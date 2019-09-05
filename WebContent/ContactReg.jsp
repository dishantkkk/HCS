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
        <title>Contact Us</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
        %>
        <%
            String name = request.getParameter("uname");
            String email = request.getParameter("email");
            String contact = request.getParameter("phone");
            String message = request.getParameter("message");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());

            try {
                con = DB.getConnection();
                ps = con.prepareStatement("insert into contact(name,email,contact,subject,message) values (?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, contact);
                ps.setString(4, message);
                ps.setString(5, date);
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("ContactSubmitted.jsp");
                } else {
                    out.println("<h1>Somethong Went Wrong Try Again...</h1>");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
