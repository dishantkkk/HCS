package com.java;

import java.sql.*;

public class DB {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "pass");
            //con = DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/saddam1_hcs", "saddam1_hcs1", "Root@123");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
