<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>


<%

String id = request.getParameter("id");
//out.println(id);

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;
String SQL = null;
 
try{
	Class.forName("oracle.jdbc.OracleDriver").newInstance();
	conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
	
 	//conn = DriverManager.getConnection("jdbc:mysql://192.168.10.20/panels_admin","root","lfdesarrollo");
	conn.setAutoCommit(false);
 
	SQL = "Select id,description from contratantes WHERE id_gerente = "+id;
 
	ps = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
 
	rs = ps.executeQuery();
 
	conn.commit();
	out.println("<option value=\"\">Seleccionar Contraparte</option>");
	//out.println("<option value=\"-1\">Agregar Ejecutivo</option>");
	//out.println("<table border=1 align=\"center\">");
	//out.println("<tr><th>Nombres</th></tr>");
	while(rs.next()) {
		out.println("<option value="+rs.getString("id")+">"+ rs.getString("description")+"</option>");
	} // end while
		
	//out.println("</table>");
} catch (SQLException exQL) {
	conn.rollback();
	out.println("Error SQL: " + exQL.getMessage());	
} catch (Exception ex) {
	conn.rollback();
	out.println("Error: " + ex.getMessage());
} finally {
	if (rs != null) rs.close();
	if (ps != null) ps.close();
	if (conn != null) conn.close();
} // end try
%>
