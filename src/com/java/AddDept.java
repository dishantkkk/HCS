package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddDept", urlPatterns = {"/AddDept"})
public class AddDept extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con = DB.getConnection();
            String deptName = request.getParameter("deptName");
            String fees = request.getParameter("fees");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            String date = s.format(d);
            PreparedStatement ps = con.prepareStatement("insert into dept(deptName,fees,added_date) values(?,?,?)");
            ps.setString(1, deptName);
            ps.setString(2, fees);
            ps.setString(3, date);
            int i = ps.executeUpdate();
            if (i > 0) {
                String msg = "Department has been added successfully";
                HttpSession session = request.getSession();
                session.setAttribute("add", msg);
                response.sendRedirect("departments.jsp");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
