package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AlterAppointment", urlPatterns = {"/AlterAppointment"})
public class AlterAppointment extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    Connection con, con1;
    Statement st, st1;
    ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            String pid = request.getParameter("pid");
            String did = request.getParameter("did");
            String date = request.getParameter("date");//appointment date time
            System.out.println("App Time:" + date);
            String status = request.getParameter("status");

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date1 = df.parse(date);//appointment date time-30m
            System.out.println("App Date:" + date1);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date1);
            cal.add(Calendar.MINUTE, -30);
            String newDate = df.format(cal.getTime());
            out.println("appointment date time-30m:" + newDate);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date2 = sdf.parse(newDate);
            System.out.println("appointment date time-30m Date:" + date2);
            //out.println("appointment date time-30m Date:" + date2);
            Date currentDate = new Date();
            System.out.println("Current Date:" + currentDate);
            con = DB.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from appointment where status='" + status + "' and pid='" + pid + "' and did='" + did + "' and appoint_date_time='" + date + "'");
            if (rs.next()) {
                session.setAttribute("update", "Appointment is alerady " + status + ".");
                response.sendRedirect("ViewDoctorAppointment.jsp");
            } else {
                if (currentDate.before(date2)) {
                    con1 = DB.getConnection();
                    st1 = con1.createStatement();
                    int i = st1.executeUpdate("update appointment set status='" + status + "' where did='" + did + "' and pid in('" + pid + "') and appoint_date_time='" + date + "'");
                    if (i > 0) {
                        session.setAttribute("update1", "Appointment has been " + status + " Successfully...");
                        response.sendRedirect("ViewDoctorAppointment.jsp");
                    } else {
                        session.setAttribute("update1", "Oops Something Went Wrong...");
                        response.sendRedirect("ViewDoctorAppointment.jsp");
                    }
                } else {
                    session.setAttribute("update2", "Sorry you can't update,Because time is upto date.");
                    response.sendRedirect("ViewDoctorAppointment.jsp");
                }
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
