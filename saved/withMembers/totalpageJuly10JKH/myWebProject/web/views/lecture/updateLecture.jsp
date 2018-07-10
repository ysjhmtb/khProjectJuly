<%@page import="com.kh.java.lecture.model.vo.LectureVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LectureVo lecture = (LectureVo)request.getAttribute("lecture");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 등록</title>
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
	width:920px;
	margin:18px;
}
label{
	width:120px;
	font-size:15px;
	text-align:center;
	margin-right:40px;
	font-family: 'ngb', 'NanumBarunGothic'; 
	text-transform: uppercase;
    letter-spacing: 2.5px;
	font-weight: 500;
	color: white;
	background-color: #232833;
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;"
}

label:hover{
	color:#585858;
}

.typeText{
	width:75%;
	height:98%;
}


</style>
<script>
function chNull(){
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var name = document.getElementById("name").value;
	var place = document.getElementById("place").value;
	var period = document.getElementById("period").value;
	var payment = document.getElementById("payment").value;
	var person = document.getElementById("person").value;
	var phone = document.getElementById("phone").value;
	var ckId = document.getElementById("ckId").value;
	
	if(title == "" || content == "" || name == "" || place == "" || period == "" || payment == "" || person == "" || phone == "" || ckId == ""){
		alert("입력하지 않은 값이 있습니다. 값을 모두 입력해 주세요.");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<div id="topBar">
<div align="center" style="font-size:25px; margin-bottom:23px;">강의 등록</div>
</div> 

<div align="center">
<form id="proInfo" method="get" action="/mwp/changeLecture.do" onsubmit="return chNull();" enctype="multipart/form-data">
	<div class="info">
		<label for="title"><b>강의명</b></label>
		<input type="text" class="typeText"  name="title" id="title"  size="65"  value="<%=lecture.getTitle()%>"/>
	</div>
	<div class="info">
		<label for="content"><b>내용</b></label>
		<input type="text" class="typeText"  name="content" id="content"  size="65" value="<%=lecture.getContent()%>"/>
	</div>
	
	<div class="info">
		<label for="name"><b>작가명</b></label>
		<input type="text" class="typeText"  name="name" id="name"  size="65"  value="<%=lecture.getName()%>"/>
	</div>
	
	<div class="info">
		<label for="place"><b>강의 장소</b></label>
		<input type="text" class="typeText"  name="place" id="place"  size="65" value="<%=lecture.getPlace()%>"/>
	</div>
	
	<div class="info">
		<label for="period"><b>강의 기간</b></label>
		<input type="text" class="typeText"  name="period" id="period" size="65" value="<%=lecture.getPeriod()%>"/>
	</div>
	
	<div class="info">
		<label for="payment"><b>수강료</b></label>
		<input type="text" class="typeText"  name="payment" id="payment"   size="65" value="<%=lecture.getPayment()%>"/>
	</div>
	
	<div class="info">
		<label for="person"><b>제한 인원수</b></label>
		<input type="text" class="typeText"  name="person" id="person"  size="65" value="<%=lecture.getPerson()%>"/>
	</div>
	
	<div class="info">
		<label for="phone"><b>전화번호</b></label>
		<input type="text" class="typeText"  name="phone" id="phone"  size="65" value="<%=lecture.getPhone()%>"/>
	</div>
	
	<div class="info">
		<label for="ckId"><b>아이디</b></label>
		<input type="text" class="typeText" name="ckId" id="ckId"  size="65" value="<%=lecture.getckId()%>"/>
	</div>
		
	<div class="info" align="right" style="margin-right:95px;">
		
		<script>
			CKEDITOR.replace('editor1',{
				filebrowserUploadUrl: '/test2/ckeditorImageUpload.do',
				width:790,
				height:800,
				enterMode:'2',
				shiftEnterMode:'3'	
			});
			
		</script>
	</div>
	<input class="btn_sch" type="submit" value="등록" style="width: 50px;
				  height: 20px;
				  font-family: 'Roboto', sans-serif;
				  font-size: 13px;
				  text-transform: uppercase;
				  letter-spacing: 2.5px;
				  font-weight: 500;
				  color: white;
				  background-color: #232833;
				  border: none;
				  border-radius: 45px;
				  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
				  transition: all 0.3s ease 0s;
				  cursor: pointer;
				  outline: none;"
				  onMouseOver="this.style.color='#585858'" onMouseOut="this.style.color='white'"/>
	<input class="btn_sch" type="button" onclick="history.back();"value="취소" style="width: 50px;
				  height: 20px;
				  font-family: 'Roboto', sans-serif;
				  font-size: 13px;
				  text-transform: uppercase;
				  letter-spacing: 2.5px;
				  font-weight: 500;
				  color: white;
				  background-color: #232833;
				  border: none;
				  border-radius: 45px;
				  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
				  transition: all 0.3s ease 0s;
				  cursor: pointer;
				  outline: none;"
				  onMouseOver="this.style.color='#585858'" onMouseOut="this.style.color='white'"/>
</form>
</div>


<%@ include file="/views/common/footer.jsp" %>
</body>
</html>