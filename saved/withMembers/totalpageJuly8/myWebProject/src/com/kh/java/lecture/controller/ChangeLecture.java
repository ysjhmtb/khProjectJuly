package com.kh.java.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.lecture.model.service.LectureService;
import com.kh.java.lecture.model.vo.LectureVo;

@WebServlet("/changeLecture.do")
public class ChangeLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeLecture() {
    }
    public boolean isNumber(String str){
    	char tempCh;
        int dotCount = 0;	//실수일 경우 .의 개수를 체크하는 변수
        boolean result = true;

        for (int i=0; i<str.length(); i++){
          tempCh= str.charAt(i);	//입력받은 문자열을 문자단위로 검사
          //아스키 코드 값이 48 ~ 57사이면 0과 9사이의 문자이다.
          if ((int)tempCh < 48 || (int)tempCh > 57){
            //만약 0~9사이의 문자가 아닌 tempCh가 .도 아니거나
            //.의 개수가 이미 1개 이상이라면 그 문자열은 숫자가 아니다.
            if(tempCh!='.' || dotCount > 0){
              result = false;
              break;
            }else{
              //.일 경우 .개수 증가
              dotCount++;
            }
          }
        }
        return result;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=UTF-8");
				//전송 값 변수에 저장
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String name = request.getParameter("name");
				String place = request.getParameter("place");
				String period = request.getParameter("period");
				String phone = request.getParameter("phone");
				String ckId = request.getParameter("ckId");
				
				String strPayment = request.getParameter("payment");
				String strPerson = request.getParameter("person");
				int payment = 0;
				int person = 0;
				
				if(isNumber(strPayment) && isNumber(strPerson)){
					payment = Integer.parseInt(request.getParameter("payment"));
					person = Integer.parseInt(request.getParameter("person"));
				}else{
					response.setCharacterEncoding("UTF-8"); 
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<html>");
					out.println("<script>");
					out.println("alert('수강료와 제한인원수는 숫자만 기입해야 합니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.println("</html>");
					out.close();
					return;
				}
				
				LectureVo lecture = new LectureVo(title, content, name, place, period, payment, person, phone, ckId);
				
				//비지니스 로직 호출
				int result = new LectureService().changeLecture(lecture);
				
				//결과 처리(응답 페이지 설정)
				RequestDispatcher view = null;
				if(0 < result){
					view = request.getRequestDispatcher("/mwp/indexLecture.jsp");
					request.setAttribute("list", new LectureService().getLectureList());
				}else{
					response.setCharacterEncoding("UTF-8"); 
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<html>");
					out.println("<script language='javascript'>");
					out.println("alert('강의수정이 취소되었습니다.');");
					out.println("history.go(-2);");
					out.println("</script>");
					out.println("/<html>");
					out.close();
				}
				view.forward(request, response);
	
	}

}
