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
        <title>Diagnosis Cost</title>
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
    <jsp:include page="AEheader.jsp" flush="true"></jsp:include>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        int id;
        String Disease_Name, Cost;
    %>

<center><h2>Diagnosis Cost</h2></center>
    <%
        String del = (String) session.getAttribute("del");
        if (del != null) {
            session.removeAttribute("del");
            out.println("<center><h4 class='alert alert-success'>Diagnosis cost has been deleted successfully..</h4></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>ID</th><th>Department Name</th><th>Diagnosis Cost</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from diseasecost");
                while (rs.next()) {
                    id = rs.getInt("id");
                    Disease_Name = rs.getString("Disease_Name");
                    Cost = rs.getString("Cost");

        %>
        <tr>
            <td><%=id%></td><td><%=Disease_Name%></td><td><%=Cost%></td>
            <td class="hidden-xs"><button class="btn btn-sm btn-primary" style="background-color: white;"><a href="DeleteDCost?id=<%=rs.getInt(1)%>">Delete</a></button></td>


        </tr>
        <%
                }
                //        HttpSession s1=request.getSession();
                //       s1.setAttribute("id", deptid);

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center>
    <!--    <a style="color:red;" href="AdminHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:red;" href="Logout.jsp">Logout</a>-->
</center>
</body>
</html>