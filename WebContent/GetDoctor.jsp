<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String department = request.getParameter("message");
            Connection con1 = DB.getConnection();
            Statement st1 = con1.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from table_doctor where Department='" + department + "'");
            while (rs1.next()) {
                //out.println("<input type='hidden' name='dname' value='+rs1.getString('Dname')+'>");
                out.println("<option value='" + rs1.getString("Did") + "'>" + rs1.getString("Dname") + "</option>");
            }
        %>
    </body>
</html>
