<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Connection con, conn;
            PreparedStatement ps, pss;
            ResultSet rs, rss;
            String Name, id, age, email, phone;
        %>
        <%
            try {
                con = DB.getConnection();
                // Name=request.getParameter("Patient_name");
                String pass = request.getParameter("Password");
                id = request.getParameter("pid");
                String sql = "select * from table_patient where Pid='" + id + "' and Pass='" + pass + "' ";
                Statement st = con.createStatement();
                rs = st.executeQuery(sql);
                if (rs.next()) {
                    conn = DB.getConnection();
                    pss = conn.prepareStatement("select Pname,age from table_patient where pid='" + id + "'");
                    rss = pss.executeQuery();
                    if (rss.next()) {
                        Name = rs.getString("Pname");
                        age = rs.getString("age");
                        phone = rs.getString("Contact");
                        email = rs.getString("Email");
                    }
                    session.setAttribute("pname", Name);
                    session.setAttribute("pid", id);
                    session.setAttribute("age", age);
                    session.setAttribute("pemail", email);
                    session.setAttribute("pphone", phone);
                    response.sendRedirect("PatientHome.jsp");
                } else {
                    String msg = "Invalid Patient ID or Password...";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("PatientLogin.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
