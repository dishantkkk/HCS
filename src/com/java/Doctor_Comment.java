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

@WebServlet(name = "Doctor_Comment", urlPatterns = {"/Doctor_Comment"})
public class Doctor_Comment extends HttpServlet {

    PrintWriter out;
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pid = request.getParameter("pid");
        String did = request.getParameter("did");
        String appoint_date_time = request.getParameter("appoint_date_time");
        String doctor_comment = request.getParameter("doctor_comment");
        String sql = "update appointment set doctor_comment='" + doctor_comment + "' where pid='" + pid + "' and did='" + did + "' and appoint_date_time='" + appoint_date_time + "'";
        try {
            out = response.getWriter();
            session = request.getSession();
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            int i = st.executeUpdate(sql);
            if (i > 0) {
                session.setAttribute("comment", "comment");
                response.sendRedirect("ViewReport.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
