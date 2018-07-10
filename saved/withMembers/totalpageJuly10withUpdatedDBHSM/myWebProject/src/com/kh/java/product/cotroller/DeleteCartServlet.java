package com.kh.java.product.cotroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;

@WebServlet("/deleteC.do")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCartServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");

	      String[] cno = { request.getParameter("cno") };
	      PrintWriter out = response.getWriter();
	      int result = new ProductService().deleteCart(cno);

	      if (0 < result) {
	         out.println("<script>");
	         out.println("alert('삭제되었습니다.');  location.href='/mwp/views/product/cart.jsp'");
	         out.println("</script>");
	      } else {
	         System.out.println("실패");
	      }

	}

}
