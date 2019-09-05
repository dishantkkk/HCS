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
                Name = request.getParameter("Doctor_name");
                String pass = request.getParameter("Password");
                id = request.getParameter("did");
                String sql = "select * from table_doctor where Did='" + id + "' && Pass='" + pass + "' ";
                Statement st = con.createStatement();
                rs = st.executeQuery(sql);
                if (rs.next()) {
                    conn = DB.getConnection();
                    pss = conn.prepareStatement("select * from table_doctor where Did='" + id + "'");
                    rss = pss.executeQuery();
                    if (rss.next()) {
                        Name = rss.getString("Dname");
                        age = rss.getString("age");
                        email = rss.getString("email");
                        phone = rss.getString("Contact");
                    }
                    session.setAttribute("did", id);
                    session.setAttribute("dname", Name);
                    session.setAttribute("dage", age);
                    session.setAttribute("demail", email);
                    session.setAttribute("dphone", phone);
                    response.sendRedirect("DoctorHome.jsp");
                } else {
                    String msg = "Invalid Doctor ID or Password";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("DoctorLogin.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
