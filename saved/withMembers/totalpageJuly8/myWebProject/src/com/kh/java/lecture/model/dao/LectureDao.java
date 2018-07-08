package com.kh.java.lecture.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.lecture.model.vo.LectureVo;


public class LectureDao {
Properties prop = new Properties();
	
	public ArrayList<LectureVo> selectLectureList(Connection con) {
		//커넥션을 맺는다
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<LectureVo> result = new ArrayList<LectureVo>();
		//쿼리 객체 생성
		try {
			stmt = con.createStatement();
			String query = "SELECT * FROM LECTURE";
			rs = stmt.executeQuery(query);
			//결과 처리(resultset)
			LectureVo temp = null;
			while(rs.next()){
				temp = new LectureVo();
				temp.setNum(rs.getInt("L_NUM"));
				temp.setTitle(rs.getString("L_TITLE"));
				temp.setContent(rs.getString("L_CONTENT"));
				temp.setName(rs.getString("L_NAME"));
				temp.setPlace(rs.getString("L_PLACE"));
				temp.setPeriod(rs.getString("L_PERIOD"));
				temp.setPayment(rs.getInt("L_PAYMENT"));
				temp.setPerson(rs.getInt("L_PERSON"));
				temp.setPhone(rs.getString("L_PHONE"));
				temp.setckId(rs.getString("L_CKID"));
				result.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//close
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	
	public int insertLecture(Connection con, LectureVo lecture) {
		int result = 0;
		Statement stmt = null;
		String query = "";
		try {
			//1. 쿼리 실행 객체 생성
			stmt = con.createStatement();
			//2. 쿼리 작성
			query = "INSERT INTO LECTURE(L_NUM, L_TITLE, L_CONTENT, L_NAME, L_PLACE, L_PERIOD, L_PAYMENT, L_PERSON, L_PHONE, L_CKID) " 
					+"VALUES (L_SEQ.NEXTVAL, '"+lecture.getTitle()+"', '" + lecture.getContent() + "', '" + lecture.getName() + 
					"', '" + lecture.getPlace() + "', '" + lecture.getPeriod() + "', " + lecture.getPayment() + ", " + lecture.getPerson()
					+ ", '" + lecture.getPhone() + "', '" + lecture.getckId() + "')";
					
			System.out.println("쿼리 : " + query);
			
			//3. 쿼리 실행
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//4. 자원 반납
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	
	
	public int deleteLecture(Connection con, String ckId) {
		int result = 0;
		Statement stmt = null;
		String query = "";
		try {
			//1. 쿼리 전송 객체 생성
			stmt = con.createStatement();
			//2. 실행 쿼리 작성
			query = "DELETE FROM LECTURE "
						+ "WHERE L_CKID = '" + ckId + "'";
			//3. 쿼리 실행
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//4. 자원 반납(close)
			JDBCTemplate.close(stmt);
		}
		//5. 결과 반환(return)
		return result;
	}
	
	public LectureVo updateLectureDAO(Connection con, String uckId) {
		Statement stmt = null;
		String query = "";
		ResultSet rs = null;
		LectureVo temp = null;
		
		try {
			//1. 쿼리 전송 객체 생성
			stmt = con.createStatement();
			//2. 실행 쿼리 작성
			query = "SELECT * FROM LECTURE "
						+ "WHERE L_CKID = '" + uckId + "'";
			//3. 쿼리 실행
			rs = stmt.executeQuery(query);
			
					while(rs.next()){
						temp = new LectureVo();
						temp.setNum(rs.getInt("L_NUM"));
						temp.setTitle(rs.getString("L_TITLE"));
						temp.setContent(rs.getString("L_CONTENT"));
						temp.setName(rs.getString("L_NAME"));
						temp.setPlace(rs.getString("L_PLACE"));
						temp.setPeriod(rs.getString("L_PERIOD"));
						temp.setPayment(rs.getInt("L_PAYMENT"));
						temp.setPerson(rs.getInt("L_PERSON"));
						temp.setPhone(rs.getString("L_PHONE"));
						temp.setckId(rs.getString("L_CKID"));
					
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//4. 자원 반납(close)
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		//5. 결과 반환(return)
		return temp;
	}
	
	
	
	public int changeLectureDAO(Connection con, LectureVo lecture) {
		int result = 0;
		Statement stmt = null;
		String query = "";
		try {
			//1. 쿼리 실행 객체 생성
			stmt = con.createStatement();
			//2. 쿼리 작성
			query = "UPDATE LECTURE SET L_NUM=L_SEQ.NEXTVAL, " + "L_TITLE='" + lecture.getTitle() + "', L_CONTENT='" +
			lecture.getContent() + "', L_NAME='" + lecture.getName() + "', L_PLACE='" + lecture.getPlace() + "', L_PERIOD='" + 
					lecture.getPeriod() + "', L_PAYMENT=" + lecture.getPayment()+", L_PERSON=" + lecture.getPerson() + 
					", L_PHONE='" + lecture.getPhone() + "', L_CKID='" + lecture.getckId() + "' WHERE L_CKID='" + lecture.getckId()+"'";
			
			//3. 쿼리 실행
			System.out.println("update query : " + query); 
		
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//4. 자원 반납
			JDBCTemplate.close(stmt);
		}
		return result;
	}
}
