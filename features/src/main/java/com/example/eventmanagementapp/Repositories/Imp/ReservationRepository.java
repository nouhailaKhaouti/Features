package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.Reservation;
import com.example.eventmanagementapp.Repositories.facad.ReservationRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class ReservationRepository implements ReservationRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();

    public ReservationRepository() {
    }
    @Override
    public boolean save(Reservation reservation) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(reservation);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public Optional<Reservation> findById(Long id) {
        String sql = "SELECT u FROM Reservation u WHERE u.id = :id";
        TypedQuery<Reservation> query = entityManager.createQuery(sql, Reservation.class);
        query.setParameter("id", id);
        return query.getResultStream().findAny();
    }

    @Override
    public List<Reservation> findByUser(Long id) {
        String sql = "SELECT u FROM Reservation u WHERE u.user.id = :id";
        TypedQuery<Reservation> query = entityManager.createQuery(sql, Reservation.class);
        query.setParameter("id", id);
        return query.getResultList();
    }

    @Override
    public List<Reservation> findByUserBillet(Long id, Long user){
        String sql = "SELECT u FROM Reservation u WHERE u.user.id = :user AND u.billet.id=:id";
        TypedQuery<Reservation> query = entityManager.createQuery(sql, Reservation.class);
        query.setParameter("user", user);
        query.setParameter("id", id);
        return query.getResultList();
    }
    @Override
    public List<Reservation> getAllReservations() {
        return entityManager.createQuery("SELECT u FROM Reservation u", Reservation.class).getResultList();
    }

    @Override
    public boolean update(Reservation reservation) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(reservation);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Reservation reservation) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(reservation);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
