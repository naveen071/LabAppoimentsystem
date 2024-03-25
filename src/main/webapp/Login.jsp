<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    .login-container {
        width: 300px;
        margin: 0 auto;
        margin-top: 100px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h2 {
        text-align: center;
    }
    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .login-container input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .login-container input[type="submit"]:hover {
        background-color: #0056b3;
    }
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
</style>
</head>
<body>

<ul>
  <li><a href="Home.jsp">Home</a></li>
  <li><a href="AppointmentForm.jsp">Appointment Now</a></li>
  <li><a href="PatientLabTestReport.jsp">Lab Test Report</a></li>
  <li style="float:right"><a class="active" href="Login.jsp">Login</a></li>
</ul>

<div class="login-container">
    <h2>Login</h2>
    <form action="Login" method="post">
        <input type="text" name="uname" placeholder="Username" required>
        <input type="password" name="psw" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
