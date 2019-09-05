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
        <title>Departments</title>
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
        tr,td{
            text-align: center;
        }
    </style>
</head>
<body style="background-image: url(images/bg1.jpg);">
    <jsp:include page="AEheader.jsp" flush="true"></jsp:include>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        int deptid;
        String deptName, fees;
    %>

<center><h2>Doctor Departments</h2></center>
    <%
        String del = (String) session.getAttribute("del");
        if (del != null) {
            session.removeAttribute("del");
            out.println("<center><div class='alert alert-success'>Department has been deleted successfully..</div></center>");
        } else {
        }
        String edit = (String) session.getAttribute("edit");
        if (edit != null) {
            session.removeAttribute("edit");
            out.println("<center><div class='alert alert-success'>Department has been updated successfully...</div></center>");
        }
        String add = (String) session.getAttribute("add");
        if (add != null) {
            session.removeAttribute("add");
            out.println("<center><div class='alert alert-success'>Department has been added successfully...</div></center>");
        }
    %><hr>
<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Department Name</th><th>Doctor Fees</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from dept");
                while (rs.next()) {
                    count++;
                    deptid = rs.getInt("deptid");
                    deptName = rs.getString("deptName");
                    fees = rs.getString("fees");

        %>
        <tr>
            <td><%=count%></td><td><%=deptName%></td><td><%=fees%></td>
            <td><a href="EditDept.jsp?id=<%=deptid%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DelDept?id=<%=deptid%>">Delete</a></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center><a style="color:red;font-size: 20px;" href="AddDept.jsp">Add Department</a></center>
</body>
</html>