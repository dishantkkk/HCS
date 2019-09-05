<%@page import="com.java.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Reports</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
    <style>
        tr,td,th{
            text-align: center;
        }
    </style>
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
        String name, dname, pid, bill, disease, room, gender, age, email;
    %>
<center><h2><%=pname%>'s Reports</h2></center>
<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Doctor ID</th><th>Doctor Name</th><th>Department</th><th>Doctor's Comment</th><th>Appointment Date</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select did,dname,department,appoint_date_time,doctor_comment from appointment where status='Confirmed' and pid='" + pid + "'");
                while (rs.next()) {
                    count++;
        %>
        <tr>
            <td><%=count%></td><td><%=rs.getString("did")%></td><td><%=rs.getString("dname")%></td><td><%=rs.getString("department")%></td><td><%=rs.getString("doctor_comment")%></td><td><%=rs.getString("appoint_date_time")%></td>
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