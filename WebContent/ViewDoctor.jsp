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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            a
            {
                text-decoration: none;
                color:red;
            }
            th
            {
                background-color:red;
                color: white;
            }
        </style>
    </head>
    <body style="background-image: url(images/bg1.jpg);">
        <%
            try {
                String id = (String) session.getAttribute("did");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from table_doctor where did='" + id + "'");

        %>
        <div class="container-fluid" style="padding:0px;">
            <div class="table-responsive">
                <table border="3" class="table table-striped">
                    <tr>
                        <th>Doctor Name</th><th>Doctor ID</th><th>Doctor Email</th><th>Doctor Gender</th><th>Age</th><th>Fees</th><th>Department</th><th>Degree</th><th>Address</th><th>Registration Date</th>
                        <th>Action</th></tr>
                            <%        while (rs.next()) {
                                    String s1 = rs.getString("Dname");
                                    String s2 = rs.getString("Did");
                                    String s3 = rs.getString("Email");
                                    String s4 = rs.getString("Gender");
                                    String s5 = rs.getString("Age");
                                    String s6 = rs.getString("Fees");
                                    String s7 = rs.getString("Department");
                                    String s8 = rs.getString("Degree");
                                    String s9 = rs.getString("Address");
                                    String s10 = rs.getString("Reg_Date");
                            %>

                    <tr><td><%=s1%></td><td><%=s2%></td><td><%=s3%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td><td><%=s8%></td><td><%=s9%></td><td><%=s10%></td>
                        <td><a href="EditProfile.jsp?id=<%=s2%>">Edit</a>&nbsp;&nbsp;&nbsp;<a href="DeleteDoctor.jsp?id=<%=s2%>">Delete</a></td></tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                </table></div></div>
    <center><a href="index.jsp">Home</a></center>
</body>
</html>
