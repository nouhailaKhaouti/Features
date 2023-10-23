/*
package com.example.eventmanagementapp.Config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")

public class AuthenticationFilter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("email") != null);

        String loginURI = httpRequest.getContextPath() + "/logIn";
        String homeURI = httpRequest.getContextPath() + "/home";

        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean isHomeRequest = httpRequest.getRequestURI().equals(homeURI);

        boolean isLoginPage = httpRequest.getRequestURI().endsWith("index.jsp");
        boolean isHomePage = httpRequest.getRequestURI().endsWith("newHomePage.jsp");
        if (isLoggedIn && (isHomeRequest || isLoginRequest || isLoginPage || isHomePage)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/");
            dispatcher.forward(request, response);

        } else if (isLoggedIn || isLoginRequest) {
            chain.doFilter(request, response);

        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
            dispatcher.forward(request, response);

        }


    }

}
*/
