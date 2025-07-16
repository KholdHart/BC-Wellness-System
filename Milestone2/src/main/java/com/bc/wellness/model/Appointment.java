/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bc.wellness.model;

import java.sql.*;

/**
 *
 * @author liamt
 */
public class Appointment {
    private Connection conn;
    
    public Appointment() throws SQLException{
        //connect to DB
        conn = DriverManager.getConnection("jdbc:derby:wellnessDB; create=true");
        createTable();
    }
    
    private void createTable() throws SQLException{
        String sql = "CREATE TABLE IF NOT EXISTS Appointments (" + //"IF NOT EXISTS" checks if there is a table that needs tp be created or not
                     "student_id INTEGER PRIMARY KEY, " +
                     "counselor_name VARCHAR(50), " +
                     "date VARCHAR(10), " +
                     "time VARCHAR(5), " +
                     "status VARCHAR(20))";
        try (Statement stmt = conn.createStatement()){
            stmt.executeUpdate(sql);
            
        }
    }
    
    public void add(String studentId, String counselorName, String date, String time, String status) throws SQLException {
    String sql = "INSERT INTO Appointments (student_id, counselor_name, date, time, status) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, Integer.parseInt(studentId)); // Convert to integer for student_id
        pstmt.setString(2, counselorName);
        pstmt.setString(3, date);
        pstmt.setString(4, time);
        pstmt.setString(5, status);
        pstmt.executeUpdate();
    } catch (NumberFormatException e) {
        throw new SQLException("Invalid student ID format: must be an integer", e);
        }
    }  
    
    public void update(String studentId, String counselorName, String date, String time, String status) throws SQLException {
    String sql = "UPDATE Appointments SET counselor_name = ?, date = ?, time = ?, status = ? WHERE student_id = ?";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, counselorName);
        pstmt.setString(2, date);
        pstmt.setString(3, time);
        pstmt.setString(4, status);
        pstmt.setInt(5, Integer.parseInt(studentId));
        pstmt.executeUpdate();
    } catch (NumberFormatException e) {
        throw new SQLException("Invalid student ID format: must be an integer", e);
    }
}

public void delete(String studentId) throws SQLException {
    String sql = "DELETE FROM Appointments WHERE student_id = ?";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, Integer.parseInt(studentId));
        pstmt.executeUpdate();
    } catch (NumberFormatException e) {
        throw new SQLException("Invalid student ID format: must be an integer", e);
    }
}

public Object[][] getAllAppointments() throws SQLException {
    String sql = "SELECT student_id, counselor_name, date, time, status FROM Appointments";
    try (Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {
        // Count rows
        int rowCount = 0;
        rs.last();
        rowCount = rs.getRow();
        rs.beforeFirst();

        // Prepare data array
        Object[][] data = new Object[rowCount][5];
        int index = 0;
        while (rs.next()) {
            data[index][0] = rs.getInt("student_id");
            data[index][1] = rs.getString("counselor_name");
            data[index][2] = rs.getString("date");
            data[index][3] = rs.getString("time");
            data[index][4] = rs.getString("status");
            index++;
        }
        return data;
    }
}
    
}
