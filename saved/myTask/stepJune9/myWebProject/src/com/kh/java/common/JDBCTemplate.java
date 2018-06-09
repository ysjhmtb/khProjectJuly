package com.kh.java.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			String filePath = 
					JDBCTemplate.class.getResource("/oracleDriver.properties").getPath();
			Properties prop = new Properties();
			prop.load(new FileReader(filePath));
			
			String driver  = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String id = prop.getProperty("id");
			String pwd = prop.getProperty("pwd");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	
}
