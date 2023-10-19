package com.example.eventmanagementapp.Domain;

import com.example.eventmanagementapp.Domain.Enums.BilletType;
import jakarta.persistence.*;

@Entity
public class Billet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double prix;
    private Integer quantiteDisponible;
    private BilletType billetType;

    @ManyToOne
    private Event event;


    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public Billet(Double prix, Integer quantiteDisponible, BilletType billetType) {
        this.prix = prix;
        this.quantiteDisponible = quantiteDisponible;
        this.billetType = billetType;
    }

    public Billet() {
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Integer getQuantiteDisponible() {
        return quantiteDisponible;
    }

    public void setQuantiteDisponible(int quantiteDisponible) {
        this.quantiteDisponible = quantiteDisponible;
    }

    public BilletType getBilletType() {
        return billetType;
    }

    public void setBilletType(BilletType billetType) {
        this.billetType = billetType;
    }

    @Override
    public String toString() {
        return "Billet{" +
                "prix=" + prix +
                ", quantiteDisponible=" + quantiteDisponible +
                ", billetType=" + billetType +
                '}';
    }


}
