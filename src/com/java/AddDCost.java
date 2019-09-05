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

@WebServlet(name = "AddDCost", urlPatterns = {"/AddDCost"})
public class AddDCost extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            Connection con = DB.getConnection();
            String Disease_Name = request.getParameter("Diagnosis_Name");
            String Cost = request.getParameter("Cost");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            String date = s.format(d);
            PreparedStatement ps = con.prepareStatement("insert into diseasecost(Disease_Name,Cost,added_date) values(?,?,?)");
            ps.setString(1, Disease_Name);
            ps.setString(2, Cost);
            ps.setString(3, date);
            int i = ps.executeUpdate();
            if (i > 0) {
                String msg = "Diagnosis costs has been added successfully...";
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("AddDCost.jsp");
            }

        } catch (Exception ex) {
            out.println(ex);
        }
    }

}
