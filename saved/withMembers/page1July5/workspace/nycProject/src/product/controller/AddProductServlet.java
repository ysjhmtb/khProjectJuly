package product.controller;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.model.service.ProductService;
import product.model.vo.ProductVo;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/addProduct.do")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
		
		Enumeration files = multi.getFileNames();
		String img = (String)files.nextElement();
		String imgName = multi.getFilesystemName(img);
	
		String category1 = multi.getParameter("category1");
		String category2 = multi.getParameter("category2");
		String name = multi.getParameter("pr_name");
		int price = Integer.parseInt(multi.getParameter("pr_price"));
		String content = multi.getParameter("pr_content");
		//임의 작가번호 -> DB에선 작가1 
		int writerNo = Integer.parseInt(multi.getParameter("mno"));
		System.out.println(writerNo);
				
		switch(category1){
		case "0": category1 = "액세서리";
		break;
		case "1": category1 = "패션잡화";
		break;
		}
		
//		System.out.println(category1);
//		System.out.println(category2);
//		System.out.println(name);
//		System.out.println(price);
//		System.out.println(imgName);
//		System.out.println(content);
		
		String img_src = fileSavePath+"/"+imgName;
//		System.out.println(img_src);
		String category = category1 + ">" + category2;
		ProductVo pv = new ProductVo(name, price, img_src, category, content, writerNo);
		int result = new ProductService().insertProduct(pv);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		if(0<result){
			request.setAttribute("list", new ProductService().getRecommendList());
			rd.forward(request, response);
		}else{
			System.out.println("상품등록 중 에러");
		}		
		
	}

}
