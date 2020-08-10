package newpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterDAO {

	public RegisterDAO() {
	}

	public String RegisterUser(RegisterBean rb) {
		String name = rb.getName();
		String email = rb.getEmail();
		String password = rb.getPassword();
		String myhash = rb.getMyhash();

		Connection con = MyConnection.getConnection();
		try {
			String sqlQuery = "insert into covid_user (name,email,password,hash) values (?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sqlQuery);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setNString(3, password);
			pst.setString(4, myhash);

			int i = pst.executeUpdate();

			if (i != 0) {

				SendingEmail se = new SendingEmail(email, myhash);
				se.sendMail();
				return "SUCCESS";
			}

		} catch (Exception ex) {
			System.out.println("RegisterDAO File" + ex);
		}
		return "error";
	}

}
