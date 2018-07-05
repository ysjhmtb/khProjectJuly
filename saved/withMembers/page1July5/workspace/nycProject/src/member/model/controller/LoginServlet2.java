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

@WebServlet("/login2.do")
public class LoginServlet2 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public LoginServlet2() {
      super();
   }

   @SuppressWarnings("unused")

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException { // 전송 값에 한글이 있을 경우 한글

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      // 전송값 변수에 저장
      String id = request.getParameter("userid");
      String pwd = request.getParameter("password");
      // String pwd = request.getParameter("userPwd");

      // 서비스 호출
      MemberVo member = new MemberService().getMemberId(id);
      RequestDispatcher view = null;
      PrintWriter out = response.getWriter();
      // 1. 아이디가 존재하지 않습니다.
      if (null == member) {
         out.println("<script>");
         out.println("alert('아이디가 존재하지않거나 잘못입력하셨습니다.');  location.href='/nycProject/member/login.jsp'");
         out.println("</script>");
         out.close();
      }else {

         if(member.getM_PW().equals(pwd)){
        	 HttpSession session = request.getSession();
        	 session.setAttribute("user", member);
        	 System.out.println("확인");
        	 
        	 if(id.equals("1111")){
             	 response.sendRedirect("/nycProject/admin/product.jsp");
              } else{
            	  response.sendRedirect("index.jsp");
              }
         }else{
        	 out.println("<script>");
        	 out.println("alert('비밀번호가 틀렸습니다.'); location.href='/nycProject/member/login.jsp' ");
        	 out.println("</script>");
        	 out.close();
         }
      }
   }

   /*@Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      // 전송 값에 한글이 있을 경우 한글 인코딩 처리
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      // 전송값 변수에 저장
      String id = request.getParameter("userid");
      String pwd = request.getParameter("password");
      // String pwd = request.getParameter("userPwd");

      // 서비스 호출
      MemberVo member = new MemberService().getMemberId(id);
      RequestDispatcher view = null;
      PrintWriter out = response.getWriter();
      // 1. 아이디가 존재하지 않습니다.
      if (null == member) {
         request.setAttribute("id", id);
         view = request.getRequestDispatcher("join.jsp");
         view.forward(request, response);
      } else {
         HttpSession session = request.getSession();
         session.setAttribute("user", member);
         System.out.println(member.getM_NAME());
         System.out.println(member.getM_CATEGORY());
         view = request.getRequestDispatcher("index.jsp");
         out.println("<script>");
         out.println("alert('계정이존재합니다 로그인합니다.'); location.href='index.jsp'");
         out.println("</script>");
         out.close();

      }
   }*/
}