<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String pID = request.getParameter("pID");
	int no = Integer.parseInt(pID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_appointment","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from appointment where pID ='" +pID+"'");
	response.sendRedirect("AppointmentManagement.jsp");
	%>