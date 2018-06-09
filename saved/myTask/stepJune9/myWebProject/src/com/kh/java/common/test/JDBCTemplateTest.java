package com.kh.java.common.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;

import com.kh.java.common.JDBCTemplate;

public class JDBCTemplateTest {

	@Test
	public void testGetConnection() {
		
		
		assertNotNull(JDBCTemplate.getConnection());
	}
	

	@Test
	public void testCloseConnection() {
		Connection con = JDBCTemplate.getConnection();
		JDBCTemplate.close(con);
		assertNull(con);
		//?
		
		
	}

	
	@Test
	public void testCloseStatement() {
		Connection con = JDBCTemplate.getConnection();
		try {
			Statement stmt = con.createStatement();
			JDBCTemplate.close(stmt);
			assertNull(stmt);
			//?
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	@Test
	public void testCloseResultSet() {
		Connection con = JDBCTemplate.getConnection();
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM MARLOC";
			ResultSet rs = stmt.executeQuery(query);
			JDBCTemplate.close(rs);
			assertNull(rs);
			//?
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	@Test
	public void testCommit() {
		
	}

	@Test
	public void testRollback() {
		
	}

}
