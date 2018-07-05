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
 * Servlet implementation class deleteprofile
 */
@WebServlet("/deleteprofile")
public class deleteprofile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String email = session.getAttribute("Email").toString();
			String pass=session.getAttribute("Password").toString();
			
			String passwrd=request.getParameter("pwd").toString();
			
			System.out.print("original password:"+pass+"Enetered password:"+passwrd);
			
			 try{
			 

				if(pass.contentEquals(passwrd))
				{ 	System.out.println("Same pass");
					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy","root","admin");

					PreparedStatement ps = con.prepareStatement("delete from userprofile where email=? && password=? ;");
					ps.setString(1 , email);
					ps.setString(2, pass);

					ps.executeUpdate();
					session.invalidate();
					System.out.println("Profile deleted");
					PrintWriter out = response.getWriter();
					response.sendRedirect("Wordyhome.html");
				}else {
					System.out.println("Wrong password entered");
					response.sendRedirect("Settings.html");
				}
			}catch(ClassNotFoundException | SQLException e){
				response.sendRedirect("Deleteprofile.html");
			}
		}catch(Exception e)
		{	e.printStackTrace();
			response.sendRedirect("Settings.html");
		}
		
			

	}
}
