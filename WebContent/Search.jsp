<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
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
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">

        <%!
            Connection con;
            Statement st;
            ResultSetMetaData rsmd;
            PreparedStatement ps;
            ResultSet rs;
            int i;
        %>
        <%

            String pid = request.getParameter("search");
           //out.println(pid);
            // String dd=(String)session.getAttribute("sname");
            try {
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select Pname,Pid,Email,Gender,DOB,Contact,Address,Disease,RoomType,Age,Pstatus,Reg_Date from Table_Patient where Pid='" + pid + "'");
               // ps=con.prepareStatement(");
                //  ps.setString(1,pid);

                //out.print("<div class='container-fluid' style='padding:0px;'><div class='table-responsive'><table border='3' class='table table-striped'>");
                out.print("<center><b>Search Result</b></center>");

                if (!rs.next()) {
                    out.println("<center><h1>No Patient Found With This Patient ID.</h1></center>");
                } else {
                    /* Printing column names */
                    rs = st.executeQuery("select Pname,Pid,Email,Gender,DOB,Contact,Address,Disease,RoomType,Age,Pstatus,Reg_Date from Table_Patient where Pid='" + pid + "'");
                    out.print("<div class='container-fluid' style='padding:0px;'><div class='table-responsive'>");
                    out.print("<table border='3' class='table table-striped'>");
                    out.print("<tr><th>Patient Name</th><th>PID</th><th>Email</th><th>Gender</th><th>DOB</th><th>Contact NO.</th><th>Address</th><th>Disease Name</th><th>Room Type</th><th>Age</th><th>Pstatus</th><th>Admit Date</th></tr>");
                    while (rs.next()) {
                        out.print("<tr><td>" + rs.getString("Pname") + "</td><td>" + rs.getString("Pid") + "</td><td>" + rs.getString("Email") + "</td><td>" + rs.getString("Gender") + "</td><td>" + rs.getString("DOB") + "</td><td>" + rs.getString("Contact") + "</td><td>" + rs.getString("Address") + "</td><td>" + rs.getString("Disease") + "</td><td>" + rs.getString("RoomType") + "</td><td>" + rs.getString("Age") + "</td><td>" + rs.getString("Pstatus") + "</td><td>" + rs.getString("Reg_Date") + "</td></tr>");

                    }
                    out.print("</table></div></div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.print(e);

            }
        %>
    <center><a href="index.jsp">Home</a></center>
</body>
</html>
