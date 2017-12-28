<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<% //
String fecha = request.getParameter("fecha");
String cumple = request.getParameter("cumple");//
//String[] id = request.getParameterValues("cumple");
//out.print("fecha="+fecha);
out.print("cumple="+cumple);
//out.print("id="+id);

//for(String v: id) {
//			  out.print("id="+id);
//		  }
		  

if ("CUMPLE".equals(cumple)) {
			cumple = "1.- CUMPLE";
		} else if ("ATRASADO".equals(cumple)) {
			cumple = "2.- ATRASADO";
		} else if("NO CUMPLE".equals(cumple.replace("-"," "))) {
			cumple = "3.- NO CUMPLE";
		} else {
			cumple = "";
		}

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;
String SQL = null;//

try{
	Class.forName("oracle.jdbc.OracleDriver").newInstance();
	conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
	conn.setAutoCommit(false);
	SQL = 	"	SELECT  " +
													"		TC.CUMPLE_RESUMEN " +
													"	from CUMPLIMIENTO TC " + 
													"	WHERE  1 = 1 " +
													"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+fecha+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+fecha+"' " + 
													"	AND TC.CUMPLE = '"+cumple+"' " + 
													"	GROUP BY TC.CUMPLE_RESUMEN " + 
													"	ORDER BY TC.CUMPLE_RESUMEN ASC";
													
	out.print("<br>");
	out.print("SQL = "+SQL);
	out.print("<br>");												
	ps = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	rs = ps.executeQuery();
	conn.commit();
	int contarCumplimiento = 0;
	while(rs.next()) {
		
		// start while Cumplimiento
		contarCumplimiento = contarCumplimiento + 1;
		//out.print("contarCumplimiento = "+contarCumplimiento);
		//out.print("<br>");



								%>

<tr id="" style="background-color:#d9e1f2;color:#000000;" >
										<td><button  class="btn btn-default" id="" style="display:none; width:50px;"><img src="../images/minus2.gif"/></button><button class="btn btn-default" id="" style=" width:50px;"><img src="../images/plus2.gif"/></button></td>
										<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;----<%=rs.getString("CUMPLE_RESUMEN")%>----</td>	 
										<%
											
										%>						
										<td>
											<table>
												<tr>
													<td>
														<table>
															<tr>
																<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																<%
																 
																 %>
																</td>
																<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																<%
																
																%></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<%
										
										%>
										<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value=""  type="number"/></td>
										<td align="left" WIDTH="50" nowrap="nowrap">
										<%
										
										%>
										%</td>
									</tr>
									<%
									
									} // end while
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