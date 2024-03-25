package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("psw");
		
		if(uname.equals("admin")&& pwd.equals("admin")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("AppointmentManagement.jsp");
		}
		else if(uname.equals("lab")&& pwd.equals("lab")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("LabTestForm.jsp");
		}
		else if(uname.equals("doctor")&& pwd.equals("doctor")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("DoctorForm.jsp");
		}

		
		
		else {
			response.sendRedirect("Login.jsp");
		}
		
	}

}
