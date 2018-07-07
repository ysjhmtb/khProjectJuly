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
		height:auto;
		align:center;
		magin-top:100px;
		margin-left:450px;
/* 		border:solid; */
/* 		boder-collapse:collapse; */
/* 		border-width:thin; */
	}
	
	div{
		text-align:center;
		
	}
	
	
	.marketName{
		font-size:40px;
	}
	
	.thumbnailTitle{
		font-size:20px;
		margin-top:5%;
		margin-bottom:1%;
		
	}
	
	.thumbnail{
	
		margin-top:1%;
		margin-bottom:5%;
	
	}
	
	.marginContent{
		margin:30px;
		padding:20px;
		font-size:40px;
	}

	.submitBtn{
		margin-top:20px;
		font-size:100px;
		width:150px;
		height:100%;
	}
	
	.submitForm{
		height:20%;
		margin:10%;
	}
	
	

</style>

</head>
<body>

 <%@ include file = "/views/common/header.jsp" %> 

<div class="h3_wrap">

	<h3><%= map.getMarketName() %> </h3>

</div>

<div class="total">

		 <br><br><br>
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
		 
		 <form class="submitForm" action="/mwp/modifyMap.do">
		 
		 	<input type="hidden" name="marketNo" value="<%= map.getMarketNo() %>">
		 	<input class="btn_sch" class="submitBtn" type="submit" value="수정/삭제">
		 
		 </form>
		 
		 
		 
			
</div>
 

	 <%@ include file = "/views/common/footer.jsp" %> 

</body>
</html>