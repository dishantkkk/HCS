<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            String s_id = request.getParameter("id");
            out.println(s_id);
            ResultSet rs = st.executeQuery("select distinct disease from symptoms where symptom like '" + s_id + "%'");
            while (rs.next()) {
        %>

    <option style="font-family:Arial"><%=rs.getString(1)%></option>


    <%
        }


    %>
</table>
</body>
</html>
