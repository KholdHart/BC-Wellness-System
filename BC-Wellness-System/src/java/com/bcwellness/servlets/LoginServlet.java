package com.bcwellness.servlets;

import com.bcwellness.dao.UserDAO;
import com.bcwellness.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String usernameOrEmail = request.getParameter("usernameOrEmail");
        String password = request.getParameter("password");
        
        if (!isValidInput(usernameOrEmail, password)) {
            request.setAttribute("errorMessage", "Please enter both username/email and password.");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }
        
        try {
            User user = userDAO.authenticateUser(usernameOrEmail.trim(), password);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userStudentNumber", user.getStudentNumber());
                session.setAttribute("userFullName", user.getFullName());
                session.setAttribute("userEmail", user.getEmail());
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username/email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            System.err.println("Database error during login: " + e.getMessage());
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    private boolean isValidInput(String usernameOrEmail, String password) {
        return usernameOrEmail != null && !usernameOrEmail.trim().isEmpty() &&
               password != null && !password.isEmpty();
    }
}