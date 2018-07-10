package com.kh.java.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.notice.model.service.NoticeService;
import com.kh.java.notice.model.vo.NoticeVo;

@WebServlet("/noticeUpdate.do")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String writer = request.getParameter("writer");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		NoticeVo notice = new NoticeVo();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setWriter(writer);
		notice.setNo(noticeNo);
		
		int result = new NoticeService().updateNotice(notice);
		
		if(result>0){
			response.sendRedirect("/mwp/noticeDetail.do?noticeNo="+noticeNo+"&currentPage="+currentPage);
		}else{			
			System.out.println("공지사항 수정하던중 오류 발생");
		}
	
	}

}
