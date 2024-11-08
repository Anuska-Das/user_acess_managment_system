<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Access Approval</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9; 
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 30px;
        width: 80%;
        max-width: 1000px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
        font-size: 24px;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f4f4f9;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .button-container {
        display: flex;
        gap: 10px;
    }

    button {
        padding: 8px 15px;
        font-size: 14px;
        font-weight: bold;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button[name="action"][value="approve"] {
        background-color: #28a745; 
    }

    button[name="action"][value="reject"] {
        background-color: #dc3545; 
    }

    button:hover {
        opacity: 0.9;
    }

</style>
</head>
<body>
    <div class="container">
        <h1>Request Access Approval</h1>
        <form action="ApprovalServlet" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Employee Name</th>
                        <th>Software</th>
                        <th>Access Type</th>
                        <th>Reason for Access</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    	List<List<String>> lists = (List<List<String>>) request.getAttribute("result"); 
                    	if(lists != null && !lists.isEmpty()){ 
                    		for(List<String> l : lists){ 
                    %>
                    <tr>
                        <td><%= l.get(0) %></td> <!-- Employee Name -->
                        <td><%= l.get(1) %></td> <!-- Software -->
                        <td><%= l.get(2) %></td> <!-- Access Type -->
                        <td><%= l.get(3) %></td> <!-- Reason for Access -->

                        <td>
                            <div class="button-container">
                                <input type="hidden" name="user_id" value="<%= l.get(4) %>"> 
                                <button name="action" value="approve">Approve</button>
                                <button name="action" value="reject">Reject</button>
                            </div>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No pending requests found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>