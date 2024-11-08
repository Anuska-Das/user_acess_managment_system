<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Form</title>
<style>
    body {
        background-color: #6a0dad; 
        color: white;
        font-family: Arial, sans-serif;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: white;
    }

    form {
        background-color: rgba(255, 255, 255, 0.1); 
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        margin: 0 auto;
        
    }

    label {
        font-size: 1.1em;
        margin-bottom: 8px;
        display: block;
    }

    select, textarea, button {
        width: 97%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ddd;
    }

    select, textarea {
        background-color: #4b0082; 
        color: white;
    }

    button {
        background-color: #8a2be2;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #7a1fe0; 
    }

</style>
</head>
<body>
    <h1>Software Access Request Form</h1>
    <form action="RequestServlet" method="post">
        <label for="software_id">Software:</label>
        <select name="software_id" required>
            <% ResultSet rs = (ResultSet) request.getAttribute("result"); while(rs.next()){ %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
            <% } %>
        </select><br/>
        <label for="access_type">Access Type:</label>
        <select name="access_type" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br/>
        <label for="reason">Reason for Request:</label>
        <textarea name="reason" required></textarea><br/>
        <% int id = (Integer) request.getAttribute("id"); %>
        <input type="hidden" name="userId" value="<%= id %>" placeholder="Enter your Id" required  />
        <button type="submit">Submit Request</button>
    </form>
</body>
</html>
