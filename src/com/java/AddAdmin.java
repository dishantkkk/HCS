package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddAdmin", urlPatterns = {"/AddAdmin"})
public class AddAdmin extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    Connection con;
    Statement st;
    int i = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            con = DB.getConnection();
            st = con.createStatement();
            i = st.executeUpdate("insert into admin(name,email,password,added_date) values('" + name + "','" + email + "','" + password + "','" + addedDate + "')");
            if (i > 0) {
                session.setAttribute("success", "Administrator Added Successfully...");
                response.sendRedirect("admin.jsp");
            }
        } catch (Exception e) {
            out.print(e);
        }

    }

}
