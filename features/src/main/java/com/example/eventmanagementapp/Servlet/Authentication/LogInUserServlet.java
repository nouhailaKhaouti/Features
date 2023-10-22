package com.example.eventmanagementapp.Servlet.Authentication;

import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Services.Imp.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="logIn", value="/logIn")
public class LogInUserServlet extends HttpServlet {
    UserService userService=new UserService(new UserRepository());
    protected void doPost(HttpServletRequest req , HttpServletResponse res) throws IOException, ServletException {
        UserE user=new UserE();
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        ResponseEntity response= null;
        try {
            response = userService.logIn(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(response.getCode()==200){
            HttpSession session= req.getSession();
            session.setAttribute("email",user.getEmail());
            session.setAttribute("message",response.getMessage());
            session.setAttribute("code",response.getCode());
            RequestDispatcher dispatcher = req.getRequestDispatcher("/home");
            dispatcher.forward(req, res);
        }else{
            HttpSession session= req.getSession();
            session.setAttribute("message",response.getMessage());
            session.setAttribute("code",response.getCode());
            res.sendRedirect("index.jsp");
        }
    }
}
