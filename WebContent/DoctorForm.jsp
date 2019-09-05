<%@page import="com.java.DB"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="https://raw.githubusercontent.com/eternicode/bootstrap-datepicker/master/js/bootstrap-datepicker.js"></script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat whitesmoke;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
        %>
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -110px;width: 100%">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6" style="margin-top: -90px;">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br><br><br><br><br><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="margin-top: -80px;width: 100%">
                                        <center><h3>Doctor Registration Form</h3></center><hr>

                                        <form action="DoctorReg.jsp" method="post" name="form" id="form" role="form" class="contactForm lead">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <label>Doctor ID</label>
                                                        <input type="text" readonly="" name="did" id="first_name" class="form-control input-md" title="Patient ID" value="<%
                                                            Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<Integer>();
                                                            while (randomNumbers.size() < 1) {
                                                                randomNumbers.add(new Integer(random.nextInt(999) + 100));
                                                            }
                                                            for (Integer randomNumber : randomNumbers) {
                                                                out.println("did-" + randomNumber);
                                                            }
                                                           %>">

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" placeholder="Name" name="name"  id="name" class="form-control input-md" required="" title="Doctor name can not be blank, minimum of 3 characters and should not contain any digit.">

                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" id="password" placeholder="Password" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Retype Password</label>
                                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" id="confirm_password" placeholder="Password" name="cpass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <span style="font-size: 12px;" id='message'></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select id="gender" name="gender" class="form-control">
                                                        <option selected="" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor DOB</label>
                                                    <input type="text" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control input-md">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="text" readonly="" placeholder="age" name="age" id="age" class="form-control input-md" required="">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="department" id="department" required="" class="form-control">
                                                        <option selected="" disabled="" value="">Select Department</option>
                                                        <%
                                                            try {
                                                                String query = "select * from dept";
                                                                Connection con = DB.getConnection();
                                                                Statement st = con.createStatement();
                                                                ResultSet rs = st.executeQuery(query);
                                                                while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
                                                        <%
                                                                }

                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="display: none;">
                                                <div class="form-group">
                                                    <label>Department ID</label>
                                                    <input type="text" readonly="" placeholder="Department ID" name="deptId" id="deptId" class="form-control input-md" required="">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="display: none;">
                                                <div class="form-group">
                                                    <label>Doctor Fee</label>
                                                    <input type="text" readonly="" placeholder="Doctor Fee" name="fee" id="fee" class="form-control input-md" required="">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" id="degree" class="form-control">
                                                        <option selected="" value="">Select Degree</option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>D.D.S</option>
                                                        <option>M.D</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" required="" placeholder="Contact" name="phone" id="phone" class="form-control input-md" title="Enter Contact No.">

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" placeholder="me@example.com" name="email" id="txtEmail" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" id="address" placeholder="Enter your Address" class="form-control input-md" required rows="3" cols="20" name="address"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" value="Submit" onclick="return val(), check();" id="btnValidate" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center>
                                        <a href="ForgotPassword.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DoctorLogin.jsp">Login Here</a>
                                    </center><hr>
                                </div>

                            </div></div></div>

                </div>


            </section>
        </div>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
                                            $(document).ready(function() {
                                                $("#btnValidate").click(function() {
                                                    var name = $("#name").val();
                                                    var password = $("#password").val();
                                                    var confirm_password = $("#confirm_password").val();
                                                    var gender = $("#gender").val();
                                                    var dob = $("#dob").val();
                                                    var age = $("#age").val();
                                                    var department = $("#department").val();
                                                    var degree = $("#degree").val();
                                                    var email = $("#txtEmail").val();
                                                    var phone = $("#phone").val();
                                                    var address = $("#address").val();
                                                    if (name === "" || password === "" || confirm_password === "" || gender === "" || dob === "" || age === "" || department === "" || degree === "" || email === "" || phone === "" || address === "")
                                                    {
                                                        $("#name").css("border-color", "red");
                                                        $("#password").css("border-color", "red");
                                                        $("#confirm_password").css("border-color", "red");
                                                        $("#gender").css("border-color", "red");
                                                        $("#dob").css("border-color", "red");
                                                        $("#age").css("border-color", "red");
                                                        $("#department").css("border-color", "red");
                                                        $("#degree").css("border-color", "red");
                                                        $("#txtEmail").css("border-color", "red");
                                                        $("#phone").css("border-color", "red");
                                                        $("#address").css("border-color", "red");
                                                        alert("All Fields Are Mendatory.");
                                                        return false;
                                                    }
                                                });
                                            });
</script>
<script>
    $(document).ready(function() {
        $("#department").on("change", function() {
            var department = $("#department").val();//id of country select box of index.jsp page;
            $.ajax({
                url: "DeptAndFee.jsp", //your jsp page name
                data: {department: department}, //sending request to state.jsp page.
                method: "POST", //HTTP method.
                success: function(data)
                {
                    //alert($.trim(data));
                    var data = $.trim(data);
                    //alert(data);
                    var myarray = data.split(',');
                    $("#deptId").val(myarray[0]);
                    $("#fee").val(myarray[1]);
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $("#form").submit(function(e) {
            var pass = $('#password').val();
            var cpass = $('#confirm_password').val();
            if (pass === cpass)
            {
                var phone = $('#phone').val().length;
                if (phone !== 10) {
                    alert("Phone number should be 10 digit only.");
                    e.preventDefault();
                    return false;
                }
                else
                {
                }
            }
            else
            {
                alert("Password does not match");
                e.preventDefault();
                return false;
            }
        });
    });
</script>
<script>
    function calculateAge() {
        var today = new Date();
        var dateString = document.getElementById('dob').value;
        //alert(dateString);
        var birthDate = new Date(dateString);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        document.getElementById('age').value = age;
    }
</script>
<script>
    $('#password, #confirm_password').on('keyup', function() {
        if ($('#password').val() === $('#confirm_password').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
    $(function() {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            endDate: '+0d',
            autoclose: true
        });
    });
</script>