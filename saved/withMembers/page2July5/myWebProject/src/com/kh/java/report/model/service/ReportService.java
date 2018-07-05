package com.kh.java.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.notice.model.dao.NoticeDao;
import com.kh.java.notice.model.vo.NoticeVo;
import com.kh.java.report.model.dao.ReportDao;
import com.kh.java.report.model.vo.ReportVo;

public class ReportService {

	public int insertMarketReport(String title, String content, String writer) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new ReportDao().insertMarketReport(con,title, content,writer);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public int selectReportCount() {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new ReportDao().selectReportTotalCount(con);
		
		JDBCTemplate.close(con);
		return listCount;
	}

	public ArrayList<ReportVo> selectReportList(int currentPage, int limit) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<ReportVo> list= new ReportDao().selectReportList(con,currentPage, limit);
		
		JDBCTemplate.close(con);
		return list;
	}

	public ReportVo selectReportDeatil(int reportNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReportVo report =null;
		report = new ReportDao().selectReportDetail(con,reportNo);
		
		if(report!=null){
			int result = new ReportDao().updateReportCount(con,reportNo);
			if(result>0){
				JDBCTemplate.commit(con);
			}else{
				JDBCTemplate.rollback(con);
			}
		}
		report = new ReportDao().selectReportDetail(con,reportNo);
		
		JDBCTemplate.close(con);
		
		return report;
	}

	public ReportVo selectReportNext(int reportNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReportVo report = new ReportDao().selectReportNext(con,reportNo);
		
		return report;
	}

	public ReportVo selectReportPre(int reportNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReportVo report = new ReportDao().selectReportPre(con,reportNo);
		
		return report;
	}

	public int deleteReport(int reportNo) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new ReportDao().deleteReport(con,reportNo);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public ReportVo selectReportForm(int reportNo) {
		Connection con = JDBCTemplate.getConnection();
		
		ReportVo report = new ReportDao().selectReportDetail(con, reportNo);
		
		JDBCTemplate.close(con);
		
		return report;
	}

	public int updateReport(ReportVo report) {
		Connection con =JDBCTemplate.getConnection();
		
		int result = new ReportDao().updateReport(con,report);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public int searchReportCount(String keyword) {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new ReportDao().searchReportCount(con,keyword);
	
		JDBCTemplate.close(con);
		
		return listCount;
	}

	public ArrayList<ReportVo> selectSearchReportList(int currentPage, int limit, String keyword) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<ReportVo> list= new ReportDao().selectSearchReport(con,currentPage, limit,keyword);
		
		JDBCTemplate.close(con);
		return list;
		
	}

}
