package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class BilletRepository implements BilletRepositoryI {
    private final EntityManagerFactory entityManagerFactory;

    public BilletRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
    }

    @Override
    public void save(Billet billet) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(billet);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public Billet findById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Billet billet = entityManager.find(Billet.class, id);
        entityManager.close();
        return billet;
    }

    @Override
    public List<Billet> getAllBillets() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Billet> billets = entityManager.createQuery("SELECT u FROM Billet u", Billet.class).getResultList();
        entityManager.close();
        return billets;
    }

    @Override
    public void update(Long billetId, Billet updatedBillet) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Billet billet = entityManager.find(Billet.class, billetId);
        if (billet != null) {
            billet.setPrix(updatedBillet.getPrix());
            billet.setQuantiteDisponible(updatedBillet.getQuantiteDisponible());
            billet.setBilletType(updatedBillet.getBilletType());
            entityManager.merge(billet);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(Long billetId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Billet billet = entityManager.find(Billet.class, billetId);
        if (billet != null) {
            entityManager.remove(billet);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}