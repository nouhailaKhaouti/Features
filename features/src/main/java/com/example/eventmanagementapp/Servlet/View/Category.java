package com.example.eventmanagementapp.Servlet.View;


import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.CategoryService;
import com.example.eventmanagementapp.Services.Imp.EventService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/category")
public class Category extends HttpServlet {

    CategoryService categoryService=new CategoryService(new CategoryRepository());
    EventService eventService=new EventService(new EventRepository());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            req.setAttribute("events",eventService.findByCategory(Long.valueOf(req.getParameter("id"))));
            req.setAttribute("categories", categoryService.findAll());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/category.jsp");
        dispatcher.forward(req, resp);
    }
}
