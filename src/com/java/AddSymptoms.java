package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AddSymptoms", urlPatterns = {"/AddSymptoms"})
public class AddSymptoms extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    Connection con;
    Statement st;
    int i = 0;
    int count = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            String[] symptom = request.getParameterValues("name[]");
            //String[] alias_name = request.getParameterValues("alias_name[]");
            String[] disease = request.getParameterValues("disease[]");
            String[] age_group = request.getParameterValues("age_group[]");
            String[] gender = request.getParameterValues("gender[]");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            for (int ag = 0, g = 0, s = 0, d = 0; ag < age_group.length && g < gender.length && s < symptom.length && d < disease.length; ag++, g++, s++, d++) {
                con = DB.getConnection();
                st = con.createStatement();
                i = st.executeUpdate("insert into symptoms(`age_group`, `gender`, `symptom`, `disease`, `added_date`) values('" + age_group[ag] + "','" + gender[g] + "','" + symptom[s] + "','" + disease[d] + "','" + addedDate + "')");
                count += i;
            }
            if (i > 0) {
                session.setAttribute("syms", "Symptoms Added Successfully...");
                response.sendRedirect("AddSymptoms.jsp");
            }
        } catch (Exception e) {
            out.print(e);
        }

    }

}
