package com.example.eventmanagementapp.Domain;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.util.Date;

@Entity
public class Reservation {

    @Id
    @GeneratedValue
    private Long id;
    private Date dateReservation;

    @ManyToOne
    private Billet billet;

    @ManyToOne
    private UserE user;

    public Reservation() {
    }

    public Reservation(Date dateReservation, Billet billet, UserE user) {
        this.dateReservation = dateReservation;
        this.billet = billet;
        this.user = user;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    public Billet getBillet() {
        return billet;
    }

    public void setBillet(Billet billet) {
        this.billet = billet;
    }

    public UserE getUser() {
        return user;
    }

    public void setUser(UserE user) {
        this.user = user;
    }
}
