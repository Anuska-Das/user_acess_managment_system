<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Software</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .form-container input[type="text"]:focus,
        .form-container textarea:focus {
            outline: none;
            border-color: #ff758c;
            box-shadow: 0 0 5px rgba(255, 117, 140, 0.5);
        }

        .form-container .checkbox-group {
            margin-bottom: 15px;
        }

        .form-container .checkbox-group label {
            margin-right: 10px;
            font-size: 14px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #ff758c;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #e0527d;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Create New Software</h2>
        <form action="SoftwareServlet" method="post">
            <label for="name">Software Name</label>
            <input type="text" name="name" id="name" placeholder="Enter software name" required />

            <label for="description">Description</label>
            <textarea name="description" id="description" rows="4" placeholder="Enter software description" required></textarea>

            <div class="radio-group">
                <label>Access Levels:</label><br/>
                <input type="radio" name="access_levels" value="Read"> <label for="read">Read</label>
                <input type="radio" name="access_levels" value="Write"> <label for="write">Write</label>
                <input type="radio" name="access_levels" value="Admin"> <label for="admin">Admin</label>
            </div>

            <button type="submit">Create Software</button>
        </form>
    </div>
</body>
</html>
