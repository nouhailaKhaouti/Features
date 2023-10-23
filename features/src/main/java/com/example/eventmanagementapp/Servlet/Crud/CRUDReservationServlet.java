package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.*;
import com.example.eventmanagementapp.Repositories.Imp.ReservationRepository;
import com.example.eventmanagementapp.Services.Imp.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/Reserve")
public class CRUDReservationServlet extends HttpServlet {
    ReservationService ReservationService = new ReservationService(new ReservationRepository());


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String Id = req.getParameter("id");
        ResponseEntity response = new ResponseEntity();
        if (Id != null) {
            try {
                response = ReservationService.delete(Long.valueOf(Id));
            } catch (SQLException e) {
                response.setMessage("an error occurred why trying to cancel this reservation");
                response.setCode(404);
            }
        } else {
            response.setMessage("No item ID provided for canceling.");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        resp.sendRedirect(req.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResponseEntity response = new ResponseEntity();
                try {
                    Reservation reservation=new Reservation();
                    UserE user=new UserE();
                    user.setEmail((String) req.getSession().getAttribute("email"));
                    reservation.setUser(user);
                    Billet billet=new Billet();
                    billet.setId(Long.valueOf(req.getParameter("billet")));
                    reservation.setDateReservation(new Date());
                    reservation.setBillet(billet);
                    response = ReservationService.create(reservation);
                } catch (SQLException e) {
                    response.setMessage("an error occurred while creating this reservation");
                    response.setCode(404);
                }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        resp.sendRedirect(req.getContextPath());

    }
}
