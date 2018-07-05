package com.kh.java.review.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.report.model.service.ReportService;
import com.kh.java.report.model.vo.ReportVo;
import com.kh.java.review.model.service.ReviewService;
import com.kh.java.review.model.vo.ReviewVo;

@WebServlet("/reviewUpdate.do")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateReviewServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String writer = request.getParameter("writer");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String marketName = request.getParameter("marketName");
		System.out.println("updateServlet = " + marketName);
		ReviewVo review = new ReviewVo();
		review.setTitle(title);
		review.setContent(content);
		review.setWriter(writer);
		review.setNo(reviewNo);
		
		int result = new ReviewService().updateReview(review);
		
		if(result>0){
			response.sendRedirect("/mwp/reviewDetail.do?reviewNo="+reviewNo+"&currentPage="+currentPage+"&marketNo="+marketNo+"&marketName="+URLEncoder.encode(marketName, "UTF-8"));
		}else{			
			System.out.println("마켓 제보 수정하던중 오류 발생");
		}
	
	}

}
