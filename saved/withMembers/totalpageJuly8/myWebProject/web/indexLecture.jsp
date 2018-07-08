<%@page import="com.kh.java.lecture.model.vo.LectureVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% ArrayList<LectureVo> list 
				= (ArrayList<LectureVo>)request.getAttribute("list"); %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>OPEN CLASSOPEN CLASS</title>
<script type="text/javascript" src="/mwp/js/jquery-3.3.1.min.js"></script>

<style>
	
	body{font-family:'ngb', 'NanumBarunGothic'; }
	div{margin:0;
	padding:0;
	border:0;
	background:transparent;
	display:block;}
	
	#container #contentWrap .content_body {line-height: 24px;}
	
	#content {font-size: 13px;
	color:#333;
	word-break: keep-all;}
	
	.tstyle_list{
	clear:both;
	width:80%;
	border-top:solid 1px #919191;
	line-height:1.6;
	margin-bottom: 10px;
	border-spacing:0;}
	
	table {border-collapse: collapse;}
	
	colgroup {display: table-column-group;}
	
	col {display: talbe-column;}
	
	thead {table-header-group;
	vertical-align: middle;}
	
	tr{display: table-row;
	vertical-align:inherit;}
 	
 	.tstyle_list thead th:first-child{border-left:0;}
 	
 	.tstyle_list thead th {
 	color: #000;
 	font-weight: normal;
 	color:white;
 	background: #232833;
 	border-bottom:1px solid #919191;}
 	
 	.tstyle_list thead th, .tstyle_list td {word-break: keep-all;
 	text-align: center;
 	padding: 8px;}
 	
 	tbody {display: table-row-group;
 	vertical-align: middle;}
 	
 	tr {display: table-row;
 	vertical-align:inherit;
 	}
 	
 	.tstyle_list td:first-child {border-left:0;}
 	.tstyle_list td.subject {text-align: center;}
 	td{word-break: keep-all;
 	border-bottom: 1px solid #dcd9d9;
 	padding: 8px;}
 	
 	element.style{text-align: left;}

	.tstyle_list td{border-left: 1px solid #dcd9d9;}
	
	.tstyle_list thead th, .tstyle_list td {
	word-break: keep-all;
	border-bottom: 1px solid #dcd9d9;
	padding: 8px;}

	.tstyle_list td{border-left: 1px solid #dcd9d9;}
	.tstyle_list thead th, .tstyle_list td {word-break: keep-all;
	border-bottom: 1px solid #dcd9d9;
	text-align: center;
	padding: 8px;}
	
	#mainfont {height:80px;
	align:bottom;}
	
	#test{
	cursor: pointer;
	}
	
	.udateBtn{
	margin-right:1px;
	}
	
	.deleteBtn{
	margin-left:1px;
	}
	
	
</style>
<script>
	$(function(){
		$("#lectureBtn").click(function(){
			location.href = "/mwp/views/lecture/writeLecture.jsp";
		});
	})
	
	function deleteLecture(){
		var ckId = prompt("본인확인을 위해 아이디를 입력해주세요.");
		if($("#ckId").val()==""){
			return false;
		}
		else{
			$("#ckId").val(ckId);
			return true;
		}
	}
	
	function updateLecture(){
		var uckId = prompt("본인확인을 위해 아이디를 입력해주세요.");
		if($("#uckId").val()==""){
			return false;
		}
		else{
			$("#uckId").val(uckId);
			return true;
		}
	}
	
</script>

</head>
<body>
<%@ include file = "/views/common/header.jsp" %>
<div id="mainfont">

<!-- 타이틀 영역 -->
<h3 style="text-align:center;">강의 정보</h3>
</div>

<div style="width:100%; margin-bottom:3px;">
<table>
	<thead>
		<tr>
			<th width=94.6% style="text-align:left;">※ 강의 등록, 수정 및 삭제는 작가회원만 가능하며 강의 등록은 1인당 1개로 제한됩니다. <br>※ 수강 상세문의는 작가님의 연락처를 이용하시기 바랍니다.</th>
			<th width=10%;>
				<button class="btn_sch" style="font-size:14px; background:#232833; border:none;" id="lectureBtn" onMouseOver="this.style.color='#585858'" onMouseOut="this.style.color='white'">강의 등록</button>
			</th>
		</tr>
	</thead>
</table>


</div>
<!-- 표 영역 : 시작 -->
<div class="mb_scroll">
<table class="tstyle_list">

<colgroup>
	<col width="50px" class="title" /> <!-- 강의 번호 -->
	<col width="300px" class="title" /> <!-- 강의 주제 -->
	<col class="title" /> <!-- 강의 내용 -->
	<col width="100px" class="title" /> <!-- 작가명 -->
	<col width="250px" class="title" /> <!-- 강의 장소 -->
	<col width="130px" class="title" /> <!-- 강의 기간 -->
	<col width="80px" class="name" /> <!-- 수강료 -->
	<col width="50px" class="date" /> <!-- 제한 인원 -->
	<col width="100px" class="hit" /> <!-- 상세 문의 -->
	<col width="60px" class="lecture" /> <!-- 강의 수정 -->
	<col width="60px" class="lecture" /> <!-- 강의 삭제 -->
</colgroup>
<thead>
<tr>
	<th scope="col" class="title">강의 번호</th>
	<th scope="col" class="title">강의 주제</th>
	<th scope="col" class="title">강의 내용</th>
	<th scope="col" class="title">작가명</th>
	<th scope="col" class="title">강의 장소</th>
	<th scope="col" class="title">강의 기간</th>
	<th scope="col" class="name">수강료</th>
	<th scope="col" class="date">제한 인원</th>
	<th scope="col" class="hit">상세 문의</th>
	<th scope="col" class="lecture">강의 수정</th>
	<th scope="col" class="lecture">강의 삭제</th>
	
</tr>
</thead>
<tbody>

	<!-- SAMPLE DATA : 시작 -->
	<tr>
		<td class="subject">1</td>
		<td class="subject2" style="text-align:center;">
			<span style="font-size: 15px; color: black;">
				<span style="color: blue;">[일회성특강]</span>
					나만의 여행팝업북 만들기</span><br/></td>
			<td class="etc">자신만의 독특하고 특별한 여행팝업북을 만드는 방법</td>
			<td  class="etc">최홍만</td>
			<td class="etc">서울시 송파구 송파구민회관 3층</td>
			<td class="etc">2018.07.11 ~ 2018.7.15 (5일간)</td>
			<td class="etc">30000원</td>
			<td class="etc">10명</td>
			<td class="etc">010-123-4567</td>
			<td rowspan=100 class="etc">
				<form method="get" action="/mwp/updateLecture.do" onsubmit="return updateLecture();" enctype="multipart/form-data">
				<input type="submit" class="updateBtn" id="uckId" name="uckId" value="수정" 
				style="width: 50px;
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
				  onMouseOver="this.style.color='#585858'" onMouseOut="this.style.color='white'"></form>
			</td>
			<td rowspan=100 class="etc">
				<form method="get" action="/mwp/deleteLecture.do" onsubmit="return deleteLecture();" enctype="multipart/form-data">
				<input type="submit" class="deleteBtn" id= "ckId" name="ckId" value="삭제" 
				  style="width: 50px;
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
				  onMouseOver="this.style.color='#585858'" onMouseOut="this.style.color='white'"/></form>
			</td>
	</tr>
	
	<!--  SAMPLE DATA : 끝 -->
	
	
	<!-- 강의 추가 시 해당 내용에 따라추가됨. -->
	<%if(list.size()==0) {%>
	<tr>
		<td colspan="7">개설된 강의가 없습니다.</td>
	</tr>
	<%}else{ %>
		<%for(LectureVo n : list){ %>
	<tr>
		<td class="subject"><%=n.getNum() %></td>
		<td class="subject2" style="text-align:center;">
			<span style="font-size: 15px; color: black;">
				<%=n.getTitle()%></span>
		</td>
			<td class="etc"><%=n.getContent() %></td>
			<td class="etc"><%=n.getName() %></td>
			<td class="etc"><%=n.getPlace() %></td>
			<td class="etc"><%=n.getPeriod() %></td>
			<td class="etc"><%=n.getPayment() %>원</td>
			<td class="etc"><%=n.getPerson() %>명</td>
			<td class="etc"><%=n.getPhone() %></td>
	</tr>
	<%}%>
	<%} %>
</tbody>
</table>
</div>
<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>