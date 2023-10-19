package com.example.eventmanagementapp.Servlet;


import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Services.Imp.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "createCategory", value = "/createCategory")
public class CreateCategoryServlet extends HttpServlet {
    CategoryService categoryService=new CategoryService(new CategoryRepository());
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Category category=new Category();
        ResponseEntity response= null;
        HttpSession session= req.getSession();
        category.setName(req.getParameter("name"));
        category.setDescription(req.getParameter("description"));
        try {
            response=categoryService.create(category);
        } catch (SQLException e) {
            response.setMessage("an error occurred while creating this category");
            response.setCode(404);
        }
        session.setAttribute("message",response.getMessage());
        session.setAttribute("code",response.getCode());
        res.sendRedirect("index.jsp");

    }
}
