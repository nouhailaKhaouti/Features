package com.example.eventmanagementapp.Servlet.View;

import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;
import com.example.eventmanagementapp.Repositories.Imp.ReservationRepository;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Services.Imp.CategoryService;
import com.example.eventmanagementapp.Services.Imp.EventService;
import com.example.eventmanagementapp.Services.Imp.ReservationService;
import com.example.eventmanagementapp.Services.Imp.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/Profile")
public class ProfileServlet extends HttpServlet {

    CategoryService categoryService=new CategoryService(new CategoryRepository());
    EventService eventService=new EventService(new EventRepository());
    UserService userService=new UserService(new UserRepository());
    ReservationService reservationService=new ReservationService(new ReservationRepository());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email=req.getParameter("email");
            if(email!=null){
                setParam(req, email);
            }else if(req.getSession().getAttribute("email")!=null){
                email= (String) req.getSession().getAttribute("email");
                setParam(req, email);
            }else {
                RequestDispatcher dispatcher = req.getRequestDispatcher("/home");
                dispatcher.forward(req, resp);
            }
        } catch (SQLException e) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/home");
            dispatcher.forward(req, resp);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/profile.jsp");
        dispatcher.forward(req, resp);
    }

    private void setParam(HttpServletRequest req, String email) throws SQLException {
        ResponseEntity response=userService.findByEmail(email);
        if(response.getCode()==200) {
            req.setAttribute("user", response.getObj());
            req.setAttribute("events", eventService.findByUser(email));
            req.setAttribute("categories", categoryService.findAll());
            req.setAttribute("reservations", reservationService.findAllByUser(email));
        }
    }

}
