package com.kh.java.map.model.dao.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.dao.MapDao;

public class MapDaoTest {

	@Test
	public void testSelectMapList() {
		MapDao daoTest = new MapDao();
		Connection con = JDBCTemplate.getConnection();
		
		assertNotNull(daoTest.selectMapList(con));
		
	}

}
