<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <%!
            String Dname, Fees;
        %>
        <%
            String department = request.getParameter("message");

            Connection con = DB.getConnection();
            Statement sts = con.createStatement();
            ResultSet rss = sts.executeQuery("select Dname,Fees from table_doctor where Department='" + department + "'");
            while (rss.next()) {

                Dname = rss.getString("Dname");
                Fees = rss.getString("Fees");

            }

        %>

        <div class="panel-body">
            <div class="row">

                <option value="<%=Dname%>"><%=Dname%></option>


                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <label>Doctor-Fees</label>
                        <input type="number" required="" name="fees" value="<%=Fees%>" id="first_name" class="form-control input-md" title="Enter Contact No.">
                        <div class="validation"></div>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>


