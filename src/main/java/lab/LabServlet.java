package lab;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Import Database Connection Class file 


@WebServlet("/LabServlet") 
public class LabServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
	
		String PhoneNo = request.getParameter("PhoneNo");		
		String testResult = request.getParameter("testResult");
		String testDate = request.getParameter("testDate");			
		String testDescri = request.getParameter("testDescri");
		
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into labtest(PhoneNo,testResult,testDate,testDescri) values(?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_appointment","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   

			    st.setString(1, PhoneNo);
			    st.setString(2, testResult);			    
			    st.setString(3, testDate);	
			    st.setString(4, testDescri);
			    	

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
	
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/ViewLabTestDetails.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();

      } 		
	} 	
} 



