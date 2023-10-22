package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Reservation;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.facad.ReservationRepositoryI;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class ReservationService {

    private final ReservationRepositoryI reservationRepositoryI;

    public ReservationService(ReservationRepositoryI reservationRepositoryI){
        this.reservationRepositoryI=reservationRepositoryI;
    }

    public ResponseEntity create(Reservation reservation) throws SQLException {
        if(reservation!=null){
            if(reservationRepositoryI.findByUserBillet(reservation.getBillet().getId(),reservation.getUser().getId()).isEmpty()){
                if(reservationRepositoryI.save(reservation)){
                    return new ResponseEntity("the reservation has been added successfully ",200);
                }
                return new ResponseEntity("an error has occurred while creating this reservation please be patient until we fix the problem ",404);
            }
            return new ResponseEntity("you already have a reservation for this event",404);
        }
        return new ResponseEntity("the reservation your trying to insert is null please try again",404);
    }

    public ResponseEntity delete(Long id) throws SQLException{
        Optional<Reservation> reservation=reservationRepositoryI.findById(id);
        if(reservation.isPresent()){
            if(reservationRepositoryI.delete(reservation.get())){
                return new ResponseEntity("the reservation has been deleted successfully ",200);
            }
            return new ResponseEntity("An error occurred while deleting this reservation ",404);
        }
        return new ResponseEntity("The reservation your trying to delete doesn't exist",404);
    }

    public List<Reservation> findAll() throws SQLException {
        return reservationRepositoryI.getAllReservations();
    }

    public List<Reservation> findAllByUser(Long id) throws SQLException {
        return reservationRepositoryI.findByUser(id);
    }
}
