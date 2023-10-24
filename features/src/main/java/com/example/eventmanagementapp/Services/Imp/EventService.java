package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.*;
import com.example.eventmanagementapp.Repositories.Imp.BilletRepository;
import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.CategoryRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.EventRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class EventService {
    private final EventRepositoryI eventRepositoryI;

    public EventService(EventRepositoryI eventRepositoryI){
        this.eventRepositoryI=eventRepositoryI;
    }

    UserRepositoryI userRepositoryI=new UserRepository();
    CategoryRepositoryI categoryRepositoryI=new CategoryRepository();
    BilletService billetService=new BilletService(new BilletRepository());

    public ResponseEntity save(Event event,List<Billet> billets) throws SQLException {
        if(event!=null){
            if(event.getDate().compareTo(new Date())>0){
                Optional<UserE> user=userRepositoryI.findByEmail(event.getUser().getEmail());
                if(user.isPresent()){
                    event.setUser(user.get());
                    Optional<Category> category=categoryRepositoryI.findById(event.getCategory().getId());
                    if(category.isPresent()) {
                        event.setCategory(category.get());
                        if (eventRepositoryI.save(event)) {
                            billets.forEach(b -> {
                                try {
                                    b.setEvent(event);
                                    billetService.save(b);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                            });
                            return new ResponseEntity("your event has been successfully added", 200);
                        }
                        return new ResponseEntity("an error has occurred while adding this event please try again later ", 404);
                    }
                    return new ResponseEntity("the category you selected doesn't exist ", 404);
                }
                return new ResponseEntity("this user doesn't exist ", 404);
            }
            return new ResponseEntity("the event your trying to insert has an expired date you need to change the date so that it is superior to the current date ",404);
        }
        return new ResponseEntity("the event your trying to insert is null please try again",404);
    }
    public ResponseEntity update(Event event) throws SQLException {
        if(event!=null){
            Event eventNew=eventRepositoryI.findById(event.getId());
            if(eventNew!=null) {
                if (event.getDate().compareTo(new Date()) > 0) {
                    event.setUser(eventNew.getUser());
                    if (eventRepositoryI.update(event)) {
                            return new ResponseEntity("your event has been successfully updated", 200);
                    }
                        return new ResponseEntity("an error has occurred while updating this event please try again later ", 404);
                }
                    return new ResponseEntity("the event your trying to update has an expired date you need to change the date so that it is superior to the current date ", 404);
            }
                return new ResponseEntity("the event your trying to update is doesn't exist",404);
        }
            return new ResponseEntity("the event your trying to update is null please try again",404);
    }

    public ResponseEntity delete(Long id) throws SQLException {

        if(eventRepositoryI.CalculateTicket(id)==0){
            Event event=eventRepositoryI.findById(id);
            if(event!=null) {
                if (eventRepositoryI.delete(event)) {
                    return new ResponseEntity("this event has been successfully deleted", 200);
                }
                return new ResponseEntity("an error has occurred while deleting this event please try again later ", 404);
            }
            return new ResponseEntity("this event doesn't exist ", 404);
        }
        return new ResponseEntity("you cant delete this event , as the ticket already been sold",404);
    }

   public List<Event> findAll()throws SQLException{
       return eventRepositoryI.getAllEvents();
   }

   public Event findById(Long id)throws SQLException{
        return eventRepositoryI.findById(id);
   }

    public List<Event> findByUser(String email)throws SQLException{
        Optional<UserE> user=userRepositoryI.findByEmail(email);
        if(user.isPresent()) {
            return eventRepositoryI.findByUser(user.get().getId());
        }
        return null;
    }

    public List<Event> findByCategory(Long id)throws SQLException{
        Optional<Category> category=categoryRepositoryI.findById(id);
        if(category.isPresent()) {
            return eventRepositoryI.findByCategory(id);
        }
        return null;
    }
   public List<Event> findByName(String name)throws SQLException{
        //TODO : VALIDATION
       return eventRepositoryI.getEventsByName(name);
   }

}
