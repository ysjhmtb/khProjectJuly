package com.kh.java.map.model.dao.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.dao.AttachmentMapDao;

public class AttachmentMapDaoTest {

	@Test
	public void testInsertAttachmentMap() {
		
		Connection con = JDBCTemplate.getConnection();
		int marNo = 229;
		String originName = "testOrigin";
		String changeName = "testChange";
		String filePath = "/Users";
		int fileLevel = 1;
		int downloadCount = 0;
		
		AttachmentMapDao dao = new AttachmentMapDao();
		
		/*
		 * public int insertAttachmentMap(Connection con, int marNo,
			String originName, String changeName, String filePath,
			int fileLevel, int downloadCount)
		 */
		
		assertEquals(dao.insertAttachmentMap(con, marNo, originName, 
				changeName, filePath, fileLevel, downloadCount), 1);
	}

}
