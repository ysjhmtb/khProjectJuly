package com.kh.java.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.notice.model.service.NoticeService;

@WebServlet("/noticeWriter.do")
public class WriterNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriterNoticeServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		int result = new NoticeService().insertNotice(title,content,writer);
		
		if(result>0){
			response.sendRedirect("/mwp/noticeList.do");
		}else{
			System.out.println("게시물 작성중 오류 발생");
		}
	}

}
