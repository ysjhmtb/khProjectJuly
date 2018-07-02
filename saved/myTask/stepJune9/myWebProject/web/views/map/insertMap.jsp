
//팀원인 하성미 씨와 장건희 씨의 도움으로 사용가능해진 에디터 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/mwp/usedLib/ckeditor/ckeditor.js"></script>
<script src="/mwp/usedLib/ckeditor/config.js"></script>
<style>
#topBar {
 	margin-bottom:15px; 
/* 	border-top:1px solid #666;  */
	border-bottom:1px solid #666; 
	padding:5px;
}

.category{
	width:345px;
}
.info{
	width:920px;
	margin:20px;
}
label{
	width:120px;
	font-size:15px;
	text-align:right;
/* 	padding-right:15px; */
	margin-right:40px;
}
.typeText{
	width:75%;
	height:98%;
}
.location{
	width:29%;
}
.explanation{
	text-align: center;
	margin-left: 80px;
}

</style>
<script>

</script>
</head>
<body>

<%@ include file = "/views/common/header.jsp" %>
<div id="topBar">
<div align="center" style="font-size:25px; margin-bottom:23px;">마켓 등록</div>
</div> 
<div align="center">
<form id="proInfo" method="post" action="/mwp/insertMap.do" enctype="multipart/form-data">
	<div class="info">
		<label for="pr_name"><b>마켓이름</b></label>
		<input type="text" class="typeText" placeholder="마켓이름" name="marketName" id="pr_name" size="65"/>
	</div>
	<div class="info">
		<label for="pr_price""><b>마켓위도</b></label>
		<input type="text" class="location" placeholder="마켓위도" name="lat" id="pr_price" size="65"/>&emsp;&emsp;
		<label for="pr_price""><b>마켓경도</b></label>
		<input type="text" class="location" placeholder="마켓경도" name="lng" id="pr_price" size="65"/>
	</div>
	<div class="info">
		<label for="pr_name"><b>마켓시작일</b></label>
		<input type="text" placeholder="20181201" class="typeText"  name="startDay" id="pr_name" size="65"/>
	</div>
	<div class="info">
		<label for="pr_name"><b>마켓종료일</b></label>
		<input type="text" placeholder="20181205" class="typeText"  name="endDay" id="pr_name" size="65"/>
	</div>
	<div class="info" align="left" style="margin-left:120px">
		<label for="pr_img"><b>대표이미지</b></label>
		<input type="file" class="typeText" placeholder="이미지" name="primaryImg" id="pr_img" size="65"/>
	</div>
	<div class="info" align="right" style="margin-right:95px;">
		<h3 class = "explanation">마켓 설명</h3>
		<textarea id="editor1" name="marketExpl"></textarea>
		<script>
			CKEDITOR.replace('editor1',{
				filebrowserUploadUrl: '/mwp/ckeditorImageUpload.do',
				width:790,
				height:800,
				enterMode:'2',
				shiftEnterMode:'3'	
			});
			
		</script>
	</div>
	<input type="submit" value="등록"/>
</form>
</div>
<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>