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
		
		
		String marketName = "kh프리마켓2";
		double marketLat = 38.498993;
		double marketLng = 117.032909;
		String marketExpl = "kh info2";
		String startDay = "20180815";
		String endDay = "20180819";
		String url = "www.naver.com";
		String color = "#FFEEDD";
		String colortext = "BLACK";
		String attachedFile = "NONE FILE";
		
	
		
		assertEquals(testService.insertMap(marketName, marketLat, marketLng, 
				marketExpl, startDay, endDay, url, color, colortext, attachedFile),1);
		
	}
	
	@Test
	public void testGetStartDayForCountdown() {
		MapService testService = new MapService();
		assertNotNull(testService.getStartDayForCountdown());
		
	}

}
