package com.kh.java.map.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.MapVo;

/**
 * Servlet implementation class SelectStartDayAjaxServlet
 */
@WebServlet("/selectStartDayAjax.do")
public class SelectStartDayAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectStartDayAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MapVo resultMapVo = new MapService().getStartDayForCountdown();
		
		JSONObject result = new JSONObject();
		result.put("startDay", new SimpleDateFormat("yyyy-MM-dd").format(resultMapVo.getStartDay()));
		System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(resultMapVo.getStartDay()));
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
