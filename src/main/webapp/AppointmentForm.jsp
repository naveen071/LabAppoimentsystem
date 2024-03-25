<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <li><a class="active" href="AppointmentForm.jsp">Appointment Now</a></li>
  <li><a href="PatientLabTestReport.jsp">Lab Test Report</a></li>
  <li style="float:right"><a href="Login.jsp">Login</a></li>
</ul>


<center><h1>Appointment Now</h1></center>


<form action="AppointmentServlet" method="POST">
    <div class="form-group">
        <label for="Name">Patient Name:</label>
        <center><input type="text" id="Name" name="Name" placeholder="Enter Patient Name" required></center>
    </div> 
    <div class="form-group">
        <label for="Address">Patient Address:</label>
        <center><input type="text" id="Address" name="Address" placeholder="Enter Patient Address" required></center>
    </div>
    <div class="form-group">
        <label for="PhoneNo">Patient Phone No:</label>
        <center><input type="text" id="PhoneNo" name="PhoneNo" placeholder="Enter Patient Phone No" required></center>
    </div>
    <div class="form-group">
        <label for="Reason">Reason for Appointment:</label>
        <center><textarea id="Reason" name="Reason" rows="4" placeholder="Enter Reason" required></textarea></center>
    </div>
    <div class="form-group">
        <label for="pDate">Date:</label>
        <center><input type="date" id="pDate" name="pDate" placeholder="Enter Date" required></center>
    </div>
    <div class="form-group">
        <label for="PayMethod">Payment Method:</label>
        <center><input type="text" id="PayMethod" name="PayMethod" placeholder="CASH or CARD" required></center>
    </div>
    <div class="form-group">
        <label for="ChannelFee">Channel Fee:</label>
        <center><input type="text" id="ChannelFee" name="ChannelFee" value="Rs. 2500.00" required></center>
    </div>
    <center><button type="submit">Appointment Now</button></center>
</form>

    


</body>
</html>


