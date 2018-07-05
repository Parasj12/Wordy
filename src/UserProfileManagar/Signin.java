package UserProfileManagar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signin
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("uname");
		String pass = request.getParameter("psw");
		//String email="paras";
		//String pass="123";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy", "root", "admin");
			PreparedStatement ps = con.prepareStatement("Select * from userprofile where Email=? && password=?;");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString(1);
				String phno=rs.getString(6);
				HttpSession session = request.getSession();
				session.setAttribute("Email", email);
				session.setAttribute("Password", pass);
				session.setAttribute("Name", name);
				session.setAttribute("Phone", phno);
				System.out.println("Signed in as\t"+email+"\t"+name);
				response.sendRedirect("chatlist.jsp");
			} else {
				response.sendRedirect("SignIn.html");
			} 
		} catch (Exception e) {response.sendRedirect("SignIn.html");
		}
	}

}
