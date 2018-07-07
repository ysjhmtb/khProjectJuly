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

@WebServlet("/noticeUpdateForm.do")
public class UpdateNoticeFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateNoticeFormServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("NoticeNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		NoticeVo notice = new NoticeService().selectNoticeForm(noticeNo);
		
		if(notice!=null){
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			RequestDispatcher view = request.getRequestDispatcher("/views/notice/updateNotice.jsp");
			view.forward(request, response);
		}else{
			System.out.println("수정할 공지사항을 가져오던중 오류 발생");
		}
		
	
	}

}
