package com.kh.java.product.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;


@WebServlet("/deliveryM.do")
public class DeliveryManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeliveryManagement() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = new ProductService().updateBv(bno,"d");
		
		if(0<result){
			response.sendRedirect("/mwp/views/admin/product.jsp");
		}else{
			System.out.println("배송완료중 에러!!");
		}
	
	}

}
