package com.kh.java.map.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.dao.MapDao;
import com.kh.java.map.model.vo.MapVo;

public class MapService {

	public List<MapVo> getMapList(){
		Connection con = JDBCTemplate.getConnection();
		ArrayList<MapVo> list = new MapDao().selectMapList(con);
		JDBCTemplate.close(con);
		return list;
	}
	
	public int insertMap(String marketName, double marketLat, double marketLng, 
			String marketExpl, String startDay, String endDay, 
			String url, String color, String colortext) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new MapDao().insertMap(con, marketName, marketLat, 
				marketLng, marketExpl, startDay, endDay, url, color, colortext);
		
		if(0 < result) {
			JDBCTemplate.commit(con);
		}else {
			JDBCTemplate.rollback(con);
		}
		
		JDBCTemplate.close(con);
		return result;
	}
	
	
	public MapVo getStartDayForCountdown() {
		Connection con = JDBCTemplate.getConnection();
		MapVo result = new MapDao().getStartDayForCountdown(con);
		JDBCTemplate.close(con);
		return result;
	}
}
