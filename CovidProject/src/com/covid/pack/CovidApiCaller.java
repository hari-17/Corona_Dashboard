package com.covid.pack;

import java.net.URL;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONObject;

import com.covid.bean.CovidBean;
import com.covid.util.CovidInfoUtility;


public class CovidApiCaller {
	
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static void main(String []args) {
		try {
		URL url = new URL("http://covid19-india-adhikansh.herokuapp.com/states"); //API URL 
		 Scanner scan = new Scanner(url.openStream()); // Api call
		    String str = new String();
		    while (scan.hasNext()) //API Data iterated & saved to str
		        str += scan.nextLine();
		    scan.close();
		
		    System.out.println("str : "+str);
		
       
       JSONObject jsonObject = new JSONObject(str); //str : form json object
System.out.println(jsonObject.length());

JSONArray res = jsonObject.getJSONArray("state");
System.out.println("State | Active");
System.out.println("------------------");

for(int i=0;i<res.length(); i++) { // iterate json array
	JSONObject jsonItem = res.getJSONObject(i);
	//System.out.println(jsonItem.getString("name")+" | "+jsonItem.getInt("active"));
	CovidBean cb = new CovidBean();
	
	cb.setName(jsonItem.getString("name"));
	cb.setActive(jsonItem.getInt("active"));
	cb.setCured(jsonItem.getInt("cured"));
	
	Boolean isRowExists = CovidInfoUtility.checkInfo(cb);
	
	if(!isRowExists) {
		System.out.println("inserted");
		CovidInfoUtility.insertToDB(cb);
	}else {
		System.out.println("updated");
		CovidInfoUtility.updateDB(cb);
	}
}		
/*
 * System.out.println(res.getInt("active"));
 * System.out.println(res.getInt("cured"));
 * System.out.println(res.getInt("death"));
 * System.out.println(res.getInt("total"));
 */


     


		
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
