package com.kh.java.report.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.report.model.service.ReportService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/marketReport.do")
public class WriterMarketReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriterMarketReportServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String fileSavePath="upload/marketReport";
		String root = request.getServletContext().getRealPath("/");
		String path = root+"upload/marketReport";
		
//		System.out.println(path);
		
		MultipartRequest mRequest = new MultipartRequest(request, path,"UTF-8");
		
		String title = mRequest.getParameter("title");
		System.out.println(title + "입니다.");
		String content = mRequest.getParameter("content");
		String writer = mRequest.getParameter("writer");
		int result = new ReportService().insertMarketReport(title,content,writer);
		
		if(result>0){
			response.sendRedirect("/mwp/marketReportList.do");
		}else{
			System.out.println("마켓 제보중 오류");
		}
	}

}
