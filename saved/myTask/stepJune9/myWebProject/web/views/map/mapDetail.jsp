<%@page import="com.kh.java.map.model.vo.AttachmentMapVo"%>
<%@page import="com.kh.java.map.model.vo.MapVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% MapVo map = (MapVo) request.getAttribute("MapVo"); %>
<% AttachmentMapVo attach = (AttachmentMapVo) request.getAttribute("AttachmentMapVo"); %>

<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div><%= map.getMarketName() %></div>
 <br>
 
 <div>대표 이미지 </div>
 <br>
 
 <div>
 	<script>
 		<%
 			String src = attach.getFilePath() + attach.getChangeName();
 		%>
 	</script>
 	<img src="<%= src %>">
 </div>
 
 <br>
 
 
 <div class="mapContent">
 	
 	<script>
 	
 		<% String expl = map.getMarketExpl(); %>
 	
 		$(function(){
 			$(".mapContent").html(<%= expl %>);
 			
 		});
 	</script>
 
 </div>

	

</body>
</html>