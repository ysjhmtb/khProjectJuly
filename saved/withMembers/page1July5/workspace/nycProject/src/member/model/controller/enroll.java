package member.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.MemberVo;

/**
 * Servlet implementation class enroll
 */
@WebServlet("/enroll.do")
public class enroll extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public enroll() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      int mno = Integer.parseInt(request.getParameter("memberMno"));
      char check = request.getParameter("boolean").charAt(0);
      System.out.println(mno + "mno");
      System.out.println(check);
      if (check == 'T') {
         int result = new MemberService().category(mno);
         RequestDispatcher view = null;
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("location.href='/nycProject/admin/member.jsp'");
         out.println("</script>");
         out.close();

      } else {
         int result = new MemberService().category2(mno);
         RequestDispatcher view = null;
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("location.href='/nycProject/admin/member.jsp'");
         out.println("</script>");
         out.close();

      }

   }
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
 *      response)
 */