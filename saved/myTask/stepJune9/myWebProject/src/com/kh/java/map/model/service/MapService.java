package com.kh.java.map.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.dao.MapDao;
import com.kh.java.map.model.vo.AttachmentMapVo;
import com.kh.java.map.model.vo.MapPlusAtmtVo;
import com.kh.java.map.model.vo.MapVo;

public class MapService {
	
	
	public List<MapVo> getMapList(){
		Connection con = JDBCTemplate.getConnection();
		ArrayList<MapVo> list = new MapDao().getMapList(con);
		JDBCTemplate.close(con);
		return list;
	}
	

	
	//marNo는 지도가 들어간 결과물 
	public int insertMap(String marketName, Double marketLat, Double marketLng, 
			String marketExpl, String startDay, String endDay, 
			String url, String color, String colortext, 
			String originName, String changeName, String filePath, int fileLevel,
			int downloadCount
			) {
		
		
		Connection con = JDBCTemplate.getConnection();
		
		/*
		 public int insertMap(Connection con, String marketName, double marketLat, 
			double marketLng, 
			String marketExpl, String startDay, String endDay, String url, 
			String color, String colortext) 
		 */
		
		int result = new MapDao().insertMap(con, marketName, marketLat, 
				marketLng, marketExpl, startDay, endDay, url, color, colortext);
		
		int result2 = -1;
		
		
		int marNo = new MapDao().getMarNo(con, marketName);
		
		if(0 < marNo) {
			result2 = new MapDao().insertAttachmentMap(con, marNo, originName, 
					changeName, filePath, fileLevel, downloadCount);
					
		}
		
		
		if(0 < result && 0 < result2) {
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



	public MapVo getAMapVo(int marNo) {
		
		Connection con = JDBCTemplate.getConnection();
		MapVo result = new MapDao().getAMapVo(con, marNo);
		JDBCTemplate.close(con);
		
		return result;
	}



	public AttachmentMapVo getAAttachmentMapVo(int marNo) {
		Connection con = JDBCTemplate.getConnection();
		AttachmentMapVo result = new MapDao().getAAttachmentMapVo(con, marNo);
		JDBCTemplate.close(con);
		
		return result;
	}



	public int realModifyMap(int marNo, String marketName, double lat, double lng, String marketExpl, String startDay,
			String endDay, String url, String color, String colorText, String originName, String changeName,
			String path, int fileLevel, int downloadCount) {
		
		System.out.println("realModifyMap SERVICE : " + marNo + " / " + lat + " / " + 
		lng + " / " + marketExpl + " / " + startDay + " / " + endDay + " / " + 
				url + " / " + color + " / " + colorText + " / " + originName + " / " + 
		changeName + " / " + path + " / " + fileLevel + " / " + downloadCount);
		
		
		Connection con = JDBCTemplate.getConnection();
		int result = new MapDao().realModifyMap(con, marNo, marketName, lat, lng,
				marketExpl, startDay, endDay, url, color, colorText);
		
		int result2 = new MapDao().realModifyAttachment(con, marNo, originName,
				changeName, path, fileLevel, downloadCount);
		
		if(0 < result && 0 < result2) {
			JDBCTemplate.commit(con);
			
		}else {
			JDBCTemplate.rollback(con);
			result = 0;
		}
		
		JDBCTemplate.close(con);
		return result;
	}



	public int deleteMap(int marNo) {
		
		Connection con = JDBCTemplate.getConnection();
		
		int result = new MapDao().deleteMap(con, marNo);
		
		if(0 < result) {
			JDBCTemplate.commit(con);
		}else {
			JDBCTemplate.rollback(con);
			
		}
		
		JDBCTemplate.close(con);		
		return result;
	}



	
}











