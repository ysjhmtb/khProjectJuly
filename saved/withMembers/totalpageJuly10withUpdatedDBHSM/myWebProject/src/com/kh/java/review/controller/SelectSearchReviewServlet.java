package com.kh.java.review.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.common.PageInfo;
import com.kh.java.review.model.service.ReviewService;
import com.kh.java.review.model.vo.ReviewVo;

@WebServlet("/reviewSearch.do")
public class SelectSearchReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchReviewServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String keyword = request.getParameter("keyword");
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		String marketName = request.getParameter("marketName");
		System.out.println(keyword);
		
		ReviewService rs = new ReviewService();
		
		int currentPage; //현재 페이지의 번호
		
		int limitPage;
		int maxPage;
		int startPage;
		int endPage;
		int limit;
		
		limit =5;
		limitPage = 10;
		
		if(request.getParameter("currentPage")!= null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}else{
			currentPage = 1;
		}
		int listCount = rs.searchReviewCount(keyword,marketNo);
		maxPage = (int)((double)listCount/limit +0.9);
		
		startPage = (int)(currentPage/limitPage *limitPage)+1;
		
		endPage = startPage + limitPage -1;
		if(endPage>maxPage){
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage,limitPage, maxPage, startPage, endPage,listCount);
		//==========================페이징 처리 끝==========================
		
		ArrayList<ReviewVo> list = rs.selectSearchReviewList(currentPage,limit,keyword,marketNo);
		
		if(null != list){
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("keyword", keyword);
			request.setAttribute("marketNo", marketNo);
			request.setAttribute("marketName", marketName);
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReview/marketReview.jsp");
			view.forward(request, response);
		}
		
	
	}

}
