package newpackage;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

@WebServlet(name = "RegisterServlet", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String newpwd = DigestUtils.md5Hex(password);

			String myHash;
			Random random = new Random();
			random.nextInt(999999);
			myHash = DigestUtils.md5Hex("" + random);

			RegisterBean rb = new RegisterBean();
			rb.setName(name);
			rb.setEmail(email);
			rb.setPassword(newpwd);
			rb.setMyhash(myHash);

			RegisterDAO regDAO = new RegisterDAO();
			String str = regDAO.RegisterUser(rb);
			if (str.equals("SUCCESS")) {
				response.sendRedirect("verify.jsp");
			} else {
				request.setAttribute("RegisterFailed", true);
				request.getRequestDispatcher("index.jsp").forward(request, response);

			}

		} catch (Exception ex) {
			System.out.println("RegisterDAO File::" + ex);
		}
	}
}
