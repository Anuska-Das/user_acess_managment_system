package com.jsp.javaServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int softwareId = Integer.parseInt(request.getParameter("software_id"));
        String accessType = request.getParameter("access_type");
        String reason = request.getParameter("reason");
        int userId = Integer.parseInt(request.getParameter("userId")); // Example: You need to retrieve the logged-in user's ID

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, softwareId);
            stmt.setString(3, accessType);
            stmt.setString(4, reason);
            stmt.executeUpdate();
            
            response.sendRedirect("login.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}

