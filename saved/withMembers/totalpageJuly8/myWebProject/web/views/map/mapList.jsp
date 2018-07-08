<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.java.map.model.vo.MapVo" %>
<%@ page import = "java.util.ArrayList" %>
<% ArrayList<MapVo> list = (ArrayList<MapVo>) request.getAttribute("list"); %>

<!DOCTYPE html>
<html>
	<head>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>프리 마켓 맵</title>
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	
	<style>
	        html,
	        body {
	            font-family: Arial, sans-serif;
	            height: 100%;
	            margin: 0;
	            padding: 0;
	        }
	        .container {
	            height: 800px;
	            /* height: 100%; */
	            position: relative;
	        }
	        input {
	            font-size: 12px;
	        }
	        h1 {
	            color: #525454;
	            font-size: 22px;
	            margin: 0 0 10px 0;
	            text-align: center;
	        }
	        #hide-listings,
	        #show-listings {
	            width: 48%;
	        }
	        #map {
	            bottom:0px;
	            height: 100%;
	            left: 362px;
	            position: absolute;
	            right: 0px;
	        }
	        .options-box {
	            background: #fff;
	            border: 1px solid #999;
	            border-radius: 3px;
	            height: 95%;
	            line-height: 35px;
	            padding: 10px 10px 30px 10px;
	            text-align: left;
	            width: 340px;
	        }
	        
	        .insertMapDiv{
	       	 	padding-top:90%;
	       	 	padding-left:30%;
	        }
    </style>
</head>
<body>

		 <%@ include file = "/views/common/header.jsp" %>

		<div class="container">
	    <div class="options-box">
	        <h1>프리마켓 확인</h1>
	        <div>
	            <input class="btn_sch"  id="show-listings" type="button" value="위치 확인">
	            <input class="btn_sch"  id="hide-listings" type="button" value="취소">
	        </div>
	        
	      
	        
	        <script>
	        
	        	
	        
		        
		        
	        </script>
	        
	        
	        <div class="marketNameSet">
	        	<div class="marketName marketName1"></div>
	        	<div class="marketName marketName2"></div>
	        	<div class="marketName marketName3"></div>
	        	<div class="marketName marketName4"></div>
	        	<div class="marketName marketName5"></div>
	        	<div class="marketName marketName6"></div>
	        	<div class="marketName marketName7"></div>
	        	<div class="marketName marketName8"></div>
	        	<div class="marketName marketName9"></div>
	        	<div class="marketName marketName10"></div>
	        	
	        </div>
	        
	        <%if(member != null){%>
	        <div class="insertMapDiv">
	        	<input type="button" class="btn_sch"  id="insertMapBtn"  value="지도 정보 입력" onclick ="insertMap()">
	        	
	        	
	        </div>
	        <%} %>
	        
	        
	    </div>
	    <div id="map"></div>
	    
	    
	</div>
	<script>
		function insertMap(){
			location.href = "/mwp/views/map/insertMap.jsp";
			
		}
		
	    var map;
	    // Create a new blank array for all the listing markers.
	    var markers = [];
	    function initMap() {
	   
	        // Create a styles array to use with the map.
	        var styles = [
	            {
	                featureType: 'water',
	                stylers: [
	                    { color: '#19a0d8' }
	                ]
	            },{
	                featureType: 'administrative',
	                elementType: 'labels.text.stroke',
	                stylers: [
	                    { color: '#ffffff' },
	                    { weight: 6 }
	                ]
	            },{
	                featureType: 'administrative',
	                elementType: 'labels.text.fill',
	                stylers: [
	                    { color: '#e85113' }
	                ]
	            },{
	                featureType: 'road.highway',
	                elementType: 'geometry.stroke',
	                stylers: [
	                    { color: '#efe9e4' },
	                    { lightness: -40 }
	                ]
	            },{
	                featureType: 'transit.station',
	                stylers: [
	                    { weight: 9 },
	                    { hue: '#e85113' }
	                ]
	            },{
	                featureType: 'road.highway',
	                elementType: 'labels.icon',
	                stylers: [
	                    { visibility: 'off' }
	                ]
	            },{
	                featureType: 'water',
	                elementType: 'labels.text.stroke',
	                stylers: [
	                    { lightness: 100 }
	                ]
	            },{
	                featureType: 'water',
	                elementType: 'labels.text.fill',
	                stylers: [
	                    { lightness: -100 }
	                ]
	            },{
	                featureType: 'poi',
	                elementType: 'geometry',
	                stylers: [
	                    { visibility: 'on' },
	                    { color: '#f0e4d3' }
	                ]
	            },{
	                featureType: 'road.highway',
	                elementType: 'geometry.fill',
	                stylers: [
	                    { color: '#efe9e4' },
	                    { lightness: -25 }
	                ]
	            }
	        ];
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	            center: {lat: 37.541, lng: 126.986},
	            zoom: 13,
	            styles: styles,
	            mapTypeControl: false
	
	            // At the same time, we'll set the styles property
	            // within the map object options.
	        });
	        // These are the real estate listings that will be shown to the user.
	        // Normally we'd have these in a database instead.
	
	        var locations = [
	            /* {title: 'Park Ave Penthouse', location: {lat: 40.7713024, lng: -73.9632393}},
	            {title: 'Chelsea Loft', location: {lat: 40.7444883, lng: -73.9949465}},
	            {title: 'Union Square Open Floor Plan', location: {lat: 40.7347062, lng: -73.9895759}},
	            {title: 'East Village Hip Studio', location: {lat: 40.7281777, lng: -73.984377}},
	            {title: 'TriBeCa Artsy Bachelor Pad', location: {lat: 40.7195264, lng: -74.0089934}},
	            {title: 'Chinatown Homey Space', location: {lat: 40.7180628, lng: -73.9961237}}  */
	        ];
	        
	        <% for(MapVo m : list){ %>
	        	<% 
	        		String temp = "{title: '" + m.getMarketName() 
	        					+ "', location : {lat: " + m.getMarketLat()
	        					+ ", lng: " + m.getMarketLng()
	        					+ "}}";
	        	%>
	        	
	        	if(locations.length < <%= list.size() - 1 %>){
	        		locations.push( <%= temp + "," %> );
	        		
	        	}else{
	        		locations.push(<%= temp %>);
	        	}
	        <% }; %>
	        

	        var largeInfowindow = new google.maps.InfoWindow();
	
	
	
	        var defaultIcon = makeMarkerIcon('0091ff');
	        var highlightedIcon = makeMarkerIcon('FFFF24');
	
	
	
	
	        var largeInfowindow = new google.maps.InfoWindow();
	        for (var i = 0; i < locations.length; i++) {
	            var position = locations[i].location;
	            var title = locations[i].title;
	            var marker = new google.maps.Marker({
	                position: position,
	                title: title,
	                animation: google.maps.Animation.DROP,
	                icon: defaultIcon,
	                id: i
	               
	            });
	            
	            console.log('marker : ' + marker.title + marker.id);
	            markers.push(marker);
	            marker.addListener('click', function() {
	                populateInfoWindow(this, largeInfowindow);
	            });
	            marker.addListener('mouseover', function() {
	                this.setIcon(highlightedIcon);
	            });
	            marker.addListener('mouseout', function() {
	                this.setIcon(defaultIcon);
	            });
	        }
	        document.getElementById('show-listings').addEventListener('click', showListings);
	        document.getElementById('hide-listings').addEventListener('click', hideListings);
	        
	        
	        
	        
	        
	        //시장목록에 대한 이벤트 
	        
	        $(".marketName").mouseover(function(){
	        	$(this).fadeTo("fast",0.3);
	        	
	        	if($('#show-listings').data('clicked')){
        			
	        		var tempMarId = $(this).attr('id');	
        			markers[parseInt(tempMarId)].setIcon(highlightedIcon);
        		}
	        	
	        	
	        	
	        }).mouseout(function(){
	        	$(this).fadeTo("fast",1.0);
	        	
	        	if($('#show-listings').data('clicked')){
	        		var tempMarId = $(this).attr('id');		        		
		        	markers[parseInt(tempMarId)].setIcon(defaultIcon);
	        	}
	        	
	        	
	        });
	        
	        
	        
	        
	        
	        
	    }
	    // This function populates the infowindow when the marker is clicked. We'll only allow
	    // one infowindow which will open at the marker that is clicked, and populate based
	    // on that markers position.
	    function populateInfoWindow(marker, infowindow) {
	        // Check to make sure the infowindow is not already opened on this marker.
	        if (infowindow.marker != marker) {
	            infowindow.marker = marker;
	            infowindow.setContent('<div>' + marker.title + '</div>');
	            infowindow.open(map, marker);
	            // Make sure the marker property is cleared if the infowindow is closed.
	            infowindow.addListener('closeclick', function() {
	                infowindow.marker = null;
	            });
	        }
	    }
	    // This function will loop through the markers array and display them all.
	    function showListings() {
	        var bounds = new google.maps.LatLngBounds();
	        // Extend the boundaries of the map for each marker and display the marker
	        for (var i = 0; i < markers.length; i++) {
	            markers[i].setMap(map);
	            bounds.extend(markers[i].position);
	        }
	        map.fitBounds(bounds);
	    }
	    // This function will loop through the listings and hide them all.
	    function hideListings() {
	        for (var i = 0; i < markers.length; i++) {
	            markers[i].setMap(null);
	        }
	    }
	
	
	
	    // This function takes in a COLOR, and then creates a new marker
	    // icon of that color. The icon will be 21 px wide by 34 high, have an origin
	    // of 0, 0 and be anchored at 10, 34).
	    function makeMarkerIcon(markerColor) {
	        var markerImage = new google.maps.MarkerImage(
	            'http://chart.googleapis.com/chart?chst=d_map_spin&chld=1.15|0|'+ markerColor +
	            '|40|_|%E2%80%A2',
	            new google.maps.Size(21, 34),
	            new google.maps.Point(0, 0),
	            new google.maps.Point(10, 34),
	            new google.maps.Size(21,34));
	        return markerImage;
	    }
	    
	    
	    
	    
	    
	    //시장 목록과 이벤트
    	$(function(){
        		
       		//위치 확인 버튼의 클릭 여부 저장.
       		$("#show-listings").click(function(){
       			$(this).data('clicked',true);
       		});
       		
       		$("#hide-listings").click(function(){
       			$("#show-listing").data('clicked',false);
       		});
       		
       		
       		
       		
       		<% for(int i = 0; i < list.size(); i++) {%>
	        	<% if(i < 10) { %>
	        		
	        		<% int idx = i + 1;%>
	        		<% String temp = ".marketName" + idx;  %>
	        		<% MapVo m = list.get(i);  %>
	        		<% String marketNameTemp = m.getMarketName();	  %>
	        		<% int marNo = m.getMarketNo(); %>
	        		
	        		
	        		var tempClass = '<%=temp %>';
	        		var tempName = '<%= marketNameTemp %>';
	        		
	        		$(tempClass).attr('name', <%= marNo %>);
	        		console.log('name : ' + $(tempClass).attr('name'));
	        		$(tempClass).attr('id',<%= i %>);
	        		$(tempClass).text(tempName);
	        	
	        	<% } %>
	        
	        <% } %>
	        
	        
	        
	        
	        
	        
	        $(".marketName").click(function(){
	        	console.log($(this).attr('name'));
	        	location.href = "/mwp/mapDetail.do?marNo=" + $(this).attr('name');  
	        });
	        
	        
       		
       	});
	    
	    
	    
	</script>
	
	<script async defer
	        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCezN1dD4T0wR_Scxh42dHLxqAmYFCTLKU&v=3&callback=initMap">
	</script>
	
	
	 <%@ include file = "/views/common/footer.jsp" %> 

</body>
</html>



