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

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public LoginServlet() {
      super();
   }

   @SuppressWarnings("unused")
   /*protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 전송 값에 한글이 있을 경우 한글 인코딩 처리
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      // 전송값 변수에 저장
      String id = request.getParameter("userId");
      //String pwd = request.getParameter("userPwd");

      // 서비스 호출
      MemberVo member = new MemberService().getMemberId(id);
      RequestDispatcher view = null;
      PrintWriter out = response.getWriter();

      // 1. 아이디가 존재하지 않습니다.
      if (null == member) {
         out.println("<script>alert('계정이 존재하지않습니다.'); location.href='index.html';</script>");

      }
      else{
         out.println("값이있습니다.");
      }

      // 비지니스 로직 호출
      // MemberVo member = new MemberService().login(id, pwd);
      // //System.out.println(member.toString());
      // if(member != null){
      // //로그인 성공
      // HttpSession session = request.getSession();
      // session.setAttribute("user", member);
      // response.sendRedirect("index.jsp");
      // }else{
      // //로그인 실패
      // //로그인에 실패하셧습니다.
      // request.setAttribute("msg", "로그인에 실패하셧습니다!!");
      // RequestDispatcher view
      // = request.getRequestDispatcher("views/common/errorPage.jsp");
      // view.forward(request, response);
      // }
   }
*/
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      // 전송 값에 한글이 있을 경우 한글 인코딩 처리
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      // 전송값 변수에 저장
      String id = request.getParameter("userId");
      String nick=request.getParameter("nick");
      System.out.println(nick);
      //String pwd = request.getParameter("userPwd");

      // 서비스 호출
      MemberVo member = new MemberService().getMemberId(id);
      RequestDispatcher view = null;
      PrintWriter out = response.getWriter();
      // 1. 아이디가 존재하지 않습니다.
      if (null == member) {
         request.setAttribute("id",id);
         request.setAttribute("nick", nick);
         view = request.getRequestDispatcher("join.jsp");
         view.forward(request, response);
      }
      else{
         out.println("<script>alert('계정이 존재합니다.로그인합니다.'); </script>.");
         HttpSession session = request.getSession();
         session.setAttribute("user", member);
         System.out.println(member.getM_NAME());
         System.out.println(member.getM_CATEGORY());
         response.sendRedirect("index.jsp");
      }
   }
}