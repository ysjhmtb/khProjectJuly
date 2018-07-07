package com.kh.java.map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.MapVo;

@WebServlet("/marketSelect.do")
public class SelectIndexMarketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectIndexMarketServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		ArrayList<MapVo> list = new MapService().selectIndexMarketList();
		
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	
	}

}
