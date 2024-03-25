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

@WebServlet("/AppointmentUpdateProcess")
public class AppointmentUpdateProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AppointmentUpdateProcess() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pID = request.getParameter("pID");
        String Name = request.getParameter("Name");
        String Address = request.getParameter("Address");
        String PhoneNo = request.getParameter("PhoneNo");
        String Reason = request.getParameter("Reason");
        String pDate = request.getParameter("pDate");
        String PayMethod = request.getParameter("PayMethod");
        String ChannelFee = request.getParameter("ChannelFee");

       

        if (pID != null) {
            Connection con = null;
            PreparedStatement ps = null;
            int personID = Integer.parseInt(pID);
            try {
                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/patient_appointment";
                String user = "root";
                String psw = "";

                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, psw);
                String sql = "UPDATE appointment SET Name=?, Address=?, PhoneNo=?, Reason=?, pDate=?, PayMethod=?, ChannelFee=? WHERE pID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, Name);
                ps.setString(2, Address);
                ps.setString(3, PhoneNo);
                ps.setString(4, Reason);
                ps.setString(5, pDate);
                ps.setString(6, PayMethod);
                ps.setString(7, ChannelFee);
                ps.setInt(8, personID);

                int i = ps.executeUpdate();
                if (i > 0) {
                	
                    RequestDispatcher rd = request.getRequestDispatcher("AppointmentManagement.jsp");
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
