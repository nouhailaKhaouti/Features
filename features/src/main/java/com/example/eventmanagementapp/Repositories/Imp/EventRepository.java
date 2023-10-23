package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Config.EntityManagerConfig;
import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.Reservation;
import com.example.eventmanagementapp.Repositories.facad.EventRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class EventRepository implements EventRepositoryI {
    private final EntityManager entityManager= EntityManagerConfig.getEntityManager();

    public EventRepository() {

    }

    @Override
    public boolean save(Event event) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(event);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
             return false;
        }
    }

    @Override
    public Event findById(Long id) {
        return entityManager.find(Event.class, id);
    }

    @Override
    public List<Event> getAllEvents() {
        return entityManager.createQuery("SELECT u FROM Event u", Event.class).getResultList();
    }

    @Override
    public List<Event> findByUser(Long id) {
        String sql = "SELECT u FROM Event u WHERE u.user.id = :id";
        TypedQuery<Event> query = entityManager.createQuery(sql, Event.class);
        query.setParameter("id", id);
        return query.getResultList();
    }
    @Override
    public boolean update(Event event) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(event);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Event event) {
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(event);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public Integer CalculateTicket(Long id){
        try{
            String sql = "SELECT count(*) FROM Event e Join Billet b On e.id=b.event.id where e.id=:id";
            TypedQuery<Integer> query = entityManager.createQuery(sql, Integer.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (Exception e) {
            return 0;
        }
    }
}