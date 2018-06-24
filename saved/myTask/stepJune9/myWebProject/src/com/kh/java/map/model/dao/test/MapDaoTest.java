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
		
		
		String marketName = "kh프리마켓2";
		double marketLat = 38.498993;
		double marketLng = 117.032909;
		String marketExpl = "kh info2";
		String startDay = "20180815";
		String endDay = "20180819";
		
		assertNotNull(daoTest.insertMap(con, marketName, marketLat, marketLng, 
				marketExpl, startDay, endDay));
		
		
		
	}
	
	@Test
	public void testGetStartDayForCountdown() {
		MapDao daoTest = new MapDao();
		Connection con = JDBCTemplate.getConnection();
		
		assertNotNull(daoTest.getStartDayForCountdown(con));
	}

}
