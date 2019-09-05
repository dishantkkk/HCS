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
    </head>
    <body>
       <%
     try
     {
    Connection con=DB.getConnection();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select Pname,Pid,Email,Specialization,Dname,Fees,Reg_Date,Time from Table_Appointment where ");//session
    %>
    
    <table border="2">
    <tr>
    <th>Patient Name</th><th>Patient ID</th><th>Patient Email</th><th>Doctor Specialization</th><th>Doctor Name</th><th>Fees</th><th>Date</th><th>Time</th>
  </tr>
    <%
    while(rs.next())
    {
        String s1=rs.getString("Pname");
        String s2=rs.getString("Pid");
        String s3=rs.getString("Email");
        String s4=rs.getString("Specialization");
        String s5=rs.getString("Dname");
        String s6=rs.getString("Fees");
        String s7=rs.getString("Reg_Date");
        String s8=rs.getString("Time");
  
    %>
    
    <tr><td><%=s1%></td><td><%=s2%></td><td><%=s3%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td><td><%=s8%></td></tr>  
    <%
    }  
      }
          catch(Exception e)
       {
           out.println(e);
   }
%>
  </table>
    </body>
</html>
