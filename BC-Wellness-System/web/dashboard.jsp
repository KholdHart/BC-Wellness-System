<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bcwellness.models.User" %>
<%
    // Check if user is logged in
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - BC Wellness System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header {
            background-color: #007bff;
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
        }
        .welcome-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        .service-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            background-color: white;
        }
        .stats-box {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 15px;
        }
        .user-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp">BC Wellness</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, <%= user.getFullName() %></span>
                <a href="LogoutServlet" class="btn btn-outline-light btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <div class="header">
        <div class="container text-center">
            <h1>Student Dashboard</h1>
            <p>Manage your wellness journey and access support services</p>
        </div>
    </div>

    <div class="container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <div class="row">
                <div class="col-md-8">
                    <h3>Welcome back, <%= user.getName() %>!</h3>
                    <p>Your mental health and well-being are important to us.</p>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="stats-box">
                                <h4>0</h4>
                                <p>Appointments</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-box">
                                <h4>0</h4>
                                <p>Sessions</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-box">
                                <h4>0</h4>
                                <p>Feedback</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="user-info">
                        <h5>Your Information</h5>
                        <p><strong>Student Number:</strong> <%= user.getStudentNumber() %></p>
                        <p><strong>Email:</strong> <%= user.getEmail() %></p>
                        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                        <p><strong>Member Since:</strong> <%= user.getCreatedAt() != null ? user.getCreatedAt().toString().substring(0, 10) : "N/A" %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Services Section -->
        <h2 class="mb-4">Available Services</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="service-card">
                    <h5>Book Appointment</h5>
                    <p>Schedule a session with our qualified counselors</p>
                    <button class="btn btn-primary" onclick="showComingSoon()">Book Now</button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card">
                    <h5>View Counselors</h5>
                    <p>Browse available counselors and their specializations</p>
                    <button class="btn btn-success" onclick="showComingSoon()">View All</button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card">
                    <h5>Feedback</h5>
                    <p>Share your experience and help us improve</p>
                    <button class="btn btn-info" onclick="showComingSoon()">Give Feedback</button>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="mt-4">
            <h4>Quick Actions</h4>
            <div class="d-flex gap-2">
                <button class="btn btn-outline-primary" onclick="showComingSoon()">New Appointment</button>
                <button class="btn btn-outline-success" onclick="showComingSoon()">View History</button>
                <button class="btn btn-outline-info" onclick="showComingSoon()">Settings</button>
                <button class="btn btn-outline-warning" onclick="showComingSoon()">Help</button>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-start">
                    <p>&copy; 2025 Belgium Campus - Student Wellness Management System</p>
                </div>
                <div class="col-md-6 text-end">
                    <p>Need help? Contact: <a href="mailto:wellness@belgiumcampus.ac.za" class="text-white">wellness@belgiumcampus.ac.za</a></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showComingSoon() {
            alert('This feature will be available in Milestone 2 (Desktop Application)');
        }
    </script>
</body>
</html>