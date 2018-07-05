package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class UpdateCartCountServlet
 */
@WebServlet("/updateCartCount.do")
public class UpdateCartCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		int result = new ProductService().updateCartCount(cno, count);
		
		RequestDispatcher rd = null;
		if(0<result){
			rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
		}else{
			System.out.println("장바구니 상품 수량 업데이트 중 에러");
		}
	}

}
