package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AskDoctor", urlPatterns = {"/AskDoctor"})
public class AskDoctor extends HttpServlet {

    String dname;
    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            //out.print("hello");
            HttpSession session = request.getSession();
            String pid = (String) session.getAttribute("pid");
            String pname = request.getParameter("pname");
            String age = request.getParameter("age");
            String smoke = request.getParameter("smoke");
            String alcohlic = request.getParameter("alcohlic");
            String symtomps = request.getParameter("queries");
            String department = request.getParameter("department");
            String did = request.getParameter("doctor");
            //System.out.println("did:" + did);
            //out.println("did:" + did);
            Connection con1 = DB.getConnection();
            Statement st1 = con1.createStatement();
            ResultSet rs = st1.executeQuery("select Dname from table_doctor where Did='" + did + "'");
            if (rs.next()) {
                dname = rs.getString(1);
            } else {
                dname = "Ask Admin";
            }
            String doctor_reply = "NA";
            //System.out.println("dname:" + dname);
            //out.println("dname:" + dname);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = sdf.format(new Date());

            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            int i = st.executeUpdate("INSERT INTO `queries`(`pid`, `pname`, `age`, `smoking`, `alcohlic`, `query`, `department`, `did`, `dname`, `doctor_reply`, `date`) VALUES ('" + pid + "','" + pname + "','" + age + "','" + smoke + "','" + alcohlic + "','" + symtomps + "','" + department + "','" + did + "','" + dname + "','" + doctor_reply + "','" + date + "')");
            if (i > 0) {
                String msg = "Your query has been sent successfully...";
                session.setAttribute("msg", msg);
                response.sendRedirect("AskDoctor.jsp");
            } else {
                String msg = "Oops! Something went wrong...";
                session.setAttribute("msg", msg);
                response.sendRedirect("AskDoctor.jsp");
            }
        } catch (Exception ex) {
            out.println(ex);
        }
    }

}
