package com.example.eventmanagementapp.Servlet.View;

import com.example.eventmanagementapp.Repositories.Imp.BilletRepository;
import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Repositories.Imp.CommentaireRepository;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.BilletService;
import com.example.eventmanagementapp.Services.Imp.CategoryService;
import com.example.eventmanagementapp.Services.Imp.CommentaireService;
import com.example.eventmanagementapp.Services.Imp.EventService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Display")
public class EventServlet extends HttpServlet {

    EventService eventService = new EventService(new EventRepository());
    BilletService billetService = new BilletService(new BilletRepository());
    CommentaireService commentService = new CommentaireService(new CommentaireRepository());
    CategoryService categoryService=new CategoryService(new CategoryRepository());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long eventId = Long.valueOf(req.getParameter("id"));
            req.setAttribute("event", eventService.findById(eventId));
            req.setAttribute("billets", billetService.findByEvent(eventId));
            req.setAttribute("comments", commentService.findAllByEvent(eventId));
            System.out.println("comment section:"+commentService.findAllByEvent(eventId));
            req.setAttribute("categories", categoryService.findAll());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/ticket.jsp");
        dispatcher.forward(req, resp);
    }
}