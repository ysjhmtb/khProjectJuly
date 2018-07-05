package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.ProductVo;

/**
 * Servlet implementation class DetailProductServlet
 */
@WebServlet("/detailProduct.do")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ProductVo pv = new ProductService().selectProduct(pno); 
		RequestDispatcher rd = null;
		if(null!=pv){
			rd = request.getRequestDispatcher("detailProduct.jsp");
			request.setAttribute("pv", pv);
			rd.forward(request, response);
		}else{
			System.out.println("상품 상세보기(detail)불러오는 중 에러");
		}
	}

}
