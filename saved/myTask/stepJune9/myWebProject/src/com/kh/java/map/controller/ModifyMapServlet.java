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


@WebServlet("/modifyMap.do")
public class ModifyMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ModifyMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		System.out.println("marketNo : " + marketNo);
		
		String url = null;
		
		MapVo map = new MapService().getAMapVo(marketNo);
		AttachmentMapVo attach = new MapService().getAAttachmentMapVo(marketNo);
		
		if(map != null && attach != null) {
			url = "views/map/modifyMap.jsp";
			request.setAttribute("MapVo", map);
			request.setAttribute("AttachmentMapVo", attach);
			
		}else {
			url = "views/common/errorPage.jsp";
			request.setAttribute("msg", "맵과 첨부파일 조회 중 에러가 발생했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
