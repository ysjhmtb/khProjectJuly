package kh.com.java.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestSongServlet
 */
@WebServlet("/requestSong.do")
public class RequestSongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestSongServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");
		String content = request.getParameter("content");
		
		RequestDispatcher rd = request.getRequestDispatcher("views/song.jsp");
		
		request.setAttribute("userid", userid);
		request.setAttribute("useremail", useremail);
		request.setAttribute("content", content);
		
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



/*
 getParameter
 
public java.lang.String getParameter(java.lang.String name)
Returns the value of a request parameter as a String, or null if the parameter does not exist. Request parameters are extra information sent with the request. For HTTP servlets, parameters are contained in the query string or posted form data.
You should only use this method when you are sure the parameter has only one value. If the parameter might have more than one value, use getParameterValues(java.lang.String).

If you use this method with a multivalued parameter, the value returned is equal to the first value in the array returned by getParameterValues.

If the parameter data was sent in the request body, such as occurs with an HTTP POST request, then reading the body directly via getInputStream() or getReader() can interfere with the execution of this method.

Parameters:
name - a String specifying the name of the parameter
Returns:
a String representing the single value of the parameter
See Also:
getParameterValues(java.lang.String)

https://tomcat.apache.org/tomcat-5.5-doc/servletapi/javax/servlet/ServletRequest.html#getParameter(java.lang.String)

현재는 html 태그에서 name 속성에 해당하는 값을 getParameter 의 매개변수로 사용했는데, id나 class에 대한 속성은
어떻게 활용되는 것일까? 

 */
