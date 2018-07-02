<%@page import="com.kh.java.map.model.vo.AttachmentMapVo"%>
<%@page import="com.kh.java.map.model.vo.MapVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% MapVo map = (MapVo) request.getAttribute("MapVo"); %>
<% AttachmentMapVo attach = (AttachmentMapVo) request.getAttribute("AttachmentMapVo"); %>
<% String expl = map.getMarketExpl(); %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
	.total{
		width:50%;
		height:800px;
		align:center;
		magin-top:100px;
		margin-left:450px;
	}
	
	div{
		text-align:center;
	}


</style>

</head>
<body>

<%-- <%@ include file = "/views/common/header.jsp" %> --%>



<div class="total">

		<div class="marketName"><%= map.getMarketName() %></div>
		 <br>
		 
		 <div class="thumbnailTitle">대표 이미지 </div>
		 <br>
		 
		 <div class="thumbnail">
		 	<script>
		 		<%
		 			String src = "/mwp/upload/" + attach.getChangeName();
		 		%>
		 	</script>
		 	<img src="<%= src %>">
		 </div>
		 
		 <br>
		 
		 
		 <div class="mapContent">
		 	<%= expl %>

		 </div>
			
</div>
 

	<%-- <%@ include file = "/views/common/footer.jsp" %> --%>

</body>
</html>