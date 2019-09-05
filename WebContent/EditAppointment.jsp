<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Smart Health Care System</title>

        <!-- css -->
<!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
         template skin 
        <link id="t-colors" href="css/default.css" rel="stylesheet">-->

<script language="javascript" type="text/javascript">  
      var xmlHttp;  
      function showDoctor(str){
      if (typeof XMLHttpRequest !== "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      } 
      var url="doctors.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
      document.getElementById("doctor").innerHTML=xmlHttp.responseText; 
      }   
      }

      function showFees(str){
      if (typeof XMLHttpRequest !== "undefined"){
        xmlHttp= new XMLHttpRequest();
        }
      else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      } 
      var url="fees.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function stateChange1(){   
      if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
      document.getElementById("fees").innerHTML=xmlHttp.responseText;   
      }   
      }
      </script>  
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
       <%!
            //Date date = new Date();
            //SimpleDateFormat sdf = new SimpleDateFormat();
            //String s = sdf.format(date);
            Connection con;
            Statement st;
            ResultSet rs;
            String pid,pname,dname, adate,time,dept,fees;
            String id;
        %>
        <%
            try 
            {
                 id = request.getParameter("id");
                 //String name=(String)session.getAttribute("name");
                //out.println(id);
                con=DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from appointment where pid='" + id + "'");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    pname = rs.getString("Pname");
                    dept = rs.getString("Department");
                    dname = rs.getString("Dname");
                    fees = rs.getString("Fees");
                    adate = rs.getString("App_Date");
                    time = rs.getString("App_Time");
                }
        %>

        <div id="wrapper">

            <jsp:include page="PHeader.jsp"></jsp:include>
            
           <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div>
                            </div>	
                            <div class="col-lg-6">

                            <div class="panel-body">
                                    <center><h3>Edit Appointment</h3></center><hr>
                                    <form action="UpdateAppointment.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" required="" disabled="" name="pid"  class="form-control input-md"  value="<%=pid%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                                     <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" required="" name="name"  class="form-control input-md"  value="<%=pname%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                             <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name='department' onchange="showDoctor(this.value)" required="" class="form-control">
                            <option selected="" value="none" disabled="">Select Department</option>
                            <%
                                try
                                {
                                    String query="select * from dept";
                                    Connection con=DB.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery(query);
                                    while (rs.next()) 
                                    {
                                        %>
                                        <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
                                        <%
                                    }
                                     
                                }
                                catch(Exception e)
                                {
                                    out.println(e);
                                }
                            %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                             <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Doctor</label>
                                                    <div id="doctor">
                                                        <select name='doctor' class="form-control">  
                                                                <option value='-1'>Select Doctor</option>  
                                                                </select>
                                                    </div>                                         
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                                    
                                                     <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Consultancy Fees</label>
                                                    <div id="fees">
                                                        <select name='fees' class="form-control">  
                                                                <option value='-1'>Doctor Fees</option>  
                                                                </select>
                                                    </div>  
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                           

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Date</label>
                                                    <input type="date" required="" name="date" id="first_name" class="form-control input-md" title="Appointment Date" value="<%=adate%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Time</label>
                                                    <input type="time" required="" name="time" id="first_name" class="form-control input-md" title="Appointment Time" value="<%=time%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                                     
                                </div>
                                
                                                   
                                <%
                                       
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                                <input type="submit" value="Update" class="btn btn-skin btn-block btn-lg">
                                
                                </form><center><a href="CancelAppointment.jsp?id=<%=id%>">Cancel Appointment</a></center>
                            </div>
                                    
                            </div>
                                
                            </div>
                        </div></div> 

                </div>			
    </section>

</body>
        </html>