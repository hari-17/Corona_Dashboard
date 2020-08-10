package newpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	LoginDAO() {
	}

	public String LoginCheck(LoginBean bean) {

		Connection con = MyConnection.getConnection();

		String email = bean.getEmail();

		String newpwd = bean.getNewpwd();
		// int admin = bean.getAdmin();

		try {
			String sqlQuery = "select * from covid_user where email=? and password=? and active=1";
			PreparedStatement pst = con.prepareStatement(sqlQuery);
			pst.setString(1, email);
			pst.setString(2, newpwd);
			// pst.setInt(3, admin);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String dbemail = rs.getString("email");
				String dbpassword = rs.getString("password");
				int dbadmin = rs.getInt("admin");
				if (dbemail.equalsIgnoreCase(email) && dbpassword.equalsIgnoreCase(newpwd) && dbadmin == 0) {
					return "success_user";
				} else if (dbemail.equalsIgnoreCase(email) && dbpassword.equalsIgnoreCase(newpwd) && dbadmin == 1) {
					return "success_admin";
				}
				return "error";

			}
		} catch (Exception ex) {
			System.out.println("From LoginDAO " + ex);
		}

		return "error";
	}

}
