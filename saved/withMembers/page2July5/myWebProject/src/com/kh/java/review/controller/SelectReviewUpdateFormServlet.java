package com.kh.java.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.report.model.service.ReportService;
import com.kh.java.report.model.vo.ReportVo;
import com.kh.java.review.model.service.ReviewService;
import com.kh.java.review.model.vo.ReviewVo;

@WebServlet("/reviewUpdateForm.do")
public class SelectReviewUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectReviewUpdateFormServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String marketName = request.getParameter("marketName");
		
		ReviewVo review = new ReviewService().selectReviewForm(reviewNo);
		
		if(review!=null){
			request.setAttribute("review", review);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("marketNo", marketNo);
			request.setAttribute("marketName", marketName);
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReview/marketReviewUpdate.jsp");
			view.forward(request, response);
		}else{
			System.out.println("리뷰 수정 폼 가져오던중 오류 발생");
		}
	
	}

}
