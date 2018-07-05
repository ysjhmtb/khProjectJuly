package com.kh.java.report.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.notice.model.vo.NoticeVo;
import com.kh.java.report.model.vo.ReportVo;

public class ReportDao {

	public int insertMarketReport(Connection con, String title, String content, String writer) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPORT VALUES( " 
				+"SEQ_REPORT.NEXTVAL, ?, ?, ?, DEFAULT, NULL , DEFAULT " 
				+")"; 
		
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

	public int selectReportTotalCount(Connection con) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+ "FROM REPORT ";
				
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

	public ArrayList<ReportVo> selectReportList(Connection con, int currentPage, int limit) {
		ArrayList<ReportVo> list = new ArrayList<ReportVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM REPORT R " 
						+"JOIN MEMBER M ON(R.RWRITER = M.USERID) "
						+"ORDER BY RNO DESC) P) "
						+"WHERE RNUM BETWEEN ? AND ? ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			ReportVo rv = null;
			while(rs.next()){
				rv = new ReportVo();
				rv.setNo(rs.getInt("RNO"));
				rv.setTitle(rs.getString("RTITLE"));
				rv.setContent(rs.getString("RCONTENT"));
				rv.setWriter(rs.getString("RWRITER"));
				rv.setName(rs.getString("USERNAME"));
				rv.setCount(rs.getInt("RCOUNT"));
				rv.setWriteDate(rs.getDate("RDATE"));
				
				list.add(rv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int updateReportCount(Connection con, int reportNo) {
		int result = 0;
		Statement stmt =null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "UPDATE REPORT "
					+"SET RCOUNT = RCOUNT +1 "
					+"WHERE RNO = " +reportNo;
			
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(stmt);
		}
		
		return result;
	}

	public ReportVo selectReportDetail(Connection con, int reportNo) {
		ReportVo report = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM REPORT R "
						+"JOIN MEMBER M ON(R.RWRITER = M.USERID) "
						+"WHERE RNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				report = new ReportVo();
				report.setNo(rs.getInt("RNO"));
				report.setTitle(rs.getString("RTITLE"));
				report.setContent(rs.getString("RCONTENT"));
				report.setWriter(rs.getString("RWRITER"));
				report.setCount(rs.getInt("RCOUNT"));
				report.setWriteDate(rs.getDate("RDATE"));
				report.setName(rs.getString("USERNAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return report;
	}

	public ReportVo selectReportNext(Connection con, int reportNo) {
		ReportVo report = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTREPORT AS ( "
						+"SELECT RNUM,RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM REPORT R " 
						+"JOIN MEMBER M ON(R.RWRITER = M.USERID) "
						+"ORDER BY RNO DESC) P)) "

						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM NEXTREPORT "	
						+"WHERE RNUM =(SELECT RNUM "
						+"FROM NEXTREPORT "
						+"WHERE RNO =?) -1 ";	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				report = new ReportVo();
				report.setNo(rs.getInt("RNO"));
				report.setTitle(rs.getString("RTITLE"));
				report.setContent(rs.getString("RCONTENT"));
				report.setWriter(rs.getString("RWRITER"));
				report.setCount(rs.getInt("RCOUNT"));
				report.setWriteDate(rs.getDate("RDATE"));
				report.setName(rs.getString("USERNAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return report;
	}

	public ReportVo selectReportPre(Connection con, int reportNo) {
		ReportVo report = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTREPORT AS ( "
						+"SELECT RNUM,RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM REPORT R " 
						+"JOIN MEMBER M ON(R.RWRITER = M.USERID) "
						+"ORDER BY RNO DESC) P)) "

						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM NEXTREPORT "	
						+"WHERE RNUM =(SELECT RNUM "
						+"FROM NEXTREPORT "
						+"WHERE RNO =?) +1 ";	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				report = new ReportVo();
				report.setNo(rs.getInt("RNO"));
				report.setTitle(rs.getString("RTITLE"));
				report.setContent(rs.getString("RCONTENT"));
				report.setWriter(rs.getString("RWRITER"));
				report.setCount(rs.getInt("RCOUNT"));
				report.setWriteDate(rs.getDate("RDATE"));
				report.setName(rs.getString("USERNAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return report;
	}

	public int deleteReport(Connection con, int reportNo) {
		int result = 0;
		PreparedStatement pstmt =null;
		String query = "DELETE "
						+ "FROM REPORT "
						+ "WHERE RNO = ?";
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int updateReport(Connection con, ReportVo report) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE REPORT "
				       +"SET RTITLE = ?, RCONTENT = ? "
				       +"WHERE RNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, report.getTitle());
			pstmt.setString(2, report.getContent());
			pstmt.setInt(3, report.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int searchReportCount(Connection con, String keyword) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+"FROM REPORT " 
					+"WHERE RTITLE LIKE '%"+keyword+"%' "
					+"OR RCONTENT LIKE  '%"+keyword+"%' ";	
				
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

	public ArrayList<ReportVo> selectSearchReport(Connection con, int currentPage, int limit, String keyword) {
		ArrayList<ReportVo> list = new ArrayList<ReportVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM( "
						+"SELECT ROWNUM AS RNUM, P.* "
						+"FROM( "
						+"SELECT RNO, RTITLE, RCONTENT, RWRITER, RCOUNT, RDATE, USERNAME "
						+"FROM REPORT R " 
						+"JOIN MEMBER M ON(R.RWRITER = M.USERID) "
						+"ORDER BY RNO DESC) P) "
						+"WHERE RNUM BETWEEN ? AND ? "
						+"AND RTITLE LIKE '%'|| ? ||'%' "
						+"OR RCONTENT LIKE '%'|| ? ||'%' ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			pstmt.setString(4, keyword);
			
			rs = pstmt.executeQuery();
			
			ReportVo rv = null;
			while(rs.next()){
				rv = new ReportVo();
				rv.setNo(rs.getInt("RNO"));
				rv.setTitle(rs.getString("RTITLE"));
				rv.setContent(rs.getString("RCONTENT"));
				rv.setWriter(rs.getString("RWRITER"));
				rv.setName(rs.getString("USERNAME"));
				rv.setCount(rs.getInt("RCOUNT"));
				rv.setWriteDate(rs.getDate("RDATE"));
				
				list.add(rv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;	
	}

}
