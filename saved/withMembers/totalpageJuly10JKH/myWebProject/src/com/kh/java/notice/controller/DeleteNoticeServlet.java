package com.kh.java.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.notice.model.service.NoticeService;

@WebServlet("/noticeDelete.do")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteNoticeServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int NoticeNo = Integer.parseInt(request.getParameter("NoticeNo"));
		
		int result = new NoticeService().deleteNotice(NoticeNo);
		
		if(result>0){
			response.sendRedirect("/mwp/noticeList.do?currentPage="+1);
		}else{
			System.out.println("공지사항 삭제도중 실패");
		}
		
		
	}

}
