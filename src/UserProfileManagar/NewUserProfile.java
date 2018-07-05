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


@WebServlet("/NewUserProfile")
public class NewUserProfile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String Name=request.getParameter("Name");
			String Email=request.getParameter("Email");
			String Password=request.getParameter("password");
			System.out.println(Password);
			String Uid=request.getParameter("uid");
			String Country=request.getParameter("country");
			String Phno=request.getParameter("phno");
			String Profession=request.getParameter("profession");
			String fb=request.getParameter("fb");
			String insta=request.getParameter("insta");
			String twitter=request.getParameter("twitter");
			String status=request.getParameter("status");
			String about=request.getParameter("about");
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy","root","admin");

				PreparedStatement ps = con.prepareStatement("insert into userprofile values(?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,Name);
				ps.setString(2,Email);
				ps.setString(3,Password);
				ps.setString(4, Uid);
				ps.setString(5, Country);
				ps.setString(6, Phno);
				ps.setString(7, Profession);
				ps.setString(8, status);
				ps.setString(9, about);
				ps.setString(10 , fb);
				ps.setString(11, insta);
				ps.setString(12, twitter);
				ps.executeUpdate();
				System.out.println("New profile Created");
				PrintWriter out = response.getWriter();
				response.sendRedirect("SignIn.html");
			}catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			}
		}catch(Exception E)
		{
			response.sendRedirect("Settings.html");
		}
	}

}