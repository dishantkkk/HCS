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
        <title>Smart Health Care System</title>
<link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <!--        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <style>
        tr,td,th{
            background-color: white;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
    <jsp:include page="DHeader.jsp"></jsp:include>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String dname, email, gender, pass, age, Reg_Date, contact, dob, fees, did, degree, address, dept;
    %>
<center><h2>Your Profile</h2></center>
    <%
        String update = (String) session.getAttribute("update");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-success'>Your detail has been updated successfully...</div></center>");
        } else {
        }
        try {
            String id = (String) session.getAttribute("did");
            con = DB.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from table_doctor where Did='" + id + "'");
            if (rs.next()) {
                did = rs.getString("Did");
                dname = rs.getString("Dname");
                email = rs.getString("Email");
                gender = rs.getString("Gender");
                dob = rs.getString("dob");
                age = rs.getString("age");
                degree = rs.getString("Degree");
                dept = rs.getString("Department");
                fees = rs.getString("fees");
                contact = rs.getString("Contact");
                address = rs.getString("Address");
            }
        } catch (Exception e) {
            out.println(e);
        }
    %>
<table id="myTable" class="table table-striped table-bordered" >
    <tbody>
        <tr>
            <th>ID</th>
            <td><%=did%></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><%=dname%></td>
        </tr>
        <tr>
            <th>Gender</th>
            <td><%=gender%></td>
        </tr>
        <tr>
            <th>DOB</th>
            <td><%=dob%></td>
        </tr>
        <tr>
            <th>Age</th>
            <td><%=age%></td>
        </tr>
        <tr>
            <th>Department</th>
            <td><%=dept%></td>
        </tr>
        <tr>
            <th>Degree</th>
            <td><%=degree%></td>
        </tr>
        <tr>
            <th>Fees</th>
            <td><%=fees%></td>
        </tr>
        <tr>
            <th>Contact No.</th>
            <td><%=contact%></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%=email%></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%=address%></td>
        </tr>
        <tr>
            <th>Action</th>
            <td><a href="EditDoctor.jsp?id=<%=did%>" class="btn btn-danger">Edit Profile</a></td>
        </tr>
    </tbody>
</table>
<!--<center><a href="DoctorHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a></center>-->
</body>
</html>