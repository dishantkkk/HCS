<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Doctors</title>
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
    <%
        try {
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from table_doctor ");
    %>
<center><h2>All Doctors</h2></center>
    <%
        String delete = (String) session.getAttribute("delete");
        if (delete != null) {
            session.removeAttribute("delete");
            out.println("<center><div class='alert alert-success'>Doctor has been removed successfully...</div></center>");
        } else {
        }
        String update = (String) session.getAttribute("update");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-success'>Doctor detail has been updated successfully...</div></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped table-bordered" style="background-color: transparent;">
    <thead>
        <tr>
            <th>Sr. No.</th><th>ID</th><th>Name</th><th>Gender</th><th>DOB</th><th>Age</th><th>Department</th><th>Degree</th><th>Fee</th><th>Contact</th><th>Email</th><th>Address</th><th>Registration Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            while (rs.next()) {
                count++;
        %>
        <tr><td><%=count%></td><td><%=rs.getString("Did")%></td><td><%=rs.getString("Dname")%></td><td><%=rs.getString("Gender")%></td><td><%=rs.getString("dob")%></td><td><%=rs.getString("age")%></td><td><%=rs.getString("Department")%></td><td><%=rs.getString("Degree")%></td><td><%=rs.getString("fees")%></td><td><%=rs.getString("contact")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("Reg_Date")%></td>
            <td><a href="EditADoctor.jsp?id=<%=rs.getString("Did")%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DeleteDoctor.jsp?id=<%=rs.getString("Did")%>">Delete</a></td></tr>
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
