package com.kh.java.review.controller;

import java.io.IOException;
import java.net.URLEncoder;

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

@WebServlet("/reviewDetail.do")
public class SelectReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectReviewDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String marketName = request.getParameter("marketName");
		System.out.println("detail.do = "+ marketName );
		
		ReviewVo review = new ReviewService().selectReviewDeatil(reviewNo);
		ReviewVo reviewNext = new ReviewService().selectReviewNext(reviewNo);
		ReviewVo reviewPre = new ReviewService().selectReviewPre(reviewNo);
		
		
		if(reviewNext !=null){
			if(reviewNext.getMarketNo() != marketNo ){
				reviewNext = null;
			}
		}
		if(reviewPre !=null){
			if(reviewPre.getMarketNo() != marketNo){
				reviewPre = null;
			}
		}
		
		
		if(review !=null){
			request.setAttribute("review", review);
			
			request.setAttribute("reviewNext", reviewNext);
			request.setAttribute("reviewPre", reviewPre);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("marketNo", marketNo);
			request.setAttribute("marketName", URLEncoder.encode(marketName, "UTF-8"));
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReview/marketReviewDetail.jsp");
			view.forward(request, response);
		}
	}

}
