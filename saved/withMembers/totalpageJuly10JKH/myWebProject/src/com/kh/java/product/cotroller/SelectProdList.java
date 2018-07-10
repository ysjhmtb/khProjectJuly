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
 * Servlet implementation class SelectProdList
 */
@WebServlet("/selectProdList.do")
public class SelectProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProdList() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		ArrayList<ProductVo> list = new ProductService().selectProdList(mno);
		if(null!=list){
			RequestDispatcher rd = request.getRequestDispatcher("/views/member/writerPage.jsp");
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else{
			System.out.println("등록한 상품 리스트 불러오는중 에러");
		}
	}

}
