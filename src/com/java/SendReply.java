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

@WebServlet(name = "SendReply", urlPatterns = {"/SendReply"})
public class SendReply extends HttpServlet {

    PrintWriter out;
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            String pid = request.getParameter("pid").trim();
            String did = request.getParameter("did").trim();
            String date = request.getParameter("date").trim();
            String doctor_reply = request.getParameter("doctor_reply").trim();
            System.out.println(pid + " " + date + " " + doctor_reply + " " + did);
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            int i = st.executeUpdate("update queries set doctor_reply='" + doctor_reply + "' where did='" + did + "' and pid='" + pid + "' and date='" + date + "'");
            if (i > 0) {
                session.setAttribute("updated", "updated");
                response.sendRedirect("ViewQueries.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
