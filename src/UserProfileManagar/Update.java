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


@WebServlet("/Update")
public class Update extends HttpServlet {	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			String email = session.getAttribute("Email").toString();
			String pass=session.getAttribute("Password").toString();
			
			System.out.println(email+pass);
			String Uid=request.getParameter("uid");
			String Country=request.getParameter("country");
			String Profession=request.getParameter("profession");
			String fb=request.getParameter("fb");
			String insta=request.getParameter("insta");
			String twitter=request.getParameter("twitter");
			String about=request.getParameter("about");

			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy","root","admin");

				PreparedStatement ps = con.prepareStatement("Update userprofile set userid=? , country=?, profession=?,about=?,fb=?,insta=?,twitter=? where Email=? && password=? ;");

				ps.setString(1 , Uid);
				ps.setString(2, Country);
				ps.setString(3, Profession);
				ps.setString(4, about);
				ps.setString(5, fb);
				ps.setString(6, insta);
				ps.setString(7, twitter);
				ps.setString(8, email);
				ps.setString(9, pass);
				ps.executeUpdate();

				PrintWriter out = response.getWriter();
				response.sendRedirect("chatlist.jsp");
			}catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
				response.sendRedirect("Updateprofile.html");
			}
		}catch(Exception E)
		{
			response.sendRedirect("Settings.html");
		}
	}	

}
