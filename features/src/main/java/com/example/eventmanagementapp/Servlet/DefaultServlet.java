package com.example.eventmanagementapp.Servlet;

import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Services.Imp.EventService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "",loadOnStartup = 1)
public class DefaultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/home").forward(request, response);
    }
}
