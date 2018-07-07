package com.kh.java.product.cotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;


@WebServlet("/addCart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCartServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		//수정
		int result =-1;
		if(mno!=0){
		result = new ProductService().insertCart(pno, mno, count);
		}
		
		RequestDispatcher rd =null;
		if(0<result){
			rd = request.getRequestDispatcher("/views/product/cart.jsp");
			rd.forward(request, response);
		}else if(-1==result){
			request.setAttribute("flag", result);
			rd = request.getRequestDispatcher("/views/member/login.jsp");
			rd.forward(request, response);
		}else{
			System.out.println("장바구니담기 중 에러");
			
		}
	
	}

}
