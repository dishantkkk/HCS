<%@page import="java.sql.Statement"%>
<%@page import="com.java.DB"%>
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
            String appoint_date_time, pid, did;
        %>
        <%
            pid = request.getParameter("pid").trim();
            out.print(pid);
            appoint_date_time = request.getParameter("appoint_date_time").trim();
            out.print(appoint_date_time);
            did = request.getParameter("did").trim();
            out.print(did);
            try {
                out.println("in try");
                Connection cons = DB.getConnection();
                Statement sts = cons.createStatement();
                int x = sts.executeUpdate("update appointment set flag=1 where pid='" + pid + "' and did='" + did + "' and appoint_date_time='" + appoint_date_time + "'");
                if (x > 0) {
                    response.sendRedirect("PayBill.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
