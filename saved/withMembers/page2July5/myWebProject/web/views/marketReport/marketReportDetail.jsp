<%@page import="com.kh.java.report.model.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ReportVo report = (ReportVo)request.getAttribute("report");
int currentPage = (int)request.getAttribute("currentPage");
 ReportVo reportNext = (ReportVo)request.getAttribute("reportNext");
ReportVo reportPre = (ReportVo)request.getAttribute("reportPre");

 String msgNext = null;
String msgPre = null;

 if(reportNext ==null){
 	msgNext = "다음 글이 없습니다.";
 }else if(reportPre ==null){
 	msgPre = "이전 게시글이 없습니다.";
 }

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#" >

<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">
<meta charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>프리마켓 제보</title>
<meta name="Robots" content="noindex,nofollow">
<meta name="title" content="" />
<meta name="author" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta property="og:site_name" content="한국" />
<meta property="og:title" content="유료스킨과 같은 고퀄리티의 퍼스트몰 무료스킨" />
<meta property="og:description" content="유료스킨과 같은 고퀄리티의 퍼스트몰 무료스킨" />
<meta property="fb:app_id" content="" />
<meta property="og:type" content="website" />

<!-- 자바스크립트 -->
<script type="text/javascript" src="http://edge-sample17.firstmall.kr/app/javascript/jquery/jquery.min.js"></script>
<style type="text/css">
table {margin:0 auto;}	#layout_config {width:1200px;margin:auto;}
	#layout_config_body, #layout_config_full {background-color:#ffffff;}
	#layout_config_full {width:100%;}
	#layout_config_body {width:1020px;}
	#layout_side {width:180px;}
	.wrap_inner {width:1200px; margin:auto;}
	
	
	.viewbox{
		width:1200px;
		margin-left: auto;
		margin-right: auto;
	}	
	.bbsbtn_wrap4 li{
	    display: inline-block;
	    float: right;
	    margin: 5px;
	}	
</style>

</head>
<body>

<%@ include file = "/views/common/header.jsp" %>

<div id="layout_body" style="min-width:1200px;">
<!-- 본문내용 시작 -->

	<div id="bbsview">

	<div class="viewbox" >


		<br><br><br><br>
		<table class="bbsview_table_style" width="100%" cellpadding="0" cellspacing="0" border="0">

			<caption>공지사항</caption>
			
			<colgroup>
				<col width="10%" /><col /><col width="10%" /><col width="20%" /><col width="10%" /><col width="10%" />
			</colgroup>

			<thead>
				<tr>
					<th scope="col" colspan="6"> <%=report.getTitle() %>  <img src="http://edge-sample17.firstmall.kr/admin/skin/default/images/board/icon/icon_hot.gif" title="hot" >  </th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th scope="row">작성자</th>

					<td class="name"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/icon/icon_admin.gif" id="icon_admin_img" align="absmiddle" style="vertical-align:middle;" /></td>

					<th scope="row">등록일</th>

					<td class="date"><%=report.getWriteDate() %></td>

					<th scope="row">조회수</th>

					<td class="hit"><%=report.getCount() %></td>

				</tr>

				<tr>

					<td colspan="6">

						<div class="content">

							<p><%=report.getContent() %></p>

						</div>

					</td>

				</tr>

			</tbody>

		</table>		


	<div id="prenextlist"><table style="width:100%">
	<colgroup>
		<col width="10%" />
		<col />
		<col width="20%" />
		<col width="15%" />
	</colgroup>
	<tbody>
		<tr>
		<%if(msgNext == null){ %>
			<td class="center"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/btn/btn_bbs_icon_prev.gif" class="mb3" align="absmiddle" /> 다음글</td>
			<td class="left"><span class="hand highlight-link boad_view_btn sbj" ><a href ="/mwp/reportDetail.do?reportNo=<%=reportNext.getNo()%>&currentPage=<%=currentPage%>"><%=reportNext.getTitle() %></a></span> </td>
			<td class="right"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/icon/icon_admin.gif" id="icon_admin_img" align="absmiddle" style="vertical-align:middle;" /></td>
			<td class="center"><%=reportNext.getWriteDate() %></td>
		<%}else{ %>
			<td class="center"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/btn/btn_bbs_icon_prev.gif" class="mb3" align="absmiddle" /> 다음글</td>
			<td class="left"><span class="hand highlight-link boad_view_btn sbj" > <%=msgNext%></span> </td>
			<td class="right"></td>
			<td class="center"></td>
		<%} %>
		</tr>
		<tr>
		<%if(msgPre == null){ %>
			<td class="center"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/btn/btn_bbs_icon_next.gif" align="absmiddle" />  이전글</td>
			<td class="left"><span class="hand highlight-link boad_view_btn sbj"><a href ="/mwp/reportDetail.do?reportNo=<%=reportPre.getNo()%>&currentPage=<%=currentPage%>"><%=reportPre.getTitle() %></a></span></td>
			<td class="right"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/icon/icon_admin.gif" id="icon_admin_img" align="absmiddle" style="vertical-align:middle;" /></td>
			<td class="center"><%=reportPre.getWriteDate() %></td>
		<%}else{ %>
			<td class="center"><img src="http://edge-sample17.firstmall.kr/data/skin/fruit_puro_gls/images/board/btn/btn_bbs_icon_next.gif" align="absmiddle" />  이전글</td>
			<td class="left"><span class="hand highlight-link boad_view_btn sbj"><a ><%=msgPre %></a></span></td>
			<td class="right"></td>
			<td class="center"></td>
		<%} %>
		</tr>
	</tbody>
</table></div>

	<!-- //이전/다음 -->



	<ul class="bbsbtn_wrap4">

		<li><button type="button" class="btn_sch" onclick = "reportList();">목록</button></li>
		<li><button type="button" class="btn_sch" onclick = "reportDelete();">삭제</button></li>
		<li><button type="button" class="btn_sch" onclick = "reportUpdate();">수정</button></li>

	</ul>

	<!-- //버튼 -->



</div>

<!-- //서브메뉴 바디 -->





<script type="text/javascript">

	$(window).load(function () {

	  //이미지 가로가 큰경우

	  $(".content img").each(function() {

	   var default_width = '920';//(본문레이아웃사이즈-100) 또는 직접값변경

	   if( $(this).width()> default_width || $(this).height()> default_width ) {

		imageResize(this,default_width);

	   }
	  });	  
	});
	
	function reportList(){
		location.href ="/mwp/marketReportList.do?currentPage=<%=currentPage%>";		
	}
	
	function reportDelete(){
		if(confirm("정말 삭제하시겠습니까??") ==true){
			location.href = "/mwp/marketDelete.do?currentPage=<%=currentPage%>&reportNo=<%=report.getNo()%>"
		}else{
			return;
		}
	}
	function reportUpdate(){
		location.href = "/mwp/marketUpdateForm.do?currentPage=<%=currentPage%>&reportNo=<%=report.getNo()%>"
	}
	

</script>
</div>
</div>				

<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>