package com.kh.java.product.cotroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.product.model.service.ProductService;
import com.kh.java.product.model.vo.BuyVo;


@WebServlet("/buyProduct2.do")
public class BuyProductServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuyProductServlet2() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String bnumber = request.getParameter("merchant_uid");
		String m_name = request.getParameter("m_name");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		String p_names = request.getParameter("p_names");
		String p_prices = request.getParameter("p_prices");
		String p_counts = request.getParameter("p_counts");
		String p_nos = request.getParameter("p_nos");
		String c_nos = request.getParameter("c_nos");

		ArrayList<BuyVo> list = new ArrayList<BuyVo>();
		String[] names = p_names.split("/");
		String[] prices = p_prices.split("/");
		String[] counts = p_counts.split("/");
		String[] pnos = p_nos.split("/");
		String[] cnos = c_nos.split("/");
		
		for(int i=0; i<names.length; i++){
			BuyVo bv = new BuyVo();
			bv.setBnumber(bnumber);
			bv.setM_name(m_name);
			bv.setP_name(names[i]);
			bv.setP_price(Integer.parseInt(prices[i]));
			bv.setP_count(Integer.parseInt(counts[i]));
			bv.setPno(Integer.parseInt(pnos[i]));
			
			list.add(bv);
		}
		int result = new ProductService().insertBuyList(list);
		if(0<result){
			PrintWriter out = response.getWriter();
			String infoStr = request.getParameter("infoStr");
			System.out.println(infoStr);
			out.print("/mwp/views/product/buyStep3.jsp?bnumber="+bnumber+"&infoStr="+infoStr);
			out.flush();
			out.close();
			int deleteCart = new ProductService().deleteCart(cnos);
		}else{
			System.out.println("상품 결제중 에러");
		}
	}

}
