package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Repositories.facad.CommentaireRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class CommentaireRepository implements CommentaireRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();

    public CommentaireRepository() {
    }

    @Override
    public boolean save(Commentaire commentaire) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(commentaire);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public Optional<Commentaire> findById(Long id) {
        String sql = "SELECT u FROM Commentaire u WHERE u.id = :id";
        TypedQuery<Commentaire> query = entityManager.createQuery(sql, Commentaire.class);
        query.setParameter("id", id);
        return query.getResultStream().findAny();
    }
    @Override
    public List<Commentaire> getAllCommentaire(Long id) {
        return entityManager.createQuery("SELECT u FROM Commentaire u where u.event.id=id", Commentaire.class).getResultList();
    }

    @Override
    public boolean update(Commentaire updatedCommentaire) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(updatedCommentaire);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Commentaire commentaire) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(commentaire);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }
}