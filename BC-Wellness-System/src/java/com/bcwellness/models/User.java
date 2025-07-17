package com.bcwellness.models;

import java.sql.Timestamp;

public class User {
    private String studentNumber;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String password;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    public User() {}
    
    public User(String studentNumber, String name, String surname, String email, String phone, String password) {
        this.studentNumber = studentNumber;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }
    
    // Getters and Setters
    public String getStudentNumber() { return studentNumber; }
    public void setStudentNumber(String studentNumber) { this.studentNumber = studentNumber; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSurname() { return surname; }
    public void setSurname(String surname) { this.surname = surname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
    
    // Validation methods
    public boolean isValidStudentNumber() {
        return studentNumber != null && studentNumber.trim().length() >= 3;
    }
    
    public boolean isValidName() {
        return name != null && name.trim().length() >= 2;
    }
    
    public boolean isValidSurname() {
        return surname != null && surname.trim().length() >= 2;
    }
    
    public boolean isValidEmail() {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
    }
    
    public boolean isValidPhone() {
        return phone != null && phone.matches("^(\\+27|0)[6-8][0-9]{8}$");
    }
    
    public boolean isValidPassword() {
        return password != null && password.length() >= 6;
    }
    
    public boolean isValid() {
        return isValidStudentNumber() && isValidName() && isValidSurname() 
               && isValidEmail() && isValidPhone() && isValidPassword();
    }
    
    public String getFullName() {
        return name + " " + surname;
    }
    
    @Override
    public String toString() {
        return "User{" +
                "studentNumber='" + studentNumber + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}