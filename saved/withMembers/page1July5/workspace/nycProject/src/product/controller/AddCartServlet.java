package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.dao.ProductDao;
import product.model.service.ProductService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/addCart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
		int mno = Integer.parseInt(request.getParameter("mno"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		int result = new ProductService().insertCart(pno, mno, count);
		
		RequestDispatcher rd =null;
		if(0<result){
			rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
		}else{
			System.out.println("장바구니담기 중 에러");
		}
	}

}
