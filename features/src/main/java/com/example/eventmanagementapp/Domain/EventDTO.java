package com.example.eventmanagementapp.Domain;

import java.util.Date;

public class EventDTO {

    private String Name;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public EventDTO(String name,Date date) {
        Name = name;
        this.date=date;
    }
}
