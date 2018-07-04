
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.kh.java.map.model.vo.MapVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% MapVo result = (MapVo) request.getAttribute("result"); %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>countdown</title>
    
    
    <style>
    
    
    	#countDown{
    		border-style:solid;
    		font-size:30px;		
    		
    		width:18%;
    		text-aligh:center;
    	
    	}
    	
    	
    </style>
</head>
<body>


<div id="countDown"></div>


<script>
	
	<%
		Date startDay = result.getStartDay();
		
		SimpleDateFormat yearFmt = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthFmt = new SimpleDateFormat("MM");
		SimpleDateFormat dayFmt = new SimpleDateFormat("dd");
		
		int year = Integer.parseInt(yearFmt.format(startDay));
		int month = Integer.parseInt(monthFmt.format(startDay));
		int day = Integer.parseInt(dayFmt.format(startDay));
		
		
		
	%>

    var countDownDate = new Date(<%=year%>, <%=month%>, <%=day%>, 15, 37, 25);

    var x = setInterval(function () {
        var now = new Date().getTime();

        var distance = countDownDate - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("countDown").innerHTML = days + "일 " + hours + "시간 " + minutes + "분 "
                                            + seconds + "초 ";

        if(distance < 0){
            clearInterval(x);
            document.getElementById("countDown").innerHTML = "종료된 시장";

        }

    }, 1000);

</script>

</body>
</html>