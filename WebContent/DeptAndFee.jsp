<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <%

                String department = request.getParameter("department");
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from dept where deptName='"+ department+"' ");
                if (rs.next()) {
                    out.println(rs.getInt("deptid")+","+rs.getString("fees"));
                }
            %>