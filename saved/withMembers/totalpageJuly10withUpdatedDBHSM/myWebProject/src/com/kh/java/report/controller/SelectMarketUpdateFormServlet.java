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

@WebServlet("/marketUpdateForm.do")
public class SelectMarketUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMarketUpdateFormServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		
		ReportVo report = new ReportService().selectReportForm(reportNo);
		
		if(report!=null){
			request.setAttribute("report", report);
			request.setAttribute("currentPage", currentPage);
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReport/marketReportUpdate.jsp");
			view.forward(request, response);
		}else{
			System.out.println("수정할 제보를 가져오던중 오류 발생");
		}
	}

}
