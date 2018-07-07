<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
   <%@ include file="/views/common1Page/header.jsp" %>



	<div id="layout_config">
		<div id="layout_config_full">
<div class="h3_wrap">
	<h3>회원가입</h3>
	<p>회원이 되셔서 회원등급할인/할인쿠폰/마일리지 등 다양한 서비스를 받으세요.</p>
	
</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->	
<div class="join_wrap">
	<div class="join_step">
		<ul>
			<li class="active"><h3>STEP 1<span>가입방법 선택</span></h3></li>
			<li><h3>STEP 2<span>이용약관 동의</span></h3></li>
			<li><h3>STEP 3<span>회원정보 입력</span></h3></li>
			<li><h3>STEP 4<span>회원가입 완료</span></h3></li>
		</ul>
	</div>
	<!-- //회원가입 스텝 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<h4>원하는 회원가입 방법을 선택하세요.</h4>
	<div class="gate_wrap">
		<div class="type_list">
			
			<!-- 개인회원 사업자회원 구분하는 라디오버튼 : 시작-->
			
		</div>
	</div>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<!-- // 회원가입 방법 선택 -->
	<div class="sns_join">
		<h4>SNS 계정으로 회원가입</h4>
		<ul class="sns_list">
		<li><div  align="center" id="naverIdLogin"></div></li>
	
		 <li> <a id="kakao-login-btn" ></a></li> 
		
</ul>	
	
	</div>

<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "b_Hj7yNZCL_pR_IVLniy",
			callbackUrl: "http://localhost:8081/mwp/views/member/check.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 70} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	 naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getNickName();
			var profileImage = naverLogin.user.getProfileImage();
			var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
			var age = naverLogin.user.getAge();
			console.log(email);
			console.log(name);
			console.log(birthday);
			console.log(age);
			console.log(uniqId);
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
	}); 
	
	 
	 Kakao.init('38e08e4d766943be45bcfdfc5b7640d3');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {

	            Kakao.API.request({

	              url: '/v1/user/me',

	              success: function(res) {


	                 //   console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
	            //    console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
	         
	                   // console.log( res.properties.nickname);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
	                    location.href = "/mwp/login.do?userId="+res.kaccount_email+"&nick="+res.properties.nickname;
	                // res.properties.nickname으로도 접근 가능 )

	                 //   console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

	                  }

	                })

	              },



	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
</script>
	<!-- //SNS 가입폼 : SNS이용할 경우 -->
	
	<!-- 하단 회원가입 혜택 그림 영역 -->
<!--
	<div class="benefit_wrap2">
		<h5>회원을 위한 다양한 혜택을 드립니다.</h5>
		<div class="benefit_list">			
			<img src="../data/skin/fruit_puro_gls/images/common/join_img_benefit.png" alt="" />
			<ul class="clearbox">
				<li>좋아요 할인</li>
				<li>회원가입 마일리지</li>
				<li>할인 이벤트</li>
				<li>다양한 쿠폰</li>
				<li>회원등급 할인</li>
				<li>친구초대 마일리지</li>
				<li>이벤트 알림</li>
			</ul>
		</div>
	</div>
-->
	
<!-- //본문내용 끝 -->


   <%@ include file="/views/common1Page/footer.jsp" %>

</body>
</html>