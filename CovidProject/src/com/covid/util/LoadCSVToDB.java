package com.covid.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import newpackage.ConnectionPro;

public class LoadCSVToDB {

	private static String INSERT_SQL = "INSERT INTO COVID_REPORT VALUES(?,?,?,?,?,?)";

	public static void main(String args[]) {
		System.out.println("Load of CSV Start");
		String fn = "result.csv";

		Boolean b = insertToDB(fn);
		System.out.println("Load completed : " + b);
		System.out.println("Load of CSV End");
	}

	public static Boolean insertToDB(String fn) {
		Boolean isInserted = false;

		Connection connection = null;

		try {

			connection = ConnectionPro.getConnection();
			connection.setAutoCommit(false);

			PreparedStatement statement = connection.prepareStatement(INSERT_SQL);

			BufferedReader lineReader = new BufferedReader(new FileReader(fn));
			String lineText = null;

			lineReader.readLine(); // skip header line

			while ((lineText = lineReader.readLine()) != null) {
				String[] data = lineText.split(",");
				int id = Integer.parseInt(data[0]);
				String name = data[1];
				int active = Integer.parseInt(data[2]);
				int cured = Integer.parseInt(data[3]);
				int death = Integer.parseInt(data[4]);
				int total = Integer.parseInt(data[5]);

				statement.setInt(1, id);
				statement.setString(2, name);
				statement.setInt(3, active);
				statement.setInt(4, cured);
				statement.setInt(5, death);
				statement.setInt(6, total);

				statement.addBatch();
			}

			lineReader.close();

			// execute the remaining queries
			int i[] = statement.executeBatch();
			if (i[0] > 0) {
				isInserted = true;
			}

			connection.commit();
			connection.close();

		} catch (IOException ex) {
			System.err.println(ex);
		} catch (SQLException ex) {
			ex.printStackTrace();

			try {
				connection.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isInserted;
	}

}
