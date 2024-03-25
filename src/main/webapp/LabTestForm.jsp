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
  <li><a class="active" href="LabTestForm.jsp">Lab Test Create</a></li>
  <li><a href="ViewDoctor.jsp">Doctor Recommend View</a></li>
  <li><a href="ViewLabTestDetails.jsp">Lab Test View</a></li>
  <li style="float:right"><a href="Login.jsp">Logout</a></li>
</ul>


<center><h1>Lab Test Form</h1></center>


<form action="LabServlet" method="POST">
    <div class="form-group">
        <label for="Name">Patient Phone No:</label>
         <select name="PhoneNo" id="PhoneNo" class="form-group-input">
                            <%
                                // Import necessary packages and initialize connection variables
                                Connection con = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                try {
                                    // Establish connection to the database
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/patient_appointment", "root", "");

                                    // Fetch patient names from the database
                                    stmt = con.createStatement();
                                    rs = stmt.executeQuery("SELECT PhoneNo FROM appointment");

                                    // Populate dropdown options with patient names
                                    while (rs.next()) {
                                        String PhoneNo = rs.getString("PhoneNo");
                            %>
                                        <option value="<%=PhoneNo%>"><%=PhoneNo%></option>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close the resources
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (con != null) con.close();
                                }
                            %>
                        </select>
                        </div> 
    <div class="form-group">
        <label for="Address">Patient Test Result</label>
        <center><input type="text" id="testResult" name="testResult" required></center>
    </div>
    <div class="form-group">
        <label for="PhoneNo">Date</label>
        <center><input type="date" id="testDate" name="testDate" required></center>
    </div>
    <div class="form-group">
        <label for="Reason">Description:</label>
        <center><textarea id="testDescri" name="testDescri" rows="4"  required></textarea></center>
    </div>
    
    <center><button type="submit">Submit</button></center>
</form>

    


</body>
</html>


