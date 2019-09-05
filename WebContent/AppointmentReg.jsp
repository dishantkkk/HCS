<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs1, rs2, rs3;
            Statement st1, st2, st3;
            String deparmentName, dname, doctorFees;
        %>
        <%
            String status = "Pending";
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf1.format(new Date());
            String pid = (String) session.getAttribute("pid");
            String pname = (String) session.getAttribute("pname");
            String dept = request.getParameter("department");
            String did = request.getParameter("doctor");
            Connection cons = DB.getConnection();
            Statement sts = cons.createStatement();
            ResultSet rss = sts.executeQuery("select Dname from table_doctor where did='" + did + "'");
            if (rss.next()) {
                dname = rss.getString(1);
            }
            String fees = request.getParameter("fees");
            String appoint_date_time = request.getParameter("appoint_date_time");
            String[] dates = appoint_date_time.split(" ");
            String appoint_date = dates[0];
            String appoint_time = dates[1];
            String doctor_comment = "N.A";
            int flag = 0;
            try {
                con = DB.getConnection();
                st1 = con.createStatement();
                ps = con.prepareStatement("insert into appointment(pid,pname,did,dname,department,fees,appoint_date,appoint_time,status,doctor_comment,appoint_date_time,added_date,flag) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, pid);
                ps.setString(2, pname);
                ps.setString(3, did);
                ps.setString(4, dname);
                ps.setString(5, dept);
                ps.setString(6, fees);
                ps.setString(7, appoint_date);
                ps.setString(8, appoint_time);
                ps.setString(9, status);
                ps.setString(10, doctor_comment);
                ps.setString(11, appoint_date_time);
                ps.setString(12, addedDate);
                ps.setInt(13, flag);
                int i = ps.executeUpdate();
                if (i > 0) {
                    String msg = "Your appointment has been booked Successfully...";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("BookApointment.jsp");
                } else {
                    String msg = "Oops! Somethong Went Wrong Please Try Again...";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("BookApointment.jsp");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
