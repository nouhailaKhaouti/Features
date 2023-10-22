package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class BilletRepository implements BilletRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();
    public BilletRepository() {
    }

    @Override
    public boolean save(Billet billet) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(billet);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public Optional<Billet> findById(Long id) {
        String sql = "SELECT u FROM Billet u WHERE u.id = :id";
        TypedQuery<Billet> query = entityManager.createQuery(sql, Billet.class);
        query.setParameter("id", id);
        return query.getResultStream().findAny();
    }

    @Override
    public List<Billet> getAllBillets() {
        return entityManager.createQuery("SELECT u FROM Billet u", Billet.class).getResultList();
    }

    @Override
    public boolean update(Billet billet) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(billet);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Billet billet) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(billet);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Optional<Billet> findByEventType(Billet billet){
        String sql = "SELECT u FROM Billet u WHERE u.event.id = :id AND u.billetType=:type";
        TypedQuery<Billet> query = entityManager.createQuery(sql, Billet.class);
        query.setParameter("id", billet.getEvent().getId());
        query.setParameter("type", billet.getBilletType());
        return query.getResultStream().findAny();
    }

    @Override
    public List<Billet> getAll(Long id) {
        String sql = "SELECT u FROM Billet u WHERE u.event.id = :id ";
        TypedQuery<Billet> query = entityManager.createQuery(sql, Billet.class);
        query.setParameter("id", id);
        return query.getResultList();
    }
}