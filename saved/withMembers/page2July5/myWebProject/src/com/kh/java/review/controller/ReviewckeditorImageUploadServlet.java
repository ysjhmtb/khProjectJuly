package com.kh.java.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/reviewckeditorImageUpload.do")
public class ReviewckeditorImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewckeditorImageUploadServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String keyword = request.getParameter("keyword"); 
		
		String fileSavePath= "";
		if(keyword.equals("report")){
			fileSavePath="upload/marketReport";			
		}else if(keyword.equals("review")){
			fileSavePath="upload/marketReview";
		}

		int uploadSizeLimit=10*1024*1024;
		String encType="UTF-8";

		if(!ServletFileUpload.isMultipartContent(request)){
			System.out.println("ckeditor에서 multipart타입이 아님");
		}
		//파일 저장 경로
		
		String root = request.getServletContext().getRealPath("/");
		String uploadPath = root + fileSavePath;
		System.out.println(uploadPath);
		//파일 저장

		MultipartRequest multi = new MultipartRequest(request,uploadPath,uploadSizeLimit,encType,

				new DefaultFileRenamePolicy());
		
	
				

		//파일 업로드 url 경로 -> ckeditor에서 이미지 보여짐.

		String uploadUrl= "http://localhost:8081/mwp/"+fileSavePath;
//		System.out.println(fileSavePath);
		//파일 이름 불러오기
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		String fileName = multi.getFilesystemName(file);

		PrintWriter out = response.getWriter();
		String funcNum = multi.getParameter("CKEditorFuncNum");
		String fileUrl = uploadUrl+"/"+fileName;

		out.println("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + fileUrl + "');</script>");
//		System.out.println("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + fileUrl + "');</script>");

		

		out.flush();
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
