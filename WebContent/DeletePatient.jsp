<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <title>Insert title here</title>
    </head>
    <body>
        <%!
            Connection conn;
            Statement st, st1, st2, st3;
            ResultSet rs;
        %>

        <%
            try {
                String id = request.getParameter("id");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("delete from table_patient where Pid='" + id + "'");
                st1 = conn.createStatement();
                int j = st1.executeUpdate("delete from appointment where Pid='" + id + "'");
                st2 = conn.createStatement();
                int k = st2.executeUpdate("delete from Patient_Bill where Pid='" + id + "'");
                session.setAttribute("delete", "delete");
                response.sendRedirect("ViewAPatients.jsp");
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
