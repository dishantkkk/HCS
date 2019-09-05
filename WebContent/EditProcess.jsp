<%@page import="com.java.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%!
            Connection conn;
            Statement st;
            ResultSet rs;
        %>
        <%
            try {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String contact = request.getParameter("phone");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String age = request.getParameter("age");
                String status = request.getParameter("status");
                String address = request.getParameter("address");
                //String disease = request.getParameter("disease");
                //String service = request.getParameter("service");
                //String room=request.getParameter("room");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("update table_patient set  Pname='" + name + "',Email='" + email + "',Pass='" + pass + "',Contact='" + contact + "',DOB='" + dob + "',Gender='" + gender + "',Age=" + age + ",Pstatus='" + status + "',Address='" + address + "' where Pid='" + id + "'");
                if (i > 0) {
                    session.setAttribute("updates", "update");
                    response.sendRedirect("ViewProfile.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>