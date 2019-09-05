<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>
    </head>
<body>
<%
String doctor=request.getParameter("count");  
String buffer="<select name='doctor' class='form-control' onchange='showFees(this.value);'><option value='-1'>Select Doctor</option>";  
 try{
 Connection con=DB.getConnection();
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from doctor where deptid='"+doctor+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("docid")+"'>"+rs.getString("name")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
</body>
</html>