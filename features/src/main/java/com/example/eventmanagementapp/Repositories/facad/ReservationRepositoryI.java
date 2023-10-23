package com.example.eventmanagementapp.Repositories.facad;

import com.example.eventmanagementapp.Domain.Reservation;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface ReservationRepositoryI {

    public boolean save(Reservation reservation)throws SQLException;
    public boolean delete(Reservation reservation)throws SQLException;
    public boolean update(Reservation reservation)throws SQLException;
    public Optional<Reservation> findById(Long id)throws SQLException;
    public List<Reservation> getAllReservations()throws SQLException;
    public List<Reservation> findByUser(Long id)throws SQLException;
    public List<Reservation> findByUserBillet(Long id,Long user)throws SQLException;
}
