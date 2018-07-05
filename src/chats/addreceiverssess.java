package chats;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/addreceiverssess")
public class addreceiverssess extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sph=request.getParameter("sphno");
		String sname=request.getParameter("sname");
		HttpSession session=request.getSession();
		session.setAttribute("rphno", sph);
		session.setAttribute("rname",sname);
		response.sendRedirect("chatbox.jsp");
	}
}
