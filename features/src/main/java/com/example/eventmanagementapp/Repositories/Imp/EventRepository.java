package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Repositories.facad.EventRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.sql.SQLException;
import java.util.List;

public class EventRepository implements EventRepositoryI {
    private final EntityManagerFactory entityManagerFactory;

    public EventRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
    }

    @Override
    public boolean save(Event event) {
        try {
            EntityManager entityManager=entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(event);
            entityManager.getTransaction().commit();
            entityManager.close();
            return true;
        }catch (Exception e){
             return false;
        }
    }

    @Override
    public Event findById(Long id) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        Event event = entityManager.find(Event.class, id);
        entityManager.close();
        return event;
    }

    @Override
    public List<Event> getAllEvents() {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        List<Event> events = entityManager.createQuery("SELECT u FROM Event u", Event.class).getResultList();
        entityManager.close();
        return events;
    }

    @Override
    public void update(Long eventId, Event updatedEvent) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Event event = entityManager.find(Event.class, eventId);
        if (event != null) {
            event.setName(updatedEvent.getName());
            event.setDescription(updatedEvent.getDescription());
            event.setDate(updatedEvent.getDate());
            event.setLieu(updatedEvent.getLieu());
            event.setHour(updatedEvent.getHour());
            entityManager.merge(event);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(Long eventId) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Event event = entityManager.find(Event.class, eventId);
        if (event != null) {
            entityManager.remove(event);
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }
}