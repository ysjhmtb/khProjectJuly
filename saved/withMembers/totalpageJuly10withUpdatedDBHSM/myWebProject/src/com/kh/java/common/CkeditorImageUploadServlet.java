package com.kh.java.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CkeditorImageUploadServlet
 */
@WebServlet("/ckeditorImageUpload.do")
public class CkeditorImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CkeditorImageUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset=utf-8");

		String fileSavePath="upload";

		

		int uploadSizeLimit=10*1024*1024;

		String encType="UTF-8";

		

		if(!ServletFileUpload.isMultipartContent(request)){

			System.out.println("ckeditor�뿉�꽌 multipart���엯�씠 �븘�떂");

		}

		

		//�뙆�씪 ���옣 寃쎈줈

//		String uploadPath = "/Users/yunseokjeon/git/khProjectJuly/saved/myTask/stepJune9/myWebProject/web/upload";

		ServletContext context = getServletContext();
	    String uploadPath = context.getRealPath(fileSavePath);
	    System.out.println(uploadPath);
		

		//�뙆�씪 ���옣

		MultipartRequest multi = new MultipartRequest(request,uploadPath,uploadSizeLimit,encType,

				new DefaultFileRenamePolicy());

				

		//�뙆�씪 �뾽濡쒕뱶 url 寃쎈줈 -> ckeditor�뿉�꽌 �씠誘몄� 蹂댁뿬吏�.

		String uploadUrl= "http://localhost:8081/mwp/"+fileSavePath;

		System.out.println(fileSavePath);

		//�뙆�씪 �씠由� 遺덈윭�삤湲�

		Enumeration files = multi.getFileNames();

		String file = (String)files.nextElement();

		String fileName = multi.getFilesystemName(file);

		

		PrintWriter out = response.getWriter();

		String funcNum = multi.getParameter("CKEditorFuncNum");

		String fileUrl = uploadUrl+"/"+fileName;

		out.println("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + fileUrl + "');</script>");

		System.out.println("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + fileUrl + "');</script>");

		

		out.flush();
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
