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
import com.kh.java.lecture.model.vo.LectureVo;

@WebServlet("/updateLecture.do")
public class UpdateLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateLectureServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uckId = request.getParameter("uckId");
		String temp = "";
		LectureVo lecture = new LectureService().updateLecture(uckId);
		System.out.println("너의 정체는 뭐냐 :" + uckId);
		if(uckId == temp){
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<script language='javascript'>");
			out.println("alert('강의수정이 정상적으로 처리되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.println("</html>");
			out.close();
			System.out.println("첫번째 update 코스");
			return;
		}
	
	RequestDispatcher view = null;
	if(lecture != null){
		request.setAttribute("lecture", lecture);
		view = request.getRequestDispatcher("/mwp/views/lecture/updateLecture.jsp");
	}else{
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<script language='javascript'>");
		out.println("alert('강의수정이 정상적으로 처리되지 않았습니다.');");
		out.println("history.back();");
		out.println("</script>");
		out.println("</html>");
		out.close();
		System.out.println("두번째 update 코스 : DB에 없는값 조회한 경우");
	}
	view.forward(request, response);
	
	
	}

}
