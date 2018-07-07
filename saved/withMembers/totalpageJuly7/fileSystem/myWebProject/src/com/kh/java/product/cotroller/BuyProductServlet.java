package com.kh.java.product.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;
import com.kh.java.product.model.vo.CartVo;


@WebServlet("/buyProd.do")
public class BuyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuyProductServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		ArrayList<CartVo> list = new ProductService().getCartList(mno);

		if(null!=list){
			RequestDispatcher rd = request.getRequestDispatcher("/views/product/buyStep2.jsp");
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else{
			System.out.println("BuyProductServlet에서 list 널!");
		}
	
	}

}
