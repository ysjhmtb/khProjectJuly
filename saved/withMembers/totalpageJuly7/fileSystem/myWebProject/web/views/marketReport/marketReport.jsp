<%@page import="com.kh.java.common.PageInfo"%>
<%@page import="com.kh.java.report.model.vo.ReportVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<ReportVo> list = (ArrayList)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getTotalCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage= pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String keyword = (String)request.getAttribute("keyword");
	if(keyword ==null){
		keyword = "";
	}
    %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#" >
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta charset=UTF-8">
<title>마켓 제보 목록</title>
<meta name="Robots" content="noindex,nofollow">
<meta name="title" content="" />
<meta name="author" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />

<meta property="og:url" content="http://edge-sample17.firstmall.kr/board/?id=faq" />
<meta property="og:site_name" content="한국" />
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="fb:app_id" content="" />
<meta property="og:type" content="website" />


<script>
	function movePage(pageNum){
		location.href = "/mwp/marketReportList.do?currentPage="+pageNum;
	}
	function updateMarketReport(){
		location.href ="/mwp/views/marketReport/marketReportWriter.jsp";
	}
	function marketReportDetail(reportNo){
		location.href = "/mwp/reportDetail.do?currentPage=<%=currentPage%>&reportNo="+reportNo;
	}
</script>

</head>
<body>
<style type="text/css">
	
	table {margin:0 auto;}	#layout_config {width:1200px;margin:auto;}
	#layout_config_body, #layout_config_full {background-color:#ffffff;}
	#layout_config_full {width:100%;}
	#layout_config_body {width:1020px;}
	#layout_side {width:180px;}
	.wrap_inner {width:1200px; margin:auto;}	
	
	

</style>
	
	<%@ include file = "/views/common/header.jsp" %>


	<div id="layout_config">
		<div id="layout_side"><div class="side_list">

	<h2>프리마켓 정보</h2>

	<ul>


		<li><a href="/mwp/mapList.do" >프리마켓</a></li>		

		<li><a href="/mwp/marketReviewList.do" >프리마켓 후기</a></li>

		<li><a href="/mwp/marketReportList.do" >프리마켓 제보</a></li>

		<li><a href="/mwp/noticeList.do" class="current">공지사항</a></li>
	</ul>

</div>

<!-- //측면영역 - 고객센터 --></div>
		<div id="layout_config_body"><div class="category_depth">
		</div>
<!-- //페이지경로 -->



<div class="h3_wrap">

	<h3>프리마켓 제보 목록</h3>

</div>




<!-- 본문내용 시작 -->

<div id="boardlayout">

	<!-- 검색영역 -->
	<div id="bbslist">
		<form name="boardsearch" id="boardsearch" method="post" action="/mwp/reportSearch.do">
	<input type="hidden" name="id" value="faq">

	<ul class="bbsbtn_wrap">
		<li>
			
			<!--검색폼 : 시작 -->
			<span class="searchform">
				<input type="text" name="keyword" id="keyword" placeholder="제목 및 내용 검색" value="<%=keyword %>" title="제목, 내용" size="40" class="input"  />
				<input type="submit" value=" 검색 " class="btn_sch small" />
				<input type="button" value=" 초기화 " class="bbs_btn hide" onclick="document.location.href='http://edge-sample17.firstmall.kr/board/?id=faq'"/>
			</span>
			<!-- 검색폼 : 끝 -->
		</li>
		<li>
			<input type="button" name="boad_write_btn_no"  id="boad_write_btn_no" board_id="" fileperm_read="" value="자주묻는질문 쓰기" class="btn_chg hidden" />
		</li>
	</ul>
</form>
<!-- //검색폼 -->

<table class="bbslist_table_style faqlist" width="100%" border="0" cellpadding="0" cellspacing="0" summary="공지사항입니다">
	<caption>자주묻는질문</caption>
	<!-- 테이블 헤더 : 시작 -->

	<thead>
		<tr>
			<th >번호</th>
			<th width="65%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<!-- 테이블 헤더 : 끝 -->
	<!-- 리스트 : 시작 -->
	<tbody>
		<!-- 리스트데이터 : 시작 -->
		<%if(list.size() ==0){ %>
		<tr>
			<td colspan="4" class="nodata">
				제보한 마켓이 없습니다.
			</td>
		</tr>
		<%}else{ 
		for(ReportVo rv : list){%>
			<tr>
				<td><%=rv.getNo()%></td>
				<td><a onclick = "marketReportDetail(<%=rv.getNo()%>);" style ="cursor:pointer"><%=rv.getTitle() %> </a></td>
				<td><%=rv.getName() %></td>
				<td><%=rv.getWriteDate() %></td>
				<td><%=rv.getCount() %></td>
				
			</tr>
		<%} 
		}%>
	</tbody>
	<!-- 리스트 : 끝 -->
</table>
<!-- //테이블 -->

<ul class="bbsbtn_wrap2">
	<li>
	</li>
	<li>
<!-- 페이징 -->
<div class="paging_navigation">
	<p>
	<%for(int i = startPage; i <=endPage; i++){%>
		<a class="on red" onclick ="movePage(<%=i%>);" id ="page" style ="cursor:pointer"><%=i %></a>
	<%}%>
	</p>
</div>
<!-- //페이징 -->
 	</li>
	<li class="last">
		<button type="button" class="btn_sch" onclick="updateMarketReport();">제보하기</button>
	</li>
</ul>


</div>	
</div>

<!-- //본문내용 끝 -->


</div>				
	</div>


	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>