package com.kh.java.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.lecture.model.service.LectureService;

@WebServlet("/deleteLecture.do")
public class DeleteLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteLectureServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ckId = request.getParameter("ckId");
		String temp = "";
		if(ckId == temp){
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<script language='javascript'>");
			out.println("alert('아이디가 입력되지 않았거나 삭제를 취소하셨습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.println("</html>");
			out.close();
			return;
		}
		
		int result = new LectureService().removeLecture(ckId);
		RequestDispatcher view = null;
		
		if(0 < result){
			view = request.getRequestDispatcher("/indexLecture.jsp");
			request.setAttribute("list", new LectureService().getLectureList());
		}else{
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<script language='javascript'>");
			out.println("alert('강의삭제가 정상적으로 처리되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.println("</html>");
			out.close();
			return;
		}
		view.forward(request, response);
	
	}

}
