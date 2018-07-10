package com.kh.java.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.report.model.service.ReportService;
import com.kh.java.report.model.vo.ReportVo;

@WebServlet("/reportDetail.do")
public class SelectMarketReportDeatilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMarketReportDeatilServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		
		ReportVo report = new ReportService().selectReportDeatil(reportNo);
		ReportVo reportNext = new ReportService().selectReportNext(reportNo);
		ReportVo reportPre = new ReportService().selectReportPre(reportNo);
		
		if(report !=null){
			request.setAttribute("report", report);
			request.setAttribute("reportNext", reportNext);
			request.setAttribute("reportPre", reportPre);
			request.setAttribute("currentPage", currentPage);
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReport/marketReportDetail.jsp");
			view.forward(request, response);
		}
	}

}
