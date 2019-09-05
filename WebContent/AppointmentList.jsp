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
        <title>Appointments</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
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
        <%!
            Connection con;
            Statement st, st1;
            String name, did, s4, s5, s6, s7, s8, s9, s1, s2, id1;
            String n = "NULL";
            ResultSet rs;
        %>
        <%
            try {
                name = (String) session.getAttribute("dname");
                did = request.getParameter("id");
                //out.println(id);
                Connection con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from appointment where pid='" + did + "'");
        %>
        <% if (!rs.next()) {
                out.println("<center><h1>No Patient have book any appointment with you.</h1></center>");
            } else { %>
        <div class="container-fluid" style="padding:0px;">
            <div class="table-responsive">
                <table border="3" class="table table-striped">
                    <tr>
                        <th>Patient Name</th><th>Patient ID</th><th>Doctor Department</th><th>Doctor Name</th><th>Doctor Fees</th><th>Appointment Date</th><th>Appointment Time</th><th>Action</th>
                    </tr>
                    <%
                        st1 = con.createStatement();
                        rs = st1.executeQuery("select * from appointment where did='" + did + "' AND status='Pending'");
                        while (rs.next()) {
                            id1 = rs.getString("pid");
                            name = rs.getString("pname");
                            s4 = rs.getString("department");
                            s5 = rs.getString("dname");
                            s6 = rs.getString("fees");
                            s7 = rs.getString("appoint_date");
                            s8 = rs.getString("appoint_time");


                    %>

                    <tr><td><%=name%></td><td><%=id1%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td><td><%=s8%></td>
                        <td><a href="EditDAppointment.jsp?id=<%=did%>">Edit</a>&nbsp;&nbsp;&nbsp;<a href="CancelAppointment.jsp?id=<%=did%>">Cancel</a>&nbsp;&nbsp;&nbsp;<a href="ConfirmAppointment.jsp?id=<%=did%>">Confirm</a></td>
                    </tr>
                    <%
                                }
                            }

                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>

                </table></div></div>
    <center>
        <a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>
    </center>
</body>
</html>
