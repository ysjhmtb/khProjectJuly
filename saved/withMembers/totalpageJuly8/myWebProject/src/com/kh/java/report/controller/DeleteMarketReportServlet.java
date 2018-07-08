package com.kh.java.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.notice.model.service.NoticeService;
import com.kh.java.report.model.service.ReportService;

@WebServlet("/marketDelete.do")
public class DeleteMarketReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMarketReportServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
				
		
		int result = new ReportService().deleteReport(reportNo);
		
		if(result>0){
			response.sendRedirect("/mwp/marketReportList.do?currentPage="+currentPage);
		}else{
			System.out.println("제보 삭제도중 실패");
		}
		
	
	}

}
