package newpackage;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class RegisterServlet
 */

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	     throws ServletException,  IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out= response.getWriter()){
			
			out.println("<!DOCTYPE html");
			out.println("<html>");
			out.println("<head>");
			out.println("<<title>Servlet Registration</title>");
			out.println("</head>");
			out.println("</body>");
			
			HttpSession session = request.getSession();
            session.removeAttribute("logUser");
            response.sendRedirect("index.jsp");
			
			out.println("<body>");
			out.println("<html>");
		}
	}

}

			
			