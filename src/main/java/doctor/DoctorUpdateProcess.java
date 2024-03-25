package doctor;


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

@WebServlet("/DoctorUpdateProcess")
public class DoctorUpdateProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorUpdateProcess() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doc_ID = request.getParameter("doc_ID");
        String PhoneNo = request.getParameter("PhoneNo");
        String DoctorName = request.getParameter("DoctorName");
        String Reg_No = request.getParameter("Reg_No");
        String Test_Name = request.getParameter("Test_Name");
       

        if (doc_ID != null) {
            Connection con = null;
            PreparedStatement ps = null;
            int personID = Integer.parseInt(doc_ID);
            try {
                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/patient_appointment";
                String user = "root";
                String psw = "";

                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, psw);
                String sql = "UPDATE doctor SET PhoneNo=?, DoctorName=?, Reg_No=?, Test_Name=? WHERE doc_ID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, PhoneNo);
                ps.setString(2, DoctorName);
                ps.setString(3, Reg_No);
                ps.setString(4, Test_Name);
                ps.setInt(5, personID);

                int i = ps.executeUpdate();
                if (i > 0) {
                	
                    RequestDispatcher rd = request.getRequestDispatcher("DoctorManagement.jsp");
                    rd.forward(request, response);
                } else {
                    response.getWriter().write("There is a problem in updating Record.");
                }
            } catch (SQLException e) {
                request.setAttribute("error", e);
                response.getWriter().write(e.toString());
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
