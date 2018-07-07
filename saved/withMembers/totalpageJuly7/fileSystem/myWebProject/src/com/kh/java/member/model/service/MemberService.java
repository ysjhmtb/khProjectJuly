package com.kh.java.member.model.service;

import java.util.ArrayList;

import com.kh.java.member.model.dao.MemberDao;
import com.kh.java.member.model.vo.MemberVo;


public class MemberService {
	 public MemberVo login(String id, String pwd){
	      //selectMemberList
	      return new MemberDao().login(id, pwd);
	   }

	   public MemberVo getMemberId(String id) {
	      return new MemberDao().selectMemberId(id);
	   }

	   public int joinMember(MemberVo m){
	      return new MemberDao().insertMember(m);
	   }
	   public ArrayList<MemberVo>  getAllmember(){
	      ArrayList<MemberVo> list = null;
	      
	      list = new MemberDao().selectAllMemberId();
	      
	      
	      return list;
	   }
	   public int category(int  mno){
	      
	      return new MemberDao().updateCategory(mno);
	      
	      
	   }
	   public int category2(int  mno){
	      
	      return new MemberDao().updateCategory2(mno);
	      
	      
	   }
}
