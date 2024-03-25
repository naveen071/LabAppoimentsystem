<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.SQLException" %> <!-- Import SQLException -->
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "patient_appointment";
String userid = "root";
String password = "";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

if (request.getParameter("search") != null) {
    String searchTerm = request.getParameter("PhoneNo");
    
    // Validation: Ensure PhoneNo is not empty and is numeric
    if (searchTerm != null && !searchTerm.isEmpty() && searchTerm.matches("\\d+")) {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM labtest WHERE PhoneNo LIKE '%" + searchTerm + "%' OR lab_ID LIKE '%" + searchTerm + "%'";
            resultSet = statement.executeQuery(query);

            // Check if resultSet has rows
            if (resultSet.next()) {
                Document document = new Document();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                PdfWriter.getInstance(document, baos);
                document.open();
                
                Paragraph title = new Paragraph("Patient Lab Report", FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD));
                title.setAlignment(Element.ALIGN_CENTER);
                document.add(title);
                
                document.add(Chunk.NEWLINE);

                PdfPTable table = new PdfPTable(5);
                table.addCell("ID");
                table.addCell("Patient Phone No");
                table.addCell("Test Result");
                table.addCell("Date");
                table.addCell("Description");

                // Loop through resultSet
                do {
                    table.addCell(resultSet.getString("lab_ID"));
                    table.addCell(resultSet.getString("PhoneNo"));
                    table.addCell(resultSet.getString("testResult"));
                    table.addCell(resultSet.getString("testDate"));
                    table.addCell(resultSet.getString("testDescri"));
                } while (resultSet.next());

                document.add(table);
                document.close();

                response.setContentType("application/pdf");
                response.setHeader("Content-disposition", "attachment; filename=Patient_Report.pdf");

                OutputStream pdfOutputStream = response.getOutputStream();
                baos.writeTo(pdfOutputStream);
                pdfOutputStream.flush();
            } else {
                // No results found
                String errorMessage = "No records found for the given Phone No.";
                // Display pop-up message
                out.println("<script type='text/javascript'>alert('" + errorMessage + "');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        // Invalid input, handle error (e.g., show error message)
        
        String errorMessage = "Invalid input! Please enter a valid phone number.";
        // Display pop-up message
        out.println("<script type='text/javascript'>alert('" + errorMessage + "');</script>");
    
    }
}
%>
<!DOCTYPE html>
<html>
<head>
 <link href="css/form.css" rel="stylesheet">
<style>
h1 {
  text-align: center;
  padding: 12px;
  font-size: 32px;
  text-transform: uppercase;
  color: #8a2be2;
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
  <li><a href="AppointmentForm.jsp">Appointment Now</a></li>
  <li><a class="active" href="PatientLabTestReport.jsp">Lab Test Report</a></li>
  <li style="float:right"><a href="Login.jsp">Login</a></li>
</ul>


<h1>Patient Lab Report</h1>

 <form method="GET" action="PatientLabTestReport.jsp">
        <div class="search-bar">
            <center><input type="text" name="PhoneNo" id="PhoneNo" placeholder="Enter Phone No"></center>
            <br>
            <center><button type="submit" name="search">Download</button></center>
        </div>
    </form>



</body>
</html>
