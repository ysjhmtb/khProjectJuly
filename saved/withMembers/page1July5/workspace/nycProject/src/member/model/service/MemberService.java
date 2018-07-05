package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.MemberVo;
import product.model.dao.ProductDao;
import product.model.vo.BuyVo;

public class MemberService {
   
   public MemberVo login(String id, String pwd){
//      MemberVo result = null;
//      result = new MemberDao().login(id, pwd);
//      return result;
      //selectMemberList
      return new MemberDao().login(id, pwd);
   }

   public MemberVo getMemberId(String id) {
      // TODO Auto-generated method stub
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
   
   //트랜젝션 
   //커넥션 관리, 트렌젝션 처리(commit, rollback)
   //게시글
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   






