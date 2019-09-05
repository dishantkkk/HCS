<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>Smart Health Care System</title>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg'); background-repeat: repeat;">
        <%
            String pid = (String) session.getAttribute("pname");
            String did = (String) session.getAttribute("dname");
            if (pid != null) {
        %>
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="border:2px solid lightseagreen">
                                        <center><img src="images/About.png" style="width: 100%;"></center><hr>
                                        <b><center> Smart Health Care System is developed as a part of CSC699 coursework. </center></b>
                                        <p>The purpose of Smart Health Care System is to automate the existing system by providing end to end solution for various
                                            departments by dividing the complete application into multiple modules and integrating it with a symptom checker tool.
                                            These smart and efficient systems take care of operational aspects so that the healthcare center can concentrate on
                                            enhanced patient care. Smart Health Care system (HCS) is a computer or web-based system that facilitates managing the
                                            functioning of the hospital or any medical set up but with a symptom checker tool.</p>

                                        <p>Smart Health Care System, as described above can lead to error free, secure, reliable and fast management system.
                                            This system provides end-to-end solution for Appointment booking, Viewing Medical records, Initial Diagnosis,
                                            Consulting doctor over the web and Billing. This system can be implemented for a single hospital or a chain of private clinics.</p>

                                        <p>The other objective is to provide essential online medical assistance to users irrespective of their location.
                                            The diagnosis of a disease in most cases depends on a complex combination of clinical and pathological data;
                                            this complexity leads to the excessive medical costs affecting the quality of the medical care. This system helps
                                            the patient in the initial diagnosis based on the symptoms and allows users to interact with doctors over the web,
                                            based on the diagnosis report.</p>

                                    </div>


                                </div>

                            </div>

                        </div>

                    </div>
                </section>
            </div>


        <%
        } else if (did != null) {
        %>
        <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="border:2px solid lightseagreen">
                                        <center><img src="images/About.png" style="width: 100%;"></center><hr>
                                        <b><center> Smart Health Care System is developed as a part of CSC699 coursework. </center></b>
                                        <p>The purpose of Smart Health Care System is to automate the existing system by providing end to end solution for various
                                            departments by dividing the complete application into multiple modules and integrating it with a symptom checker tool.
                                            These smart and efficient systems take care of operational aspects so that the healthcare center can concentrate on
                                            enhanced patient care. Smart Health Care system (HCS) is a computer or web-based system that facilitates managing the
                                            functioning of the hospital or any medical set up but with a symptom checker tool.</p>

                                        <p>Smart Health Care System, as described above can lead to error free, secure, reliable and fast management system.
                                            This system provides end-to-end solution for Appointment booking, Viewing Medical records, Initial Diagnosis,
                                            Consulting doctor over the web and Billing. This system can be implemented for a single hospital or a chain of private clinics.</p>

                                        <p>The other objective is to provide essential online medical assistance to users irrespective of their location.
                                            The diagnosis of a disease in most cases depends on a complex combination of clinical and pathological data;
                                            this complexity leads to the excessive medical costs affecting the quality of the medical care. This system helps
                                            the patient in the initial diagnosis based on the symptoms and allows users to interact with doctors over the web,
                                            based on the diagnosis report.</p>

                                    </div>


                                </div>

                            </div>

                        </div>

                    </div>
                </section>
            </div>

        <%
        } else {
        %>
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="border:2px solid lightseagreen">
                                        <center><img src="images/About.png" style="width: 100%;"></center><hr>
                                        <b><center> Smart Health Care System is developed as a part of Demo coursework. </center></b>
                                        <p>The purpose of Smart Health Care System is to automate the existing system by providing end to end solution for various
                                            departments by dividing the complete application into multiple modules and integrating it with a symptom checker tool.
                                            These smart and efficient systems take care of operational aspects so that the healthcare center can concentrate on
                                            enhanced patient care. Smart Health Care system (HCS) is a computer or web-based system that facilitates managing the
                                            functioning of the hospital or any medical set up but with a symptom checker tool.</p>

                                        <p>Smart Health Care System, as described above can lead to error free, secure, reliable and fast management system.
                                            This system provides end-to-end solution for Appointment booking, Viewing Medical records, Initial Diagnosis,
                                            Consulting doctor over the web and Billing. This system can be implemented for a single hospital or a chain of private clinics.</p>

                                        <p>The other objective is to provide essential online medical assistance to users irrespective of their location.
                                            The diagnosis of a disease in most cases depends on a complex combination of clinical and pathological data;
                                            this complexity leads to the excessive medical costs affecting the quality of the medical care. This system helps
                                            the patient in the initial diagnosis based on the symptoms and allows users to interact with doctors over the web,
                                            based on the diagnosis report.</p>

                                    </div>


                                </div>

                            </div>

                        </div>

                    </div>
                </section>
            </div>

        <%
            }
        %>
    </body>

</html>
