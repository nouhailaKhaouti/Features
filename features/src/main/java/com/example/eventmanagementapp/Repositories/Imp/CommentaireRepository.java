package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Repositories.facad.CommentaireRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class CommentaireRepository implements CommentaireRepositoryI {
    private final EntityManagerFactory entityManagerFactory;

    public CommentaireRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
    }

    @Override
    public void save(Commentaire commentaire) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(commentaire);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public Commentaire findById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Commentaire commentaire = entityManager.find(Commentaire.class, id);
        entityManager.close();
        return commentaire;
    }

    @Override
    public List<Commentaire> getAllCommentaires() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Commentaire> commentaires = entityManager.createQuery("SELECT u FROM Commentaire u", Commentaire.class).getResultList();
        entityManager.close();
        return commentaires;
    }

    @Override
    public void update(Long commentaireId, Commentaire updatedCommentaire) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Commentaire commentaire = entityManager.find(Commentaire.class, commentaireId);
        if (commentaire != null) {
            commentaire.setText(updatedCommentaire.getText());
            commentaire.setEvaluation(updatedCommentaire.getEvaluation());
            entityManager.merge(commentaire);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(Long commentaireId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Commentaire commentaire = entityManager.find(Commentaire.class, commentaireId);
        if (commentaire != null) {
            entityManager.remove(commentaire);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}