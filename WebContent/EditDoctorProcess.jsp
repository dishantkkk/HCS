<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                //out.println(id);
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String contact = request.getParameter("phone");
                String fees = request.getParameter("fees");
                String gender = request.getParameter("gender");
                String dob = request.getParameter("dob");
                System.out.println(dob);
                String age = request.getParameter("age");
                String dept = request.getParameter("Department");
                String address = request.getParameter("address");
                String degree = request.getParameter("degree");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("update Table_Doctor set  dob='" + dob + "',Dname='" + name + "',Email='" + email + "',Pass='" + pass + "',Contact='" + contact + "',Gender='" + gender + "',age='" + age + "',fees='" + fees + "',Address='" + address + "',Department='" + dept + "',Degree='" + degree + "' where Did='" + id + "'");
                if (i > 0) {
                    session.setAttribute("update", "update");
                    response.sendRedirect("DoctorProfile.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>