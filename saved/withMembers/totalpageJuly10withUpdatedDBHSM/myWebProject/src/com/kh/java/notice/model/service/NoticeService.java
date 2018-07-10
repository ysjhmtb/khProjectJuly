package com.kh.java.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.notice.model.dao.NoticeDao;
import com.kh.java.notice.model.vo.NoticeVo;

public class NoticeService {

	public int selectNoticeCount() {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new NoticeDao().selectNoticeTotalCount(con);
		
		JDBCTemplate.close(con);
		return listCount;
	}

	public ArrayList<NoticeVo> selectNoticeList(int currentPage, int limit) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<NoticeVo> list= new NoticeDao().selectNoticeList(con,currentPage, limit);
		
		JDBCTemplate.close(con);
		return list;
		
	}

	public NoticeVo selectNoticeDeatil(int noticeNo) {
		Connection con = JDBCTemplate.getConnection();
		
		NoticeVo notice =null;
		notice = new NoticeDao().selectNoticeDetail(con,noticeNo);
		
		if(notice!=null){
			int result = new NoticeDao().updateNoticeCount(con,noticeNo);
			if(result>0){
				JDBCTemplate.commit(con);
			}else{
				JDBCTemplate.rollback(con);
			}
		}
		notice = new NoticeDao().selectNoticeDetail(con,noticeNo);
		
		JDBCTemplate.close(con);
		
		return notice;
	}

	public NoticeVo selectNoticeNext(int noticeNo) {
		Connection con = JDBCTemplate.getConnection();
		
		NoticeVo notice = new NoticeDao().selectNoticeNext(con,noticeNo);
		
		
		JDBCTemplate.close(con);
		return notice;
	}

	public NoticeVo selectNoicePre(int noticeNo) {
		Connection con = JDBCTemplate.getConnection();
		
		NoticeVo notice = new NoticeDao().selectNoticePre(con,noticeNo);
		
		
		JDBCTemplate.close(con);
		return notice;
	}

	public int deleteNotice(int noticeNo) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNotice(con,noticeNo);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public int insertNotice(String title, String content,String writer) {
		Connection con = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(con,title, content,writer);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public NoticeVo selectNoticeForm(int noticeNo) {
		Connection con = JDBCTemplate.getConnection();
		
		NoticeVo notice = new NoticeDao().selectNoticeDetail(con,noticeNo);
		
		JDBCTemplate.close(con);
		
		return notice;
	}

	public int updateNotice(NoticeVo notice) {
		Connection con =JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(con,notice);
		
		if(result>0){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		
		JDBCTemplate.close(con);
		
		return result;
	}

	public ArrayList<NoticeVo> selectSearchNoticeList(int currentPage, int limit, String keyword) {
		Connection con = JDBCTemplate.getConnection();
		
		ArrayList<NoticeVo> list= new NoticeDao().selectSearchNotice(con,currentPage, limit,keyword);
		
		JDBCTemplate.close(con);
		return list;
	}

	public int searchNoticeCount(String keyword) {
		Connection con = JDBCTemplate.getConnection();
		
		int listCount = new NoticeDao().searchNoticeCount(con,keyword);
	
		
		
		JDBCTemplate.close(con);
		return listCount;
	}

}
