<%@page import="com.java.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Paid Bills</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <style>
        th,tr,td{
            text-align: center;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
</head>
<body style="background-image: url(images/bg1.jpg);">
    <jsp:include page="AEheader.jsp" flush="true"></jsp:include>
    <%
        String pname = request.getParameter("name");
        String pid = request.getParameter("id");
        String name = (String) session.getAttribute("name");
        if (name != null) {
    %>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String pname, dname, pid, bill, did, date;
    %>
<center><h2><%=pname%>'s Billing History</h2></center>
<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Doctor ID</th><th>Doctor Name</th><th>Department</th><th>Appointment Date</th><th>Bill Amount</th><th>Bill Paid Date</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select a.pname,a.did,a.pid,a.fees,a.dname,a.appoint_date_time,a.department,b.date from appointment a join patient_bill b on a.pid=b.pid and a.flag=1 and a.pid='" + pid + "' group by a.dname");

                while (rs.next()) {
                    count++;
                    pid = rs.getString("pid");
                    pname = rs.getString("pname");
                    dname = rs.getString("dname");
                    did = rs.getString("did");
                    bill = rs.getString("fees");
                    date = rs.getString("date");
        %>
        <tr>
            <td><%=count%></td><td><%=did%></td><td><%=dname%></td><td><%=rs.getString("department")%><td><%=rs.getString("appoint_date_time")%></td><td><%=bill%></td><td><%=date%></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<%            } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>