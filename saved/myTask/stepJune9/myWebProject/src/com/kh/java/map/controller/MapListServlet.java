package com.kh.java.map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.map.model.service.MapService;
import com.kh.java.map.model.vo.AttachmentMapVo;
import com.kh.java.map.model.vo.MapPlusAtmtVo;
import com.kh.java.map.model.vo.MapVo;

/**
 * Servlet implementation class MapListServlet
 */
@WebServlet("/mapList.do")
public class MapListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    /**

     * Default constructor. 

     */

    public MapListServlet() {

        // TODO Auto-generated constructor stub

    }

	/**

	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");

		List<MapVo> list = new MapService().getMapList();

		for(MapVo vo : list) {
			System.out.println(vo.toString());
		}


		RequestDispatcher view = null;

		if(list.size() != 0) {
			request.setAttribute("list", list);
			view = request.getRequestDispatcher("views/map/mapList.jsp");			

		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "failed in caliing map");
		}

		System.out.println("maplist servlet");
		view.forward(request, response);

	}

	/**

	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

		doGet(request, response);

	}

}
