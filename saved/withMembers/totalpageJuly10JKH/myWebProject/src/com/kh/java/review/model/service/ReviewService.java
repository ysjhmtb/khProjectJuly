package com.kh.java.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.map.model.vo.MapVo;
import com.kh.java.report.model.dao.ReportDao;
import com.kh.java.report.model.vo.ReportVo;
import com.kh.java.review.model.dao.ReviewDao;
import com.kh.java.review.model.vo.ReviewVo;

public class ReviewService {

	public int selectReviewCount() {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new ReviewDao().selectReviewTotalCount(con);
		
		JDBCTemplate.close(con);
		
		return listCount;
	}

	public ArrayList<MapVo> selectReviewMarketList(int currentPage, int limit) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<MapVo> list= new ReviewDao().selectReviewMarketList(con,currentPage, limit);
		
		JDBCTemplate.close(con);
		return list;
	}

	public int selectReviewMarektCount(int marketNo) {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new ReviewDao().selectReviewMarketTotalCount(con,marketNo);
		
		JDBCTemplate.close(con);
		
		return listCount;
	}

	public ArrayList<ReviewVo> selectReviewList(int currentPage, int limit, int marketNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<ReviewVo> list= new ReviewDao().selectReviewList(con,currentPage, limit,marketNo);
		
		JDBCTemplate.close(con);
		return list;
	}

	public ReviewVo selectReviewDeatil(int reviewNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReviewVo review =null;
		review = new ReviewDao().selectReviewDetail(con,reviewNo);
		
		if(review!=null){
			int result = new ReviewDao().updateReviewCount(con,reviewNo);
			if(result>0){
				JDBCTemplate.commit(con);
			}else{
				JDBCTemplate.rollback(con);
			}
		}
		review = new ReviewDao().selectReviewDetail(con,reviewNo);
		
		JDBCTemplate.close(con);
		
		return review;
	}

	public int deleteReview(int reviewNo) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().deleteReview(con,reviewNo);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public ReviewVo selectReviewNext(int reviewNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReviewVo review = new ReviewDao().selectReviewNext(con,reviewNo);
		
		return review;
	}

	public ReviewVo selectReviewPre(int reviewNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReviewVo review = new ReviewDao().selectReviewPre(con,reviewNo);
		
		return review;
	}

	public int insertMarketReview(ReviewVo review) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().insertMarketReview(con,review);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public ReviewVo selectReviewForm(int reviewNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReviewVo review = new ReviewDao().selectReviewDetail(con, reviewNo);
		
		JDBCTemplate.close(con);
		
		return review;
	}

	public int updateReview(ReviewVo review) {
		Connection con =JDBCTemplate.getConnection();
		
		int result = new ReviewDao().updateReview(con,review);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public int searchReviewCount(String keyword,int marketNo) {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new ReviewDao().searchReviewCount(con,keyword,marketNo);
	
		JDBCTemplate.close(con);
		
		return listCount;
	}

	public ArrayList<ReviewVo> selectSearchReviewList(int currentPage, int limit, String keyword, int marketNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<ReviewVo> list= new ReviewDao().selectSearchReview(con,currentPage, limit,keyword,marketNo);
		
		JDBCTemplate.close(con);
		return list;
	}

}
