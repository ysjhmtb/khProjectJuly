<%@page import="com.kh.java.common.PageInfo"%>
<%@page import="com.kh.java.map.model.vo.MapVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MapVo> list = (ArrayList)request.getAttribute("list");
	
		

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getTotalCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage= pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>
	.displayTabContentsContainer ul li{
		padding : 10px;
	}
	
	.displayTabContentsContainer{
		margin-top : 100px;
		margin-bottom: 50px;
	}

</style>
<script>
	function movePage(pageNum){
		location.href = "/mwp/marketReviewList.do?currentPage="+pageNum;
	}
</script>
</head>
<body>
<%@ include file = "/views/common/header.jsp" %>



<div id="boardlayout">
<div class="h3_wrap">

	<h3>프리마켓 선택</h3>

</div>

<div class="displayTabContentsContainer displayTabContentsA ">
		
		<ul>
		<%if(list.size()!=0){
			for(MapVo mv : list){ %>
			<li class="goodsDisplayWrap">
				<div class="goodsDisplayItemWrap">
					<div class="goodsDisplayImageWrap" >
						<a href="reviewList.do?marketNo=<%=mv.getMarketNo()%>&marketName=<%=mv.getMarketName() %>">
								<img src="/mwp/upload/<%=mv.getFileName() %>" class="goodsDisplayImage" width="400px"  alt="박스형상품1" />
						</a>
					</div>
						<ul class="goodsDisplayTextWrap" style="text-align:center;">
						
						<li>
							<a href="reviewList.do?marketNo=<%=mv.getMarketNo()%>&marketName=<%=mv.getMarketName() %>"><span style="color:#333;font-size:10pt;font-weight:normal;text-decoration:none;" class="goods_name"><%=mv.getMarketName() %></span></a>
						</li>
						<!-- //상품명 -->
						<li>
							<span style = "color:#888;font-size:9pt;font-weight:nomal;text-decoration:none;" class="summary">
							리뷰 갯수 : <%=mv.getReviewTotalCount()%>개<br>기간 : <%=mv.getStartDay() %> ~ <%=mv.getEndDay() %></span>
						</li>
					</ul>
				</div>
			</li>
			<%}
			}%>

			
		</ul>
</div>
<div class="paging_navigation">
	<p>
	<%for(int i = startPage; i <=endPage; i++){%>
		<a class="on red" onclick ="movePage(<%=i%>);" id ="page" style ="cursor:pointer"><%=i %></a>
	<%}%>
	</p>
</div>
</div>







<%@ include file = "/views/common/footer.jsp" %>

</body>
</html>