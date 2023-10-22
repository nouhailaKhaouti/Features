package com.example.eventmanagementapp.Domain;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Commentaire {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;
    private Integer evaluation;
    private Date dateDeCreation;
    @ManyToOne
    private UserE user;
/*    @ManyToOne
    private Event event;*/

    public Date getDateDeCreation() {
        return dateDeCreation;
    }

    public void setDateDeCreation(Date dateDeCreation) {
        this.dateDeCreation = dateDeCreation;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Integer evaluation) {
        this.evaluation = evaluation;
    }

    public UserE getUser() {
        return user;
    }

    public void setUser(UserE user) {
        this.user = user;
    }

/*    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }*/

    public Commentaire(String text, Integer evaluation, UserE user) {
        this.text = text;
        this.evaluation = evaluation;
        this.user = user;
    }

    public Commentaire() {
    }

    @Override
    public String toString() {
        return "Commentaire{" +
                "text='" + text + '\'' +
                ", evaluation=" + evaluation +
                ", user=" + user +
                '}';
    }

}
