package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.facad.CategoryRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class CategoryRepository implements CategoryRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();


    public CategoryRepository() {
    }

    @Override
    public boolean save(Category category) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(category);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public Optional<Category> findById(Long id) {
        String sql = "SELECT u FROM Category u WHERE u.id = :id";
        TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
        query.setParameter("id", id);
        return query.getResultStream().findAny();
    }
    @Override
    public Optional<Category> findByName(String name) {
            String sql = "SELECT u FROM Category u WHERE u.name = :name";
            TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
            query.setParameter("name", name);
            return query.getResultStream().findAny();
    }
    @Override
    public List<Category> getAllCategories() {
        return entityManager.createQuery("SELECT u FROM Category u", Category.class).getResultList();
    }

    @Override
    public boolean update(Category updatedCategory) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(updatedCategory);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Category category) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(category);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }
}