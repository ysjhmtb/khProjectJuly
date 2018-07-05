package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.java.common.MyRenamePolicy;
import com.kh.java.map.model.service.MapService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RealDeleteMapServlet
 */
@WebServlet("/realDeleteMap.do")
public class RealDeleteMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealDeleteMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int maxSize = 1024 * 1024 * 10;
		RequestDispatcher view = null;
		
		
		if(!ServletFileUpload.isMultipartContent(request)){
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "전송 데이터의 타입을 확인하십시오!!");
			view.forward(request, response);
		}
		String fileSavePath="upload";
		ServletContext context = getServletContext();
	    String path = context.getRealPath(fileSavePath);
		
	
		MultipartRequest mRequest = new MultipartRequest(request, path, maxSize
				, "UTF-8", new MyRenamePolicy());
		
		
		int marNo = Integer.parseInt(mRequest.getParameter("marketNo"));
		System.out.println("marNo : " + marNo);
		
		int result = new MapService().deleteMap(marNo);
		
		String gotoPage = "";
		if(0 < result) {
			gotoPage = "/mapList.do";
			request.setAttribute("msg", "맵 삭제에 성공하였습니다.");
		}else {
			gotoPage = "views/common/errorPage.jsp";
			request.setAttribute("msg", "맵 삭제에 실패하였습니다.");
		}
		
		view = request.getRequestDispatcher(gotoPage);
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
