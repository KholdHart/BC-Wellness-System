package com.bcwellness.dao;

import com.bcwellness.models.User;
import com.bcwellness.utils.DatabaseUtil;
import com.bcwellness.utils.PasswordUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    
    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (student_number, name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            String hashedPassword = PasswordUtil.hashPassword(user.getPassword());
            
            statement.setString(1, user.getStudentNumber());
            statement.setString(2, user.getName());
            statement.setString(3, user.getSurname());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPhone());
            statement.setString(6, hashedPassword);
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error registering user: " + e.getMessage());
            throw e;
        }
    }
    
    public User authenticateUser(String usernameOrEmail, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE student_number = ? OR email = ?";
        
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, usernameOrEmail);
            statement.setString(2, usernameOrEmail);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String storedPassword = resultSet.getString("password");
                    
                    if (PasswordUtil.verifyPassword(password, storedPassword)) {
                        return mapResultSetToUser(resultSet);
                    }
                }
            }
        }
        return null;
    }
    
    public boolean isStudentNumberExists(String studentNumber) throws SQLException {
        return checkFieldExists("student_number", studentNumber);
    }
    
    public boolean isEmailExists(String email) throws SQLException {
        return checkFieldExists("email", email);
    }
    
    private boolean checkFieldExists(String fieldName, String value) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE " + fieldName + " = ?";
        
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, value);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    private User mapResultSetToUser(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setStudentNumber(resultSet.getString("student_number"));
        user.setName(resultSet.getString("name"));
        user.setSurname(resultSet.getString("surname"));
        user.setEmail(resultSet.getString("email"));
        user.setPhone(resultSet.getString("phone"));
        user.setPassword(resultSet.getString("password"));
        user.setCreatedAt(resultSet.getTimestamp("created_at"));
        user.setUpdatedAt(resultSet.getTimestamp("updated_at"));
        return user;
    }
}