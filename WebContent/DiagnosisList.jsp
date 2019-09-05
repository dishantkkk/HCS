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
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat;">

    <%
        try {
    %>
    <div class="container-fluid">

        <center><h2>All Related Diagnosis</h2></center>
        <table id="myTable" class="table table-striped" >
            <thead>
                <tr>
                    <th>Sr. No.</th><th>Diagnosis</th>
                </tr>
            </thead>
            <tbody>
                <%  String sym1 = request.getParameter("sym1");
                    String sym2 = request.getParameter("sym2");
                    String sym3 = request.getParameter("sym3");
                    String sym4 = request.getParameter("sym4");
                    String sym5 = request.getParameter("sym5");
                    String sym6 = request.getParameter("sym6");
                    String sym7 = request.getParameter("sym7");
                    String sym8 = request.getParameter("sym8");
                    String sym9 = request.getParameter("sym9");
                    String sym10 = request.getParameter("sym10");
                    String age = request.getParameter("age");
                    String gender = request.getParameter("gender");
                    //out.println(age);
                    Connection con = DB.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT distinct disease FROM `sym` WHERE sym IN ('" + sym1 + "','" + sym2 + "','" + sym3 + "','" + sym4 + "','" + sym5 + "','" + sym6 + "','" + sym7 + "','" + sym8 + "','" + sym9 + "','" + sym10 + "') and age='" + age + "' and gender='" + gender + "'");
                    int count = 0;
                    while (rs.next()) {
                        count = count + 1;
                %>

                <tr>

                    <td><%=count%></td><td><%=rs.getString(1)%></td>


                </tr>


                <%
                        }

                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </tbody></table></div>
            <%
                String pid = (String) session.getAttribute("pid");
                String did = (String) session.getAttribute("did");
                if (pid != null) {
                    out.println("<center><a href='PatientHome.jsp'>Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='Logout.jsp'>Logout</a></center>");
                } else if (did != null) {
                    out.println("<center><a href='DoctorHome.jsp'>Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='Logout.jsp'>Logout</a></center>");
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
</body>
</html>
