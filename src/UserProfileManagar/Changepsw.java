package UserProfileManagar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Changepsw
 */
@WebServlet("/Changepsw")
public class Changepsw extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String email = session.getAttribute("Email").toString();
			String pass=session.getAttribute("Password").toString();

			String passwrd=request.getParameter("pwd");
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy","root","admin");

				PreparedStatement ps = con.prepareStatement("Update userprofile set password=? where Email=? && password=? ;");

				ps.setString(1 , passwrd);
				ps.setString(2 , email);
				ps.setString(3, pass);
				pass=passwrd;
				ps.executeUpdate();
				session.setAttribute("Password", passwrd);
				PrintWriter out = response.getWriter();
				response.sendRedirect("chatlist.jsp");
			}catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
				response.sendRedirect("ChangePwd.html");
			}
		}catch(Exception E)
		{
			response.sendRedirect("Settings.html");
		}
	}

}
