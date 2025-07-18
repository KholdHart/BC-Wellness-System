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
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .welcome-message {
            color: #333;
            margin-bottom: 30px;
        }
        .logout-btn {
            margin-top: 20px;
            padding: 12px 30px;
            font-size: 16px;
        }
        .system-title {
            color: #007bff;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1 class="system-title">BC Wellness System</h1>
        <h2 class="welcome-message">Welcome, <%= user.getName() %>!</h2>
        <p class="text-muted">You are successfully logged in to the dashboard.</p>
        
        <form action="LogoutServlet" method="post">
            <button type="submit" class="btn btn-danger logout-btn">Logout</button>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
