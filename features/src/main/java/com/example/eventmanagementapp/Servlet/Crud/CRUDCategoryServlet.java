package com.example.eventmanagementapp.Servlet.Crud;


import com.example.eventmanagementapp.Domain.Category;
import com.example.eventmanagementapp.Domain.ResponseEntity;
import com.example.eventmanagementapp.Repositories.Imp.CategoryRepository;
import com.example.eventmanagementapp.Services.Imp.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Category", value = "/Category")
public class CRUDCategoryServlet extends HttpServlet {
    CategoryService categoryService=new CategoryService(new CategoryRepository());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String Id = req.getParameter("id");
        ResponseEntity response= new ResponseEntity();
        if (Id != null) {
            try {
                response=categoryService.delete(Long.valueOf(Id));
            } catch (SQLException e) {
                response.setMessage("an error occurred why trying to delete this category");
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

        ResponseEntity response= new ResponseEntity();
        String action=req.getParameter("action");
        if(action!=null) {
            if (action.equals("create")) {
                try {
                    response = categoryService.create(setParameter(req,res));
                } catch (SQLException e) {
                    response.setMessage("an error occurred while creating this category");
                    response.setCode(404);
                }
                req.getSession().setAttribute("message", response.getMessage());
                req.getSession().setAttribute("code", response.getCode());
                res.sendRedirect(req.getContextPath());
            } else if (action.equals("update")) {
                try {
                    Category category=setParameter(req,res);
                    category.setId(Long.valueOf(req.getParameter("id")));
                    response = categoryService.update(category);
                } catch (SQLException e) {
                    response.setMessage("an error occurred while creating this category");
                    response.setCode(404);
                }
            } else {
                response.setMessage("Invalid action specified.");
                response.setCode(404);
            }
            response.setMessage("No action specified..");
            response.setCode(404);
        }
        req.getSession().setAttribute("message", response.getMessage());
        req.getSession().setAttribute("code", response.getCode());
        res.sendRedirect(req.getContextPath());
    }

    public Category setParameter(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Category category=new Category();
        category.setName(req.getParameter("name"));
        category.setDescription(req.getParameter("description"));
        return category;
    }

}
