<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>
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

try {
  Class.forName(driver);
  connection = DriverManager.getConnection(connectionUrl + database, userid, password);
  statement = connection.createStatement();
  String query = "SELECT * FROM doctor"; // Query to select all data from the table
  resultSet = statement.executeQuery(query);

  if (resultSet != null) {
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();

    // Inserting title with spacing
    Paragraph title = new Paragraph("Doctor Report", FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD));
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);
    
    document.add(Chunk.NEWLINE); // Adding space between title and table

    PdfPTable table = new PdfPTable(5); // Number of columns
    table.addCell("ID");
    table.addCell("Patient Phone No");
    table.addCell("Doctor Name");
    table.addCell("Reg. No");
    table.addCell("Test Name");

    while (resultSet.next()) {
      table.addCell(resultSet.getString("doc_ID"));
      table.addCell(resultSet.getString("PhoneNo"));
      table.addCell(resultSet.getString("DoctorName"));
      table.addCell(resultSet.getString("Reg_No"));
      table.addCell(resultSet.getString("Test_Name"));
    }

    document.add(table);
    document.close();

    response.setContentType("application/pdf");
    response.setHeader("Content-disposition", "attachment; filename=Doctor Report.pdf");

    OutputStream pdfOutputStream = response.getOutputStream();
    baos.writeTo(pdfOutputStream);
    pdfOutputStream.flush();
  }
} catch (Exception e) {
  e.printStackTrace();
}
%>
