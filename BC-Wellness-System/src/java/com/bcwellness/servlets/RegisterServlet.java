package com.bcwellness.servlets;

import com.bcwellness.dao.UserDAO;
import com.bcwellness.models.User;
import com.bcwellness.utils.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String studentNumber = request.getParameter("studentNumber");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        String registerPage = "register.jsp";
        
        try {
            // Validate input
            if (!isValidInput(studentNumber, name, surname, email, phone, password, confirmPassword)) {
                request.setAttribute("errorMessage", "Please fill in all fields correctly.");
                request.getRequestDispatcher(registerPage).forward(request, response);
                return;
            }
            
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match.");
                request.getRequestDispatcher(registerPage).forward(request, response);
                return;
            }
            
            User user = new User(studentNumber.trim(), name.trim(), surname.trim(), 
                               email.trim(), phone.trim(), password);
            
            if (!user.isValid()) {
                request.setAttribute("errorMessage", "Please ensure all fields meet the requirements.");
                request.getRequestDispatcher(registerPage).forward(request, response);
                return;
            }
            
            if (userDAO.isStudentNumberExists(studentNumber)) {
                request.setAttribute("errorMessage", "Student number already exists.");
                request.getRequestDispatcher(registerPage).forward(request, response);
                return;
            }
            
            if (userDAO.isEmailExists(email)) {
                request.setAttribute("errorMessage", "Email already exists.");
                request.getRequestDispatcher(registerPage).forward(request, response);
                return;
            }
            
            if (userDAO.registerUser(user)) {
                request.setAttribute("successMessage", "Registration successful! You can now login.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher(registerPage).forward(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher(registerPage).forward(request, response);
        }
    }

    private boolean isValidInput(String studentNumber, String name, String surname, 
                               String email, String phone, String password, String confirmPassword) {
        if (studentNumber == null || studentNumber.trim().isEmpty() ||
            name == null || name.trim().isEmpty() ||
            surname == null || surname.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            password == null || password.isEmpty() ||
            confirmPassword == null || confirmPassword.isEmpty()) {
            return false;
        }
        
        if (studentNumber.trim().length() < 3 ||
            name.trim().length() < 2 ||
            surname.trim().length() < 2 ||
            password.length() < 6) {
            return false;
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            return false;
        }
        
        if (!phone.matches("^(\\+27|0)[6-8][0-9]{8}$")) {
            return false;
        }
        
        return true;
    }
}