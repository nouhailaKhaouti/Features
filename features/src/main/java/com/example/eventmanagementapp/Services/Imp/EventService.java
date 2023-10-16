package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Repositories.facad.EventRepositoryI;

import java.sql.SQLException;
import java.util.Date;

public class EventService {
    private final EventRepositoryI eventRepositoryI;

    public EventService(EventRepositoryI eventRepositoryI){
        this.eventRepositoryI=eventRepositoryI;
    }


    public ResponseEntity save(Event event) throws SQLException {
        if(event!=null){
            if(event.getDate().compareTo(new Date())>0){
               if(eventRepositoryI.save(event)){
                   return new ResponseEntity("your event has been successfully added",200);
               }else{
                   return new ResponseEntity("an error has occurred while adding this event please try again later ",404);
               }
            }else{
                return new ResponseEntity("the event your trying to insert has an expired date you need to change the date so that it is superior to the current date ",404);
            }
        }else{
            return new ResponseEntity("the event your trying to insert is null please try again",404);
        }
    }


}
