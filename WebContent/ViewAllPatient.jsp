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
</head>
<body style="background-image: url(images/bg1.jpg);">
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String name, email, gender, pass, age, Reg_Date, contact, dob, status, pid, room, address, disease;
    %>
<center><h2>All Patients</h2></center>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>PID</th><th>Pname</th><th>Email</th><th>Contact No.</th><th>DOB</th><th>Gender</th><th>Age</th><th>Status</th><th>Address</th><th>Diagnosis</th><th>Registered Date</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                // String id=(String)session.getAttribute("pid");
                //out.println(id);
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from table_patient");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    email = rs.getString("Email");
                    //pass=rs.getString("Pass");
                    contact = rs.getString("Contact");
                    dob = rs.getString("Dob");
                    gender = rs.getString("Gender");
                    //age = rs.getString("Age");
                    status = rs.getString("Pstatus");
                    address = rs.getString("Address");
                    //disease = rs.getString("Disease");
                    Reg_Date = rs.getString("Reg_Date");
        %>
        <tr>
            <td><%=pid%></td><td><%=name%></td><td><%=email%></td><td><%=contact%></td><td><%=dob%></td><td><%=gender%><td><%=status%><td><%=address%><td><%=Reg_Date%></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center><a href="index.jsp">Home</a></center>
</body>
</html>