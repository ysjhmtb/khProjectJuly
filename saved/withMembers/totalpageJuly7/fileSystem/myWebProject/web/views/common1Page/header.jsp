<%@page import="com.kh.java.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#" >
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">
 <% MemberVo member = (MemberVo)session.getAttribute("user"); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>Now You Can make this</title>
	
<meta name="Robots" content="index,follow">
<meta name="title" content="" />
<meta name="author" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />

<meta property="og:url" content="main.html" />
<meta property="og:site_name" content="한국" />
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="fb:app_id" content="" />
<meta property="og:type" content="website" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/mwp/views/common1Page/data/font/font.css" />
<link rel="stylesheet" type="text/css" href="/mwp/views/common1Page/data/skin/fruit_puro_gls/css/style.css" />

<!-- 파비콘 -->
<link rel="shortcut icon" href="/mwp/views/common1Page/data/icon/favicon/favicon1497244551.html" />

<!-- 자바스크립트 -->
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.poshytip.min.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.activity-indicator-1.0.0.min.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.cookie.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.slides.min.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.bxslider.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.placeholder.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/custom-select-box.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/plugin/jquery.sprintf.js"></script>

<script type="text/javascript" src="/mwp/views/common1Page/data/js/language/L10n_KR.js?dummy=20180527072837"></script>
<!--
<script type="text/javascript" src="/mwp/views/common1Page/data/js/language/L10n_KR0c73.js?dummy=20180525001153">
</script>
-->

<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/front-layout0c73.js?dummy=20180525001153"></script>
<!--
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/common0c73.js?dummy=20180525001153"></script>
-->
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/base64.js"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/goods-display0c73.js?dummy=20180525001153"></script>

<script type="text/javascript" src="/mwp/views/common1Page/data/skin/fruit_puro_gls/common/script.js"></script>

<!-- 아래 스크립트 영역 추가했더니 기능 돌아감  -->
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/common.js?dummy=20180527002547"></script>
<script type="text/javascript" src="/mwp/views/common1Page/app/javascript/js/common-function.js?v=140729"></script>
<script src="/mwp/views/common1Page/app/javascript/js/echo.js"></script>
<!-- 위 스크립트 영역 추가했더니 기능 돌아감  -->

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>


<script type="text/javascript">
	var gl_mobile_mode	= 0;
	var gl_set_mode		= 'pc';
	var gl_language		= 'KR';
	var gl_basic_currency					= "KRW";
	var gl_skin_currency					= "KRW";  
	var gl_basic_currency_symbol			= "원";
	var gl_basic_currency_symbol_position	= "after";

	$(function(){

	});
</script>

<style type="text/css">
	/* 레이아웃설정 폰트 적용 */
	#layout_body * {}

	/* 레이아웃설정 스크롤바색상 적용 */
</style>
<!-- /자바스크립트 -->

<style>
	body {	}
	table {margin:0 auto;}	
	#layout_config {width:1200px;margin:auto;}
	#layout_config_body, #layout_config_full {background-color:#ffffff;}
	#layout_config_full {width:100%;}
	#layout_config_body {width:1020px;}
	#layout_side {width:180px;}
	.wrap_inner {width:1200px; margin:auto;}		
</style>

<style>
    #layout_topBar { }
	#layout_side.flying, #layout_config_body.flying, #layout_config_full.flying {margin-top:80px;}
	#layout_side.flying2, #layout_config_body.flying2, #layout_config_full.flying2 {margin-top:100px;}
    #layout_side.flying, #layout_config_body.flying, #layout_config_full.flying {margin-top:55px;}
    #layout_side.flying2, #layout_config_body.flying2, #layout_config_full.flying2 {margin-top:70px;}
</style>

</head>

<!-- 헤드 영역 끝 -->


<body>
	<script type="text/javascript">
		//<![CDATA[
		 var is_user = false;
		 var plus_app_id = '';
		 var fammercemode = '';
		 var fbId = "";
		 var fbAccessToken = "";
		 var isLogin = false;
		 var isFirst = true;
		 var fbUid = "";
		 var fbName = "";
		 var mbpage = false;
		 var orderpage = false;
		//]]>
	</script>
	<!--facebook area-->
	<div id="fb-root"></div>
	<!--facebook area end-->



<!-- 상단영역 : 시작 -->

<div id="layout_body" style="min-width:1200px;">



<!--최상단 광고, 로고, 검색창, 로그인,회원가입 영역 : 시작 -->
<div id="layout_header">
	<div class="nav_wrap">
		<div class="wrap_inner relative">
			          
			<!-- 로그인 회원가입 장바구니 마이페이지 : 시작 -->
			<div class="nav">
			<%if(member == null){ %>
				<ul class="fleft">
				
					<li><a href="/mwp/views/member/login.jsp">LOGIN</a></li>
					<li class="relative"><a href="/mwp/views/member/agreement.jsp">JOIN</a>
					</li>
					<li><a href="/mwp/views/product/cart.jsp">CART (0)</a></li>
					<li class="cs_link"><a href="/mwp/views/member/mypage.jsp">MYPAGE</a></li>
					<li class="cs_star"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/star_icon.png" /> </li>
				</ul>
			</div>
			<!-- 로그인 회원가입 장바구니 마이페이지 : 끝-->
		</div>
	</div>
	<%}else{%>
		<ul class="fleft">
				
					<li ><font color="white"><%=member.getM_NAME() %>님(<%=member.getM_CATEGORY() %>)</font></li>
					<li class="cs_link"><a href="/mwp/logout.do">로그아웃</a></li>
					<%if(member.getM_CATEGORY().equals("작가")) {%>
					<li class="relative"><a href="/mwp/views/product/addProduct.jsp">상품등록</a>	</li>
					<%}else{ %>
						
					<%} %>
					
			
					
					
				
					<li><a href="/mwp/views/product/cart.jsp">CART (0)</a></li>
					<li class="cs_link"><a href="/mwp/views/member/mypage.jsp">MYPAGE</a></li>
					<li class="cs_star"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/star_icon.png" /> </li>
				</ul>
			</div>
			<!-- 로그인 회원가입 장바구니 마이페이지 : 끝-->
		</div>
	</div>
	<%} %>
	
	
	<!---------------------- 검색창, 로고 부분 상단메뉴 : 시작 ------------------------>
	<div class="logo_wrap">
		<div class="wrap_inner relative">			
			<form class="fleft" name="topSearchForm" id="topSearchForm" action="goods/search">
				<input type="hidden" name="keyword_log_flag" value="Y" />
				<input type="text" name="search_text" value=""  />
				<input type="image" src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/zoom.gif" value="검색" />
			</form>

     <!--------------------- 로고 교체 ----------------------> 
            <ul class="top_bnr">
                 <li><h1><a href="/mwp/indexMarket.jsp" target="_self"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/logo.jpg" alt="(주) 귀사의 회사명" /></a></h1></li>
            </ul>
		</div>
	</div>
</div>
<!--최상단 광고, 로고, 검색창, 로그인,회원가입 영역 : 끝 -->


<!-- 스크롤 하단으로 내려갔을때 카테고리영역 상단에 고정시켜주는 기능 : 시작 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#layout_topBar").each(function(){
			var obj = $(this);
			var top_loc = obj.offset().top;
			$(document).scroll(function(){				
				if(top_loc < $(document).scrollTop()){
					obj.addClass("flying");
					if($(".designPopupBand").css('display')=="block"){
						$("#layout_header .logo_wrap").hide();
						$("#layout_side, #layout_config_body, #layout_config_full").removeClass("flying");
						$("#layout_side, #layout_config_body, #layout_config_full").addClass("flying2");						
					}else{
						$("#layout_side, #layout_config_body, #layout_config_full").addClass("flying");
					}					
				}else{
					obj.removeClass('flying');
					if($(".designPopupBand").css('display')=="block"){
						$("#layout_header .logo_wrap").show();
						$("#layout_side, #layout_config_body, #layout_config_full").removeClass("flying");
						$("#layout_side, #layout_config_body, #layout_config_full").removeClass("flying2");
					}else{
						$("#layout_side, #layout_config_body, #layout_config_full").removeClass("flying");
					}
				}
			});
		});
	});
</script>
<!-- 스크롤 하단으로 내려갔을때 카테고리영역 상단에 고정시켜주는 기능 : 끝 -->



<!---------------------- 카테고리영역 : 시작 ---------------------->
<div id="layout_topBar" style="border-bottom:1px solid lightgray;">
	<div class="wrap_inner relative">
		<ul class="showCategoryNavigation">
			<li><div class='designCategoryNavigation' id='categoryNavigation5b06d639964c1' designElement='categoryNavigation' templatePath='/mwp/indexMarket.jsp'>
				<ul class="category_wrap">
					<li class="categoryDepth">
						<a href="javascript:;" class="categoryAllBtn"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/ico_category2.png" alt=""> &nbsp;Category</a>
					</li>
										
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="/mwp/views/common1Page/goods/catalog7ff.jsp">액세서리</a>
						<div class="relative">
							<ul class="categorySub">
							<li>
								<ul class="categorySubItems" style="text-align:center">
									<li class="categorySubDepth"><a href="/mwp/views/common1Page/goods/catalog7ff.jsp#firstTag">반지</a></li>
									<li class="categorySubDepth"><a href="/mwp/views/common1Page/goods/catalog7ff.jsp#secondTag">귀걸이</a></li>
									<li class="categorySubDepth"><a href="/mwp/views/common1Page/goods/catalog7ff.jsp#thirdTag">팔찌</a></li>
								</ul>
							</li>				
						</ul>
						</div>
					</li>  
										
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">패션잡화</a>
						<div class="relative">
							<ul class="categorySub">
								<li class="categorySubBar"> </li>
								<li>
									<ul class="categorySubItems" style="text-align: center">
										<li class="categorySubDepth"><a href="#">수제화</a></li>
										<li class="categorySubDepth"><a href="#">가방,파우치</a></li>
										<li class="categorySubDepth"><a href="#">지갑</a></li>
									</ul>
								</li>				
							</ul>
						</div>
					</li>
									
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">공예</a>
					</li>
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">생활소품</a>
					</li>
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">인테리어</a>
					</li>
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">수제(먹거리)</a>
					</li>
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">팬시,아트</a>
					</li>
					<li class="categoryDepth1" style="width:10.526315789474%">
						<a href="#">기타</a>
					</li>
				</ul>
			<div class="categoryAll_wrap">
				<div class="categoryAllContainer"></div>
			</div>

					</div>
				</li>
			</ul>
		</div>
		
	<div class="relative">
		<div class="categorySub2_bg"></div>
	</div>
</div>
<!-- 상단 카테고리 메뉴 : 끝 -->
	
	
	
<div id="layout_scroll" class="wrap_inner">
		<div class="fright">
			<div id="rightScrollLayer">

<!-- 우측 퀵 아이콘 바 영역 CSS -->
<style type="text/css">
	.rightQuickMenuWrap2.defaultClose{right:-220px;}
</style>

	<!-- 우측 퀵 아이콘 바 영역 -->
 <div id="rightQuickMenuWrap" class="rightQuickMenuWrap2 defaultClose">
	<a href="javascript:;" class="rightQuick_close"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_close.png" alt="close" /></a>
	<a href="javascript:;" class="rightQuick_open"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_open.png" alt="open" /></a>
	<div class="right_wrap">
		<h3>QUICK ICON</h3>		
		<ul class="quick">
			<li><a href="order/cart.html"><span><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/r_icon01.gif" alt="장바구니" /></span>장바구니</a></li>	
			<li><a href="/mwp/views/member/mypage.jsp"><span><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/r_icon04.gif" alt="마이페이지" /></span>마이페이지</a></li>			
			<li><a href="/mwp/views/common1Page/member/login0c75.html"><span><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/design/r_icon06.gif" alt="배송조회" /></span>배송조회</a></li>
		</ul>		
		
		<!-- //게시판 -->
		<div id="rightQuickMenu" class="rightQuickMenu" style="margin:-40px 0 40px">
			<div class="rightQuickTitle">QUICK MENU</div>
			<div class="right_item_recent">
				
				<!-- //최근본상품 -->
				<p class="rightTitleMenu">최근본상품 <span id="right_recent_total">14</span></p>
				  <div class="right_itemList">
					<p class="rightBorderTop"></p>
					<ul></ul>
					<div id="right_page_div" class="right_quick_paging">
						<a class="right_quick_btn_prev" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_left_icon.png" alt="prev" /></a>
						<div class="right_page_box"><span class="right_quick_current_page bold"></span><span class="right_quick_separation">/</span><span class="right_quick_total_page"></span></div>
						<a class="right_quick_btn_next" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_right_icon.png" alt="next" /></a>
					</div>
					<p class="rightBoxBorder"></p>
				</div>
			</div>
			
			<!-- //추천상품 -->
			<div class="right_item_recomm">
				<div class="rightTitleMenu"><div designElement='goodsRecommDisplay'>추천상품 <span id="right_recomm_total">0</span></div></div>
				<div class="right_itemList">
					<p class="rightBorderTop"></p>
					<ul></ul>
					<div id="right_page_div" class="right_quick_paging">
						<a class="right_quick_btn_prev" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_left_icon.png" alt="prev" /></a>
						<div class="right_page_box"><span class="right_quick_current_page bold"></span><span class="right_quick_separation">/</span><span class="right_quick_total_page"></span></div>
						<a class="right_quick_btn_next" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_right_icon.png" alt="next" /></a>
					</div>
					<p class="rightBoxBorder"></p>
				</div>
			</div>
			
			
			<!-- //장바구니 -->
			<div class="right_item_cart">
				<p class="rightTitleMenu">장바구니 <span id="right_cart_total">0</span></p>
				<div class="right_itemList">
					<p class="rightBorderTop"></p>
					<ul></ul>
					<div id="right_page_div" class="right_quick_paging">
						<a class="right_quick_btn_prev" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_left_icon.png" alt="prev" /></a>
						<div class="right_page_box"><span class="right_quick_current_page bold"></span><span class="right_quick_separation">/</span><span class="right_quick_total_page"></span></div>
						<a class="right_quick_btn_next" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_right_icon.png" alt="next" /></a>
					</div>
					<p class="rightBoxBorder"></p>
				</div>
			</div>
			
			
			<!-- //위시리스트 -->
			<div class="right_item_wish">
				<p class="rightTitleMenu">위시리스트 <span id="right_wish_total">0</span></p>
				<div class="right_itemList">
					<p class="rightBorderTop"></p>
					<ul></ul>
					<div id="right_page_div" class="right_quick_paging">
						<a class="right_quick_btn_prev" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_left_icon.png" alt="prev" /></a>
						<div class="right_page_box"><span class="right_quick_current_page bold"></span><span class="right_quick_separation">/</span><span class="right_quick_total_page"></span></div>
						<a class="right_quick_btn_next" href="#"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_menu_right_icon.png" alt="next" /></a>
					</div>
					<p class="rightBoxBorder"></p>
				</div>
			</div>
			
			<!-- 즐겨 찾기 -->
			<div class="rightBookMark">
				<a href="javascript:;"  onclick="bookmarksitelay('/mwp/indexMarket.jsp', '한국',  '/member/login?return_url=%2Fmain' )" id="linkbookmark" rel="sidebar" class="btn_move" style="width:90%;" title="즐겨찾기에 추가">즐겨찾기</a>
			</div>
			
		</div>
		
		
		
		<!-- 우측 바 : 무통장 입금계좌 -->
		<h3>BANK INFO</h3>
		<ul>			
			<li>국민은행 274528-21-049213</li>
			<li>HOLDER : NYC</li>
		</ul>
		
		<!-- 우측 바 : 고객센터 -->
		<h3>CS CENTER</h3>
		<ul>
			<li><div class="phone">02-354-4771</div></li>		
			<li>MON-FRI&nbsp; am 09:00 ~ pm 06:00</li>
			<li>LUNCH&nbsp; &nbsp; &nbsp;pm 12:00 ~ pm 01:00</li>
			<li>Sat, Sun, Holiday OFF</li>
		</ul>
		
		<!-- 우측 슬라이드 바 광고 -->
		<div class="rBanner">
			<script type='text/javascript' src='/mwp/views/common1Page/app/javascript/jquery/jquery.ui.touch-punch.min.js'></script>
			<script type='text/javascript' src='/mwp/views/common1Page/app/javascript/plugin/anibanner/jquery.anibanner7687.js'></script><link rel='stylesheet' type='text/css' href='/mwp/views/common1Page/app/javascript/plugin/anibanner/anibanner.css' />
			<div class='designBanner' designElement='banner' templatePath='/mwp/indexMarket.jsp' bannerSeq='2' style='height:300px;'>
			<img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/images_1.jpg" width="100%" height="240" /></div>
			
			<script>
				$(function(){
					var bannerTimer2;
					var settings2= {
						'platform' : 'pc',
						'modtime' : '1504529082',
						'style' : 'pc_style_2',
						'height' : '300',
						'background_color' : '#ffffff',
						'background_image' : '/mwp/views/common1Page/data/skin/fruit_puro_gls/',
						'background_repeat' : 'no-repeat',
						'background_position' : 'left top',
						'image_border_use' : 'n',
						'image_border_width' : '0',
						'image_border_color' : '#ffffff',
						'image_opacity_use' : 'n',
						'image_opacity_percent' : '0',
						'image_top_margin' : '0',
						'image_side_margin' : '0',
						'image_width' : '175',
						'image_height' : '240',
						'navigation_btn_style' : '',
						'navigation_btn_visible' : 'fixed',
						'navigation_paging_style' : 'paging_style_3',
						'navigation_paging_height' : '',
						'navigation_paging_align' : 'center',
						'navigation_paging_position' : 'bottom',
						'navigation_paging_margin' : '10',
						'navigation_paging_spacing' : '0',
						'slide_event' : 'auto',
						'images' : 
						[{'link':'/','target':'_self','image':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/images_1.jpg'},{'link':'/','target':'_self','image':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/images_2.jpg'},{'link':'/','target':'_self','image':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/images_3.jpg'}],
						'navigation_paging_custom_images' :
						[{'active':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/','inactive':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/'},{'active':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/','inactive':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/'},{'active':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/','inactive':'/mwp/views/common1Page/data/skin/fruit_puro_gls/images/banner/2/'}]};
					
			if (typeof(callAnibanner2) != 'function'){
				function callAnibanner2() {
					if (typeof ($.custom.anibanner) != 'undefined') {
						$('.designBanner[bannerSeq="2"]').anibanner(settings2);
					}
					clearInterval(bannerTimer2);
				}
			}
			if (typeof($.custom.anibanner) == 'undefined'){
				clearInterval(bannerTimer2);
				bannerTimer2 = setInterval(callAnibanner2,100);
			} else {
				$('.designBanner[bannerSeq="2"]').anibanner(settings2);
			}
	})</script>
		</div>
		<!-- 우측 슬라이드 바 광고 끝 -->
		
	</div>
	<!--우측하단 퀵 최상, 최하단 바로이동 화살표 -->
	<div id="rightQuickMenuBottom" class="rightQuickMenuBottom">
		<a href="javascript:;" class="rightTop" onclick="$('html,body').animate({scrollTop:0},'slow');"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_top2.png" alt="TOP" /></a>
		<a href="javascript:;" class="rightBottom" onclick="$('html,body').animate({scrollTop:$(document).height()},'slow');"><img src="/mwp/views/common1Page/data/skin/fruit_puro_gls/images/common/right_quick_bottom2.png" alt="BOTTOM" /></a>
	</div>
	<!--우측하단 퀵 최상, 최하단 바로이동 화살표 : 끝 -->
</div>


<script type="text/javascript">
	$(document).ready(function() {
		$set_right_recent = 1;	/* 최근 본상품 설정 */
		$set_right_recomm = 5;	/* 추천상품 설정 */
		$set_right_cart = 5;		/* 장바구니 설정 */
		$set_right_wish = 5;		/* 위시리스트 설정 */
		
		/* 퀵메뉴 슬라이드 */
		$(".rightQuick_close").click(function() {
			$.cookie('rightQuickMenuWrapClosed',1,{path:'/'});
			rightQuickMenuClose();
		})
		$(".rightQuick_open").click(function() {
			$.cookie('rightQuickMenuWrapClosed',null,{path:'/'});
			rightQuickMenuOpen();
		});			
		if($.cookie('rightQuickMenuWrapClosed')){
			rightQuickMenuClose();
		}
		$(".rightQuickMenuWrap2").removeClass('defaultClose');

		/* TOP버튼 */
		if(parseInt($(document).height())>parseInt($(window).height())){
			$(window).scroll(function(){
				if($(window).scrollTop()>100){
					$("#rightQuickMenuBottom").show();
				}else{
					$("#rightQuickMenuBottom").hide();
				}
			});
		}
		/* 최근본상품 */
		$(".quick .recent").bind("click", function(){
			$(".rightQuickMenu").slideToggle();
		});
	});
	/* 오픈 */
	function rightQuickMenuOpen(){
		$(".rightQuickMenuWrap2").stop().animate({'right':'0'}, 400);
		$("#rightQuickMenuBottom").stop().animate({'right':'246px'}, 400);
		$(".designPopupClose").stop().animate({'right':'250px'}, 400);
		$(".rightQuick_open").hide();
		$(".rightQuick_close").show();
	}
	/* 닫기 */
	function rightQuickMenuClose(){
		$(".rightQuickMenuWrap2").stop().animate({'right':'-220px'}, 400);
		$("#rightQuickMenuBottom").stop().animate({'right':'30px'}, 400);
		$(".designPopupClose").stop().animate({'right':'35px'}, 400);
		$(".rightQuick_open").show();
		$(".rightQuick_close").hide();		
	}
</script></div>
		</div>
	</div>
	<!-- //우측 스크롤 끝-->
	
</body>
</html>




