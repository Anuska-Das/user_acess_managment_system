<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .login-container label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
            display: block;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            outline: none;
            border-color: #5e60ce;
            box-shadow: 0 0 5px rgba(94, 96, 206, 0.5);
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            background-color: #5e60ce;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #4c4bb3;
        }

        .login-container .form-info {
            font-size: 12px;
            color: #888;
            margin-top: 10px;
            text-align: center;
        }

        .login-container .form-info a {
            color: #5e60ce;
            text-decoration: none;
        }

        .login-container .form-info a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Your Account</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="Enter your username" required />

            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required />

            <button type="submit">Login</button>
        </form>

        <p class="form-info">
            Don't have an account? <a href="signup.jsp">Sign up here</a>
        </p>
    </div>
</body>
</html>
