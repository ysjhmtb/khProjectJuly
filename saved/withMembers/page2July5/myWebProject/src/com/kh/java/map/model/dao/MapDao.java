package com.kh.java.map.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.vo.AttachmentMapVo;
import com.kh.java.map.model.vo.MapPlusAtmtVo;
import com.kh.java.map.model.vo.MapVo;

public class MapDao {
	
public ArrayList<MapVo> getMapList(Connection con){
		
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MapVo> result = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			String query = "SELECT MARNAME, MARNO, LAT, LNG, EXPL, STARTDAY, ENDDAY, URL, "
					+ "COLOR, COLORTEXT FROM MARLOC";
			rs = stmt.executeQuery(query);
			
			MapVo temp = null;
			while(rs.next()) {
				String marketName = rs.getString("MARNAME");
				int marketNo = rs.getInt("MARNO");
				double marketLat = rs.getDouble("LAT");
				double marketLng = rs.getDouble("LNG");
				String marketExpl = rs.getString("EXPL");
				Date startDay = rs.getDate("STARTDAY");
				Date endDay = rs.getDate("ENDDAY");
				String url = rs.getString("URL");
				String color = rs.getString("COLOR");
				String colortext = rs.getString("COLORTEXT");
				
				
				
				temp = new MapVo(marketName, marketNo, marketLat, marketLng, 
						marketExpl, startDay, endDay, url, color, colortext);
				
				result.add(temp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		
		return result;
	}
	
	
	

	
	
	
	
	public int insertMap(Connection con, String marketName, double marketLat, 
			double marketLng, 
			String marketExpl, String startDay, String endDay, String url, 
			String color, String colortext) {
		
		
		PreparedStatement pstmt = null;
		
		
		String query = "INSERT INTO MARLOC " + 
				"VALUES(?,SEQ_MARKET.NEXTVAL,?,?,?,TO_DATE(?,'YYYYMMDD'),TO_DATE(?,'YYYYMMDD'),?,?,?)";
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, marketName);
			pstmt.setDouble(2, marketLat);
			pstmt.setDouble(3, marketLng);
			pstmt.setString(4, marketExpl);
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			pstmt.setString(7, "#");
			pstmt.setString(8, color);
			pstmt.setString(9, colortext);
			
			
			result = pstmt.executeUpdate();
			
			System.out.println(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	
	
	//int fno는 시퀀스로 입력되므로 매개변수로 받을 필요가 없다.
	public int insertAttachmentMap(Connection con, int marNo, String originName,
			String changeName, String filePath, int fileLevel,
			int downloadCount) {
		
		System.out.println(marNo + " / " + originName + " / " + 
		changeName + " / " + filePath + " / " + fileLevel + " / " + 
				downloadCount);
		
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO ATTACHMENTMAP" + 
				" VALUES (SEQ_FNO.NEXTVAL, ?," + 
				" ?,?," + 
				" ?," + 
				" SYSDATE, ?, ?)";
		
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, marNo);
			pstmt.setString(2, originName);
			pstmt.setString(3, changeName);
			pstmt.setString(4, filePath);
			pstmt.setInt(5, fileLevel);
			pstmt.setInt(6, downloadCount);
			
			
			result = pstmt.executeUpdate();
			
			System.out.println(query);
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
		
	}
	
	
	
	
	
	public MapVo getStartDayForCountdown(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		MapVo result = null;
		
		try {
			stmt = con.createStatement();
			String query = "SELECT ROWNUM, MARNAME, MARNO, LAT, LNG, EXPL,"
					+ " STARTDAY, ENDDAY, URL, COLOR, COLORTEXT" + 
					" FROM(" + 
					" SELECT ROWNUM, MARNAME, MARNO, LAT, LNG," + 
					" EXPL, STARTDAY, ENDDAY, URL, COLOR, COLORTEXT" + 
					" FROM MARLOC ORDER BY STARTDAY" + 
					" ) " + 
					" WHERE ROWNUM = 1";
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String marketName = rs.getString("MARNAME");
				int marketNo = rs.getInt("MARNO");
				double marketLat = rs.getDouble("LAT");
				double marketLng = rs.getDouble("LNG");
				String marketExpl = rs.getString("EXPL");
				Date startDay = rs.getDate("STARTDAY");
				Date endDay = rs.getDate("ENDDAY");
				String url = rs.getString("URL");
				String color = rs.getString("COLOR");
				String colortext = rs.getString("COLORTEXT");
				
				
				result = new MapVo(marketName, marketNo, marketLat, marketLng, 
						marketExpl, startDay, endDay, url, color, colortext);
				
				System.out.println(query);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		
		return result;
	}




	public int getMarNo(Connection con, String marketName) {
		
		Statement stmt = null;
		ResultSet rs = null;
		int result = -1;
		
		try {
			stmt = con.createStatement();
			String query = "SELECT MAX(MARNO) AS MARNO " + 
					" FROM MARLOC WHERE MARNAME='" + marketName +"'";
			
			System.out.println(query);
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				result = rs.getInt("MARNO");
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}








	public MapVo getAMapVo(Connection con, int marNo) {
		
		MapVo result = new MapVo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MARNAME, MARNO, LAT, LNG, EXPl, " + 
				"STARTDAY, ENDDAY, URL, COLOR, COLORTEXT " + 
				"FROM MARLOC " + 
				"WHERE MARNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, marNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result.setMarketName(rs.getString("MARNAME"));
				result.setMarketNo(rs.getInt("MARNO"));
				result.setMarketLat(rs.getDouble("LAT"));
				result.setMarketLng(rs.getDouble("LNG"));
				result.setMarketExpl(rs.getString("EXPL"));
				result.setStartDay(rs.getDate("STARTDAY"));
				result.setEndDay(rs.getDate("ENDDAY"));
				result.setUrl(rs.getString("URL"));
				result.setColor(rs.getString("COLOR"));
				result.setColortext(rs.getString("COLORTEXT"));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return result;
	}


	public AttachmentMapVo getAAttachmentMapVo(Connection con, int marNo) {
		AttachmentMapVo result = new AttachmentMapVo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT FNO, MARNO, ORIGIN_NAME, CHANGE_NAME, " + 
				"FILE_PATH, UPLOAD_DATE, FILE_LEVEL, DOWNLOAD_COUNT " + 
				"FROM ATTACHMENTMAP " + 
				"WHERE MARNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, marNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				result.setFno(rs.getInt("FNO"));
				result.setMarNo(rs.getInt("MARNO"));
				result.setOriginName(rs.getString("ORIGIN_NAME"));
				result.setChangeName(rs.getString("CHANGE_NAME"));
				result.setFilePath(rs.getString("FILE_PATH"));
				result.setUploadDate(rs.getDate("UPLOAD_DATE"));
				result.setFileLevel(rs.getInt("FILE_LEVEL"));
				result.setDownloadCount(rs.getInt("DOWNLOAD_COUNT"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
		
		
	}








	public int realModifyMap(Connection con, int marNo, String marketName, double lat, 
			double lng, String marketExpl,
			String startDay, String endDay, String url, String color, String colorText) {
		
		
		System.out.println("realModifyMap DAO : " + marNo + " / " + lat + " / " + 
				lng + " / " + marketExpl + " / " + startDay + " / " + endDay + " / " + 
						url + " / " + color + " / " + colorText);
		
		
		PreparedStatement pstmt = null;
		
		String query = "UPDATE MARLOC "
				+ "SET MARNAME = ?, LAT = ?, "
				+ "LNG = ?, EXPL = ?, STARTDAY = TO_DATE(?,'YYYYMMDD'), "
				+ "ENDDAY = TO_DATE(?,'YYYYMMDD'), URL = ?, "
				+ "COLOR = DEFAULT, COLORTEXT = DEFAULT "
				+ "WHERE MARNO = ?";
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, marketName);
			pstmt.setDouble(2, lat);
			pstmt.setDouble(3, lng);
			pstmt.setString(4, marketExpl);
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			pstmt.setString(7, url);
			//pstmt.setString(8, color);
			//pstmt.setString(9, colorText);
			pstmt.setInt(8, marNo);
			
			result = pstmt.executeUpdate();
			
			System.out.println("query : " + query);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}








	public int realModifyAttachment(Connection con, int marNo, String originName, 
			String changeName, String path,
			int fileLevel, int downloadCount) {
		
		System.out.println("realModifyAttachment : " + marNo + " / " + originName + " / " + 
				changeName + " / " + path + " / " + fileLevel + " / " + downloadCount);
		
		PreparedStatement pstmt = null;
		
		String query = "UPDATE ATTACHMENTMAP "
				+ "SET ORIGIN_NAME = ?, "
				+ "CHANGE_NAME = ?, "
				+ "FILE_PATH = ?,"
				+ "UPLOAD_DATE = SYSDATE, "
				+ "FILE_LEVEL = ?, "
				+ "DOWNLOAD_COUNT = ? "
				+ "WHERE MARNO = ?";

		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, originName);
			pstmt.setString(2, changeName);
			pstmt.setString(3, path);
			pstmt.setInt(4,  fileLevel);
			pstmt.setInt(5,  downloadCount);
			pstmt.setInt(6, marNo);
			
			
			result = pstmt.executeUpdate();
			
			System.out.println("query : " + query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}








	public int deleteMap(Connection con, int marNo) {
		
		PreparedStatement pstmt = null;
		
		String query = "DELETE FROM MARLOC WHERE MARNO = ?";
		
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, marNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<MapVo> selectCalendar(Connection con) {
		ArrayList<MapVo> list = new ArrayList<MapVo>();
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "SELECT MARNAME, TO_CHAR(STARTDAY, 'YYYY-MM-DD') AS STARTD ,TO_CHAR(ENDDAY, 'YYYY-MM-DD') AS ENDD,COLOR, COLORTEXT "
						+"FROM MARLOC";
		try {
			stmt =con.createStatement();
			
			rs = stmt.executeQuery(query);
			
			MapVo mv = null;
			while(rs.next()){
				mv = new MapVo();
				mv.setTitle(rs.getString("MARNAME"));
				mv.setStart(rs.getString("STARTD"));
				mv.setEnd(rs.getString("ENDD"));
				mv.setColor(rs.getString("COLOR"));
				mv.setTextColor(rs.getString("COLORTEXT"));
				
				list.add(mv);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return list;
	}






	
	
}









