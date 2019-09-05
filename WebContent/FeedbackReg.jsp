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
        <title>FeedBack</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            String name = "";
        %>
        <%
            String pname = (String) session.getAttribute("pname");
            String dname = (String) session.getAttribute("dname");
            if (pname != null) {
                name = pname;
            } else if (dname != null) {
                name = dname;
            } else {
                name = "Anonymous";
            }
            String service = request.getParameter("service");
            String point = request.getParameter("point");
            String nature = request.getParameter("nature");
            String loc = request.getParameter("hloc");
            String feedback = request.getParameter("feedback");
            //String date=request.getParameter("date");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            String date = s.format(d);
            try {
                con = DB.getConnection();
                ps = con.prepareStatement("insert into feedback(name,service,points,nature,location,feedback,date) values (?,?,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, service);
                ps.setString(3, point);
                ps.setString(4, nature);
                ps.setString(5, loc);
                ps.setString(6, feedback);
                ps.setString(7, date);
                int i = ps.executeUpdate();
                if (i > 0) {
                    session.setAttribute("feedback", "feed");
                    response.sendRedirect("FeedbackForm.jsp");
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
