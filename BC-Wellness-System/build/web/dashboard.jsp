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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 0;
        }
        .welcome-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-top: -30px;
            position: relative;
            z-index: 1;
        }
        .service-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 2rem;
            text-align: center;
            transition: transform 0.3s ease;
            height: 100%;
        }
        .service-card:hover {
            transform: translateY(-10px);
        }
        .service-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .navbar-custom {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
        }
        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
            margin: 0 auto 1rem;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            margin-bottom: 1rem;
        }
        .btn-logout {
            background: #dc3545;
            border: none;
            padding: 8px 20px;
            border-radius: 25px;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-logout:hover {
            background: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
        }
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: #dc3545;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="dashboard.jsp">
                <i class="fas fa-heartbeat"></i> BC Wellness
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user"></i> Welcome, <%= user.getFullName() %>
                </span>
                <a href="LogoutServlet" class="btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Dashboard Header -->
    <section class="dashboard-header" style="margin-top: 76px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">
                        <i class="fas fa-tachometer-alt"></i> Student Dashboard
                    </h1>
                    <p class="lead mb-0">Manage your wellness journey and access support services</p>
                </div>
                <div class="col-md-4 text-center">
                    <div class="user-avatar">
                        <%= user.getName().substring(0, 1).toUpperCase() %><%= user.getSurname().substring(0, 1).toUpperCase() %>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Welcome Card -->
    <div class="container">
        <div class="welcome-card">
            <div class="row">
                <div class="col-md-8">
                    <h3 class="text-primary mb-3">Welcome back, <%= user.getName() %>!</h3>
                    <p class="text-muted mb-3">
                        Your mental health and well-being are important to us. Here's what you can do:
                    </p>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="stats-card">
                                <h4 class="mb-1">0</h4>
                                <small>Appointments</small>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-card">
                                <h4 class="mb-1">0</h4>
                                <small>Sessions</small>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stats-card">
                                <h4 class="mb-1">0</h4>
                                <small>Feedback</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="text-center">
                        <h5 class="text-muted mb-3">Your Information</h5>
                        <p class="mb-1"><strong>Student Number:</strong> <%= user.getStudentNumber() %></p>
                        <p class="mb-1"><strong>Email:</strong> <%= user.getEmail() %></p>
                        <p class="mb-1"><strong>Phone:</strong> <%= user.getPhone() %></p>
                        <p class="mb-0"><strong>Member Since:</strong> <%= user.getCreatedAt() != null ? user.getCreatedAt().toString().substring(0, 10) : "N/A" %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Available Services</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <div class="service-icon text-primary">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h5 class="mb-3">Book Appointment</h5>
                        <p class="text-muted mb-4">Schedule a session with our qualified counselors</p>
                        <button class="btn btn-outline-primary" onclick="showComingSoon()">
                            <i class="fas fa-plus"></i> Book Now
                        </button>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <div class="service-icon text-success">
                            <i class="fas fa-user-md"></i>
                        </div>
                        <h5 class="mb-3">View Counselors</h5>
                        <p class="text-muted mb-4">Browse available counselors and their specializations</p>
                        <button class="btn btn-outline-success" onclick="showComingSoon()">
                            <i class="fas fa-eye"></i> View All
                        </button>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <div class="service-icon text-info">
                            <i class="fas fa-comment-alt"></i>
                        </div>
                        <h5 class="mb-3">Feedback</h5>
                        <p class="text-muted mb-4">Share your experience and help us improve</p>
                        <button class="btn btn-outline-info" onclick="showComingSoon()">
                            <i class="fas fa-star"></i> Give Feedback
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Actions -->
    <section class="py-4 bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="mb-3">Quick Actions</h4>
                    <div class="d-flex gap-3">
                        <button class="btn btn-primary" onclick="showComingSoon()">
                            <i class="fas fa-calendar-plus"></i> New Appointment
                        </button>
                        <button class="btn btn-success" onclick="showComingSoon()">
                            <i class="fas fa-history"></i> View History
                        </button>
                        <button class="btn btn-info" onclick="showComingSoon()">
                            <i class="fas fa-cog"></i> Settings
                        </button>
                        <button class="btn btn-warning" onclick="showComingSoon()">
                            <i class="fas fa-question-circle"></i> Help
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-6 text-start">
                    <p>&copy; 2025 Belgium Campus - Student Wellness Management System</p>
                </div>
                <div class="col-md-6 text-end">
                    <p>Need help? Contact: <a href="mailto:wellness@belgiumcampus.ac.za" class="text-white">wellness@belgiumcampus.ac.za</a></p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function showComingSoon() {
            alert('This feature will be available in Milestone 2 (Desktop Application)');
        }
        
        // Add some interactive elements
        document.addEventListener('DOMContentLoaded', function() {
            // Animate service cards on scroll
            const cards = document.querySelectorAll('.service-card');
            
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -100px 0px'
            };
            
            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);
            
            cards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                observer.observe(card);
            });
        });
    </script>
</body>
</html>