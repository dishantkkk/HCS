/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dharmesh Mourya
 */
@WebServlet(name = "DeleteDCost", urlPatterns = {"/DeleteDCost"})
public class DeleteDCost extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from diseasecost where id='" + id + "'");
            int i = ps.executeUpdate();
            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("del", "del");
                response.sendRedirect("ViewDCostt.jsp");
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
