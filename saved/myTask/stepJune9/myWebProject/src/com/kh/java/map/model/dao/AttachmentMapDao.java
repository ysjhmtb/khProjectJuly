package com.kh.java.map.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.java.common.JDBCTemplate;

public class AttachmentMapDao {
	
	
	public int insertAttachmentMap(Connection con, int marNo,
			String originName, String changeName, String filePath,
			int fileLevel, int downloadCount) {
		
		PreparedStatement pstmt = null;
		
		
		String query = "INSERT INTO ATTACHMENTMAP(SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, ?)";
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
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
