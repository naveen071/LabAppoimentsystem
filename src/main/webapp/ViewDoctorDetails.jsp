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
  <li><a href="DoctorForm.jsp">DoctorCreate</a></li>
  <li><a href="ViewLabTest.jsp">Lab Test View</a></li>
  <li><a class="active" href="ViewDoctorDetails.jsp">Doctor Recommend View</a></li>
  <li style="float:right"><a href="Login.jsp">Login</a></li>
</ul>



<center><h2>All Doctor Recommend</h2></center>


        
<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Patient Phone No</th>
								 <th scope="col">Doctor Name</th>
								  <th scope="col">Doctor Reg No</th>
								   <th scope="col">Test Name</th>
								
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from doctor";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("doc_ID") %></td>
				  <td><%=resultSet.getString("PhoneNo") %></td>
				  <td><%=resultSet.getString("DoctorName") %></td>
				  <td><%=resultSet.getString("Reg_No") %></td>
				  <td><%=resultSet.getString("Test_Name") %></td>

				  
				  
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


