package com.kh.java.member.comtroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.member.model.service.MemberService;
import com.kh.java.member.model.vo.MemberVo;


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   request.setCharacterEncoding("utf-8");
		      response.setContentType("text/html; charset=UTF-8");
		      
		      String Mid = request.getParameter("id");
		      String Mpw = request.getParameter("pw");
		      String Mname = request.getParameter("name");
		      char Mgender = request.getParameter("gender").charAt(0);
		      int Mage = Integer.parseInt(request.getParameter("age"));
		      String Memail = request.getParameter("id");
		      String Mphone = request.getParameter("phone1") + "-"
		                 + request.getParameter("phone2") + "-"
		                 + request.getParameter("phone3");
		      String Maddress = request.getParameter( "zipcode") + ", "
		            + request.getParameter("address1") + ", "
		            + request.getParameter("address2");
		      String Mcategory=(request.getParameter("kind").equals("C"))?"일반회원":"작가";
		   
		      
		      
		      MemberVo member = new MemberVo(Mid, Mpw, Mname, Mgender, Memail, Mphone, Maddress, Mcategory,Mage);
		      
		      //서비스(비지니스 로직) 호출
		      MemberService ms = new MemberService();
		      RequestDispatcher view = null;
		      //아이디 중복 체크 확인
		      if(ms.getMemberId(Mid) != null){
		         //아이디 중복
		         request.setAttribute("msg", "회원 가입 중 아이디가 중복 되었습니다.");
		         view 
		            = request.getRequestDispatcher("/views/common/errorPage.jsp");
		         view.forward(request, response);
		         return;
		      } 
		      
		      int result = ms.joinMember(member);
		      if(0 < result){
		         System.out.println("회원가입 완료!!");
		         response.sendRedirect("indexMarket.jsp");
		      }else{
		         System.out.println("회원가입 실패!!");
		         request.setAttribute("msg", "회원 가입 중 에러가 발생하였습니다.");
		         view 
		            = request.getRequestDispatcher("/views/common/errorPage.jsp");
		         view.forward(request, response);
		      }
	}

}
