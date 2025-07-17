package com.bcwellness.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet for handling user logout
 * Invalidates user session and redirects to login page
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    
    /**
     * Handles both GET and POST requests for logout
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processLogout(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processLogout(request, response);
    }
    
    /**
     * Processes logout by invalidating session and redirecting
     */
    private void processLogout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get current session
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Invalidate the session
            session.invalidate();
        }
        
        // Set success message
        request.setAttribute("successMessage", "You have been successfully logged out.");
        
        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
