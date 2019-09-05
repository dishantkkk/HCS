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
                String id = request.getParameter("did");
                String name = request.getParameter("name");
                String dept = request.getParameter("department");
                int deptid = Integer.parseInt(request.getParameter("deptId"));
                String fees = request.getParameter("fee");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String contact = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String age = request.getParameter("age");

                String address = request.getParameter("address");
                String degree = request.getParameter("degree");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("update table_doctor set  dname='" + name + "',email='" + email + "',pass='" + pass + "',contact='" + contact + "',gender='" + gender + "',age='" + age + "',fees='" + fees + "',address='" + address + "',department='" + dept + "',degree='" + degree + "',deptid='"+deptid+"' where did='" + id + "'");
                if(i>0){
                    response.sendRedirect("DoctorsList.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>