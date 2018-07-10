package com.kh.java.map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.java.common.MyRenamePolicy;
import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.AttachmentMapVo;
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
		System.out.println("insertMapServlet");
		
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
		
		String marketName = mRequest.getParameter("marketName");
		double lat = Double.parseDouble(mRequest.getParameter("lat"));
		double lng = Double.parseDouble(mRequest.getParameter("lng"));
		String startDay = mRequest.getParameter("startDay");
		String endDay = mRequest.getParameter("endDay");
		String url = "#";
		String color = "#FFEEDD";
		String colorText = "BLACK";
		String marketExpl = mRequest.getParameter("marketExpl");
		
		
		String originName = mRequest.getOriginalFileName("primaryImg");
		String changeName = mRequest.getFilesystemName("primaryImg");
		
		
		
		
		int result = new MapService().insertMap(marketName, lat, lng, 
				marketExpl, startDay, endDay, url, color, colorText,
				originName, changeName, path, 0, 0);
		
		
		if(result>0){
			view = request.getRequestDispatcher("/mapList.do");
			view.forward(request, response);
		}else{
			System.out.println("마켓 저장중 오류");
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
