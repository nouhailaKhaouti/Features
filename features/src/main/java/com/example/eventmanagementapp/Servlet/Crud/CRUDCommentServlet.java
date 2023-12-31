package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.Commentaire;
import com.example.eventmanagementapp.Domain.Event;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.CommentaireRepository;
import com.example.eventmanagementapp.Services.Imp.CommentaireService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "Comment", value = "/Comment")
public class CRUDCommentServlet extends HttpServlet {
    CommentaireService CommentaireService = new CommentaireService(new CommentaireRepository());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String Id = req.getParameter("id");
        ResponseEntity response = new ResponseEntity();
        if (Id != null) {
            try {
                response = CommentaireService.delete(Long.valueOf(Id));
            } catch (SQLException e) {
                response.setMessage("an error occurred why trying to delete this Comment");
                response.setCode(404);
            }
        } else {
            response.setMessage("No item ID provided for deletion.");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        resp.sendRedirect(req.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        ResponseEntity response = new ResponseEntity();
        String action = req.getParameter("action");
        if (action != null) {
            if ("create".equals(action)) {
                try {
                    Commentaire comment=setParameter(req);
                    UserE user=new UserE();
                    user.setEmail((String) req.getSession().getAttribute("email"));
                    comment.setUser(user);
                    Event event=new Event();
                    event.setId(Long.valueOf(req.getParameter("event")));
                    comment.setEvent(event);
                    response = CommentaireService.create(comment);
                } catch (SQLException e) {
                    response.setMessage("an error occurred while creating this Comment");
                    response.setCode(404);
                }
            } else if ("update".equals(action)) {
                try {
                    Commentaire Commentaire = setParameter(req);
                    Commentaire.setId(Long.valueOf(req.getParameter("id")));
                    response = CommentaireService.update(Commentaire);
                } catch (SQLException e) {
                    response.setMessage("an error occurred while creating this Comment");
                    response.setCode(404);
                }
            } else {
                response.setMessage("Invalid action specified.");
                response.setCode(404);
            }
        }else{
            response.setMessage("No action specified..");
            response.setCode(404);
        }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        res.sendRedirect(req.getContextPath());
    }

    public Commentaire setParameter(HttpServletRequest req) {
        Commentaire Commentaire = new Commentaire();
        Commentaire.setText(req.getParameter("description"));
        Commentaire.setDateDeCreation(new Date());
        Commentaire.setEvaluation(5);
        return Commentaire;
    }
}