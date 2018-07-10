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


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
	      
	      // 전송값 변수에 저장
	      String id = request.getParameter("userId");
	      String nick=request.getParameter("nick");
	      System.out.println(nick);

	      // 서비스 호출
	      MemberVo member = new MemberService().getMemberId(id);
	      RequestDispatcher view = null;
	      PrintWriter out = response.getWriter();
	      // 1. 아이디가 존재하지 않습니다.
	      if (null == member) {
	         request.setAttribute("id",id);
	         request.setAttribute("nick", nick);
	         view = request.getRequestDispatcher("/views/member/join.jsp");
	         view.forward(request, response);
	      }
	      else{
	         out.println("<script>alert('계정이 존재합니다.로그인합니다.'); </script>.");
	         HttpSession session = request.getSession();
	         session.setAttribute("user", member);
	         System.out.println(member.getM_NAME());
	         System.out.println(member.getM_CATEGORY());
	         response.sendRedirect("indexMarket.jsp");
	      }
	}

}
