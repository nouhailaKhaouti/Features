package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class UserRepository  implements UserRepositoryI {
    private final EntityManagerFactory entityManagerFactory;

    public UserRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
    }

    @Override
    public boolean save(UserE user) {
        try {
            EntityManager entityManager=entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
            entityManager.close();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public UserE findById(Long id) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        UserE user = entityManager.find(UserE.class, id);
        entityManager.close();
        return user;
    }
    @Override
    public UserE findByEmail(String email) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            String sql = "SELECT u FROM UserE u WHERE u.email = :email";
            TypedQuery<UserE> query = entityManager.createQuery(sql, UserE.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<UserE> getAllUserEs() {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        List<UserE> users = entityManager.createQuery("SELECT u FROM UserE u", UserE.class).getResultList();
        entityManager.close();
        return users;
    }

    @Override
    public void update(Long userId, UserE updatedUserE) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        UserE user = entityManager.find(UserE.class, userId);
        if (user != null) {
            user.setUsername(updatedUserE.getUsername());
            user.setFirstName(updatedUserE.getFirstName());
            user.setLastName(updatedUserE.getLastName());
            user.setEmail(updatedUserE.getEmail());
            entityManager.merge(user);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(Long userId) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        UserE user = entityManager.find(UserE.class, userId);
        if (user != null) {
            entityManager.remove(user);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}