package com.kh.java.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
			
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:59161:XE", "jsp", "jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(Connection con) {
		
		try {
			if(con != null && !con.isClosed()) {
				System.out.println("test");
				con.close();
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed()) {
				rs.close();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		try {
			if(con != null && !con.isClosed()) {
				con.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			if(con != null && !con.isClosed()) {
				con.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
