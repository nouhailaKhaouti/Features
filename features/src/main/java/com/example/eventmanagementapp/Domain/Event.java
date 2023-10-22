package com.example.eventmanagementapp.Domain;

import jakarta.persistence.*;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
public class Event {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Date date;
    private Time hour;
    private String lieu;
    private String description;
    @ManyToOne
    private Category category;
    @ManyToOne
    private UserE user;
    @OneToMany
    private List<Commentaire> commentaires;
    @OneToMany
    private List<Billet> billets;

    public Event() {
    }

    public Event(String name, Date date, Time hour, String lieu, String description) {
        this.name = name;
        this.date = date;
        this.hour = hour;
        this.lieu = lieu;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public UserE getUser() {
        return user;
    }

    public void setUser(UserE user) {
        this.user = user;
    }

    public List<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(List<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getHour() {
        return hour;
    }

    public void setHour(Time hour) {
        this.hour = hour;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Billet> getBillets() {
        return billets;
    }

    public void setBillets(List<Billet> billets) {
        this.billets = billets;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Event event = (Event) o;
        return Objects.equals(name, event.name) && Objects.equals(date, event.date) && Objects.equals(hour, event.hour) && Objects.equals(lieu, event.lieu) && Objects.equals(description, event.description) && Objects.equals(category, event.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, date, hour, lieu, description, category);
    }
}
