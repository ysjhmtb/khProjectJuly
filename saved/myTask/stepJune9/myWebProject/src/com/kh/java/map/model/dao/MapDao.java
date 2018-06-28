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
	
	
	
	public ArrayList<MapPlusAtmtVo> selectMapList(Connection con){
		
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MapPlusAtmtVo> result = new ArrayList<>();
		
		
		try {
			stmt = con.createStatement();
			String query = "SELECT MARNAME, MARLOC.MARNO  AS MARNO, LAT, LNG, EXPL, STARTDAY, ENDDAY," + 
					"  URL, COLOR, COLORTEXT, FNO, ORIGIN_NAME, CHANGE_NAME," + 
					"  FILE_PATH, UPLOAD_DATE, FILE_LEVEL, DOWNLOAD_COUNT" + 
					"  FROM MARLOC" + 
					"  JOIN ATTACHMENTMAP on MARLOC.MARNO = ATTACHMENTMAP.MARNO";
			rs = stmt.executeQuery(query);
			
			MapPlusAtmtVo sumVo = null;
			MapVo temp = null;
			AttachmentMapVo temp2 = null;
			
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
				
				int fno = rs.getInt("FNO");
				int attachMarNo = rs.getInt("MARNO");
				String originName = rs.getString("ORIGIN_NAME");
				String changeName = rs.getString("CHANGE_NAME");
				String filePath = rs.getString("FILE_PATH");
				Date uploadDate = rs.getDate("UPLOAD_DATE");
				int fileLevel = rs.getInt("FILE_LEVEL");
				int downloadCount = rs.getInt("DOWNLOAD_COUNT");
				
				
				temp = new MapVo(marketName, marketNo, marketLat, marketLng, 
						marketExpl, startDay, endDay, url, color, colortext);
				
				temp2 = new AttachmentMapVo(fno, attachMarNo, originName, changeName, 
						filePath, uploadDate, fileLevel, downloadCount);
				
				sumVo = new MapPlusAtmtVo(temp,temp2);
				
				result.add(sumVo);
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
				"VALUES(?,SEQ_NNO.NEXTVAL,?,?,?,TO_DATE(?,'YYYYMMDD'),TO_DATE(?,'YYYYMMDD'),?,?,?)";
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, marketName);
			pstmt.setDouble(2, marketLat);
			pstmt.setDouble(3, marketLng);
			pstmt.setString(4, marketExpl);
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			pstmt.setString(7, url);
			pstmt.setString(8, color);
			pstmt.setString(9, colortext);
			
			
			result = pstmt.executeUpdate();
			
			
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
		
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO ATTACHMENTMAP" + 
				" VALUES (SEQ_FNO.NEXTVAL, ?," + 
				" '?','?'," + 
				" '?'," + 
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
					" FROM MARLOC WHERE MARNAME=" + marketName;
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				result = rs.getInt("MARNO");
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
		
		
	
		
		
		
		
		
		return 0;
	}
	
	
}









