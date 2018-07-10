package com.kh.java.review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.vo.MapVo;
import com.kh.java.report.model.vo.ReportVo;
import com.kh.java.review.model.vo.ReviewVo;

public class ReviewDao {

	public int selectReviewTotalCount(Connection con) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+ "FROM MARLOC ";
				
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

	public ArrayList<MapVo> selectReviewMarketList(Connection con, int currentPage, int limit) {
		ArrayList<MapVo> list = new ArrayList<MapVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "WITH MARCOUNT AS( "
						+"SELECT R.MARNO,COUNT(*) AS REVIEWCOUNTR "
						+"FROM REVIEW R "
						+"JOIN MARLOC M ON(R.MARNO = M.MARNO) "
						+"GROUP BY R.MARNO) "

						+"SELECT RNUM,MARNAME, MARNO, STARTDAY, ENDDAY , CHANGE_NAME ,REVIEWCOUNTR "
						+"FROM( "  	
						+"SELECT ROWNUM AS RNUM, P.* " 
						+"FROM( " 
						+"SELECT M.MARNAME, M.MARNO, M.STARTDAY, M.ENDDAY , A.CHANGE_NAME ,C.REVIEWCOUNTR "
						+"FROM MARLOC M " 
						+"JOIN ATTACHMENTMAP A ON(M.MARNO = A.MARNO) " 
						+"JOIN MARCOUNT C ON(C.MARNO=M.MARNO) "
						+"ORDER BY MARNO DESC) P) " 
						+"WHERE RNUM BETWEEN ? AND ? "; 
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			MapVo mv = null;
			while(rs.next()){
				mv = new MapVo();
				mv.setMarketName(rs.getString("MARNAME"));
				mv.setMarketNo(rs.getInt("MARNO"));
				mv.setStartDay(rs.getDate("STARTDAY"));
				mv.setEndDay(rs.getDate("ENDDAY"));
				mv.setFileName(rs.getString("CHANGE_NAME"));
				mv.setReviewTotalCount(rs.getInt("REVIEWCOUNTR"));
				
				list.add(mv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int selectReviewMarketTotalCount(Connection con, int marketNo) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT "
					+ "FROM REVIEW "
					+ "WHERE MARNO ="+marketNo;
				
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

	public ArrayList<ReviewVo> selectReviewList(Connection con, int currentPage, int limit, int marketNo) {
		ArrayList<ReviewVo> list = new ArrayList<ReviewVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT VNO, MARNO, VTITLE,VCONTENT, VWRITER, VCOUNT,VDATE, M_NAME ,MARNAME "
							+"FROM( " 
							+"SELECT ROWNUM AS RNUM, P.* "  
							+"FROM( "  
							+"SELECT R.VNO, M.MARNO, R.VTITLE,R.VCONTENT, R.VWRITER, R.VCOUNT, R.VDATE,MEMBER.M_NAME,M.MARNAME " 
							+"FROM REVIEW R " 
							+"JOIN MARLOC M ON(R.MARNO = M.MARNO) "  
							+"JOIN MEMBER ON(R.VWRITER = MEMBER.M_ID) " 
							+"WHERE M.MARNO = ? " 
							+"ORDER BY VNO DESC) P) "  
							+"WHERE RNUM BETWEEN ? AND ? ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, marketNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			ReviewVo rv = null;
			while(rs.next()){
				rv = new ReviewVo();
				rv.setNo(rs.getInt("VNO"));
				rv.setTitle(rs.getString("VTITLE"));
				rv.setContent(rs.getString("VCONTENT"));
				rv.setWriter(rs.getString("VWRITER"));
				rv.setName(rs.getString("M_NAME"));
				rv.setCount(rs.getInt("VCOUNT"));
				rv.setWriteDate(rs.getDate("VDATE"));
				rv.setMarketNo(rs.getInt("MARNO"));
				rv.setMarketTitle(rs.getString("MARNAME"));
				
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

	public int updateReviewCount(Connection con, int reviewNo) {
		int result = 0;
		Statement stmt =null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "UPDATE REVIEW "
					+"SET VCOUNT = VCOUNT +1 "
					+"WHERE VNO = " +reviewNo;
			
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(stmt);
		}
		
		return result;
	}


	public ReviewVo selectReviewDetail(Connection con, int reviewNo) {
		ReviewVo review = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME "
						+"FROM REVIEW R "
						+"JOIN MEMBER M ON(R.VWRITER = M.M_ID) "
						+"WHERE VNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				review = new ReviewVo();
				review.setNo(rs.getInt("VNO"));
				review.setTitle(rs.getString("VTITLE"));
				review.setContent(rs.getString("VCONTENT"));
				review.setWriter(rs.getString("VWRITER"));
				review.setCount(rs.getInt("VCOUNT"));
				review.setWriteDate(rs.getDate("VDATE"));
				review.setName(rs.getString("M_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return review;
	}

	public int deleteReview(Connection con, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt =null;
		String query = "DELETE "
						+ "FROM REVIEW "
						+ "WHERE VNO = ?";
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	
	}

	public ReviewVo selectReviewNext(Connection con, int reviewNo) {
		ReviewVo review = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTREVIEW AS ( "
						+"SELECT RNUM,VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME,MARNO "
						+"FROM( " 
						+"SELECT ROWNUM AS RNUM, P.* " 
						+"FROM( " 
						+"SELECT VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME ,R.MARNO "
						+"FROM REVIEW R " 
						+"JOIN MEMBER M ON(R.VWRITER = M.M_ID) "
						+"JOIN MARLOC L ON(R.MARNO = L.MARNO) "
						+"ORDER BY VNO DESC) P)) " 

						+"SELECT VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME,MARNO "
						+"FROM NEXTREVIEW " 
						+"WHERE RNUM =(SELECT RNUM " 
						+"FROM NEXTREVIEW " 
						+"WHERE VNO =?) -1 ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				review = new ReviewVo();
				review.setNo(rs.getInt("VNO"));
				review.setTitle(rs.getString("VTITLE"));
				review.setContent(rs.getString("VCONTENT"));
				review.setWriter(rs.getString("VWRITER"));
				review.setCount(rs.getInt("VCOUNT"));
				review.setWriteDate(rs.getDate("VDATE"));
				review.setName(rs.getString("M_NAME"));
				review.setMarketNo(rs.getInt("MARNO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return review;
	}

	public ReviewVo selectReviewPre(Connection con, int reviewNo) {
		ReviewVo review = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "WITH NEXTREVIEW AS ( "
						+"SELECT RNUM,VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME,MARNO "
						+"FROM( " 
						+"SELECT ROWNUM AS RNUM, P.* " 
						+"FROM( " 
						+"SELECT VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME ,R.MARNO "
						+"FROM REVIEW R " 
						+"JOIN MEMBER M ON(R.VWRITER = M.M_ID) "
						+"JOIN MARLOC L ON(R.MARNO = L.MARNO) "
						+"ORDER BY VNO DESC) P)) " 
		
						+"SELECT VNO, VTITLE, VCONTENT, VWRITER, VCOUNT, VDATE, M_NAME,MARNO "
						+"FROM NEXTREVIEW " 
						+"WHERE RNUM =(SELECT RNUM " 
						+"FROM NEXTREVIEW " 
						+"WHERE VNO =?) +1 ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				review = new ReviewVo();
				review.setNo(rs.getInt("VNO"));
				review.setTitle(rs.getString("VTITLE"));
				review.setContent(rs.getString("VCONTENT"));
				review.setWriter(rs.getString("VWRITER"));
				review.setCount(rs.getInt("VCOUNT"));
				review.setWriteDate(rs.getDate("VDATE"));
				review.setName(rs.getString("M_NAME"));
				review.setMarketNo(rs.getInt("MARNO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return review;
	}

	public int insertMarketReview(Connection con, ReviewVo review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REVIEW VALUES( " 
				+"SEQ_REVIEW.NEXTVAL, ?, ?, ?, ?,DEFAULT, DEFAULT " 
				+")"; 
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, review.getMarketNo());
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getContent());
			pstmt.setString(4, review.getWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int updateReview(Connection con, ReviewVo review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE REVIEW "
				       +"SET VTITLE = ?, VCONTENT = ? "
				       +"WHERE VNO = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setInt(3, review.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int searchReviewCount(Connection con, String keyword, int marketNo) {
		int result = -1;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			stmt = con.createStatement();
			query = "SELECT COUNT(*) AS LISTCOUNT " 
					+"FROM REVIEW " 
					+"WHERE MARNO = "+marketNo+" "
					+"AND (VTITLE LIKE '%"+keyword+"%' " 
					+"OR VCONTENT LIKE  '%"+keyword+"%') ";	
				
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

	public ArrayList<ReviewVo> selectSearchReview(Connection con, int currentPage, int limit, String keyword,
			int marketNo) {
		ArrayList<ReviewVo> list = new ArrayList<ReviewVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT VNO, MARNO, VTITLE,VCONTENT, VWRITER, VCOUNT,VDATE, M_NAME ,MARNAME "
						+"FROM( " 
						+"SELECT ROWNUM AS RNUM, P.* " 
						+"FROM( " 
						+"SELECT R.VNO, M.MARNO, R.VTITLE,R.VCONTENT, R.VWRITER, R.VCOUNT, R.VDATE,MEMBER.M_NAME,M.MARNAME " 
						+"FROM REVIEW R "  
						+"JOIN MARLOC M ON(R.MARNO = M.MARNO) " 
						+"JOIN MEMBER ON(R.VWRITER = MEMBER.M_ID) "
						+"WHERE M.MARNO = ? "
						+"ORDER BY VNO DESC) P) " 
						+"WHERE RNUM BETWEEN ? AND ? "
						+"AND VTITLE LIKE '%'|| ? ||'%' "
						+"OR VCONTENT LIKE '%'|| ? ||'%' ";
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, marketNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, keyword);
			pstmt.setString(5, keyword);
			
			rs = pstmt.executeQuery();
			
			ReviewVo rv = null;
			while(rs.next()){
				rv = new ReviewVo();
				rv.setNo(rs.getInt("VNO"));
				rv.setTitle(rs.getString("VTITLE"));
				rv.setContent(rs.getString("VCONTENT"));
				rv.setWriter(rs.getString("VWRITER"));
				rv.setName(rs.getString("M_NAME"));
				rv.setCount(rs.getInt("VCOUNT"));
				rv.setWriteDate(rs.getDate("VDATE"));
				rv.setMarketNo(rs.getInt("MARNO"));
				rv.setMarketTitle(rs.getString("MARNAME"));
				
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
