package com.example.eventmanagementapp;


import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.EventService;

import java.sql.SQLException;

public class Main {

    static final EventService eventService=new EventService(new EventRepository());
    public static void main(String[] args) throws SQLException {

        System.out.println(eventService.stream_function());
    }
}