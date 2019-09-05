/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteAppointment", urlPatterns = {"/DeleteAppointment"})
public class DeleteAppointment extends HttpServlet {

    PrintWriter out;
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            //System.out.println("id: " + id);
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            int i = st.executeUpdate("delete from appointment where id=" + id + "");
            if (i > 0) {
                session.setAttribute("deleted", "deleted");
                response.sendRedirect("ViewAppointment.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

}
