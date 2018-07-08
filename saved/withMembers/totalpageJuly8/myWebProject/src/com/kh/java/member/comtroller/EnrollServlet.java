package com.kh.java.member.comtroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.member.model.service.MemberService;


@WebServlet("/enroll.do")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
	      
	      
	      
	      int mno = Integer.parseInt(request.getParameter("memberMno"));
	      char check = request.getParameter("boolean").charAt(0);
	      System.out.println(mno + "mno");
	      System.out.println(check);
	      if (check == 'T') {
	         int result = new MemberService().category(mno);
	         RequestDispatcher view = null;
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("location.href='/mwp/views/admin/member.jsp'");
	         out.println("</script>");
	         out.close();

	      } else {
	         int result = new MemberService().category2(mno);
	         RequestDispatcher view = null;
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("location.href='/views/admin/member.jsp'");
	         out.println("</script>");
	         out.close();

	      }
		
	}

}
