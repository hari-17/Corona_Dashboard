package newpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDatabase {
	Connection con;

	public UserDatabase(Connection con) {
		this.con = con;
	}

	// for register user
	public boolean saveUser(User user) {
		boolean set = false;
		try {
			// Insert register data to database
			String query = "insert into user(name,email,password,admin) values(?,?,?,?)";

			PreparedStatement pt = this.con.prepareStatement(query);
			pt.setString(1, user.getName());
			pt.setString(2, user.getEmail());
			pt.setString(3, user.getPassword());
			pt.setInt(4, 0);
			pt.executeUpdate();
			set = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}

	public User logUser(String email, String pass) {
		User user = null;
		try {

			String query = "select * from user where email=? and password=?";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, pass);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAdmin(rs.getInt("admin"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}
}
