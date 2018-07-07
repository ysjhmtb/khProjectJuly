<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String loginConfirm = null ;

 	if(request.getAttribute("flag") !=null && (int)request.getAttribute("flag")==-1){
 		loginConfirm = "아무말";
 	}
 	
 %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<%@ include file="/views/common1Page/header.jsp" %>
 <div class="h3_wrap">
   <h3>로그인</h3>
   <p>회원 로그인을 하시면 각종 혜택 및 정보를 제공 받으실 수 있습니다.</p>
   

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<script type='text/javascript'>var fbv='2.6';</script><script type='text/javascript' src='../app/javascript/js/facebook0dfd.js?v=20150501' charset='utf8'></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <script src="/mwp/views/common1Page/app/javascript/js/sha512.min.js"  type="text/javascript"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<div class="login_wrap">
<script>

function validate() {
    var sign = hex_sha512($("#password").val()); 
      $("#password").val(sign); 
      
   //다른 값들을 체크 하는 로직 추가(유효성 검사 로직 추가 영역)

   return true;
}
<%if(loginConfirm!=null){%>
$(function(){
	alert("로그인이 필요한 기능입니다.");
});
<%}%>
</script>
   <form name="loginForm"  method="post"  action="/mwp/login2.do"  onsubmit="return validate()" >
      <input type="hidden" name="return_url" value="/main/index"/>
      <input type="hidden" name="order_auth" value="0"/>
      <fieldset>
      <legend>로그인 폼</legend>
      <div class="login_form">
         <input type="text" name="userid" id="userid" value="" placeholder="아이디" />
         <input type="password" password="password" name="password" id="password"  value=""  placeholder="비밀번호" />
         <input type="submit"  class="btn_sch" value="로그인" onclick="memberlogin();" />
         
      </div>
   </fieldset>

   </form>
   
   
      <ul class="login_list">
         <li><input type="checkbox" name="idsave" id="idsave" value="checked" class="mb0"  /> <label for="idsave">아이디 저장</label></li>
         <li><a href="agreement.html">회원가입</a>&nbsp; | &nbsp;<a href="find.html">아이디/비밀번호 찾기</a></li>
               
      </ul>
      <!-- //일반적인 로그인 폼 : 쇼핑몰ID만 이용할 경우 -->
         
      </div>
      
   
   
      <br></br>
      <ul>
           <li> <div align=center id="naverIdLogin"> </div></li>
           <br></br>
    	<li><div align=center id="kakao-login-btn" "></div></li>
    <!-- <a href="http://developers.kakao.com/logout"  align="center" ></a> -->
   

   </ul>
   
      
   
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "b_Hj7yNZCL_pR_IVLniy",
         callbackUrl: "http://localhost:8081/mwp/views/member/check.jsp",
         isPopup: false, /* 팝업을 통한 연동처리 여부 */
         loginButton: {color: "green", type: 4, height: 47} /* 로그인 버튼의 타입을 지정 */
      }
      
   );
   naverLogin.init();
    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
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
  //]]>
   
      
      </script>
      <!-- //본문내용 끝 -->
      <%@ include file="/views/common1Page/footer.jsp" %>
</body>
</html>