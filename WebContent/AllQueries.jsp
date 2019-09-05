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
        <title>Queries</title>
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
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String pid, pname, age, email, smoking, alcohlic, symtomps, date;
    %>
    <%
        String pname = request.getParameter("name");
        String pid = request.getParameter("id");
        String deleted = (String) session.getAttribute("deleted");
        if (deleted != null) {
            session.removeAttribute("deleted");
            out.println("<center><div class='alert alert-success'>Patient query has been deleted successfully...</div></center>");
        } else {
        }
    %>
<center><h2><%=pname%>'s Queries</h2></center>
<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Age</th><th>Smoking</th><th>Alcohlic</th><th>Query</th><th>Doctor ID</th><th>Doctor Name</th><th>Doctor's Comment</th><th>Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from queries where pid='" + pid + "'");
                while (rs.next()) {
                    count++;
                    pid = rs.getString("Pid");
                    pname = rs.getString("Pname");
                    age = rs.getString("age");
                    smoking = rs.getString("smoking");
                    alcohlic = rs.getString("alcohlic");
                    symtomps = rs.getString("query");
                    date = rs.getString("date");
        %>
        <tr>
            <td><%=count%></td><td><%=age%></td><td><%=smoking%></td><td><%=alcohlic%></td><td><%=symtomps%></td><td><%=rs.getString("did")%></td><td><%=rs.getString("dname")%></td><td><%=rs.getString("doctor_reply")%></td><td><%=date%></td><td><a href="DeleteQueries?id=<%=rs.getInt("id")%>">Delete</a></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
</body>
</html>