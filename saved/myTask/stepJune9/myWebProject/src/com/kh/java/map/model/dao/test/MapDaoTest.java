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
	
	@Test
	public void testInsertMap() {
		MapDao daoTest = new MapDao();
		Connection con = JDBCTemplate.getConnection();
		
		
		String marketName = "kh프리마켓";
		double marketLat = 37.498993;
		double marketLng = 127.032909;
		String marketExpl = "kh info";
		String startDay = "20180815";
		
		assertNotNull(daoTest.insertMap(con, marketName, marketLat, marketLng, marketExpl, startDay));
		
		
		
	}

}
