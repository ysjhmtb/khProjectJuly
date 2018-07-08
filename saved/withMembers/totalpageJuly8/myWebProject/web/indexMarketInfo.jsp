<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.java.map.model.vo.MapVo"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/mwp/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/mwp/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type = "text/javascript"  src='/mwp/lib/moment.min.js'></script>
<script type = "text/javascript"  src='/mwp/lib/jquery.min.js'></script>
<script src='/mwp/calendar/fullcalendar.js'></script>


<script>
$(document).ready(function(){
	
	$.ajax({
		url : "/mwp/calendarSelect.do",
		type : "get",
		success : function(data){
			console.log("성공",data);
			
			calendarSel(data);
		},error : function(e){
			console.log("error",e);
		}
	});
	
	$.ajax({
		url : "/mwp/marketSelect.do",
		type : "get",
		success : function(data){
			console.log("maket list = ",data);
			var map;
			var resultHtmlImg = "";
			for(var key in data){
				map = data[key];
				resultHtmlImg += "<div class='catlog'> ";
				resultHtmlImg += "<a href=/mwp/mapDetail.do?marNo="+map.marketNo+">"
				resultHtmlImg += "<img src = '/mwp/upload/"+map.fileName+"' width='300px'><br><br><br> ";
				resultHtmlImg += "<span style = 'color:#888;font-size:9pt;font-weight:nomal;text-decoration:none;' class='summary'>"+map.marketName+"<br>";
				resultHtmlImg += map.start+" ~ "+map.end+"</span> ";
				resultHtmlImg += "</div> ";			
				
			}
			$("#marketCatalogArea").html(resultHtmlImg);
		},error : function(e){
			console.log("error",e);
		}
	});

  });
  function calendarSel(data){
	  $('#calendar').fullCalendar({
	      header: {
	        left: '',
	        center: 'title',
	        right: ''
	      },
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      businessHours: true,
	      local:'ko',
	      
	       	events: data
	    });
  }
  $(function(){
	
	  
  $("#map").click(function(){
	  location.href="/mwp/mapList.do";
  });
	  
  });
  
  
</script>
<style>
body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
   max-width: 700px; 
	width:100%;
    margin-left:480px;
 	margin-top: 10px;
   float:left;
  }
	
	#midArea{
		width:1200px;
		height:auto;
		
		margin: 2px;
	}
	#outArea{
/* 		border: 1px solid black; */
		width: 465px;
		height: 307px;
		float:left;
		margin-top: 59px;
		margin-bottom: 100px;
	}
	#countdown,#map{
/* 		border: 1px solid black; */
	
	}
	#countdown{
	
		padding-top:10%;
		padding-bottom:10%;
		padding-left:7%;
		background-image: url("/mwp/upload/indexImage/1467362563486.jpg");
		background-size: cover;
		width:auto;
		height:25%;
		font-size:45px;
		font-family:"Helvetica";
	}
	#map{
		height:30%;
		background-image: url("/mwp/upload/indexImage/mapBack.jpg");
		background-size: cover;
		cursor: pointer;
		font-size: 55px;
		font-family: 'Gaegu', cursive;
		text-align: center;
		padding-top: 14px;
		color:#FF7493;
	}
	
	#marketCatalogArea{
		width:1150px;
		height: 500px;
/* 		margin-left:370px; */
		margin-left:480px;
		margin-top: 60px;
		margin-bottom: 20px;
		float:left;
	}
	.catlog{
/* 		border:1px solid black; */
		height: 400px;
		width: 300px;
		margin:40px;
		float: left;
		text-align: center;
	}
	
	#catlog1{
		margin-left: 30px;
	}
	
	.title{
		border: 1px solid black;
		height:100px;
		width:100%;
		margin-top: 100%;
	}
	.h3_wrap{
		margin-bottom:0px; 
	}
	.main_slider{
		margin-bottom: 60px;
	}


</style>

  





</head>
<body>

	<%@ include file = "/views/common/header.jsp" %>
	<!-- 중앙 슬라이드 배너 시작-->
	<div id="layout_config">
		<div id="layout_config_full">

<style type="text/css">
	body {width:100%; height:100%; overflow-x:hidden;}
	#layout_config {width:100%; margin:0 auto;}	
	#layout_topBar {margin-bottom:0 !important;}
	.main_display {width:1200px; margin:0 auto;}
	.main_slider .designBanner {width:100% !important; margin:0 auto !important;}
	.main_slider .designBanner .anibanner_navigation_btn_prev {left:50% !important; margin-left:-570px; transition:transform .3s;}
	.main_slider .designBanner .anibanner_navigation_btn_next {right:50% !important; margin-right:-570px !important; transition:transform .3s;}
	.main_slider .designBanner:hover .anibanner_navigation_btn_prev {transform:translate(-30px, 0)}
    .main_slider .designBanner:hover .anibanner_navigation_btn_next {transform:translate(30px, 0)}
    .main_slider3 .designBanner {width:100% !important; margin:0 auto !important;}
	.main_slider3 .designBanner .anibanner_navigation_btn_prev {left:50% !important; margin-left:-500px !important;}
	.main_slider3 .designBanner .anibanner_navigation_btn_next {left:50% !important; margin-left:430px !important;}
</style>

<div class="main_slider">
	<script type='text/javascript' src='/mwp/views/common/app/javascript/jquery/jquery.ui.touch-punch.min.js'></script>
	<script type='text/javascript' src='/mwp/views/common/app/javascript/plugin/anibanner/jquery.anibanner7687.js'></script>
	<link rel='stylesheet' type='text/css' href='/mwp/views/common/app/javascript/plugin/anibanner/anibanner.css' />
<!-- <div class='designBanner' designElement='banner' templatePath='main/index.html' bannerSeq='1' style='height:568px;'><img src="/mwp/upload/indexImage/1467362563486.jpg" width="100%" height="568" /></div> -->

<div class='designBanner' designElement='banner' templatePath='main/index.html' bannerSeq='1' style='height:568px;'><img src="/mwp/upload/indexImage/images_1.jpg" width="100%" height="568" /></div>


<script>
		$(function(){
			var bannerTimer1;
			var settings1= {
				'platform' : 'pc',
				'modtime' : '1518494058',
				'style' : 'pc_style_2',
				'height' : '568',
				'background_color' : '#ffffff',
				'background_image' : '/mwp/views/common/data/skin/fruit_puro_gls/',
				'background_repeat' : 'no-repeat',
				'background_position' : 'left top',
				'image_border_use' : 'n',
				'image_border_width' : '0',
				'image_border_color' : '#ffffff',
				'image_opacity_use' : 'y',
				'image_opacity_percent' : '0',
				'image_top_margin' : '0',
				'image_side_margin' : '0',
				'image_width' : '2000',
				'image_height' : '568',
				'navigation_btn_style' : 'btn_style_2',
				'navigation_btn_visible' : 'mouseover',
				'navigation_paging_style' : 'paging_style_3',
				'navigation_paging_height' : '',
				'navigation_paging_align' : 'center',
				'navigation_paging_position' : 'over',
				'navigation_paging_margin' : '30',
				'navigation_paging_spacing' : '0',
				'slide_event' : 'auto',
				
				'images' : 
					[{'image':'/mwp/upload/indexImage/images_1.jpg'},
						{'image':'/mwp/upload/indexImage/images_2.jpg'}],
				
				'navigation_paging_custom_images' : 
				[{'active':'/mwp/views/common/data/skin/fruit_puro_gls/images/banner/1/','inactive':'/mwp/views/common/data/skin/fruit_puro_gls/images/banner/1/'},{'active':'/mwp/views/common/data/skin/fruit_puro_gls/images/banner/1/','inactive':'/mwp/views/common/data/skin/fruit_puro_gls/images/banner/1/'}]};
			
			if (typeof(callAnibanner1) != 'function'){
				function callAnibanner1() {
					if (typeof ($.custom.anibanner) != 'undefined') {
						$('.designBanner[bannerSeq="1"]').anibanner(settings1);
					}
					clearInterval(bannerTimer1);
				}
			}
			if (typeof($.custom.anibanner) == 'undefined'){
				clearInterval(bannerTimer1);
				bannerTimer1 = setInterval(callAnibanner1,100);
			} else {
				$('.designBanner[bannerSeq="1"]').anibanner(settings1);
			}
	});
</script>
</div>
</div>
</div>	
<!-- //슬라이드 배너 끝 -->
	
		<div id='calendar' ></div>
		<div id="outArea">
			<div id='countdown' ></div>
			<script>
			
			
				
				
				$(function(){
					
					var countDownDate;
				
					$.ajax({
						url:"/mwp/selectStartDayAjax.do",
						type:"get",
						success:function(data){
							var result = data.startDay;
							var mydate = new Date(result);
							console.log(mydate);
							//Sun Jul 15 2018 09:00:00 GMT+0900 (한국 표준시)
							
							countDownDate = mydate;
							
							console.log(mydate - new Date().getTime());
							
							
							var x = setInterval(function () {
						        var now = new Date().getTime();
						
						        var distance = countDownDate - now;
						
						        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
						        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
						        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
// 						        document.getElementById("countDown").innerHTML = days + "일 " + hours + "시간 " + minutes + "분 "
// 						                                            + seconds + "초 ";
								console.log(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 ");
								$("#countdown").html(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 ");
						        if(distance < 0){
						            clearInterval(x);
						            document.getElementById("countdown").innerHTML = "종료된 시장";
						
						        }
						        
						        
						
						    }, 1000);
						},error:function(e){
							console.log(e);
						}
					});
					});
					
					
					

				    
	
				
			
			</script>
			
			
			
			
			
			<div id="map" >진행중인 프리마켓</div>
		</div>
		
		
		<div class="h3_wrap">

			<h3>프리마켓 정보</h3>

		</div>
		
		<div id ="marketCatalogArea">
<!-- 			<div class="catlog" > -->
<!-- 				<img src = "/mwp/upload/201807050645595318.jpg" width="300px"> -->
<!-- 				<span>내용</span> -->
<!-- 			</div> -->
<!-- 			<div class="catlog"> -->
<!-- 				<div class = "title"></div> -->
<!-- 			</div> -->
<!-- 			<div class="catlog"> -->
<!-- 				<div class = "title"></div> -->
<!-- 			</div> -->
		</div>

		

	
<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>