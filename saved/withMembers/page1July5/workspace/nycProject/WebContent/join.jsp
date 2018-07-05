<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
   String id = (String) request.getAttribute("id");
   if (id == null) {
      id = "";
   }
     String nick=(String)request.getAttribute("nick");
     if(nick.equals("undefined")){
        nick="";
     }
     
%>
<head>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <script src="/nycProject/app/javascript/js/sha512.min.js"  type="text/javascript"></script>

<link href="https://fonts.googleapis.com/css?family=Poor+Story"
   rel="stylesheet">
   
<meta charset="UTF-8">
<title>회원 가입</title>

<style>
td {
   font-family: 'Poor Story', cursive;
   font-size: 20px;
}

.outer {
   width: 600px;
   height: 500px;
   background: white;
   color: black;
   margin-left: auto;
   margin-right: auto;
   padding: 20px;
   border: 1px solid white;
   font-family: 'Poor Story', cursive;
   font-size: 30px;
}

#idCheckBtn, #searchAddressBtn, #joinMainBtn, #joinBtn {
   background: #58FAF4;
   order-radius: 5px;
   width: 100px;
   height: 25px;
   text-align: center;
   cursor: pointer;
   font-family: 'Poor Story', cursive;
   font-size: 20px;
}

#joinMainBtn, #joinBtn {
   display: inline-block;
   font-family: 'Poor Story', cursive;
   font-size: 20px;
}

#searchAddressBtn, #joinBtn {
   background: yellowgreen;
   font-family: 'Poor Story', cursive;
   font-size: 20px;
}
</style>
<script >
   function memberJoin() {
      $("#joinForm").submit();
   }

   function validate() {
      var regExp = "^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"; 
      var pwregExp = /^[a-z0-9_]{8,20}$/;
      var idregExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
      if($("#id").val()==""){
         $("#idChkSpan").text("아이디를 입력해주세요.");
         $("#id").focus();
         return false;
      }
      if(!idregExp.test($("#id").val())){
         $("#idChkSpan").text("아이디를 형식이 잘못되었습니다. Email형식으로 입력해주세요");
         $("#id").focus();
         return false;

      }
      if ( !pwregExp.test( $("#pw").val() ) ) {
         $("#passChkSpan").text("비밀번호가 잘못되었습니다. 8자이상 20자 이하 숫자나 영문만");
         $("#pw2").focus();
         return false;
      }

      
      
      if ($("#pw").val() != $("#pw2").val()) {
         $("#passChkSpan").text("비밀번호가 일치하지 않습니다.");
         $("#pw2").focus();
         

         return false;
      }

      
      if($("#name").val()==""){
         $("#nameChkSpan").text("이름을 입력해주세요.");
         $("#name").focus();
         return false;
      }
      
      var sign = hex_sha512($("#pw").val()); 
      $("#pw").val(sign);
      
      
      
   
   
      
      //다른 값들을 체크 하는 로직 추가(유효성 검사 로직 추가 영역)
      return true;
   }

   function openAddressPopup() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  //data.zonecode; //5자리 새우편번호 사용
                  $("#zipcode").val(data.zonecode);
                  $("#address1").val(fullAddr);

                  // 커서를 상세주소 필드로 이동한다.
                  $("#address2").focus();
               }
            }).open();
   }
</script>
</head>
<body>
   <%@ include file="/header.jsp"%>

   <div class="outer">
      <h2 align="center">회원 가입</h2>
      <br>
      <form id="joinForm" method="post" action="/nycProject/join.do"
         onsubmit="return validate();">
         <table>
            <tr>
               <td width="200px;"><span class="import">*</span>아이디</td>
               <td><input type="text" name="id" id="id" value=<%=id%> ></td>
               <td><span id="idChkSpan"></span></td>
               
            </tr>
            <tr>
               <td><span class="import">*</span>비밀번호</td>
               <td><input type="password" name="pw" id="pw"
                  required /></td>
               <td></td>
            </tr>
            <tr>
               <td><span class="import">*</span>비밀번호 확인</td>
               <td><input type="password" name="pw2" id="pw2"
                  required /></td>
               <td><span id="passChkSpan"></span></td>
            </tr>
            <tr>
               <td><span class="import">*</span>이름</td>
               <td><input type="text" name="name" id="name" value=<%=nick%>></td>
               <td><span id="nameChkSpan"></span></td>
            </tr>
            <tr>
               <td>성별</td>
               <td><input type="radio" name="gender" value="M" checked>
                  남성 <input type="radio" name="gender" value="F"> 여성</td>
               <td></td>
            </tr>
            <tr>
               <td>나이</td>
               <td><input type="number" name="age" min="10" max="100"
                  value="20" /></td>
               <td></td>
            </tr>
            <tr>
               <td>전화번호</td>
               <td><input type="text" name="phone1" id="phone1" size="2" />-
                  <input type="text" name="phone2" id="phone2" size="2" />- <input
                  type="text" name="phone3" id="phone3" size="2" /></td>
                  <td><span id="phoneChkSpan"></span></td>
            </tr>
            <tr>
               <td>우편번호</td>
               <td><input type="text" name="zipcode" id="zipcode" /></td>
               <td><div id="searchAddressBtn" onclick="openAddressPopup();">주소
                     검색</div></td>
            </tr>
            <tr>
               <td>주소</td>
               <td><input type="text" name="address1" id="address1" /></td>
               <td></td>
            </tr>
            <tr>
               <td>상세주소</td>
               <td><input type="text" name="address2" id="address2" /></td>
               <td></td>
            </tr>
            <tr>
               <td>회원유형</td>
               <td><input type="radio" name="kind" value="C" checked>
                  일반회원 <input type="radio" name="kind" value="W"> 작가</td>
               <td></td>
            </tr>

         </table>
         <br>
         <div class="btns" align="center">
            <div id="joinMainBtn" onclick="mainPage();">메인으로</div>
            <div id="joinBtn" onclick="memberJoin();">회원가입</div>
         </div>
      </form>
   </div>
   <%@ include file="/footer.jsp"%>
</body>
</html>