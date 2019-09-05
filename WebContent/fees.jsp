<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String fees = request.getParameter("count");
            String buffer = "<select name='fees' id='test' class='form-control'>";
            try {
                Connection con = DB.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("Select Fees from table_doctor where Did='" + fees + "' ");
                if (rs.next()) {
                    buffer = buffer + "<option value='" + rs.getString("Fees") + "'>" + rs.getString("Fees") + "</option>";
                }
                buffer = buffer + "</select>";
                response.getWriter().println(buffer);
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </body>
</html>