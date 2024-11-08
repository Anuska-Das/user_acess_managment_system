package com.jsp.javaServlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {	
    private static final String URL = "jdbc:mysql://localhost:3306/user_access_management";
    private static final String USER = "root";  // MySQL user
    private static final String PASSWORD = "anuska";  // MySQL password

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

