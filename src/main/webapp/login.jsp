<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Serenify</title>
    <link rel="stylesheet" href="style.css"> <!-- Assuming a common stylesheet -->
    <style>
        /* General Page Styles */
            
            body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
            

        .navbar {
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }
/*
        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 1em;
        }

        .navbar a:hover {
            text-decoration: underline;
        }
 */
        /* Login Container */
        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            margin-top: 50px;
        }

        .login-container h1 {
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
        }

        .login-container p {
            font-size: 0.9em;
            color: #666;
        }

        .form-group {
            margin: 20px 0;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            text-align: left;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ddd;
            margin-top: 5px;
            font-size: 1em;
        }

        .form-group input:focus {
            outline: none;
            border-color: #2193b0;
            box-shadow: 0 0 8px rgba(33, 147, 176, 0.2);
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1em;
            font-weight: bold;
            color: #fff;
            background: #800000	;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #800000;
        }

        .alt-links {
            margin-top: 20px;
        }

        .alt-links a {
            color: #800000;
            text-decoration: none;
            font-weight: bold;
        }

        .alt-links a:hover {
            text-decoration: underline;
        }

        /* Footer */
        footer {
            width: 100%;
            text-align: center;
            padding: 10px 0;
            background: #800000;
            color: #fff;
            position: fixed;
            bottom: 0;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <!-- Include Common Navigation Bar -->
    <%@ include file="MainNavBar.jsp" %>

    <!-- Login Form -->
    <div class="login-container">
        <h1>Welcome Back!</h1>
        <p>Please login to continue to Serenify</p>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>

        <div class="alt-links">
            <p>Don't have an account? <a href="student_registration.jsp">Sign Up</a></p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        &copy; 2024 Serenify. All rights reserved.
    </footer>
</body>
</html>
