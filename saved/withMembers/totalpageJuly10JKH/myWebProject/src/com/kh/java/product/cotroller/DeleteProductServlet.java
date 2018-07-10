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
import com.kh.java.product.model.vo.ProductVo;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteProd.do")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new ProductService().deleteProd(mno,pno);
		if(0<result){
			ArrayList<ProductVo> list = new ProductService().selectProdList(mno);
			RequestDispatcher rd = request.getRequestDispatcher("/views/member/writerPage.jsp");
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else{
			System.out.println("등록상품 삭제중 에러");
		}
	}

}
