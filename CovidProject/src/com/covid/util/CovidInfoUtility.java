package com.covid.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.covid.bean.CovidBean;

import newpackage.ConnectionPro;

public class CovidInfoUtility {
	
	private static final String INSERT_SQL = "INSERT INTO DBCOVID.COVID_API(NAME,ACTIVE,CURED) VALUES(?,?,?)";
	private static final String UPDATE_SQL = "UPDATE DBCOVID.COVID_API SET ACTIVE=?, CURED=? WHERE NAME=?";
	private static final String SELECT_SQL = "SELECT ID FROM DBCOVID.COVID_API WHERE NAME=?";
	//private static final String GETMAXID = "SELECT MAX(ID)+1 FROM COVID_API";
	public static Boolean insertToDB(CovidBean cb) {
		Boolean isInserted = false;
		try {
		Connection con = ConnectionPro.getConnection();
		
		 PreparedStatement pt = con.prepareStatement(INSERT_SQL);
         pt.setString(1, cb.getName());
         pt.setInt(2, cb.getActive());
         pt.setInt(3, cb.getCured());
         
         int i=pt.executeUpdate();
         if(i>0) {
        	 isInserted = true;
         } else {
        	 isInserted = false;
         }
         con.close();
         
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return isInserted;
	}
	
	public static Boolean checkInfo(CovidBean cb) {
		Boolean exists = false;
		try {
			Connection con = ConnectionPro.getConnection();
			
			 PreparedStatement pt = con.prepareStatement(SELECT_SQL);
	         pt.setString(1, cb.getName());
	         
	         ResultSet rs = pt.executeQuery();
	         System.out.println("RS : "+rs);
	         if(rs.next()) {
	        	 exists = true;
	         }
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		return exists;
	}
	
	public static Boolean updateDB(CovidBean cb) {
		Boolean updated = false;
		try {
			Connection con = ConnectionPro.getConnection();
			
			 PreparedStatement pt = con.prepareStatement(UPDATE_SQL);
			 pt.setInt(1, cb.getActive());
	         pt.setInt(2, cb.getCured());
	         pt.setString(3, cb.getName());
	         
	         int i = pt.executeUpdate();
	         if(i>0) {
	        	 updated = true;
	         }
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		
		return updated;
	}
	
}