package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.CartVo;

/**
 * Servlet implementation class BuyProductServlet
 */
@WebServlet("/buyProd.do")
public class BuyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		ArrayList<CartVo> list = new ProductService().getCartList(mno);

		if(null!=list){
			RequestDispatcher rd = request.getRequestDispatcher("buyStep2.jsp");
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else{
			System.out.println("BuyProductServlet에서 list 널!");
		}
	}

}
