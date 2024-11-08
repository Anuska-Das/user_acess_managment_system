<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .message-container h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .message-container p {
            margin-bottom: 20px;
            font-size: 16px;
            color: #333;
        }

        .message-container a {
            padding: 10px 20px;
            background-color: #6c63ff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .message-container a:hover {
            background-color: #5751d3;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Registration Successful!</h2>
        <p>Your account has been created successfully. You can now log in.</p>
        <a href="login.jsp">Go to Login</a>
    </div>
</body>
</html>
