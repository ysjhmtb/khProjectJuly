package com.kh.java.review.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.report.model.service.ReportService;
import com.kh.java.review.model.service.ReviewService;

@WebServlet("/reviewDelete.do")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteReviewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String marketName = request.getParameter("marketName");
		
		
		int result = new ReviewService().deleteReview(reviewNo);
		
		if(result>0){
			response.sendRedirect("/mwp/reviewList.do?currentPage="+currentPage+"&marketNo="+marketNo+"&marketName="+URLEncoder.encode(marketName, "UTF-8"));
		}else{
			System.out.println("제보 삭제도중 실패");
		}
	
	}

}
