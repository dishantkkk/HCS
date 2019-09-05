<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Connection conn, con;
            Statement st, st1;
            ResultSet rs, rs1;
        %>

        <%
            try {
                String id = request.getParameter("id");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("delete from table_doctor where Did='" + id + "'");
                st1 = conn.createStatement();
                int j = st1.executeUpdate("delete from appointment where Did='" + id + "'");
                session.setAttribute("delete", "delete");
                response.sendRedirect("DoctorsList.jsp");
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
