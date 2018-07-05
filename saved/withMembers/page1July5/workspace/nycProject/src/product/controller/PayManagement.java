package product.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import product.model.service.ProductService;
import product.model.vo.BuyVo;

/**
 * Servlet implementation class DeliveryManagement
 */
@WebServlet("/payM.do")
public class PayManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = new ProductService().updateBv(bno,"p");
		
		if(0<result){
			response.sendRedirect("/nycProject/admin/product.jsp");
		}else{
			System.out.println("배송완료중 에러!!");
		}
		
		
		
		
	}

}
