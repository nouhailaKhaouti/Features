package com.example.eventmanagementapp.Services.Imp;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.Reservation;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.BilletRepository;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Repositories.facad.BilletRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.ReservationRepositoryI;
import com.example.eventmanagementapp.Repositories.facad.UserRepositoryI;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class ReservationService {

    private final ReservationRepositoryI reservationRepositoryI;

    public ReservationService(ReservationRepositoryI reservationRepositoryI){
        this.reservationRepositoryI=reservationRepositoryI;
    }
    BilletRepositoryI billetRepositoryI=new BilletRepository();
    UserRepositoryI userRepositoryI=new UserRepository();

    public ResponseEntity create(Reservation reservation) throws SQLException {
        if(reservation!=null){
            Optional<Billet> billetOptional=billetRepositoryI.findById(reservation.getBillet().getId());
            if(billetOptional.isPresent()) {
                if(billetOptional.get().getEvent().getDate().compareTo(new Date())>0) {
                    Optional<UserE> user=userRepositoryI.findByEmail(reservation.getUser().getEmail());
                    if(user.isPresent()) {
                        if (reservationRepositoryI.findByUserBillet(reservation.getBillet().getId(), user.get().getId()).isEmpty()) {
                            if (billetOptional.get().getQuantiteDisponible() > 0) {
                                reservation.setBillet(billetOptional.get());
                                reservation.setUser(user.get());
                                if (reservationRepositoryI.save(reservation)) {
                                    return new ResponseEntity("the reservation has been added successfully ", 200);
                                }
                                return new ResponseEntity("an error has occurred while creating this reservation please be patient until we fix the problem ", 404);
                            }
                            return new ResponseEntity("there's no place available in the " + billetOptional.get().getBilletType() + " class please choose another class ", 404);
                        }
                        return new ResponseEntity("you already have a reservation for this event", 404);
                    }
                    return new ResponseEntity("this user doesn't exist",404);
                }
                return new ResponseEntity("the date of this event already expired", 404);
            }
            return  new ResponseEntity("This billet doesn't exist",404);
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
