package com.kh.java.lecture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.java.lecture.model.service.LectureService;
import com.kh.java.lecture.model.vo.LectureVo;

@WebServlet("/lectureList.do")
public class LectureListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LectureListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글 전송 값이 존재 할경우 인코딩 처리 X
				//2. 전송 값 변수에 저장 X
				//3. 비지니스 로직 호출(서비스 호출)
				List<LectureVo> list = new LectureService().getLectureList(); 
				System.out.println("1번실행 확인");
				//공지사항 조회 값 확인
//				for(NoticeVo vo : list){
//					System.out.println(vo.toString());
//				}
				//4. 로직 결과 처리(응답 페이지 처리)
				RequestDispatcher view = null;
				if(list.size() != 0){
					//조회 성공->공지사항 페이지 목록 출력
					System.out.println("2번실행 확인");
					view = request.getRequestDispatcher("/indexLecture.jsp");
					request.setAttribute("list", list);
				}else{
					//조회 실패->에러 페이지 -> 공지사항 불러오기를 실패하셧습니다. 
					request.setAttribute("msg", "공지사항 불러오기를 실패하셧습니다.");
					view 
						= request.getRequestDispatcher("/views/common/errorPage.jsp");
				}
				view.forward(request, response);
	
	}

}
