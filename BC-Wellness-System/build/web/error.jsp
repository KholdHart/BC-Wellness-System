<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - BC Wellness System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            text-align: center;
        }
        .error-box {
            border: 2px solid #dc3545;
            border-radius: 5px;
            padding: 40px;
            background-color: #f8f9fa;
        }
        .error-code {
            font-size: 4rem;
            font-weight: bold;
            color: #dc3545;
            margin-bottom: 20px;
        }
        .error-details {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin: 20px 0;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-box">
            <%
                String errorType = request.getParameter("type");
                String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
                Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                String requestURI = (String) request.getAttribute("javax.servlet.error.request_uri");
                
                // Default values
                if (statusCode == null) statusCode = 500;
                if (errorMessage == null) errorMessage = "An unexpected error occurred";
                if (requestURI == null) requestURI = "Unknown";
                
                String titleText = "Error " + statusCode;
                String descriptionText = errorMessage;
                
                // Customize based on error type
                if (statusCode == 404) {
                    titleText = "Page Not Found";
                    descriptionText = "The page you're looking for doesn't exist or has been moved.";
                } else if (statusCode == 403) {
                    titleText = "Access Denied";
                    descriptionText = "You don't have permission to access this resource.";
                } else if (statusCode == 500) {
                    titleText = "Server Error";
                    descriptionText = "We're experiencing technical difficulties. Please try again later.";
                }
            %>
            
            <div class="error-code"><%= statusCode %></div>
            <h2 class="text-danger"><%= titleText %></h2>
            <p class="text-muted"><%= descriptionText %></p>
            
            <% if (statusCode == 404) { %>
                <div class="error-details">
                    <strong>Requested URL:</strong> <%= requestURI %><br><br>
                    <strong>Possible causes:</strong>
                    <ul>
                        <li>The URL was typed incorrectly</li>
                        <li>The page has been moved or deleted</li>
                        <li>The link you followed is broken</li>
                    </ul>
                </div>
            <% } else if (statusCode == 500) { %>
                <div class="error-details">
                    <strong>What happened:</strong> <%= errorMessage %><br><br>
                    <strong>What you can do:</strong>
                    <ul>
                        <li>Try refreshing the page</li>
                        <li>Go back to the previous page</li>
                        <li>Contact support if the problem persists</li>
                    </ul>
                </div>
            <% } %>
            
            <div class="mt-4">
                <button onclick="history.back()" class="btn btn-secondary me-2">Go Back</button>
                <a href="index.jsp" class="btn btn-primary">Home Page</a>
            </div>
            
            <div class="mt-3">
                <p class="text-muted small">
                    If you continue to experience problems, please contact our support team at 
                    <a href="mailto:support@belgiumcampus.ac.za">support@belgiumcampus.ac.za</a>
                </p>
            </div>
        </div>
    </div>
    
    <div class="fixed-bottom text-center bg-light py-2">
        <small>&copy; 2025 Belgium Campus - Student Wellness Management System</small>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>