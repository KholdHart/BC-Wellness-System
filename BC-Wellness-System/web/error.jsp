<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - BC Wellness System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .error-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 3rem;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        .error-icon {
            font-size: 5rem;
            color: #dc3545;
            margin-bottom: 1.5rem;
        }
        .error-code {
            font-size: 8rem;
            font-weight: bold;
            color: #667eea;
            line-height: 1;
            margin-bottom: 1rem;
        }
        .btn-primary-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.4);
        }
        .btn-secondary-custom {
            background: #6c757d;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-secondary-custom:hover {
            background: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(108, 117, 125, 0.4);
        }
        .error-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            text-align: left;
        }
        .animate-fade-in {
            animation: fadeIn 0.6s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-card animate-fade-in">
            <%
                String errorType = request.getParameter("type");
                String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
                Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                String requestURI = (String) request.getAttribute("javax.servlet.error.request_uri");
                
                // Default values
                if (statusCode == null) statusCode = 500;
                if (errorMessage == null) errorMessage = "An unexpected error occurred";
                if (requestURI == null) requestURI = "Unknown";
                
                String iconClass = "fas fa-exclamation-triangle";
                String titleText = "Error " + statusCode;
                String descriptionText = errorMessage;
                
                // Customize based on error type
                if (statusCode == 404) {
                    iconClass = "fas fa-search";
                    titleText = "Page Not Found";
                    descriptionText = "The page you're looking for doesn't exist or has been moved.";
                } else if (statusCode == 403) {
                    iconClass = "fas fa-lock";
                    titleText = "Access Denied";
                    descriptionText = "You don't have permission to access this resource.";
                } else if (statusCode == 500) {
                    iconClass = "fas fa-server";
                    titleText = "Server Error";
                    descriptionText = "We're experiencing technical difficulties. Please try again later.";
                }
            %>
            
            <div class="error-icon">
                <i class="<%= iconClass %>"></i>
            </div>
            
            <div class="error-code"><%= statusCode %></div>
            
            <h2 class="text-primary mb-3"><%= titleText %></h2>
            <p class="text-muted mb-4"><%= descriptionText %></p>
            
            <% if (statusCode == 404) { %>
                <div class="error-details">
                    <strong>Requested URL:</strong> <%= requestURI %><br>
                    <strong>Possible causes:</strong>
                    <ul class="mt-2 mb-0">
                        <li>The URL was typed incorrectly</li>
                        <li>The page has been moved or deleted</li>
                        <li>The link you followed is broken</li>
                    </ul>
                </div>
            <% } else if (statusCode == 500) { %>
                <div class="error-details">
                    <strong>What happened:</strong> <%= errorMessage %><br>
                    <strong>What you can do:</strong>
                    <ul class="mt-2 mb-0">
                        <li>Try refreshing the page</li>
                        <li>Go back to the previous page</li>
                        <li>Contact support if the problem persists</li>
                    </ul>
                </div>
            <% } %>
            
            <div class="d-flex gap-3 justify-content-center mt-4">
                <button onclick="history.back()" class="btn btn-secondary-custom">
                    <i class="fas fa-arrow-left"></i> Go Back
                </button>
                <a href="index.jsp" class="btn btn-primary-custom">
                    <i class="fas fa-home"></i> Home Page
                </a>
            </div>
            
            <div class="mt-4">
                <p class="text-muted small">
                    If you continue to experience problems, please contact our support team at 
                    <a href="mailto:support@belgiumcampus.ac.za" class="text-primary">support@belgiumcampus.ac.za</a>
                </p>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="position-fixed bottom-0 w-100 text-center text-white" style="background: rgba(0,0,0,0.5); padding: 10px;">
        <small>&copy; 2025 Belgium Campus - Student Wellness Management System</small>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-refresh functionality for server errors
        <% if (statusCode == 500) { %>
            let countdown = 30;
            function updateCountdown() {
                const countdownElement = document.getElementById('countdown');
                if (countdownElement) {
                    countdownElement.textContent = countdown;
                    countdown--;
                    if (countdown < 0) {
                        location.reload();
                    }
                }
            }
            
            // Add countdown for server errors
            document.addEventListener('DOMContentLoaded', function() {
                const errorCard = document.querySelector('.error-card');
                const countdownDiv = document.createElement('div');
                countdownDiv.className = 'mt-3 text-muted small';
                countdownDiv.innerHTML = 'Page will auto-refresh in <span id="countdown">30</span> seconds';
                errorCard.appendChild(countdownDiv);
                
                setInterval(updateCountdown, 1000);
            });
        <% } %>
        
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effects to buttons
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px)';
                });
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>