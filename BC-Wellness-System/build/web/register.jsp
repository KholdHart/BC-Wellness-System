<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - BC Wellness System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .register-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
        }
        .register-form {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 2rem;
            max-width: 500px;
            width: 100%;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-register {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .alert {
            border-radius: 10px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="register-form">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-primary">Create Account</h2>
                            <p class="text-muted">Join BC Wellness System</p>
                        </div>

                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle"></i> <%= errorMessage %>
                            </div>
                        <% } %>

                        <% String successMessage = (String) request.getAttribute("successMessage"); %>
                        <% if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <i class="fas fa-check-circle"></i> <%= successMessage %>
                            </div>
                        <% } %>

                        <form action="RegisterServlet" method="POST" id="registerForm">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required maxlength="50">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="surname" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="surname" name="surname" required maxlength="50">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="studentNumber" class="form-label">Student Number</label>
                                <input type="text" class="form-control" id="studentNumber" name="studentNumber" required maxlength="20">
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required maxlength="100">
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="tel" class="form-control" id="phone" name="phone" required maxlength="15" placeholder="0123456789 or +27123456789">
                                <div class="form-text">Format: 0123456789 or +27123456789</div>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required minlength="6" maxlength="100">
                                <div class="form-text">Password must be at least 6 characters long</div>
                            </div>

                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required minlength="6" maxlength="100">
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-register text-white">
                                    <i class="fas fa-user-plus"></i> Register
                                </button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <p class="text-muted">Already have an account? 
                                <a href="login.jsp" class="text-primary">Login here</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match');
            }
        });
    </script>
</body>
</html>