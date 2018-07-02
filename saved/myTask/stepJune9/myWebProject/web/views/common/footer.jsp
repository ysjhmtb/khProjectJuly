<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#" >
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>Now You Can make this</title>
	
<meta property="og:url" content="main.html" />
<meta property="og:site_name" content="한국" />
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="fb:app_id" content="" />
<meta property="og:type" content="website" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/mwp/views/common/data/font/font.css" />
<link rel="stylesheet" type="text/css" href="/mwp/views/common/data/skin/fruit_puro_gls/css/style.css" />

<style>
	body {	}
	table {margin:0 auto;}	
	#layout_config {width:1200px;margin:auto;}
	#layout_config_body, #layout_config_full {background-color:#ffffff;}
	#layout_config_full {width:100%;}
	#layout_config_body {width:1020px;}
	#layout_side {width:180px;}
	.wrap_inner {width:1200px; margin:auto;}		


    #layout_topBar { }
	#layout_side.flying, #layout_config_body.flying, #layout_config_full.flying {margin-top:80px;}
	#layout_side.flying2, #layout_config_body.flying2, #layout_config_full.flying2 {margin-top:100px;}
    #layout_side.flying, #layout_config_body.flying, #layout_config_full.flying {margin-top:55px;}
    #layout_side.flying2, #layout_config_body.flying2, #layout_config_full.flying2 {margin-top:70px;}
</style>

</head>

<!-- 헤드 영역 끝 -->

<body>
<div id="layout_footer">	
	
	<div class="nav_wrap">

	</div>
	
	<!-- //하단메뉴 -->
	<div class="cs_wrap">
		<div class="wrap_inner">
			<ul>
				
				<!-- 전화번호 영업시간 정보 -->
				<li class="cs_center">
					<h4>CS CENTER</h4>
					<ul>
						<li><div class="phone">02-354-4771</div></li>		
						<li>MON-FRI&nbsp; am 09:00 ~ pm 06:00 / LUNCH&nbsp; pm 12:00 ~ pm 01:00</li>
						<li>Sat, Sun, Holiday OFF</li>
					</ul>
				</li>
				
				<!-- 메인페이지 하단 은행/인터넷뱅킹 -->
				<li class="cs_bank">
					<h4>BANK INFO</h4>
					<ul>			
						<li>국민은행 274528-21-149213</li>
						<li class="mt10">HOLDER : NYC</li>
						<li class="mt20">
							<select  name="select" onchange="window.open(this.value);" class="bank">
								<option value=""> 인터넷뱅킹 바로가기 </option>
								<option value="http://www.kbstar.com/">KB국민은행</option>
								<option value="http://www.ibk.co.kr/">IBK기업은행</option>
								<option value="http://banking.nonghyup.com/">농협</option>
								<option value="http://www.kfcc.co.kr/">MG새마을금고</option>
								<option value="http://www.shinhan.com/">신한은행</option>
								<option value="http://www.citibank.co.kr/">씨티은행</option>
								<option value="http://www.wooribank.com/">우리은행</option>
								<option value="http://www.epostbank.go.kr/">우체국</option>
								<option value="http://www.scfirstbank.com/">SC제일은행</option>
								<option value="http://www.hanabank.com/">KEB하나은행</option>
								<option value="http://www.knbank.co.kr/">경남은행</option>
								<option value="http://www.kjbank.com/">광주은행</option>
								<option value="http://www.daegubank.co.kr/">DGB대구은행</option>
								<option value="http://www.busanbank.co.kr/">BNK부산은행</option>
								<option value="http://www.jbbank.co.kr/">전북은행</option>
								<option value="http://www.chejubank.co.kr/">제주은행</option>
								<option value="http://www.suhyup.co.kr/">수협</option>
								<option value="http://www.cu.co.kr/">신협</option>								
							</select>
						</li>
					</ul>
				</li>
				
				<!-- 메인화면 하단 배송 조회, 반품 주소 -->
				<li class="cs_sns">
					<h4>DELIVERY</h4>
					<ul class="delivery">	
						<li>배송조회 : CJ택배 1588-0411</li>
						<li>반품주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 4층</li>
					</ul>
					<h4>SOCIAL NETWORK</h4>
					<ul class="sns">
						<li><a><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/ico_facebook.png" alt="페이스북" /></a></li>
						<li><a><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/ico_twitter.png" alt="트위터" /></a></li>
						<li><a><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/ico_instagram.png" alt="인스타그램" /></a></li>		
						<li><a><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/ico_naverblog.png" alt="네이버블로그" /></a></li>
						<li><a><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/ico_kakaostory.png" alt="카카오스토리" /></a></li>					
					</ul>
				</li>
				
				
				
				<!-- 제일 하단 SHOP MENU 와 그림 -->
				<li class="cs_menu">
					<h4>SHOP MENU</h4>
					<ul class="menu">
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i01.png" alt="" /><span class="on"></span></li>	
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i02.png" alt="" /><span class="on"></span></li>
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i03.png" alt="" /><span class="on"></span></li>
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i04.png" alt="" /><span class="on"></span></li>
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i05.png" alt="" /><span class="on"></span></li>
						<li><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/cs_i06.png" alt="" /><span class="on"></span></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	
	
	<!-- //고객센터 -->
	<div class="copy_wrap">
		<div class="wrap_inner relative">
			<h1><a href="index.html" target="_top"><img src="/mwp/views/common/data/skin/fruit_puro_gls/images/design/logo.png" alt="LOGO" /></a></h1>		
			<ul class="copy">
				<li class="first">회사명 : (주) Now You Can</li>
				<li>대표자 : 황인선</li>			
				<li>주소 : 서울시 강남구 테헤란로14길 6 남도빌딩 4층 </li>
				<li>전화 : 02-235-4771</li>
				<li>팩스 : 02-211-4771</li>
<br/>
				<li class="first">사업자등록번호 : 032-66-17140 <a href="javascript:;" onclick="window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1234567890','communicationViewPopup','width=750,height=700,scrollbars=yes')"></a></li>
				<li>통신판매업신고번호 : 제1234-서울강남56789호</li>			
				<li>개인정보 보호책임자 : 장건희</li>
				<li>이메일 : <a href="mailto:yourmail@yourdomain.com">his8457@hanmail.net</a></li><br />
				<li class="first">Copyright ⓒ <strong>(주) Now You Can</strong>. All Rights Reserved.</li>
				<li></li>
			</ul>	
			<span class="escrow">
				<form name="shop_check" method="post" action="http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp" target="kcp_pop">
				<input type="hidden" name="site_cd" value="N3711">
				</form>
					<script type="text/javascript">function go_check() {	var status = "width=500 height=450 menubar=no,scrollbars=no,resizable=no,status=no";	var obj = window.open("", "kcp_pop", status);	document.shop_check.submit();}
					</script>
			<img src="/mwp/views/common/data/icon/escrow_mark/kcp.png"  style="max-width:80px;" />
			</span>		
			<!-- //에스크로표기 -->
		
		
		</div>
	</div>
	<!-- //카피라이트 -->
</div>


<!-- //하단영역 : 끝 -->
<!-- //기본형 -->



<iframe name="actionFrame" id="actionFrame" src="main/blank.html" frameborder="0" width="100%" height="0"></iframe>
<div id="openDialogLayer" style="display:none">
	<div align="center" id="openDialogLayerMsg"></div>
</div>

<div id="ajaxLoadingLayer" style="display:none"></div>






<div id='popupChangePassword' class='hide'>
	<form id='passUpdateForm' method='post' action='login_process/popup_change_pass' target='actionFrame'>
		<input type='hidden' name='password_mode' value='update'>
		<table width='100%' cellpadding='0' cellspacing='0' border=0>
			<tr>
				<td colspan='2'>
					회원님의 소중한 개인정보 보호를 위해 비밀번호를 주기적으로 변경하시는 것이 좋습니다.
				</td>
			</tr>
			<tr><td colspan='2' height='10'></td></tr>
			<tr>
				<td width='110'>
					현재 비밀번호
				</td>
				<td>
					<input type='password' name='old_password' value='' size='30' class='passwordField'>
				</td>
			</tr>
			<tr><td colspan='2' height='5'></td></tr>
			<tr>
				<td>
					신규 비밀번호
				</td>
				<td>
					<input type='password' name='new_password' value='' size='30' class='passwordField'>
				</td>
			</tr>
			<tr><td colspan='2' height='5'></td></tr>
			<tr>
				<td>
					신규 비밀번호 확인
				</td>
				<td>
					<input type='password' name='re_new_password' value='' size='30' class='passwordField'>
				</td>
			</tr>
			<tr><td colspan='2' height='5'></td></tr>
			<tr>
				<td colspan='2'>
					<span class='desc'>6~20자, 영문 대소문자 또는 숫자 특수문자 중 2가지 이상 조합</span>
				</td>
			</tr>
			<tr><td colspan='2' height='10'></td></tr>
			<tr>
				<td colspan='2'>
					<label><input type='checkbox' name='update_rate' value='Y' onclick='update_rate_checked();'> 개월 이후에 비밀번호를 변경하겠습니다.</label>
				</td>
			</tr>
		</table>
		<div style="padding-top:10px;" class="center">
			<span class="btn large black"><button type="submit" class="setBtn">확인</button></span>
			<span class="btn large black">&nbsp;&nbsp;<button type='button' onclick='passwordAfterUpdate();'>취소</button></span>
		</div>
	</form>
	
</div>

</body>
</html>