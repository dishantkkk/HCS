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
            int deptid;
            String fees;
        %>
        <%
            String department = request.getParameter("message");

            Connection con = DB.getConnection();
            Statement sts = con.createStatement();
            ResultSet rss = sts.executeQuery("select deptid,fees from dept where deptName='" + department + "'");
            if (rss.next()) {

                deptid = rss.getInt("deptid");
                fees = rss.getString("fees");

            }

        %>

        <div class="panel-body" style="display: none;">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <label>Department ID</label>
                        <input type="number" required="" name="deptid" readonly="" value="<%=deptid%>" id="first_name" class="form-control input-md" title="Enter Contact No.">
                        <div class="validation"></div>
                    </div>
                </div>

                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <label>Fees</label>
                        <input type="number" required="" name="fees" readonly="" value="<%=fees%>" id="first_name" class="form-control input-md" title="Enter Contact No.">
                        <div class="validation"></div>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>


