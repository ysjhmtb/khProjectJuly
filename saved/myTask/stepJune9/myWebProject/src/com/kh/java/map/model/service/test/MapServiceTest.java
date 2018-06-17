package com.kh.java.map.model.service.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.kh.java.map.model.service.MapService;

public class MapServiceTest {

	@Test
	public void testGetMapList() {
		MapService testService = new MapService();
		assertNotNull(testService.getMapList());
	}
	
	@Test
	public void testInsertMap() {
		MapService testService = new MapService();
		
		String marketName = "kh프리마켓";
		double marketLat = 37.498993;
		double marketLng = 127.032909;
		String marketExpl = "kh info";
		String startDay = "20180815";
		
		assertEquals(testService.insertMap(marketName, marketLat, marketLng, marketExpl, startDay),1);
		
	}

}
