package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.Billet;
import com.example.eventmanagementapp.Domain.Enums.BilletType;
import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.BilletRepository;
import com.example.eventmanagementapp.Services.Imp.BilletService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;


@WebServlet("/ticket")
public class CRUDBilletServlet extends HttpServlet {
    BilletService billetService=new BilletService(new BilletRepository());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String Id = req.getParameter("id");
        ResponseEntity response= new ResponseEntity();
        if (Id != null) {
            try {
                response=billetService.delete(Long.valueOf(Id));
            } catch (SQLException e) {
                response.setMessage("an error occurred why trying to delete this billet");
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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Billet billet=new Billet();
        ResponseEntity response=new ResponseEntity("",200);
        String action=req.getParameter("action");
        if("update".equals(action)) {
            billet.setPrix(Double.parseDouble(req.getParameter("price")));
            billet.setQuantiteDisponible(Integer.parseInt(req.getParameter("quantity")));
            billet.setBilletType(BilletType.valueOf(req.getParameter("type")));
            try {
                billet.setId(Long.valueOf(req.getParameter("id")));
                response = billetService.update(billet);
            } catch (SQLException e) {
                response.setMessage("an error occurred while creating this billet");
                response.setCode(404);
            }
        }else if("create".equals(action)){
            billet.setPrix(Double.parseDouble(req.getParameter("price")));
            billet.setQuantiteDisponible(Integer.parseInt(req.getParameter("quantity")));
            billet.setBilletType(BilletType.valueOf(req.getParameter("type")));
            try {
                Event event=new Event();
                event.setId(Long.valueOf(req.getParameter("event")));
                billet.setEvent(event);
                billetService.save(billet);
            } catch (SQLException e) {
                response.setMessage("an error occurred while creating this billet");
                response.setCode(404);
            }
        }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        res.sendRedirect(req.getContextPath());
    }
}
