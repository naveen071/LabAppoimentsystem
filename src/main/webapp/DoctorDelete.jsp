<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String doc_ID = request.getParameter("doc_ID");
	int no = Integer.parseInt(doc_ID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_appointment","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from doctor where doc_ID ='" +doc_ID+"'");
	response.sendRedirect("DoctorManagement.jsp");
	%>