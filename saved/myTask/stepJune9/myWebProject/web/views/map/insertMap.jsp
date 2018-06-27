
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="/mwp/web/WEB-INF/lib/ckeditor/ckeditor.js"></script>
    <script src="/mwp/web/WEB-INF/lib/ckeditor/config.js"></script>
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


        .outerBox{
            width:50%;
            height:800px;
            align:center;

        }


        .firstRow:after, secondRow:after,
        thirdRow:after, fourthRow:after,
        .fifthRow:after {
            content: "";
            display: block;
            clear: both;

        }

        .nameDiv{
        	font-size:30px;
            float:left;
            width:30%;
            margin-top:20px;
            margin-bottom:20px;
        }

        .dataDiv{
        	font-size:30px;
            float:left;
            width:70%;
            margin-top:20px;
            margin-bottom:20px;
        }
        
        .dataBox{
        	font-size:25px;
        	
        }


		.submitBtn{
			width:200px;
			height:80px;
			font-size:20px;
			background-color:gray;
			margin:60px;
			cursor:pointer;
		}





    </style>


    <script>


       /*  $(function () {
        	$(".submitBtn").click(function(){
        		
        		var marketName = $("#marketName").val();
        		var marketLat = $("#marketLat").val();
        		var marketLng = $("#marketLng").val();
        		var marketExpl = $("#marketExpl").val();
        		var startDay = $("#startDay").val();
        		var endDay = $("#endDay").val();
        		var url = $("url").val();
        		var color = $("#color").val();
        		var colortext = $("#colortext").val();
        		
        		location.href = "/mwp/insertMap.do?marketName=" + marketName
        						+ "&marketLat=" + marketLat 
        						+ "&marketLng=" + marketLng
        						+ "&marketExpl=" + marketExpl
        						+ "&startDay=" + startDay
        						+ "&endDay=" + endDay
        						+ "&url=" + url
        						+ "&color=" + color
        						+ "&colortext=" + colortext;
        	});

        }); */
        
        
    </script>
</head>
<body>
<%@ include file = "/views/common/header.jsp" %>4


<div id="topBar">
    <div align="center" style="font-size:25px; margin-bottom:23px;">프리마켓 등록</div>
</div>
<div align="center">
    <form id="proInfo" method="post" action="/mwp/insertMap.do">


        <div class="outerBox">

            <div class="firstRow">
                <div class="oneInFirst nameDiv">마켓 이름</div>
                <div class="twoInFirst dataDiv">
                    <input type="text" class="infoText dataBox" name="marketName" id="marketName" placeholder="kh역프리마켓">
                </div>

            </div>

            <div class="secondRow">

                <div class="oneInSecond  nameDiv">마켓 위도</div>
                <div class="twoInSecond dataDiv">
                    <input type="text" class="infoText dataBox" name="marketLat" id="marketLat" placeholder="37.552200">
                </div>


            </div>

            <div class="thirdRow">
                <div class="oneInThird nameDiv">마켓 경도</div>
                <div class="twoInThird dataDiv">
                    <input type="text" class="infoText dataBox" name="marketLng" id="marketLng" placeholder="126.923300">
                </div>
            </div>

            <div class="fourthRow">
                <div class="oneInFourth  nameDiv">마켓 설명</div>
                <div class="twoInFourth dataDiv">

                    <input type="text" class="infoText dataBox" name="marketExpl" id="marketExpl" placeholder="kh 정보교육">
                </div>

            </div>

            <div class="fifthRow">
                <div class="oneInFifth  nameDiv"> 시작일 </div>
                <div class="twoInFifth dataDiv">
                    <input type="text" class="infoText dataBox" name="startDay" id="startDay" placeholder="20181101">
                </div>

                <div class="threeInFifth  nameDiv"> 종료일</div>
                <div class="fourInFifth dataDiv">
                    <input type="text" class="infoText dataBox" name="endDay" id="endDay" placeholder="20181109">
                </div>
                
                
                
                <div class="fiveInFifth nameDiv"> 배경색</div>
                <div class="sixInFifth dataDiv">
                	<input type="text" class="infoText dataBox" name="color" id="color" placeholder="#FFEEDD">
                </div>
                
                <div class="sevenInFifth nameDiv"> 글자색</div>
                <div class="eightInFifth dataDiv">
                	<input type="text" class="infoText dataBox" name="colortext" id="colortext" placeholder="BLACK">
                </div>
                
                <div class="nineInFifth nameDiv"> URL</div>
                <div class="tenInFifth dataDiv">
                	<input type="text" class="infoText dataBox" name="url" id="url" placeholder="http://tour.pcs21.net/main/main.kh">
                </div>
                

            </div>



            <input class="submitBtn" type="submit" value="등록"/>



        </div>


    </form>
</div>


<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>