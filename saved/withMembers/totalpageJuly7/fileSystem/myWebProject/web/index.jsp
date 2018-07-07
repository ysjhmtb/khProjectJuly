<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>EVERLAND RESORT</title>

	<meta name="description" content="EVERLAND RESORT">
	<meta name="keywords" content="EVERLAND RESORT">
	<meta name="viewport" content="width=1600">
	<link rel="stylesheet" href="css/intro.css" media="all">
</head>

<body>

	<div id="wrapper">
		<div class="contents">
			<div class="half">
				<div class="everland">
					<h2 class="logo"></h2>
					<div class="bg">
						<div class="tit_box">
							<p style="color:#2e2e2f;"></p>
							<h3 class="title" style="color:#ed4c06;"><span></span><small style="color:#2e2e2f;"></small></h3>
						</div>
						<div class="dim"></div>
					</div>
					<div class="btn_box">
						
						
						<!-- 1번 수제품 판매/구매 이동 페이지 경로 설정 -->
							<a href="indexMarket.jsp">
								
								
								<div class="thumb"><br><br><br>수제품 판매/구매</div>
								<span class="arrow">바로가기</span>
							</a>
						</div>
				</div>
				<div class="caribbean">
					<h2 class="logo"></h2>
					<div class="bg">
						<div class="tit_box">
							<p style="color:#fff;"></p>
							<h3 class="title" style="color:#fff;"><span style="color:#08e5ff; font-size:40px;"></span></h3>
						</div>
						<div class="dim"></div>
					</div>
					<div class="btn_box">
						
						
						<!-- 2번 프리마켓 일정 정보 이동 페이지 경로 설정 -->
							<a href="indexMarketInfo.jsp">
								
								
								<div class="thumb"><br><br><br>프리마켓 일정</div>
								<span class="arrow">바로가기</span>
							</a>
						</div>
				</div>
                <div class="lecture">
					<h2 class="logo"></h2>
					<div class="bg">
						<div class="tit_box">
							<p style="color:#fff;"></p>
							<h3 class="title" style="color:#fff;"><span style="color:#08e5ff; font-size:40px;"></span></h3>
						</div>
						<div class="dim"></div>
					</div>
					<div class="btn_box">
						
						
						<!-- 3번 오프라인 강의 이동 페이지 경로 설정 -->
							<a href="caribbean/main.html">
								
								
								<div class="thumb"><br><br><br>강의 정보</div>
								<span class="arrow">바로가기</span>
							</a>
						</div>
				</div>
			</div>
		</div>
		
        
        <div id="footer">
            <div class="resort_logo"><a href="intro.html"></a></div>
			<div class="nyc_info">회사명 : (주) Now You Can | 대표자 : 황인선	| 주소 : 서울시 강남구 테헤란로14길 6 남도빌딩 4층 | 전화 : 02-235-4771  | 팩스 : 02-211-4771 
| 사업자등록번호 : 032-66-17140 | </div>
			<div class="nyc_info">
			통신판매업신고번호 : 제1234-서울강남56789호	| 개인정보 보호책임자 : 장건희 | 이메일 : his8457@hanmail.net |
Copyright ⓒ (주) Now You Can. All Rights Reserved.
			</div>
			 
			
			
			
			
			
	</div>

	<script src="js/jquery-1.12.4.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/analytics.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			var sel_box = $('.half > div')
			$(sel_box).hover(function(){
				$(this).siblings().toggleClass("on");
			});

		});
	</script>

</body>
</html>