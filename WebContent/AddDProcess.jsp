<%@page import="com.java.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            ResultSet rs;
            String id, dname;
        %>
        <%
            id = request.getParameter("did");
            dname = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String d_gender = request.getParameter("gender");
            String age = request.getParameter("age");
            String degree = request.getParameter("degree");
            String dept = request.getParameter("Department");
            String fees = request.getParameter("fees");
            String d_address = request.getParameter("address");
            String phone = request.getParameter("phone");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat();
            String date = s.format(d);
            try {
                Connection con = DB.getConnection();
                ps = con.prepareStatement("insert into Table_Doctor values(?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, dname);
                ps.setString(3, email);
                ps.setString(4, pass);
                ps.setString(5, d_gender);
                ps.setString(6, age);
                ps.setString(7, degree);
                ps.setString(8, dept);
                ps.setString(9, fees);
                ps.setString(10, phone);
                ps.setString(11, d_address);
                ps.setString(12, date);
                int i = ps.executeUpdate();
                if (i > 0) {
                    session.setAttribute("dname", dname);
                    session.setAttribute("did", id);
                    response.sendRedirect("DoctorAdded.jsp");
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
