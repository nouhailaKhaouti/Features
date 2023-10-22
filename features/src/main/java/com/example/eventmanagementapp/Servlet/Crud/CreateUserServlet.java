package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Services.Imp.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="create_user", value="/create_Account")
public class CreateUserServlet extends HttpServlet {

    UserService userService=new UserService(new UserRepository());
    protected void doPost(HttpServletRequest req , HttpServletResponse res) throws IOException {
        UserE user=new UserE();
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setUsername(req.getParameter("username"));
        ResponseEntity response= null;
        try {
            response = userService.create(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            HttpSession session= req.getSession();
            session.setAttribute("message",response.getMessage());
            session.setAttribute("code",response.getCode());
            res.sendRedirect("index.jsp");
    }
}
