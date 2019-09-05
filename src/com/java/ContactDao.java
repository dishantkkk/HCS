package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ContactDao", urlPatterns = {"/ContactDao"})
public class ContactDao extends HttpServlet {

    PrintWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            String name = request.getParameter("uname");
            String email = request.getParameter("email");
            String contact = request.getParameter("phone");
            String subject = request.getParameter("subject");
            String comment = request.getParameter("message");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            con = DB.getConnection();
            ps = con.prepareStatement("insert into contact(name,email,contact,subject,message,date) values (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, contact);
            ps.setString(4, subject);
            ps.setString(5, comment);
            ps.setString(6, date);
            int i = ps.executeUpdate();
            if (i > 0) {
                final String username = "";//your email
                final String password = "";//your password
                Properties props = new Properties();
                props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
                try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
                    MimeBodyPart textPart = new MimeBodyPart();
                    MimeBodyPart htmlPart = new MimeBodyPart();
                    Multipart multipart = new MimeMultipart();
                    String final_Text = "Name: " + name + "    " + "Email: " + email + "    " + "Subject: " + subject + "    " + "Mesaage: " + comment;
                    textPart.setText(final_Text);
                    htmlPart.setContent("<a href='mailto:" + email + "'>Reply</a><br>", "text/html");
                    //htmlPart.setContent("<button onclick='window.location.href='mailto:"+email+"'>Give Reply</button><br>", "text/html");
                    multipart.addBodyPart(htmlPart);
                    message.setSubject(subject);
                    multipart.addBodyPart(textPart);
                    message.setContent(multipart);
                    message.setSubject("Contact Details: " + date);
                    //out.println("Sending");
                    Transport.send(message);
                    //out.println("<h2 style='color:lightgreen;'>Email Sent Successfully.</h2>");
                    //out.println("Thank you "+name+", your message has been submitted to us.");
                    HttpSession sessions = request.getSession();
                    //sessions.setAttribute("msg1", "Email Sent Successfully....");
                    sessions.setAttribute("msg", "Thank you <b>" + name + "</b>, your message has been submitted to us.");
                    response.sendRedirect("Contact.jsp");
                } catch (Exception e) {
                    out.println(e);
                }

            } else {
                HttpSession sessions = request.getSession();
                sessions.setAttribute("msg", "Oops! something went wrong...");
                response.sendRedirect("Contact.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

}
