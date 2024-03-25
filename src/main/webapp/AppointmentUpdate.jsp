<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "patient_appointment";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from appointment where pID="+pID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/form.css">
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
  border-right:1px solid #bbb;
}

li:last-child {
  border-right: none;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #04AA6D;
}

img {
    width: 1420px; /* Set width of the image */
    height: 700px; /* Maintain aspect ratio */
    border-radius: 10px; /* Add rounded corners */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow */
}
</style>
</head>
<body>

<ul>
  <li><a href="Home.jsp">Home</a></li>
  <li><a class="active"  href="AppointmentManagement.jsp">Appointment Manage</a></li>
  <li><a href="LabReportManagement.jsp">Lab Report Manage</a></li>
  <li><a href="DoctorRecommendManagement.jsp">Doctor Recommend Manage</a></li>
  <li><a href="PdfAppointment.jsp">Appointment Report</a></li>
  <li><a href="PdfLab.jsp">Lab Report</a></li>
  <li><a href="PdfDoctor.jsp">Doctor Report</a></li>
  <li style="float:right"><a href="Login.jsp">Logout</a></li>
</ul>


<center><h1>Appointment Now</h1></center>


<form action="AppointmentUpdateProcess" method="POST">
	<div class="form-group">
        <label for="Name">Patient ID:</label>
        <center><input type="text" readonly="pID" name="pID" value="<%=resultSet.getInt("pID") %>"></center>
    </div>
    <div class="form-group">
        <label for="Name">Patient Name:</label>
        <center><input type="text" id="Name" name="Name" value="<%=resultSet.getString("Name") %>"></center>
    </div> 
    <div class="form-group">
        <label for="Address">Patient Address:</label>
        <center><input type="text" id="Address" name="Address" value="<%=resultSet.getString("Address") %>"></center>
    </div>
    <div class="form-group">
        <label for="PhoneNo">Patient Phone No:</label>
        <center><input type="text" id="PhoneNo" name="PhoneNo" value="<%=resultSet.getString("PhoneNo") %>"></center>
    </div>
    <div class="form-group">
    <label for="Reason">Reason for Appointment:</label>
    <center><textarea id="Reason" name="Reason" rows="4"><%=resultSet.getString("Reason") %></textarea></center>
   </div>

    <div class="form-group">
        <label for="pDate">Date:</label>
        <center><input type="date" id="pDate" name="pDate" value="<%=resultSet.getString("pDate") %>"></center>
    </div>
    <div class="form-group">
        <label for="PayMethod">Payment Method:</label>
        <center><input type="text" id="PayMethod" name="PayMethod" value="<%=resultSet.getString("PayMethod") %>"></center>
    </div>
    <div class="form-group">
        <label for="ChannelFee">Channel Fee:</label>
        <center><input type="text" id="ChannelFee" name="ChannelFee" value="<%=resultSet.getString("ChannelFee") %>"></center>
    </div>
    <center><button type="submit">Appointment Now</button></center>
</form>

<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  


</body>
</html>


