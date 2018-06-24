package com.kh.java.map.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.vo.MapVo;

public class MapDao {
	
	public ArrayList<MapVo> selectMapList(Connection con){
		
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MapVo> result = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			String query = "SELECT MARNAME, MARNO, LAT, LNG, EXPL, STARTDAY, ENDDAY FROM MARLOC";
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
				
				temp = new MapVo(marketName, marketNo, marketLat, marketLng, marketExpl, startDay, endDay);
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
	
	
	public int insertMap(Connection con, String marketName, double marketLat, double marketLng, 
			String marketExpl, String startDay, String endDay) {
		PreparedStatement pstmt = null;
		
		
		String query = "INSERT INTO MARLOC " + 
				"VALUES(?,SEQ_NNO.NEXTVAL,?,?,?,TO_DATE(?,'YYYYMMDD'),TO_DATE(?,'YYYYMMDD'))";
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, marketName);
			pstmt.setDouble(2, marketLat);
			pstmt.setDouble(3, marketLng);
			pstmt.setString(4, marketExpl);
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}
	
	public MapVo getStartDayForCountdown(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		MapVo result = null;
		
		try {
			stmt = con.createStatement();
			String query = "SELECT ROWNUM, MARNAME, MARNO, LAT, LNG, EXPL, STARTDAY, ENDDAY " + 
					"FROM( " + 
					"  SELECT ROWNUM, MARNAME, MARNO, LAT, LNG, " + 
					"          EXPL, STARTDAY, ENDDAY " + 
					"  FROM MARLOC ORDER BY STARTDAY " + 
					") " + 
					"WHERE ROWNUM = 1";
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String marketName = rs.getString("MARNAME");
				int marketNo = rs.getInt("MARNO");
				double marketLat = rs.getDouble("LAT");
				double marketLng = rs.getDouble("LNG");
				String marketExpl = rs.getString("EXPL");
				Date startDay = rs.getDate("STARTDAY");
				Date endDay = rs.getDate("ENDDAY");
				
				result = new MapVo(marketName, marketNo, marketLat, marketLng, marketExpl, startDay, endDay);
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
	
	
}









