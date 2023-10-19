package com.example.eventmanagementapp.Servlet;

import com.example.eventmanagementapp.Domain.*;
import com.example.eventmanagementapp.Domain.Enums.BilletType;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "createEvent",value = "/createEvent")
public class CreateEventServlet extends HttpServlet {

    EventService eventService=new EventService(new EventRepository());
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Event event=new Event();
        ResponseEntity response= new ResponseEntity();

        List<Billet> billetList=new ArrayList<>();
        for(int i=0;i<req.getParameterValues("quantity[]").length;i++){
            Billet billet=new Billet(Double.valueOf(req.getParameterValues("price[]")[i]),Integer.valueOf(req.getParameterValues("quantity[]")[i]),BilletType.valueOf(req.getParameterValues("type[]")[i]));
            billetList.add(billet);
        }
        event.setName(req.getParameter("name"));
        event.setDescription(req.getParameter("description"));
        UserE user=new UserE();
        user.setEmail(req.getParameter("user"));
        event.setUser(user);
        event.setLieu(req.getParameter("lieu"));
        Category category=new Category();
        category.setId(Long.valueOf(req.getParameter("category")));
        event.setCategory(category);
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormat.parse(req.getParameter("date"));
            event.setDate(parsedDate);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            LocalTime parsedTime = LocalTime.parse(req.getParameter("hour"), formatter);
            event.setHour(Time.valueOf(parsedTime));;
        } catch (ParseException e) {
            response.setMessage("an error occurred why trying to send the date of the event");
            response.setCode(404);
            res.sendRedirect(req.getContextPath());
        }
        try {
            response= eventService.save(event,billetList);
        } catch (SQLException e) {
            response.setMessage("an error occurred why trying to send the date of the event");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message",response.getMessage());
        req.getSession(true).setAttribute("code",response.getCode());
        res.sendRedirect(req.getContextPath());

    }
}
