package com.kh.java.member.comtroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.java.member.model.service.MemberService;
import com.kh.java.member.model.vo.MemberVo;


@WebServlet("/login2.do")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet2() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");

	      // 전송값 변수에 저장
	      String id = request.getParameter("userid");
	      String pwd = request.getParameter("password");

	      // 서비스 호출
	      MemberVo member = new MemberService().getMemberId(id);
	      RequestDispatcher view = null;
	      PrintWriter out = response.getWriter();
	      // 1. 아이디가 존재하지 않습니다.
	      if (null == member) {
	         out.println("<script>");
	         out.println("alert('아이디가 존재하지않거나 잘못입력하셨습니다.');  location.href='/mwp/views/member/login.jsp'");
	         out.println("</script>");
	         out.close();
	      }else {

	         if(member.getM_PW().equals(pwd)){
	        	 HttpSession session = request.getSession();
	        	 session.setAttribute("user", member);
	        	 System.out.println("확인");
	        	 
	        	 if(id.equals("admin")){
	             	 response.sendRedirect("/mwp/views/admin/member.jsp");
	              } else{
	            	  response.sendRedirect("indexMarket.jsp");
	              }
	         }else{
	        	 out.println("<script>");
	        	 out.println("alert('비밀번호가 틀렸습니다.'); location.href='/mwp/views/member/login.jsp' ");
	        	 out.println("</script>");
	        	 out.close();
	         }
	
	      }
	}
}


