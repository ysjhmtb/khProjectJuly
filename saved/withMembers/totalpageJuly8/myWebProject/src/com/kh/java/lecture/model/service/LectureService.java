package com.kh.java.lecture.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.lecture.model.dao.LectureDao;
import com.kh.java.lecture.model.vo.LectureVo;


public class LectureService {
	LectureDao lectureDao = new LectureDao();
	
	public List<LectureVo> getLectureList(){
		//커넥션을 맺는 역할 -> 서비스 
		//	-> 트랜젝션 관리를 해야 하기 때문에
		Connection con = JDBCTemplate.getConnection();
		ArrayList<LectureVo> list = lectureDao.selectLectureList(con);
		JDBCTemplate.close(con);
		return list;
	}
	
	
	public LectureVo updateLecture(String uckId){
		//1. 커넥션 생성
		Connection con = JDBCTemplate.getConnection();
		//2. dao 호출
		LectureVo result = lectureDao.updateLectureDAO(con, uckId);
		//3. 트랜젝션 처리
		if(result != null){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		//4. 자원 반납(close)
		JDBCTemplate.close(con);
		//5. 해당 결과 return
		return result;
	}
	
	public int writeLecture(LectureVo lecture) {
		//커넥션 생성
		Connection con = JDBCTemplate.getConnection();
		//비지니스 로직 호출
		int result = lectureDao.insertLecture(con, lecture);
		//트랜젝션 처리
		if(0 < result){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		//자원 반납(close)
		JDBCTemplate.close(con);
		//결과 반환
		return result;
	}
	
	public int removeLecture(String ckId) {
		//1. 커넥션 생성
		Connection con = JDBCTemplate.getConnection();
		//2. dao 호출
		int result = lectureDao.deleteLecture(con, ckId);
		//3. 트랜젝션 처리
		if(0 < result){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		//4. 자원 반납(close)
		JDBCTemplate.close(con);
		//5. 해당 결과 return
		return result;
	}
	
	public int changeLecture(LectureVo lecture) {
		//커넥션 생성
		Connection con = JDBCTemplate.getConnection();
		//비지니스 로직 호출
		int result = lectureDao.changeLectureDAO(con, lecture);
		//트랜젝션 처리
		if(0 < result){
			JDBCTemplate.commit(con);
		}else{
			JDBCTemplate.rollback(con);
		}
		//자원 반납(close)
		JDBCTemplate.close(con);
		//결과 반환
		return result;
	}
}
