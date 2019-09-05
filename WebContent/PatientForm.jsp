<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
        %>

        <div id="wrapper">

            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -120px;width: 100%">
                    <div class="intro-content">
                        <div class="container" >
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt=""  style="margin-top: 0px;"/>
                                    </div>
                                </div><br><br><br><br>
                                <div class="col-lg-6" style="margin-top: -60px;">

                                    <div class="panel-body">
                                        <center><h4>Patient Registration Form</h4></center><hr>

                                        <form action="PatientRegistration.jsp" method="post" name="form" id="form" role="form" class="contactForm lead">
                                            <div class="row" style="margin-top: 0px;">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <label>Patient ID</label>
                                                        <input type="text" readonly="" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                            Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<Integer>();
                                                            while (randomNumbers.size() < 1) {
                                                                randomNumbers.add(new Integer(random.nextInt(999) + 10));
                                                            }
                                                            for (Integer randomNumber : randomNumbers) {
                                                                out.println("pid-" + randomNumber);
                                                            }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" placeholder="Name" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name" id="name" class="form-control input-md" required="" title="Patient name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" placeholder="Password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Retype Password</label>
                                                    <input type="password" placeholder="Retype Password" id="confirm_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="cpass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <span style="font-size: 12px;" id='message'></span>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender" id="gender" class="form-control" required="">
                                                        <option selected="" value="" disabled="">Select Gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="text" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control input-md">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" readonly="" placeholder="age" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status" id="status" class="form-control" required="">
                                                        <option selected="" value="" disabled="">Select Status</option>
                                                        <option>Married</option>
                                                        <option>Divorced</option>
                                                        <option>Single</option>
                                                        <option>Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" placeholder="Contact" name="phone" id="phone" class="form-control input-md" required="" title="Phone no. should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" placeholder="me@example.com" name="email" id="txtEmail" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" id="address" placeholder="Address" class="form-control" required rows="3" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" value="Submit" id="btnValidate" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center>
                                        <a href="ForgotPass.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="PatientLogin.jsp">Login Here</a>
                                    </center><hr>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </section></div>

    </body>
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
                                                                var status = $("#status").val();
                                                                var email = $("#txtEmail").val();
                                                                var phone = $("#phone").val();
                                                                var address = $("#address").val();
                                                                if (name === "" || password === "" || confirm_password === "" || gender === "" || dob === "" || age === "" || status === "" || email === "" || phone === "" || address === "")
                                                                {
                                                                    $("#name").css("border-color", "red");
                                                                    $("#password").css("border-color", "red");
                                                                    $("#confirm_password").css("border-color", "red");
                                                                    $("#gender").css("border-color", "red");
                                                                    $("#dob").css("border-color", "red");
                                                                    $("#age").css("border-color", "red");
                                                                    $("#status").css("border-color", "red");
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
<!--<script>
    $(document).ready(function(e) {
        $('#btnValidate').click(function() {
            var sEmail = $('#txtEmail').val();
            if ($.trim(sEmail).length === 0) {
                alert('Please enter valid email address');
                e.preventDefault();
            }
            if (validateEmail(sEmail)) {
                //alert('Email is valid');
            }
            else {
                alert('Invalid Email Address');
                e.preventDefault();
            }
        });
    });

    function validateEmail(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (filter.test(sEmail)) {
            return true;
        }
        else {
            return false;
        }
    }
</script>-->
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