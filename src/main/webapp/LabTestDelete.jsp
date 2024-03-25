<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String lab_ID = request.getParameter("lab_ID");
	int no = Integer.parseInt(lab_ID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_appointment","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from labtest where lab_ID ='" +lab_ID+"'");
	response.sendRedirect("LabTestManagement.jsp");
	%>