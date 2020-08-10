package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	static Connection con;

	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcovid", "root", "1234");

		} catch (Exception ex) {
			System.out.println("From My Connection Class" + ex);
		}
		return con;

	}
}
