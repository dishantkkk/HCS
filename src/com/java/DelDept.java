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

@WebServlet(name = "DelDept", urlPatterns = {"/DelDept"})
public class DelDept extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int deptid = Integer.parseInt(request.getParameter("id"));

            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from dept where deptid='" + deptid + "'");
            int i = ps.executeUpdate();
            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("del", "del");
                response.sendRedirect("departments.jsp");
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
