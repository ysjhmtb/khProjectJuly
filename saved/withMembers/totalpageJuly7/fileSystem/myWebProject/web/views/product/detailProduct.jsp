<%@page import="com.kh.java.product.model.vo.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


.prodInfo{
	width:60%;
	height:400px;
	margin:10px;
	padding:40px;
	margin-top:40px;
}

.prodContent{
	width:60%;
/* 	height:800px; */
	height:auto;
	margin:20px;
	margin-top:10px;
	align:center;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
}

.sellerInfo{
	width:60%;
	height:100px;
	margin:10px;
}

.top{
	display:inline-block;
	height:95%;
	margin:10px;
}

#img-div{
	width:30%;
	margin-right:10px;
	border:1px solid lightgray;
}

#info-div{
	width:45%;
	margin-left:50px;
	text-align:center;
}

 .tableDiv{ 
 	height:73%;
 	margin:15px; 
 } 

.tableDiv table{
	width:98%;
	height:98%;
	border-spacing:0px;
}

.tableDiv table td{
	border-top:1px solid lightgray;
	text-align:left;
}
.tableDiv table td:nth-child(2n-1){
	width:100px;
}

.btnDiv{
	height:15%;
	margin:15px;
	text-align:right;
	padding:10px;
}

.btnDiv button{
	width:30%;
	height:80%;
	border:none;
	background:#FF8200;
	color:white;
	font-size:15px;
}

.sellerInfo table{
	width:98%;
	height:88%;
	align:center;
	border:1px solid lightgray;
	border-spacing:0px;
	border-collapse:collapse;
}

.sellerInfo table td{
	width:24%;
	border:1px solid lightgray;
}

.sellerInfo table td:nth-child(2n-1){
	background:rgba(207,209,200,0.2);
}
</style>
</head>
<body>

<%@ include file="/views/common1Page/header.jsp" %>
<%
	//수정
	int mno = 0;	

	if(member!=null){
	 mno = member.getMNO();
	};
	
	ProductVo pv = (ProductVo)request.getAttribute("pv");
%>
<script>
	$(function(){
		$("#addBtn").click(function(){
			var $count = $("#count").val();
			$("#count").val(+$count+1);
		});
		$("#subBtn").click(function(){
			var $count = $("#count").val();
			if(0<$count){
				$("#count").val(+$count-1);
			}
		});
		
		$("#cartBtn").click(function(){
// 			openDialogAlert(getAlert('gv011'),'400','140');
			var count = $("#count").val();
			location.href = "/mwp/addCart.do?pno=<%=pv.getPno()%>&count="+count+"&mno=<%=mno%>";
		});
	});
</script>

<div align="center">

	<div class="prodInfo">
		<div class="top" id="img-div">
			<img src="<%=pv.getImg_src() %>" width="100%" height="100%"/>
		</div>
		
		<div class="top" id="info-div">
			<div class="tableDiv">
			<table>
				<tr>
					<td>카테고리</td>
					<td><%=pv.getCategory() %></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=pv.getName() %></td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<p style="color:#FF6633;">
							<b style="font-size:23px"><%=pv.getPrice() %></b>
							<b style="font-size:16px">원</b>
						</p>
					</td>
				</tr>
				<tr>
					<td>판매자</td>
					<td><%=pv.getWriterName() %></td>
				</tr>
				<tr>
					<td>수량</td>
					<td>
						<button id="subBtn">-</button>
						<input type="text" size="2" id="count" value="1"/>
						<button id="addBtn">+</button>
					</td>
				</tr>
				<tr>
					<td rowspan="5" style="vertical-align:top;">
						<p style="margin-top:10px; font-size:14px;"><b>총 상품금액</b></p>
					</td>
					<td rowspan="5" style="vertical-align:top; text-align:right">
						<p style="color:#FF6633;">
							<b style="font-size:30px"><%=pv.getPrice() %></b>
							<b style="font-size:18px">원</b>
						</p>
					</td>
				</tr>
			</table>
			</div>
			<div class="btnDiv">
				<button id="cartBtn">장바구니</button>
				<button id="buyBtn">바로구매</button>
			</div>
		</div>
	</div>
	
	<div class="prodContent">
		<br><br><br><br><br><br><br>
			<%=pv.getContent() %>
		<br><br><br><br><br><br><br><br><br>
	</div>

	<div class="sellerInfo">
		<table>
			<tr>
				<td>판매자명</td>
				<td><%=pv.getWriterName() %></td>
				<td>공방주소</td>
				<td><%=pv.getWriterAddr() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=pv.getWriterPhone() %></td>
				<td>이메일</td>
				<td><%=pv.getWriterEmail() %></td>
			</tr>
		</table>
	</div>

<br/><br/><br/>

</div>
<%@ include file="/views/common1Page/footer.jsp" %>
</body>
</html>