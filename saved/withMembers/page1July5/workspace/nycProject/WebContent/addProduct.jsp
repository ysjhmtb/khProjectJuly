<%@page import="product.model.vo.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="lib/ckeditor/ckeditor.js"></script>
<script src="lib/ckeditor/config.js"></script>
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

</style>
</head>
<body>
<%@ include file="header.jsp" %>

<script>
	function selectCategory(){
		for(var i=0; i<8; i++){
			$("#category2").children("option").eq(i).attr("hidden",false);
		}
		$("#category1 option:selected").each(function(index, value){
			category2($(this).val());
		});
	}
	
	function category2(category1){
			var startidx = 0;
			var endidx = 7;
			if(category1==0){
				startidx = 4;
				endidx = 7;
			}else if(category1==1){
				startidx = 0;
				endidx = 3;
			}
			for(var i=startidx; i<=endidx; i++){
				$("#category2").children("option").eq(i).attr("hidden","hidden");
			}
	}
</script>

<div id="topBar">
<div align="center" style="font-size:25px; margin-bottom:23px;">상품 등록</div>
</div> 
<div align="center">
<form id="proInfo" method="post" action="addProduct.do?mno=<%=member.getMNO() %>" enctype="multipart/form-data">
	<div class="info">
		<label for="category1"><b>상품카테고리</b></label>
		<select class="category" id="category1" name="category1" onchange="selectCategory()">
			<option>선택</option>
			<option value="0">액세서리</option>
			<option value="1">패션잡화</option>
			<option value="공예">공예</option>
			<option value="생활소품">생활소품</option>
			<option value="인테리어">인테리어</option>
		</select>
		<select class="category" id="category2" name="category2">
			<option>선택</option>
			<option value="반지">반지</option>
			<option value="귀걸이">귀걸이</option>
			<option value="팔찌">팔찌</option>
			<option value="수제화">수제화</option>
			<option value="파우치">파우치</option>
			<option value="가방">가방</option>
			<option value="지갑">지갑</option>
		</select>
	</div>
	<div class="info">
		<label for="pr_name"><b>상품명</b></label>
		<input type="text" class="typeText" placeholder="상품명" name="pr_name" id="pr_name" size="65"/>
	</div>
	<div class="info">
		<label for="pr_price"><b>가격</b></label>
		<input type="text" class="typeText" placeholder="가격" name="pr_price" id="pr_price" size="65"/>
	</div>
	<div class="info" align="left" style="margin-left:120px">
		<label for="pr_img"><b>대표이미지</b></label>
		<input type="file" class="typeText" placeholder="이미지" name="pr_img" id="pr_img" size="65"/>
	</div>
	<div class="info" align="right" style="margin-right:95px;">
		<textarea id="editor1" name="pr_content"></textarea>
		<script>
			CKEDITOR.replace('editor1',{
				filebrowserUploadUrl: '/nycProject/ckeditorImageUpload.do',
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


<%@ include file="footer.jsp" %>
</body>
</html>