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

}
