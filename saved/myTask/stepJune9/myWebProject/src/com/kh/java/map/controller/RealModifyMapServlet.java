package com.kh.java.map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.java.common.MyRenamePolicy;
import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.AttachmentMapVo;
import com.kh.java.map.model.vo.MapVo;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/realModifyMap.do")
public class RealModifyMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public RealModifyMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
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
		
		String path = "/Users/yunseokjeon/git/khProjectJuly/saved/myTask/stepJune9/myWebProject/web/upload";
		
		MultipartRequest mRequest = new MultipartRequest(request, path, maxSize
				, "UTF-8", new MyRenamePolicy());
		
		//받은 맵 번호와 내용을 바탕으로 수정하기.
		int marNo = Integer.parseInt(mRequest.getParameter("marketNo"));
		System.out.println("marNo : " + marNo);
		
		//수정의 경우 대표 이미지에 사진이 추가된 경우 기존 첨부파일을 이것으로 대체한다.
		//빈 파일인지 아닌지 확인.
		//만약 입력이 되지 않았다면 기존 첨부파일을 보존한다.
		
		String marketName = mRequest.getParameter("marketName");
		double lat = Double.parseDouble(mRequest.getParameter("lat"));
		double lng = Double.parseDouble(mRequest.getParameter("lng"));
		String startDay = mRequest.getParameter("startDay");
		String endDay = mRequest.getParameter("endDay");
		String url = "url";
		String color = "#FFEEDD";
		String colorText = "BLACK";
		String marketExpl = mRequest.getParameter("marketExpl");
		
		String originName = mRequest.getOriginalFileName("primaryImg");
		String changeName = null;
		
		int fileLevel = 0;
		int downloadCount = 0;
		
		if(originName == null || originName.length() == 0) {
			MapVo tempMap = new MapService().getAMapVo(marNo);
			AttachmentMapVo tempAttach = new MapService().getAAttachmentMapVo(marNo);
			
			originName = tempAttach.getOriginName();
			changeName = tempAttach.getChangeName();
		}else {
			changeName = mRequest.getFilesystemName("primaryImg");
		}
		
		System.out.println(marketName + "/" + lat  + "/" + lng  + "/" + startDay
				 + "/" + endDay + "/" + url + "/" + color + "/" + colorText
				 + "/" + marketExpl + "/" + originName + "/" + changeName);
		
		
		int result = new MapService().realModifyMap(marNo, marketName, lat, lng,
				marketExpl, startDay, endDay, url, color, colorText,
				originName, changeName, path, fileLevel, downloadCount);
		
		String gotoPage = "";
		if(0 < result) {
			gotoPage = "/mwp/index.jsp";
			request.setAttribute("msg", "맵 수정에 성공하였습니다.");
		}else {
			gotoPage = "views/common/errorPage.jsp";
			request.setAttribute("msg", "맵 수정에 실패하였습니다.");
		}
		
		view = request.getRequestDispatcher(gotoPage);
		view.forward(request, response);
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
