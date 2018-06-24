package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.MapVo;

/**
 * Servlet implementation class SelectStartDayServlet
 */
@WebServlet("/selectStartDay.do")
public class SelectStartDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectStartDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MapVo result = new MapService().getStartDayForCountdown();
		
		RequestDispatcher view = null;
		
		if(result != null) {
			request.setAttribute("result", result);
			view = request.getRequestDispatcher("views/countdown/countdown.jsp");
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "failed in getting days");
		}
		
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
