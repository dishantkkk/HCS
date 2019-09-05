<%@page import="com.java.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled or minified CSS -->
        <style>
            table
            {
                bandder:2px solid green;

            }
            tr
            {
                padding:5px;
            }
            tr:hover
            {

            }
        </style>
    </head>
    <body>
        <table class="table table-banddered">


            <%

                String sym1 = request.getParameter("sym1");
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
                out.println(sym1 + " " + sym2 + " " + sym3 + " " + sym4 + " " + sym5 + " " + sym6 + " " + sym7 + " " + sym8 + " " + sym9 + " " + sym10);
                out.println(age + " " + gender);
                //System.out.println(sym1);
                if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined") && !sym6.equalsIgnoreCase("undefined") && !sym7.equalsIgnoreCase("undefined") && !sym8.equalsIgnoreCase("undefined") && !sym9.equalsIgnoreCase("undefined") && !sym10.equalsIgnoreCase("undefined")) {
                    out.println("in all");
                    Connection con = DB.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 or locate(symptom,'" + sym7 + "')>0 or locate(symptom,'" + sym8 + "')>0 or locate(symptom,'" + sym9 + "')>0 or locate(symptom,'" + sym10 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                    int count = 0;
                    while (rs.next()) {
                        count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined") && !sym6.equalsIgnoreCase("undefined") && !sym7.equalsIgnoreCase("undefined") && !sym8.equalsIgnoreCase("undefined") && !sym9.equalsIgnoreCase("undefined")) {
                out.println("in 9th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 or locate(symptom,'" + sym7 + "')>0 or locate(symptom,'" + sym8 + "')>0 or locate(symptom,'" + sym9 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined") && !sym6.equalsIgnoreCase("undefined") && !sym7.equalsIgnoreCase("undefined") && !sym8.equalsIgnoreCase("undefined")) {
                out.println("in 8th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 or locate(symptom,'" + sym7 + "')>0 or locate(symptom,'" + sym8 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined") && !sym6.equalsIgnoreCase("undefined") && !sym7.equalsIgnoreCase("undefined")) {
                out.println("in 7th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 or locate(symptom,'" + sym7 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined") && !sym6.equalsIgnoreCase("undefined")) {
                out.println("in 6th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined") && !sym5.equalsIgnoreCase("undefined")) {
                out.println("in 5th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined") && !sym4.equalsIgnoreCase("undefined")) {
                out.println("in 4th");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined") && !sym3.equalsIgnoreCase("undefined")) {
                out.println("in 3rd");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined") && !sym2.equalsIgnoreCase("undefined")) {
                out.println("in 2nd");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            } else if (!sym1.equalsIgnoreCase("undefined")) {
                out.println("in 1st");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 and gender='" + gender + "' and age_group='" + age + "' limit 0,5");
                int count = 0;
                while (rs.next()) {
                    count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                    }
                } else {
                    out.println("Something went wrong.");
                }
            %>
            <%
                String pid = (String) session.getAttribute("pid");
                if (pid != null) {
            %>
            <tr>
                <td></td>
                <td><a href="BookApointment.jsp">Book Appointment</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AskDoctor.jsp">Ask Doctor</a></td>
            </tr>
            <%
                } else {
                }
            %>

        </table>
    </body>
</html>
