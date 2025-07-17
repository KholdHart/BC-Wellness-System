<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BC Student Wellness Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
        }
        .feature-card {
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <strong>BC Wellness</strong>
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="login.jsp">Login</a>
                <a class="nav-link" href="register.jsp">Register</a> //
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">Welcome to BC Student Wellness System</h1>
            <p class="lead mb-4">Your mental health and well-being are our priority. Access counseling services, book appointments, and manage your wellness journey.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="login.jsp" class="btn btn-light btn-lg">Login</a>
                <a href="register.jsp" class="btn btn-outline-light btn-lg">Register</a>            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-calendar-alt fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title">Appointment Booking</h5>
                            <p class="card-text">Schedule appointments with qualified counselors at your convenience.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-user-friends fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">Professional Counselors</h5>
                            <p class="card-text">Connect with experienced mental health professionals who understand student needs.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-comments fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title">Feedback System</h5>
                            <p class="card-text">Share your experience and help us improve our services for all students.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p>&copy; 2025 Belgium Campus - Student Wellness Management System</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>