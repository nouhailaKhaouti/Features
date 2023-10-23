package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class BilletService {
    private final BilletRepositoryI billetRepositoryI;

    public BilletService(BilletRepositoryI billetRepositoryI){
        this.billetRepositoryI=billetRepositoryI;
    }

    public void save(Billet billet) throws SQLException {
        if(billet!=null) {
            if (billetRepositoryI.findByEventType(billet).isEmpty()) {
                billetRepositoryI.save(billet);
            }
        }
    }

    public ResponseEntity update(Billet billet) throws SQLException{
        if(billet!=null){
            Optional<Billet> billetOptional=billetRepositoryI.findById(billet.getId());

            if(billetOptional.isPresent()){
                billet.setEvent(billetOptional.get().getEvent());
                if(billetRepositoryI.update(billet)){
                    return new ResponseEntity("the ticket has been updated successfully ",200);
                }
                return new ResponseEntity("An error occurred while updating this ticket ",404);
            }
            return new ResponseEntity("this ticket doesn't exist",404);
        }
        return new ResponseEntity("the ticket your trying to update is null please try again",404);
    }

    public ResponseEntity delete(Long id)throws SQLException{
        Optional<Billet> billet=billetRepositoryI.findById(id);
        if(billet.isPresent()){
            if(billetRepositoryI.delete(billet.get())){
                return new ResponseEntity("the ticket has been deleted successfully ",200);
            }
            return new ResponseEntity("An error occurred while deleting this ticket ",404);
        }
        return new ResponseEntity("The ticket your trying to delete doesn't exist",404);
    }

    public List<Billet> findByEvent(Long id) throws SQLException {
        return billetRepositoryI.getAll(id);
    }

}
