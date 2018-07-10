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
import com.kh.java.map.model.vo.MapVo;
import com.kh.java.report.model.service.ReportService;
import com.kh.java.report.model.vo.ReportVo;
import com.kh.java.review.model.service.ReviewService;
import com.kh.java.review.model.vo.ReviewVo;

@WebServlet("/marketReviewList.do")
public class SelectMarketReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMarketReviewListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ReviewService rs = new ReviewService();
		
		int currentPage; //현재 페이지의 번호
		
		int limitPage;
		int maxPage;
		int startPage;
		int endPage;
		int limit;
		
		limit =3;
		limitPage = 10;
		
		if(request.getParameter("currentPage")!= null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}else{
			currentPage = 1;
		}
		int listCount = rs.selectReviewCount();
		maxPage = (int)((double)listCount/limit +0.9);
		
		startPage = (int)(currentPage/limitPage *limitPage)+1;
		
		endPage = startPage + limitPage -1;
		if(endPage>maxPage){
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage,limitPage, maxPage, startPage, endPage,listCount); 
		//=======================페이징 처리 끝 =====================================
		
		ArrayList<MapVo> list = rs.selectReviewMarketList(currentPage,limit);
		
		if(null != list){
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			RequestDispatcher view = request.getRequestDispatcher("/views/marketReview/marketRList.jsp");
			view.forward(request, response);
		}
		
	}

}
