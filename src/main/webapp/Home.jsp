<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    width: 1520px; /* Set width of the image */
    height: 700px; /* Maintain aspect ratio */
    border-radius: 10px; /* Add rounded corners */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow */
}
</style>
</head>
<body>

<ul>
  <li><a class="active" href="Home.jsp">Home</a></li>
  <li><a href="AppointmentForm.jsp">Appointment Now</a></li>
  <li><a href="PatientLabTestReport.jsp">Lab Test Report</a></li>
  <li style="float:right"><a href="Login.jsp">Login</a></li>
</ul>


<img src="img/lab02.jpg" alt="A">


</body>
</html>


