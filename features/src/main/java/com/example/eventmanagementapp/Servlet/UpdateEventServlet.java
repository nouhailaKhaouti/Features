package com.example.eventmanagementapp.Servlet;

import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.EventService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "updateEvent", value = "/updateEvent")
public class UpdateEventServlet extends HttpServlet {
    EventService eventService=new EventService(new EventRepository());
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        Event event=new Event();
        ResponseEntity response= null;
        HttpSession session= req.getSession();
        event.setName(req.getParameter("name"));
        event.setDescription(req.getParameter("description"));
        event.setLieu(req.getParameter("lieu"));
        event.setId(Long.valueOf(req.getParameter("id")));
        try {
            event.setDate(dateFormat.parse(req.getParameter("date")));
            event.setHour(Time.valueOf(LocalTime.parse(req.getParameter("hour"), formatter)));
        } catch (ParseException e) {
            response.setMessage("an error occurred why trying to send the date of the event");
            response.setCode(404);
        }
        try {
            response= eventService.update(event);
        } catch (SQLException e) {
            response.setMessage("an error occurred why trying to send the date of the event");
            response.setCode(404);
        }
        session.setAttribute("message",response.getMessage());
        session.setAttribute("code",response.getCode());
        res.sendRedirect("index.jsp");
    }
}
