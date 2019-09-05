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

@WebServlet(name = "UpdateAPatients", urlPatterns = {"/UpdateAPatients"})
public class UpdateAPatients extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    Connection con;
    Statement st;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("pid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String contact = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String age = request.getParameter("age");
            String status = request.getParameter("status");
            String address = request.getParameter("address");
                //String service = request.getParameter("service");
            //String room=request.getParameter("room");
            out.println(id + " " + name);
            con = DB.getConnection();
            st = con.createStatement();
            int i = st.executeUpdate("update table_patient set Pname='" + name + "',Email='" + email + "',Pass='" + pass + "',Contact='" + contact + "',DOB='" + dob + "',Gender='" + gender + "',age=" + age + ",Pstatus='" + status + "',Address='" + address + "' where Pid='" + id + "'");
            if (i > 0) {
                session.setAttribute("update", "Patient Detail Updated Successfully...");
                response.sendRedirect("ViewAPatients.jsp");
            } else {
                session.setAttribute("update", "Oops Something Went Wrong...");
                response.sendRedirect("ViewAPatients.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

}
