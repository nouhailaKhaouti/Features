package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.*;
import com.example.eventmanagementapp.Domain.Enums.BilletType;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.EventService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "event",value = "/event")
public class CRUDEventServlet extends HttpServlet {

    EventService eventService=new EventService(new EventRepository());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String itemId = req.getParameter("id");
        ResponseEntity response= new ResponseEntity();
        if (itemId != null) {
            try {
                response=eventService.delete(Long.valueOf(itemId));
            } catch (SQLException e) {
                response.setMessage("an error occurred why trying to delete this date of the event");
                response.setCode(404);
            }
        } else {
            response.setMessage("No item ID provided for deletion.");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message",response.getMessage());
        req.getSession(true).setAttribute("code",response.getCode());
        resp.sendRedirect(req.getContextPath());
    }

    public Event setParameter(HttpServletRequest req, HttpServletResponse res , ResponseEntity response)throws IOException{
        Event event=new Event();
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
        } catch (ParseException e) {
            response.setMessage("an error occurred why trying to send the date of the event");
            response.setCode(404);
            req.getSession(true).setAttribute("message",response.getMessage());
            req.getSession(true).setAttribute("code",response.getCode());
            res.sendRedirect(req.getContextPath());
        }
        return event;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        ResponseEntity response= new ResponseEntity();
        if (action != null) {
            if (action.equals("create")) {
                List<Billet> billetList=new ArrayList<>();
                for(int i=0;i<req.getParameterValues("quantity[]").length;i++){
                    Billet billet=new Billet(Double.valueOf(req.getParameterValues("price[]")[i]),Integer.valueOf(req.getParameterValues("quantity[]")[i]),BilletType.valueOf(req.getParameterValues("type[]")[i]));
                    billetList.add(billet);
                }
                Event event=setParameter(req,res,response);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
                LocalTime parsedTime = LocalTime.parse(req.getParameter("hour").trim(), formatter);
                event.setHour(Time.valueOf(parsedTime));
                try {
                    response= eventService.save(event,billetList);
                } catch (SQLException e) {
                    response.setMessage("an error occurred why trying to send the date of the event");
                    response.setCode(404);
                }
            } else if (action.equals("update")) {
                Event event=setParameter(req,res,response);
                event.setId(Long.valueOf(req.getParameter("id")));
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                LocalTime parsedTime = LocalTime.parse(req.getParameter("hour").trim(), formatter);
                event.setHour(Time.valueOf(parsedTime));
                try {
                    response= eventService.update(event);
                } catch (SQLException e) {
                    response.setMessage("an error occurred why trying to send the date of the event");
                    response.setCode(404);
                }
            } else {
                response.setMessage("Invalid action specified.");
                response.setCode(404);
            }
        } else {
            response.setMessage("No action specified..");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message",response.getMessage());
        req.getSession(true).setAttribute("code",response.getCode());
        res.sendRedirect(req.getContextPath());
    }
}
