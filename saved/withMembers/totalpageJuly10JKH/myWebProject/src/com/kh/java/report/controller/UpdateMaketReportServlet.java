package com.kh.java.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.notice.model.service.NoticeService;
import com.kh.java.notice.model.vo.NoticeVo;
import com.kh.java.report.model.service.ReportService;
import com.kh.java.report.model.vo.ReportVo;
import com.sun.media.jfxmedia.events.MarkerEvent;

@WebServlet("/reportUpdate.do")
public class UpdateMaketReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMaketReportServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String writer = request.getParameter("writer");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		
		ReportVo report = new ReportVo();
		report.setTitle(title);
		report.setContent(content);
		report.setWriter(writer);
		report.setNo(reportNo);
		
		int result = new ReportService().updateReport(report);
		
		if(result>0){
			response.sendRedirect("/mwp/reportDetail.do?reportNo="+reportNo+"&currentPage="+currentPage);
		}else{			
			System.out.println("마켓 제보 수정하던중 오류 발생");
		}
	
	}
	

}
