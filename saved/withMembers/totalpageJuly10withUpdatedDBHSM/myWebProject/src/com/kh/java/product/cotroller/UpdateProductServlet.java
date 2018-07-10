package com.kh.java.product.cotroller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.java.product.model.service.ProductService;
import com.kh.java.product.model.vo.ProductVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/updateProduct.do")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String fileSavePath="Thumbnail";
		int uploadSizeLimit=10*1024*1024;
		
		if(!ServletFileUpload.isMultipartContent(request)){
			System.out.println("addproduct에서 multipart타입이 아님");
		}
		
		//파일 저장 경로
		ServletContext context = getServletContext();
		String uploadPath=context.getRealPath(fileSavePath);
		//파일 저장
		MultipartRequest multi = new MultipartRequest(request,uploadPath,uploadSizeLimit,"utf-8",
				new DefaultFileRenamePolicy());
				//똑같은 이미지 업로드시 이름 바꿔서 저장됨.
		String img_src="";
		Enumeration files = multi.getFileNames();
		
			String img = (String)files.nextElement();
			String imgName = multi.getFilesystemName(img);
			if(imgName!=null){
			img_src = fileSavePath+"/"+imgName;
		}else{
			img_src = multi.getParameter("scr");
		}

		String category1 = multi.getParameter("category1");
		String category2 = multi.getParameter("category2");
		String name = multi.getParameter("pr_name");
		int price = Integer.parseInt(multi.getParameter("pr_price"));
		String content = multi.getParameter("pr_content");
		int writerNo = Integer.parseInt(multi.getParameter("mno"));
				
		switch(category1){
		case "0": category1 = "액세서리";
		break;
		case "1": category1 = "패션잡화";
		break;
		}
		
		int mno = Integer.parseInt(multi.getParameter("mno"));
		int pno = Integer.parseInt(multi.getParameter("pno"));
		
		String category = category1 + ">" + category2;
		ProductVo pv = new ProductVo(name, price, img_src, category, content, writerNo);
		pv.setPno(pno);
		
		int result = new ProductService().updateProduct(mno,pv);
		
		if(0<result){
			RequestDispatcher rd = request.getRequestDispatcher("/views/member/writerPage.jsp");
			request.setAttribute("list", new ProductService().selectProdList(mno));
			rd.forward(request, response);
		}else{
			System.out.println("상품등록 중 에러");
		}		
		
	}

}
