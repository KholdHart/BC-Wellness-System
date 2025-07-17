<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BC Wellness System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
        }
        .login-form {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 2rem;
            max-width: 400px;
            width: 100%;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .alert {
            border-radius: 10px;
            margin-bottom: 1rem;
        }
        .welcome-text {
            color: #667eea;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="login-form">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-primary">Welcome Back</h2>
                            <p class="text-muted">Sign in to your account</p>
                        </div>

                        <!-- Display error message -->
                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle"></i> <%= errorMessage %>
                            </div>
                        <% } %>

                        <!-- Display success message -->
                        <% String successMessage = (String) request.getAttribute("successMessage"); %>
                        <% if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <i class="fas fa-check-circle"></i> <%= successMessage %>
                            </div>
                        <% } %>

                        <form action="LoginServlet" method="POST" id="loginForm">
                            <div class="mb-3">
                                <label for="usernameOrEmail" class="form-label">Student Number or Email</label>
                                <input type="text" class="form-control" id="usernameOrEmail" name="usernameOrEmail" 
                                       value="<%= request.getParameter("usernameOrEmail") != null ? request.getParameter("usernameOrEmail") : "" %>" 
                                       required maxlength="100" placeholder="Enter your student number or email">
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       required maxlength="100" placeholder="Enter your password">
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-login text-white">
                                    <i class="fas fa-sign-in-alt"></i> Login
                                </button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <p class="text-muted">Don't have an account? 
                                <a href="register.jsp" class="text-primary">Register here</a>
                            </p>
                        </div>

                        <div class="text-center mt-2">
                            <a href="index.jsp" class="text-muted">
                                <i class="fas fa-arrow-left"></i> Back to Home
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
    <script>
        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const username = document.getElementById('usernameOrEmail').value.trim();
            const password = document.getElementById('password').value;
            
            if (username === '' || password === '') {
                e.preventDefault();
                alert('Please fill in all fields');
            }
        });
    </script>
</body>
</html>