<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            ResultSet rs;
            String p_id, p_name;
        %>
        <%
            p_id = request.getParameter("pid");
            p_name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String phone = request.getParameter("phone");
            String p_dob = request.getParameter("dob");
            String p_gender = request.getParameter("gender");
            String age = request.getParameter("age");
            String p_status = request.getParameter("status");
            String p_address = request.getParameter("address");
            String p_disease = request.getParameter("disease");
            //String p_roomType=request.getParameter("room");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat();
            String date = s.format(d);
            try {
                Connection con = DB.getConnection();
                ps = con.prepareStatement("insert into table_patient values (?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, p_id);
                ps.setString(2, p_name);
                ps.setString(3, email);
                ps.setString(4, pass);
                ps.setString(5, phone);
                ps.setString(6, p_dob);
                ps.setString(7, p_gender);
                ps.setString(8, age);
                ps.setString(9, p_status);
                ps.setString(10, p_address);
                ps.setString(11, p_disease);
                //ps.setString(12,p_roomType);
                ps.setString(12, date);
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("PatientAdded.jsp");
                    //out.println("<h1>Registration Suucessful...</h1>");
                } else {
                    out.println("<h1>Somethong Went Wrong Try Again...</h1>");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
