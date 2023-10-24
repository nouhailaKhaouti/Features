package com.example.eventmanagementapp.Servlet.Crud;

import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Domain.UserE;
import com.example.eventmanagementapp.Repositories.Imp.UserRepository;
import com.example.eventmanagementapp.Services.Imp.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {

    UserService userService=new UserService(new UserRepository());
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        ResponseEntity response=new ResponseEntity();
        UserE user=new UserE();
        String email=(String) req.getSession().getAttribute("email");
        switch (action){
            case "password":

                user.setEmail(email);
                user.setPassword(req.getParameter("password"));
                try {
                    response=userService.UpdatePassword(user,req.getParameter("confirmPassword"));
                } catch (SQLException e) {
                    response.setMessage("An error occurred why changing password");
                    response.setCode(404);
                }
                break;
            case "profile":
                user.setEmail(email);
                user.setUsername(req.getParameter("userName"));
                user.setFirstName(req.getParameter("firstName"));
                user.setLastName(req.getParameter("lastName"));
                try {
                    response=userService.Update(user);
                } catch (SQLException e) {
                    response.setMessage("An error occurred why updating your profile");
                    response.setCode(404);
                }
                break;
            default:
                response.setMessage("Invalid action specified.");
                response.setCode(404);
                break;
        }
        req.getSession(true).setAttribute("message", response.getMessage());
        req.getSession(true).setAttribute("code", response.getCode());
        String referer = req.getHeader("Referer");
        resp.setHeader("Location", referer);    }
}
