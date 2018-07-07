<%@page import="com.kh.java.report.model.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ReportVo report = (ReportVo)request.getAttribute("report");
    	int currentPage = (int)request.getAttribute("currentPage");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>마켓제보 수정</title>
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
<div align="center" style="font-size:25px; margin-bottom:23px;">프리마켓 제보 내용 수정</div>
</div> 
<div align="center">
<form id="proInfo" method="post" action="/mwp/reportUpdate.do">
	<!-- member세션 받아올 경우 writer 수정-->
	<input type ="hidden" name ="writer" value ="admin" /> 
	<input type ="hidden" name ="currentPage" value ="<%=currentPage %>"/>
	<input type ="hidden" name ="reportNo" value ="<%=report.getNo() %>"/>
	<div class="info">
		<label for="pr_name" class ="title"><b>제목</b></label>
		<input type="text" class="typeText" value="<%=report.getTitle() %>" name="title" id="pr_name" size="120"/>
	</div>
	<div class="info" align="right" style="margin-right:95px;">
		<p id ="content"><b>상세내용</b></p>
		<textarea id="editor1" name="content"><%=report.getContent() %></textarea>
		<script>
			CKEDITOR.replace('editor1',{
				filebrowserUploadUrl: '/mwp/reviewckeditorImageUpload.do?keyword=report',
				width:790,
				height:600,
				enterMode:'2',
				shiftEnterMode:'3'	
			});
			
		</script>
	</div>
	<input type="submit" class="btn_sch" value="수정"/>
</form>
</div>
<%@ include file = "/views/common/footer.jsp" %>

</body>
</html>