package com.example.eventmanagementapp.Repositories.Imp;

import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Repositories.facad.EventRepositoryI;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

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
    public boolean update(Event updatedEvent) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Event event = new Event();
            event.setName(updatedEvent.getName());
            event.setDescription(updatedEvent.getDescription());
            event.setDate(updatedEvent.getDate());
            event.setLieu(updatedEvent.getLieu());
            event.setHour(updatedEvent.getHour());
            entityManager.merge(event);
            entityManager.getTransaction().commit();
            entityManager.close();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean delete(Long eventId) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            Event event = entityManager.find(Event.class, eventId);
            if (event != null) {
                entityManager.remove(event);
            }
            entityManager.getTransaction().commit();
            entityManager.close();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public Integer CalculateTicket(Long id){
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            String sql = "SELECT count(*) FROM Event e Join Billet b On e.id=b.event.id where e.id=:id";
            TypedQuery<Integer> query = entityManager.createQuery(sql, Integer.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (Exception e) {
            return 0;
        }
    }
}