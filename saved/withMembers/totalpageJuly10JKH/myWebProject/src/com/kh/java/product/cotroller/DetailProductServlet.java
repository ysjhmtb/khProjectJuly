package com.kh.java.product.cotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;


@WebServlet("/detailProduct.do")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailProductServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		com.kh.java.product.model.vo.ProductVo pv = new ProductService().selectProduct(pno); 
		RequestDispatcher rd = null;
		if(null!=pv){
			rd = request.getRequestDispatcher("/views/product/detailProduct.jsp");
			request.setAttribute("pv", pv);
			rd.forward(request, response);
		}else{
			System.out.println("상품 상세보기(detail)불러오는 중 에러");
		}
	}

}
