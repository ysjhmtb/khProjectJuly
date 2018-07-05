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

@WebServlet("/noticeDetail.do")
public class SelectNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
																
		
		NoticeVo notice = new NoticeService().selectNoticeDeatil(noticeNo);
		NoticeVo noticeNext = new NoticeService().selectNoticeNext(noticeNo);
		NoticeVo noticePre = new NoticeService().selectNoicePre(noticeNo);
		
		if(notice != null){
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("noticeNext", noticeNext);
			request.setAttribute("noticePre", noticePre);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/notice/noticeDetail.jsp");
			view.forward(request, response);
		}
				
	
	}

}
