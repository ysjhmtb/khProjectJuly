package com.kh.java.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.java.common.JDBCTemplate;
import com.kh.java.member.model.vo.MemberVo;


public class MemberDao {	
	 public MemberVo login(String id, String pwd){
	      MemberVo result = null;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      
	      try {
	         //1. 커넥션 생성
	         //실행 할 jdbc 라이브러리 등록
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         //접속 정보 설정
	         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:59161:XE",
	                                          "nyc",
	                                          "nyc");
	         //2. 쿼리 실행 객체 생성
	         stmt = con.createStatement();
	         
	         //쿼리 작성시 주의 사항 
	         //- 스트링 값 비교 시 따옴표를 추가하는 경우 주의
	         String query = "SELECT * FROM MEMBER "
	               + " WHERE USERID = '" + id + "' " ;  // where userid = 'admin' 
	               
	         System.out.println(query);
	         //3. 쿼리 실행
	         rs = stmt.executeQuery(query);
	         
	         //4. 실행 결과를 객체로 변환
	         while(rs.next()){
	            result = new MemberVo();
	            result.setM_NAME(rs.getString("M_NAME"));
	            result.setMNO(rs.getInt("MNO"));
	            System.out.println(rs.getInt("MNO")+"mno");
	            result.setM_ID(rs.getString("M_ID"));
	            result.setM_PHONE(rs.getString("M_PHONE"));
	            result.setM_ADDRESS(rs.getString("M_ADDRESS"));
	         }
	         
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         //자원 반납
	         try {
	            rs.close();
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }
	   
	   public MemberVo selectMemberId(String id){
	      MemberVo result = null;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      
	      try {
	         //1. 커넥션 생성
	         //실행 할 jdbc 라이브러리 등록
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         //접속 정보 설정
	         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:59161:XE",
	                                          "nyc",
	                                          "nyc");
	         //2. 쿼리 실행 객체 생성
	         stmt = con.createStatement();
	         
	         //쿼리 작성시 주의 사항 
	         //- 스트링 값 비교 시 따옴표를 추가하는 경우 주의
	         String query = "SELECT * FROM MEMBER "
	               + " WHERE M_ID = '" + id + "' ";   // where userid = 'admin' 
	               
	         System.out.println(query);
	         //3. 쿼리 실행
	         rs = stmt.executeQuery(query);
	         
	         //4. 실행 결과를 객체로 변환
	         while(rs.next()){
	            result = new MemberVo();
	            result.setM_NAME(rs.getString("M_NAME"));
	            result.setM_CATEGORY(rs.getString("M_CATEGORY"));
	            result.setMNO(rs.getInt("MNO"));
	            System.out.println(rs.getInt("MNO")+"mno");
	            result.setM_ID(rs.getString("M_ID"));
	            result.setM_PHONE(rs.getString("M_PHONE"));
	            result.setM_ADDRESS(rs.getString("M_ADDRESS"));
	            //수정
	            result.setM_PW(rs.getString("M_PW"));
	         }
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         //자원 반납
	         try {
	            rs.close();
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }
	   
	   public int insertMember(MemberVo m){
	      int result = 0;
	      Connection con = null;
	      Statement stmt = null;
	         
	      //1. 커넥션을 맺는다
	   
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:59161:XE","nyc","nyc");
	         stmt = con.createStatement();
	         //2. 쿼리 객체를 생성한다.
	      
	         //실행할 쿼리 작성
	         String query = "Insert into MEMBER values (SEQ_MNO.NEXTVAL,'"
	               + m.getM_ID() + "', '"  // '값', '값'
	               + m.getM_PW() + "', '"
	               + m.getM_NAME() + "', '"
	               + m.getM_GENDER() + "', "
	               + m.getM_age() + ", '"
	               + m.getM_PHONE() + "', '"
	               + m.getM_ADDRESS() + "', '"
	               + m.getM_CATEGORY() + "', sysdate)";
	         System.out.println("insert query : " + query);
	         //3. 쿼리 실행 결과를 가져온다.
	         //executeQuery -> resultSet(표 형식의 데이터)
	         //                     -> select 문 호출시 사용
	         //executeUpdate -> int(수정/추가/삭제 된 행의 수)
	         //                     -> 추가/수정/삭제 시 사용
	         result = stmt.executeUpdate(query);
	         
	         //dml의 경우 트랜잭션 처리 필요
	         //result - 0이 아닐때 commit
	         //result - 0일때 rollback
	         if(0 < result){
	            con.commit();
	         }else{
	            con.rollback();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally{
	         try {
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }
	   
	   public ArrayList<MemberVo> selectAllMemberId(){
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      ArrayList<MemberVo> list = new ArrayList<MemberVo>();
	      try {
	         //1. 커넥션 생성
	         //실행 할 jdbc 라이브러리 등록
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         //접속 정보 설정
	         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:59161:XE",
	                                          "nyc",
	                                          "nyc");
	         //2. 쿼리 실행 객체 생성
	         stmt = con.createStatement();
	         
	         //쿼리 작성시 주의 사항 
	         //- 스트링 값 비교 시 따옴표를 추가하는 경우 주의
	         String query = "SELECT * FROM MEMBER "; 
	               
	         System.out.println(query);
	         //3. 쿼리 실행
	         rs = stmt.executeQuery(query);
	         //4. 실행 결과를 객체로 변환
	         while(rs.next()){
	            MemberVo mv = new MemberVo();
	            mv.setM_NAME(rs.getString("M_NAME"));
	            mv.setM_CATEGORY(rs.getString("M_CATEGORY"));
	            mv.setMNO(rs.getInt("MNO"));
	            mv.setM_ID(rs.getString("M_ID"));
	            mv.setM_PHONE(rs.getString("M_PHONE"));
	            mv.setM_ADDRESS(rs.getString("M_ADDRESS"));
	            mv.setM_age(Integer.parseInt(rs.getString("M_AGE")));
	            mv.setM_GENDER(rs.getString("M_GENDER").charAt(0));
	            mv.setENTERDATE(rs.getDate("M_ENTERDATE"));
	            list.add(mv);
	         }
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         //자원 반납
	         try {
	            rs.close();
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }
	   public int updateCategory(int mno){
	      int result = -1;
	      Connection con = null;
	      Statement stmt = null;
	      String query = null;
	      //1. 데이터베이스 커넥션 생성
	      con = JDBCTemplate.getConnection();
	      //2. 쿼리 전송 객체 생성
	      try {
	         stmt = con.createStatement();
	         //3. 쿼리 작성
	         query = "UPDATE MEMBER "
	               + "SET M_CATEGORY = '" +"작가"+"'"
	               + " WHERE MNO ="+ mno ;
	         System.out.println("query : " + query);
	         result = stmt.executeUpdate(query);
	         
	         if(0 < result){
	            con.commit();
	         }else{
	            con.rollback();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         //5. 자원 반납(close처리)
	         try {
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }
	   public int updateCategory2(int mno){
	      int result = -1;
	      Connection con = null;
	      Statement stmt = null;
	      String query = null;
	      //1. 데이터베이스 커넥션 생성
	      con = JDBCTemplate.getConnection();
	      //2. 쿼리 전송 객체 생성
	      try {
	         stmt = con.createStatement();
	         //3. 쿼리 작성
	         query = "UPDATE MEMBER "
	               + "SET M_CATEGORY = '" +"일반회원"+"'"
	               + " WHERE MNO ="+ mno ;
	         System.out.println("query : " + query);
	         result = stmt.executeUpdate(query);
	         
	         if(0 < result){
	            con.commit();
	         }else{
	            con.rollback();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         //5. 자원 반납(close처리)
	         try {
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }

}
