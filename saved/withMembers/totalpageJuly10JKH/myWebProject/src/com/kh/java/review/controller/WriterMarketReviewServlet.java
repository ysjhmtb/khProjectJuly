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
import com.kh.java.review.model.vo.ReviewVo;

@WebServlet("/marketReviewWriter.do")
public class WriterMarketReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriterMarketReviewServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String writer = request.getParameter("writer");
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String marketName = request.getParameter("marketName");
		
		ReviewVo review = new ReviewVo();
		review.setWriter(writer);
		review.setMarketNo(marketNo);
		review.setTitle(title);
		review.setContent(content);
		
		int result = new ReviewService().insertMarketReview(review);
		
		if(result>0){
			response.sendRedirect("/mwp/reviewList.do?currentPage="+1+"&marketNo="+marketNo+"&marketName="+URLEncoder.encode(marketName, "UTF-8"));
		}else{
			System.out.println("마켓 제보중 오류");
		}
		
		
	}

}
