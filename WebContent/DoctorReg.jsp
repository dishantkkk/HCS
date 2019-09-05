<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
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
            String id, dname;
            ResultSet rs, rs1, rs2, rs3;
            Statement st1, st2, st3;
            int deparmentID;
            String doctorFees, deparmentName;
        %>
        <%
            id = request.getParameter("did");
            dname = request.getParameter("name");
            String email = request.getParameter("email");

            String pass = request.getParameter("pass");
            String d_gender = request.getParameter("gender");
            int deptid = Integer.parseInt(request.getParameter("deptId"));
            String degree = request.getParameter("degree");
            String dept = request.getParameter("department");
            String fees = request.getParameter("fee");
            String d_address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String age = request.getParameter("age");
            Date d = new Date();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            String date = s.format(d);
            try {
                con = DB.getConnection();
                ps = con.prepareStatement("insert into table_doctor values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, dname);
                ps.setString(3, email);
                ps.setString(4, pass);
                ps.setString(5, d_gender);
                ps.setString(6, dob);
                ps.setString(7, age);
                ps.setString(8, degree);
                ps.setString(9, dept);
                ps.setString(10, fees);
                ps.setString(11, phone);
                ps.setString(12, d_address);
                ps.setString(13, date);
                ps.setInt(14, deptid);

                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("DoctorHome.jsp");
                    //out.println("<h1>Registration Suucessful...</h1>");
                } else {
                    out.println("<h1>Somethong Went Wrong Try Again...</h1>");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
        <%
            session.setAttribute("dname", dname);
            session.setAttribute("did", id);
            //session.setAttribute("pemail",email);
        %>
    </body>
</html>
