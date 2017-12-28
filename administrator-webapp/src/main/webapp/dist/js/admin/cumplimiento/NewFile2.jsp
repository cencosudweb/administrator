<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	//
	String fecha = request.getParameter("fecha");
	String cumple = request.getParameter("cumple");//
	//String[] id = request.getParameterValues("id");
	String cumple_resumen = request.getParameter("cumple_resumen");//
	//String prefixclause = request.getParameter("prefixclause");//

	out.print("fecha=" + fecha);
	out.print("cumple=" + cumple);
	out.print("cumple_resumen=" + cumple_resumen);
	//out.print("prefixclause="+prefixclause);

	//out.print("id="+id);
	/*
	 for(String v: id) {
	 out.print("v="+v);
	 }
	 */

	if ("CUMPLE".equals(cumple)) {
		cumple = "1.- CUMPLE";
	} else if ("ATRASADO".equals(cumple)) {
		cumple = "2.- ATRASADO";
	} else if ("NO CUMPLE".equals(cumple.replace("-", " "))) {
		cumple = "3.- NO CUMPLE";
	} else {
		cumple = "";
	}

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String SQL = null;//
	
	PreparedStatement psShowFecha = null;
	ResultSet rsShowFecha = null;
	String SQLFecha = null;
	

	try {
		Class.forName("oracle.jdbc.OracleDriver").newInstance();
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@172.18.163.15:1521/XE", "kpiweb",
				"kpiweb");//
		conn.setAutoCommit(false);
		SQL = "	SELECT  "
				+ "		CU.CUMPLE_RESUMEN "
				+ "	from CUMPLIMIENTO CU "
				+ "	WHERE  1 = 1 "
				+ "	AND CU.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"
				+ fecha
				+ "', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND CU.FECHA_COMPROMISO_EOM <= '"
				+ fecha + "' " + "	AND CU.CUMPLE = '" + cumple + "' "
				+ "	AND CU.CUMPLE_RESUMEN = '"
				+ cumple_resumen.replace("-", " ") + "' " +

				"	GROUP BY CU.CUMPLE_RESUMEN "
				+ "	ORDER BY CU.CUMPLE_RESUMEN ASC";

		//out.print("<br>");
		//out.print("SQL = " + SQL);
		//out.print("<br>");
		ps = conn.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rs = ps.executeQuery();
		conn.commit();
		int contarCumplimiento = 0;
		while (rs.next()) {

			// start while Cumplimiento
			contarCumplimiento = contarCumplimiento + 1;
			//out.print("contarCumplimiento = "+contarCumplimiento);
			//out.print("<br>");
%>

<tr id="" style="background-color: #d9e1f2; color: #000000;">
	<td><button class="btn btn-default" id=""
			style="display: none; width: 50px;">
			<img src="../images/minus2.gif" />
		</button>
		<button class="btn btn-default" id="" style="width: 50px;">
			<img src="../images/plus2.gif" />
		</button></td>
	<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rs.getString("CUMPLE_RESUMEN")%></td>
	<%
	
	SQLFecha = 	"	SELECT " + 
			"			TC.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM  " + 
			//"		,'0' AS CANTIDAD " + 
			//" 	,'0' AS  TOTAL " +
			
			" 		,COUNT(*) AS CANTIDAD " +		
			//"		,NVL( (SUM(CASE  WHEN  (TC.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' "+prefixclause+") THEN  1 ELSE 0 END) ),0) AS CANTIDAD " + 
			"	from CUMPLIMIENTO TC " +
			"	WHERE 1 = 1 " + 
			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+fecha+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+fecha+"'  " + 
			//"	" + prefixclause +
			"	AND TC.CUMPLE = '"+cumple+"' " +
			"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
			"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
			out.print("<br>");
			out.print("SQLFecha = " + SQLFecha);
			out.print("<br>");
			
			psShowFecha = conn.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rsShowFecha = psShowFecha.executeQuery();
            conn.commit();
            int contarShowFechaCumple = 0;
			int totalCantidadCumple = 0;
			int totalProcentajeCumple = 0;
            while(rsShowFecha.next()) {
            	contarShowFechaCumple = contarShowFechaCumple + 1;
				totalCantidadCumple = totalCantidadCumple + rsShowFecha.getInt("CANTIDAD") ;
	%>
	<td>
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td style="font-size: 13px" align="left" WIDTH="50"
								nowrap="nowrap">
								<%
								 DecimalFormat formatea = new DecimalFormat("###,###.##");
								 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));	
								%>
							</td>
							<td style="font-size: 13px" align="left" WIDTH="50"
								nowrap="nowrap"> 100%
								<%
									
								%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
	<%
    }	
	%>
	<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber
			maxFractionDigits="3" value="" type="number" /></td>
	<td align="left" WIDTH="50" nowrap="nowrap">
		<%
			
		%> %
	</td>
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
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	} // end try
%>