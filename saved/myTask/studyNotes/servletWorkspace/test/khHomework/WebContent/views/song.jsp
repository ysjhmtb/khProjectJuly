<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% 
 	String userid = (String)request.getAttribute("userid");
 	String useremail = (String)request.getAttribute("useremail");
 	String content = (String)request.getAttribute("content");
 	
 %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신청곡 등록 확인 </h1> <br>
	<h3>다음의 신청곡이 등록 완료되었습니다. </h3> <br>
	<span>신청자 : <%=userid %></span> <br>
	<span>메일 주소 : <%=useremail %></span> <br>
	<span>사연 : <%=content %></span> <br>
	
	<a href="/khHomework/views/requestSong.html">메인으로 가기 </a>
	
	

	

</body>
</html>