package chats;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sendmessage")
public class sendmessage extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String phno = session.getAttribute("Phone").toString();
		String name=session.getAttribute("Name").toString();
		String rname=session.getAttribute("rname").toString();
		String rph=session.getAttribute("rphno").toString();
			
		String chat=request.getParameter("message");
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy","root","admin");
	
		PreparedStatement ps = con.prepareStatement("insert into chats values(?,?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,phno);
		ps.setString(3,rname);
		ps.setString(4, rph);
		ps.setString(5, chat);
		ps.executeUpdate();
		System.out.println("New message sent");
		PrintWriter out = response.getWriter();
		response.sendRedirect("chatbox.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
