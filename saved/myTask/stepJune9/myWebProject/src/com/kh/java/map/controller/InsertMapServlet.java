package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.MapVo;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class InsertMapServlet
 */
@WebServlet("/insertMap.do")
public class InsertMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//cos.jar in lib 
		int maxSize = 1024 * 1024 * 10;
		
		RequestDispatcher view = null;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/errorPage.sjp");
			request.setAttribute("msg", "전송 데이터의 타입을 확인하십시오.");
			view.forward(request, response);
		}
		
		String path = "/Users/yunseokjeon/git/khProjectJuly/saved/myTask/stepJune9/myWebProject/web/upload";
		
		MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "UTF-8");
		
		
		String marketName = mRequest.getParameter("marketName");
		double marketLat = Double.parseDouble(mRequest.getParameter("marketLat"));
		double marketLng = Double.parseDouble(mRequest.getParameter("marketLng"));
		String marketExpl = mRequest.getParameter("marketExpl");
		String startDay = mRequest.getParameter("startDay");
		String endDay = mRequest.getParameter("endDay");
		String url = mRequest.getParameter("url");
		String color = mRequest.getParameter("color");
		String colortext = mRequest.getParameter("colortext");
		String attachedFile = mRequest.getFilesystemName("attachedFile");
		
		int result = new MapService().insertMap(marketName, marketLat, marketLng,
				marketExpl, startDay, endDay, url, color, colortext, attachedFile);
		
		if(0 < result) {
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("msg", "맵 정보 입력 성공 ");
			
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "맵 정보 입력 중 에러 발생");
		}
		
		view.forward(request, response);
		
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
