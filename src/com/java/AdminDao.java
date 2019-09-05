package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminDao", urlPatterns = {"/AdminDao"})
public class AdminDao extends HttpServlet {

    PrintWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        try {
            con = DB.getConnection();
            String email = request.getParameter("email");
            String Pass = request.getParameter("password");
            String sql = "select * from admin where email=? and password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, Pass);
            ps.executeQuery();
            rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("name", email);
                response.sendRedirect("AdminHome.jsp");
            } else {
                String msg = "Invalid Username or Password...";
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("AdminForm.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
