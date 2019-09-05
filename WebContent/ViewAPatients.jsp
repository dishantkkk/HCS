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
        <title>View Patients</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
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
        String name = (String) session.getAttribute("name");
        if (name != null) {
    %>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String name, email, gender, service, pass, age, Reg_Date, contact, dob, status, pid, room, address, disease;
    %>
<center><h2>All Patients</h2></center>
    <%
        String delete = (String) session.getAttribute("delete");
        if (delete != null) {
            session.removeAttribute("delete");
            out.println("<center><div class='alert alert-success'>Patient has been removed successfully...</div></center>");
        } else {
        }
        String update = (String) session.getAttribute("update");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-success'>Patient detail has been updated successfully...</div></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>ID</th><th>Name</th><th>Gender</th><th>DOB</th><th>Age</th><th>Status</th><th>Contact</th><th>Email</th><th>Address</th><th>Registration Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from table_patient");
                while (rs.next()) {
                    count++;
        %>
        <tr>
            <td><%=count%> <td><%=rs.getString("Pid")%></td><td><%=rs.getString("Pname")%></td><td><%=rs.getString("Gender")%></td><td><%=rs.getString("Dob")%></td><td><%=rs.getString("age")%></td><td><%=rs.getString("Pstatus")%></td><td><%=rs.getString("Contact")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("reg_date")%></td>
            <td><a href="EditAPatient.jsp?id=<%=rs.getString("pid")%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DeletePatient.jsp?id=<%=rs.getString("pid")%>">Delete</a></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center>
    <!--    <a href="AdminHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>-->
</center>
<%            } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>