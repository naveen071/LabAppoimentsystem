package appointment;

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


@WebServlet("/AppointmentServlet") 
public class AppointmentServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
	
		String Name = request.getParameter("Name");		
		String Address = request.getParameter("Address");
		String PhoneNo = request.getParameter("PhoneNo");	
		String Reason = request.getParameter("Reason");	
		String pDate = request.getParameter("pDate");	
		String PayMethod = request.getParameter("PayMethod");
		String ChannelFee = request.getParameter("ChannelFee");
	

		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into appointment(Name,Address,PhoneNo,Reason,pDate,PayMethod,ChannelFee) values(?,?,?,?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_appointment","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   

			    st.setString(1, Name);
			    st.setString(2, Address);			    
			    st.setString(3, PhoneNo);			    
			    st.setString(4, Reason);			    
			    st.setString(5, pDate);			    
			    st.setString(6, PayMethod);	
			    st.setString(7, ChannelFee);
	

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Booking Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          

		          
		          RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();

      } 		
	} 	
} 



