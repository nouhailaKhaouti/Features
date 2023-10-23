package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Event;

import java.sql.SQLException;
import java.util.List;

public interface EventRepositoryI {

    public boolean save(Event event)throws SQLException;
    public boolean delete(Event event)throws SQLException;
    public boolean update(Event event)throws SQLException;
    public Event findById(Long id)throws SQLException;
    public List<Event> getAllEvents()throws SQLException;
    public List<Event> findByUser(Long id)throws SQLException;
    public Integer CalculateTicket(Long id)throws SQLException;
    }
