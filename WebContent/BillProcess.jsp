<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.java.DB"%>
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
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            String appoint_date_time, pid, did;
        %>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            pid = request.getParameter("pid").trim();
            out.print(pid);
            appoint_date_time = request.getParameter("appoint_date_time").trim();
            out.print(appoint_date_time);
            String name = request.getParameter("pname").trim();
            out.print(name);
            String dname = request.getParameter("dname").trim();
            out.print(dname);
            did = request.getParameter("did").trim();
            out.print(did);
            String amount = request.getParameter("amount").trim();
            out.print(amount);
            try {
                Connection con = DB.getConnection();
                ps = con.prepareStatement("insert into patient_bill(pid,pname,did,dname,Bill,date) values (?,?,?,?,?,?)");
                ps.setString(1, pid);
                ps.setString(2, name);
                ps.setString(3, did);
                ps.setString(4, dname);
                ps.setString(5, amount);
                ps.setString(6, date);
                int i = ps.executeUpdate();
                if (i > 0) {
                    Connection cons = DB.getConnection();
                    Statement sts = cons.createStatement();
                    int x = sts.executeUpdate("update appointment set flag=1 where pid='" + pid + "' and did='" + did + "' and appoint_date_time='" + appoint_date_time + "'");
                    if (x > 0) {
                        response.sendRedirect("PayBill.jsp");
                    }
                } else {
                    out.println("<h1>Somethong Went Wrong Try Again...</h1>");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
