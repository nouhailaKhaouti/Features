package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.ResponseEntity;
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
                event.setUser(userRepositoryI.findByEmail(event.getUser().getEmail()));
                event.setCategory(categoryRepositoryI.findById(event.getCategory().getId()));
               if(eventRepositoryI.save(event)){
                   billets.forEach(b-> {
                       try {
                           b.setEvent(event);
                           boolean res=billetService.save(b);
                           if(!res){
                               new ResponseEntity("an error has occurred while adding this event tickets please try again later ",404) ;
                           }
                       } catch (SQLException e) {
                           throw new RuntimeException(e);
                       }
                   });
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
    public ResponseEntity update(Event event) throws SQLException {
        if(event!=null){
            if(eventRepositoryI.findById(event.getId())!=null) {
                if (event.getDate().compareTo(new Date()) > 0) {
                    if (eventRepositoryI.update(event)) {
                        return new ResponseEntity("your event has been successfully updated", 200);
                    } else {
                        return new ResponseEntity("an error has occurred while updating this event please try again later ", 404);
                    }
                } else {
                    return new ResponseEntity("the event your trying to update has an expired date you need to change the date so that it is superior to the current date ", 404);
                }
            }else{
                return new ResponseEntity("the event your trying to update is doesn't exist",404);
            }
        }else{
            return new ResponseEntity("the event your trying to update is null please try again",404);
        }
    }


    public ResponseEntity delete(Long id) throws SQLException {

        if(eventRepositoryI.CalculateTicket(id)!=0){
            if(eventRepositoryI.delete(id)){
                return new ResponseEntity("this event has been successfully deleted", 200);
            }else{
                return new ResponseEntity("an error has occurred while deleting this event please try again later ", 404);
            }
        }else{
            return new ResponseEntity("you cant delete this event , as the ticket already been sold",404);
        }
    }

   public List<Event> findAll()throws SQLException{
       return eventRepositoryI.getAllEvents();
   }

}
