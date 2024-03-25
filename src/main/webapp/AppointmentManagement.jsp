<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
<!DOCTYPE html>
<html>
<head>
 <link href="css/table.css" rel="stylesheet">
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



.button1 {
  background-color: #0739BF;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {
  background-color: #ff0000;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
</head>
<body>

<ul>
  <li><a href="Home.jsp">Home</a></li>
  <li><a class="active"  href="AppointmentManagement.jsp">Appointment Manage</a></li>
  <li><a href="LabTestManagement.jsp">Lab Report Manage</a></li>
  <li><a href="DoctorManagement.jsp">Doctor Recommend Manage</a></li>
  <li><a href="PdfAppointment.jsp">Appointment Report</a></li>
  <li><a href="PdfLab.jsp">Lab Report</a></li>
  <li><a href="PdfDoctor.jsp">Doctor Report</a></li>
  <li style="float:right"><a href="Login.jsp">Logout</a></li>
</ul>



<center><h2>All Appointment</h2></center>


        
<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Patient Name</th>
								 <th scope="col">Address</th>
								  <th scope="col">Phone No</th>
								   <th scope="col">Reason</th>
								  <th scope="col">Date</th>
								   <th scope="col">Payment Method</th>
								   <th scope="col">Amount</th>
								  
									<th>Update</th>
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from appointment";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("pID") %></td>
				  <td><%=resultSet.getString("Name") %></td>
				  <td><%=resultSet.getString("Address") %></td>
				  <td><%=resultSet.getString("PhoneNo") %></td>
				  <td><%=resultSet.getString("Reason") %></td>
				  <td><%=resultSet.getString("pDate") %></td>
				  <td><%=resultSet.getString("PayMethod") %></td>
				  <td><%=resultSet.getString("ChannelFee") %></td>

				  
				  
				   <td><a href="AppointmentUpdate.jsp?pID=<%=resultSet.getInt("pID") %>"><button class="button1" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				 
				  <td><a href="AppointmentDelete.jsp?pID=<%=resultSet.getInt("pID") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>
			
		</div>

				
</body>
</html>


