package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.map.model.service.MapService;

/**
 * Servlet implementation class InsertMapServlet
 */
@WebServlet("/insertMap.do")
public class InsertMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		/*
		 String marketName = "kh프리마켓";
		double marketLat = 37.498993;
		double marketLng = 127.032909;
		String marketExpl = "kh info";
		String startDay = "20180815"; 
		 
		 */
		
		String marketName = request.getParameter("marketName");
		double marketLat = Double.parseDouble(request.getParameter("marketLat"));
		double marketLng = Double.parseDouble(request.getParameter("marketLng"));
		String marketExpl = request.getParameter("marketExpl");
		String startDay = request.getParameter("startDay");
		
		int result = new MapService().insertMap(marketName, marketLat, marketLng, marketExpl, startDay);
		
		RequestDispatcher view = null;
		
		if(0 < result) {
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("msg", "inserting map succeeded");
		}
		
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
