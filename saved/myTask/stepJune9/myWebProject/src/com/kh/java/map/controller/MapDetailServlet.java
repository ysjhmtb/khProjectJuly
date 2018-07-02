package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.AttachmentMapVo;
import com.kh.java.map.model.vo.MapVo;


@WebServlet("/mapDetail.do")
public class MapDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MapDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("marNo"));
		int marNo = Integer.parseInt(request.getParameter("marNo"));
		
		MapService ms = new MapService();
		MapVo map = null;
		AttachmentMapVo attach = null;
		String url = null;
		
		map = ms.getAMapVo(marNo);
		attach = ms.getAAttachmentMapVo(marNo);
		
		if(map != null && attach != null) {
			url = "views/map/mapDetail.jsp";
			request.setAttribute("MapVo", map);
			request.setAttribute("AttachmentMapVo", attach);
		}else {
			url = "views/common/errorPage.jsp";
			request.setAttribute("msg", "마켓 세부 정보 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
