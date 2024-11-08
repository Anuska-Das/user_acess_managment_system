<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Sign Up</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .signup-container h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .signup-container label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
            display: block;
        }

        .signup-container input[type="text"],
        .signup-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .signup-container input[type="text"]:focus,
        .signup-container input[type="password"]:focus {
            outline: none;
            border-color: #6c63ff;
            box-shadow: 0 0 5px rgba(108, 99, 255, 0.5);
        }

        .signup-container button {
            width: 100%;
            padding: 12px;
            background-color: #6c63ff;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup-container button:hover {
            background-color: #5751d3;
        }

        .signup-container .form-info {
            font-size: 12px;
            color: #888;
            margin-top: 10px;
            text-align: center;
        }

        .signup-container .form-info a {
            color: #6c63ff;
            text-decoration: none;
        }

        .signup-container .form-info a:hover {
            text-decoration: underline;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .signup-container {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Create an Account</h2>
        <form action="SignUpServlet" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="Enter your username" required />

            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required />
            
             
            <input type="hidden" name="role" value="Employee" placeholder="Enter your Role" required  />

            <button type="submit">Sign Up</button>
        </form>

        <p class="form-info">
            Already have an account? <a href="login.jsp">Login here</a>
        </p>
    </div>
</body>
</html>
