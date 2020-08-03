package newpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			out.println("<!DOCTYPE html");
			out.println("<html>");
			out.println("<head>");
			out.println("<<title>Servlet Registration</title>");
			out.println("</head>");
			out.println("<body>");

			String lEmail = request.getParameter("email");
			String lPass = request.getParameter("password");

			UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
			User user = db.logUser(lEmail, lPass);

			if (user != null) {
				if (user.getAdmin() == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("loguser", user);
					response.sendRedirect("page.jsp");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("loguser", user);
					response.sendRedirect("dashboard.jsp");
				}
			} else {
				response.sendRedirect("index.jsp");
			}

			out.println("</body>");
			out.println("</html>");

		}
	}
}
