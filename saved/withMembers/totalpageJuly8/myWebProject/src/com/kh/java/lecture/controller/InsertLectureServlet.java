package com.kh.java.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.lecture.model.service.LectureService;
import com.kh.java.lecture.model.vo.LectureVo;

@WebServlet("/insertLecture.do")
public class InsertLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertLectureServlet() {
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
		List<LectureVo> list = new LectureService().getLectureList(); 
		ArrayList<LectureVo> arrList = (ArrayList<LectureVo>)list;
		//한글 인코딩
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=UTF-8");
				//전송 값 변수에 저장
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String name = request.getParameter("name");
				String place = request.getParameter("place");
				String period = request.getParameter("period");
//				int payment = Integer.parseInt(request.getParameter("payment"));
//				int person = Integer.parseInt(request.getParameter("person"));
				String phone = request.getParameter("phone");
				String ckId = request.getParameter("ckId");
				String tempPayment = request.getParameter("payment");
				String tempPerson = request.getParameter("person");
				int payment = 0;
				int person = 0;
				
				
				if(isNumber(tempPayment) && isNumber(tempPerson)){
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
				
				int result = 0;
				int temp1 = 0;
				for(LectureVo n : arrList){
					if(ckId.equals(n.getckId())){
						System.out.println("강의 중복");
						temp1 = 1;
					}else{
						System.out.println("강의 중복 없음");
						temp1 = 2;
					}
				}

				if(temp1 == 2){
					result = new LectureService().writeLecture(lecture);
				}
				else if(temp1 == 1){
					response.setCharacterEncoding("UTF-8"); 
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<html>");
					out.println("<script>");
					out.println("alert('이미 등록된 강의가 있습니다. 확인해주세요.');");
					out.println("history.back();");
					out.println("</script>");
					out.println("</html>");
					out.close();
				}
				
				//결과 처리(응답 페이지 설정)
				RequestDispatcher view = null;
				if(0 < result){
					view = request.getRequestDispatcher("/mwp/indexLecture.jsp");
					request.setAttribute("list", new LectureService().getLectureList());
				}else{
					view = request.getRequestDispatcher("/mwp/indexLecture.jsp");
					request.setAttribute("list", new LectureService().getLectureList());
				}
				view.forward(request, response);
	
	
	}

}
