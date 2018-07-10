package com.kh.java.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.notice.model.vo.NoticeVo;

public class NoticeDao {

	public int selectNoticeTotalCount(Connection con) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+ "FROM NOTICE ";
				
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				result = rs.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<NoticeVo> selectNoticeList(Connection con, int currentPage, int limit) {
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NOTICE N " 
						+"JOIN MEMBER M ON(N.NWRITER = M.M_ID) "
						+"ORDER BY NNO DESC) P) "
						+"WHERE RNUM BETWEEN ? AND ? ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			NoticeVo nv = null;
			while(rs.next()){
				nv = new NoticeVo();
				nv.setNo(rs.getInt("NNO"));
				nv.setTitle(rs.getString("NTITLE"));
				nv.setContent(rs.getString("NCONTENT"));
				nv.setWriter(rs.getString("NWRITER"));
				nv.setName(rs.getString("M_NAME"));
				nv.setCount(rs.getInt("NCOUNT"));
				nv.setWriteDate(rs.getDate("NDATE"));
				
				list.add(nv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		return list;
		
	}

	public int updateNoticeCount(Connection con, int noticeNo) {
		int result = 0;
		Statement stmt =null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "UPDATE NOTICE "
					+"SET NCOUNT = NCOUNT +1 "
					+"WHERE NNO = " +noticeNo;
			
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(stmt);
		}
		
		return result;
	}

	public NoticeVo selectNoticeDetail(Connection con, int noticeNo) {
		NoticeVo notice = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NOTICE N "
						+"JOIN MEMBER M ON(N.NWRITER = M.M_ID) "
						+"WHERE NNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				notice = new NoticeVo();
				notice.setNo(rs.getInt("NNO"));
				notice.setTitle(rs.getString("NTITLE"));
				notice.setContent(rs.getString("NCONTENT"));
				notice.setWriter(rs.getString("NWRITER"));
				notice.setCount(rs.getInt("NCOUNT"));
				notice.setWriteDate(rs.getDate("NDATE"));
				notice.setName(rs.getString("M_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return notice;
	}

	public NoticeVo selectNoticeNext(Connection con, int noticeNo) {
		NoticeVo notice = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTNOTICE AS ( "
						+"SELECT RNUM,NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NOTICE N " 
						+"JOIN MEMBER M ON(N.NWRITER = M.M_ID) "
						+"ORDER BY NNO DESC) P)) "

						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NEXTNOTICE "	
						+"WHERE RNUM =(SELECT RNUM "
						+"FROM NEXTNOTICE "
						+"WHERE NNO =?) -1 ";	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				notice = new NoticeVo();
				notice.setNo(rs.getInt("NNO"));
				notice.setTitle(rs.getString("NTITLE"));
				notice.setContent(rs.getString("NCONTENT"));
				notice.setWriter(rs.getString("NWRITER"));
				notice.setCount(rs.getInt("NCOUNT"));
				notice.setWriteDate(rs.getDate("NDATE"));
				notice.setName(rs.getString("M_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return notice;
	}

	public NoticeVo selectNoticePre(Connection con, int noticeNo) {
		NoticeVo notice = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTNOTICE AS ( "
						+"SELECT RNUM,NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NOTICE N " 
						+"JOIN MEMBER M ON(N.NWRITER = M.M_ID) "
						+"ORDER BY NNO DESC) P)) "

						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NEXTNOTICE "	
						+"WHERE RNUM =(SELECT RNUM "
						+"FROM NEXTNOTICE "
						+"WHERE NNO =?) +1 ";	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				notice = new NoticeVo();
				notice.setNo(rs.getInt("NNO"));
				notice.setTitle(rs.getString("NTITLE"));
				notice.setContent(rs.getString("NCONTENT"));
				notice.setWriter(rs.getString("NWRITER"));
				notice.setCount(rs.getInt("NCOUNT"));
				notice.setWriteDate(rs.getDate("NDATE"));
				notice.setName(rs.getString("M_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return notice;
	}

	public int deleteNotice(Connection con, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt =null;
		String query = "DELETE "
						+ "FROM NOTICE "
						+ "WHERE NNO = ?";
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int insertNotice(Connection con, String title, String content, String writer) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO NOTICE VALUES( "
						+"SEQ_NNO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT "
						+") ";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return result;
	}

	public int updateNotice(Connection con, NoticeVo notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE NOTICE "
				       +"SET NTITLE = ?, NCONTENT = ? "
				       +"WHERE NNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setInt(3, notice.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<NoticeVo> selectSearchNotice(Connection con, int currentPage, int limit, String keyword) {
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT NNO, NTITLE, NCONTENT, NWRITER, NCOUNT, NDATE, M_NAME "
						+"FROM NOTICE N " 
						+"JOIN MEMBER M ON(N.NWRITER = M.M_ID) "
						+"ORDER BY NNO DESC) P) "
						+"WHERE RNUM BETWEEN ? AND ? "
						+"AND NTITLE LIKE '%'|| ? ||'%' "
						+"OR NCONTENT LIKE '%'|| ? ||'%' ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			pstmt.setString(4, keyword);
			
			rs = pstmt.executeQuery();
			
			NoticeVo nv = null;
			while(rs.next()){
				nv = new NoticeVo();
				nv.setNo(rs.getInt("NNO"));
				nv.setTitle(rs.getString("NTITLE"));
				nv.setContent(rs.getString("NCONTENT"));
				nv.setWriter(rs.getString("NWRITER"));
				nv.setName(rs.getString("M_NAME"));
				nv.setCount(rs.getInt("NCOUNT"));
				nv.setWriteDate(rs.getDate("NDATE"));
				
				list.add(nv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		return list;
	}

	public int searchNoticeCount(Connection con, String keyword) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+"FROM NOTICE " 
					+"WHERE NTITLE LIKE '%"+keyword+"%' "
					+"OR NCONTENT LIKE  '%"+keyword+"%' ";	
				
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				result = rs.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		
		
		return result;
	}

}
