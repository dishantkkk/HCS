package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EditDept", urlPatterns = {"/EditDept"})
public class EditDept extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int deptid = Integer.parseInt(request.getParameter("deptid"));
            String deptName = request.getParameter("deptName");
            String fees = request.getParameter("fees");
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("update dept set deptName='" + deptName + "',fees='" + fees + "' where deptid='" + deptid + "'");
            int i = ps.executeUpdate();
            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("edit", "Department has been updated successfully..");
                response.sendRedirect("departments.jsp");
            } else {
                out.println("Failed");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
