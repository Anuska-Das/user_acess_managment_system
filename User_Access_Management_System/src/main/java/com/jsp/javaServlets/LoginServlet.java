package com.jsp.javaServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                if (role.equals("Employee")) {
                	int id = rs.getInt("id");
                	String sQL = "SELECT * FROM software";
                	Statement st = connection.createStatement();
                	ResultSet rest = st.executeQuery(sQL);
                	                	
                	request.setAttribute("id", id);
                	
            		request.setAttribute("result", rest);
            		RequestDispatcher rd = request.getRequestDispatcher("requestAccess.jsp");
            		rd.include(request, response);
                } else if (role.equals("Manager")) {
                	String sQL = "SELECT * FROM requests";
                	Statement st = connection.createStatement();
                	ResultSet rest = st.executeQuery(sQL);
                	
                	

                	List<List<String>> finalList = new ArrayList<List<String>>();
                	while(rest.next()) {
                		if(! (rest.getString("status").equals("Pending"))) continue;
                		List<String> list = new ArrayList<String>();
                		
                		PreparedStatement ps1 = connection.prepareStatement("select * from users where id = ?");
                		ps1.setInt(1, rest.getInt("user_id"));
                		ResultSet rs1 = ps1.executeQuery();
                		rs1.next();
                		list.add(rs1.getString("username"));
                		
                		PreparedStatement ps2 = connection.prepareStatement("select * from software where id = ?");
                		ps2.setInt(1, rest.getInt("software_id"));
                		ResultSet rs2 = ps2.executeQuery();
                		rs2.next();
                		list.add(rs2.getString("name"));
                		
                		list.add(rest.getString("access_type"));
                		list.add(rest.getString("reason"));
                		list.add(rest.getInt("id")+"");
                		
                		finalList.add(list);
                	}
            		request.setAttribute("result", finalList);
            		RequestDispatcher rd = request.getRequestDispatcher("pendingRequests.jsp");
            		rd.include(request, response);
                } else if (role.equals("Admin")) {
                    response.sendRedirect("createSoftware.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}


