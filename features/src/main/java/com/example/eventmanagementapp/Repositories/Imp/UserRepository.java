package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class UserRepository  implements UserRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();


    public UserRepository()
    {

    }

    @Override
    public boolean save(UserE user) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public UserE findById(Long id) {
        return entityManager.find(UserE.class, id);
    }
    @Override
    public Optional<UserE> findByEmail(String email) {
            String sql = "SELECT u FROM UserE u WHERE u.email = :email";
            TypedQuery<UserE> query = entityManager.createQuery(sql, UserE.class);
            query.setParameter("email", email);
            return query.getResultStream().findAny();
    }

    @Override
    public List<UserE> getAllUserEs() {
        return entityManager.createQuery("SELECT u FROM UserE u", UserE.class).getResultList();
    }

    @Override
    public boolean update(UserE updatedUserE) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(updatedUserE);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public void delete(UserE user) {
        entityManager.getTransaction().begin();
        entityManager.remove(user);
        entityManager.getTransaction().commit();
    }
}