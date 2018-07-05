<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String marketName = request.getParameter("marketName");
	int marketNo = Integer.parseInt(request.getParameter("marketNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성하기</title>
<script src="/mwp/usedLib/ckeditor/ckeditor.js"></script>
<script src="/mwp/usedLib/ckeditor/config.js"></script>
<style>
#topBar {
 	margin-bottom:15px; 
	border-bottom:1px solid #666; 
	padding:5px;
}

.category{
	width:345px;
}
.info{
	width:930px;
	margin:25px;
}
.title{
	width:120px;
	font-size:15px;
	text-align:right;
	margin-right:45px;
}
.typeText{
	width:75%;
	height:98%;
}
#content{
	width:120px;
	font-size:30px;
	text-align:center;
	margin-right: 360px;

	}


</style>
</head>
<body>
<%@ include file = "/views/common/header.jsp" %>


<div id="topBar">
<div align="center" style="font-size:25px; margin-bottom:23px;"><%=marketName %>후기 작성</div>
</div> 
<div align="center">
<form id="proInfo" method="post" action="/mwp/marketReviewWriter.do" >
	<!-- member세션 받아올 경우 writer 수정-->
	<input type ="hidden" name ="writer" value ="admin" /> 
	<input type ="hidden" name ="marketNo" value ="<%=marketNo %>"/>
	<input type ="hidden" name ="marketName" value = "<%=marketName %>"/>

	<div class="info">
		<label for="pr_name" class ="title"><b>제목</b></label>
		<input type="text" class="typeText" placeholder="제목" name="title" id="pr_name" size="65"/>
	</div>
	<div class="info" align="right" style="margin-right:95px;">
		<p id ="content"><b>상세내용</b></p>
		<textarea id="editor1" name="content" ><%=marketName %>의 후기만 작성해주세요.</textarea>
		<script>
			CKEDITOR.replace('editor1',{
				filebrowserUploadUrl: '/mwp/reviewckeditorImageUpload.do?keyword=review',
				width:790,
				height:600,
				enterMode:'2',
				shiftEnterMode:'3'	
			});
			
		</script>
	</div>
	<input type="submit" class="btn_sch" value="등록"/>
</form>
</div>


<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>