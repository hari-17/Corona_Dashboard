package newpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// private int admin;
	// private PrintStream out;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			String newpwd = DigestUtils.md5Hex(password);

			LoginBean bean = new LoginBean();
			bean.setEmail(email);
			bean.setPassword(password);
			bean.setNewpwd(newpwd);
			// bean.setAdmin(admin);

			LoginDAO loginDAO = new LoginDAO();
			String daoStr = loginDAO.LoginCheck(bean);
			if (daoStr.equals("success_user")) {

				HttpSession session = request.getSession(true);
				session.setAttribute("session_user", email);
				request.setAttribute("loginInitial", true);
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				// response.sendRedirect("dashboard.jsp");

			} else if (daoStr.equals("success_admin")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("session_user", email);
				response.sendRedirect("page.jsp");
			} else {
				request.setAttribute("loginFailed", true);
				// response.sendRedirect("login.jsp");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("error");

			}

		} catch (Exception ex) {
			System.out.println("" + ex);
		}
	}
}
