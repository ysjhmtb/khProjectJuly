<%@page import="com.kh.java.member.model.service.MemberService"%>
<%@page import="com.kh.java.member.model.vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.in_div{
   float:left;
}
</style>
<script >
   
   

</script>
</head>
<body>
<%@ include file="/views/common1Page/header.jsp" %>
<%
if(!(member.getM_ID().equals("admin")) || member==null){%>
   <script>alert("관리자만 로그인 가능합니다. ")
   location.href='/mwp/index.jsp';
   </script>
<% }%>
<%
ArrayList<MemberVo> list=new MemberService().getAllmember();

//    ArrayList<BuyVo> dList = new ProductService().getMBuyList(0);
//    ArrayList<BuyVo> pList = new ProductService().getMBuyList(1);
//    ArrayList<BuyVo> cList = new ProductService().getMBuyList(2);
%>


<script type= text/javascript>
$(function () {
   $("#enroll").click(function(){
      alert("확인");
   });
   
})

</script>
<!-- //상단영역 : 끝 -->

   <div id="layout_config">
   <div id="wrap_div">
   <div class="in_div">
      <div id="layout_side">
      <div class="side_list">
   <h2>관리자페이지</h2>

   <h3>관리자 페이지</h3>
   <ul>
      <li><a href="/mwp/views/admin/member.jsp">멤버관리</a></li>
      <li><a href="/mwp/views/admin/product.jsp" >주문관리</a></li>      
<!--       필요없음 -->
      <li><a href="/mypage/taxinvoice" >세금계산서 신청</a></li>
      <li><a href="/mypage/personal" >개인결제</a></li>
      <li><a href="/mypage/delivery_address?tab=1" >주소록</a></li>
      <li><a href="/mypage/return_catalog" >반품/교환 내역</a></li>
      <li><a href="/mypage/refund_catalog" >환불 내역</a></li>
      <li><a href="/mypage/my_minishop" >나의 단골 미니샵</a></li>
<!--       필요없음 -->
   </ul>
   <!-- //나의 쇼핑 -->

   <h3>관리자 </h3>
   <ul>
      <li><a href="/mypage/emoney" >마일리지 내역</a></li>
      <li><a href="/mypage/coupon" >쿠폰 내역</a></li>
      <li><a href="/mypage/offlinecoupon" >쿠폰 등록(인증)</a></li>
      <li><a href="/mypage/cash" >예치금 내역</a></li>
      <li><a href="/mypage/point" >포인트 내역</a></li>
      <li><a href="/mypage/promotion" >포인트로 할인코드 교환</a></li>
      <li><a href="/mypage/emoney_exchange" >마일리지로 사은품 교환</a></li>
   </ul>
   <!-- //나의 혜택 -->

   <h3>관리자</h3>
   <ul>
      <li><a href="/mypage/myqna_catalog" > 1:1문의</a></li>
      <li><a href="/mypage/mygdqna_catalog" > 상품문의</a></li>
      <li><a href="/mypage/mygdreview_catalog" > 상품후기</a></li>
   </ul>
   <!-- //나의 활동 -->

   <h3>기타정보</h3>
   <ul>
      <li><a href="/mypage/myinfo" >기타정보</a></li>
      <li><a href="/mypage/withdrawal" >기타정보</a></li>
   </ul>
   <!-- //나의 정보 -->
</div>
<!-- //측면영역 - 마이페이지 -->


<script type="text/javascript">
   $(document).ready(function() {
      //기존멤버-통합하기
      $("#facebookmbconnectalert").click(function(){
         //facebook 친구들을 쇼핑몰에 초대하기 위해서는 facebook계정으로 쇼핑몰을 이용해 주셔야 합니다.<br>회원정보수정에서 "SNS계정사용"을 수락해 주세요. <br>친구들을 초대하시면 다양한 혜택을 받으실 수 있습니다.<br>지금 회원정보수정 화면으로 이동하시겠습니까?
         openDialogConfirm(getAlert('mp107'),'650','200',function(){document.location.href='../mypage/myinfo'},function(){});
      });
   });
</script>
</div>
</div>
<div class="in_div">
 <div id="layout_config_body">
<div class="category_depth">
   <ul class="list2">
      <li><a href="/main/index">&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

      <li><a href="/mwp/views/member/mypage.jsp">마이페이지</a></li>
      <li>주문/배송 내역</li>

   </ul>
</div>
<!-- //페이지경로 -->

<div class="h3_wrap">
   <h3>일반회원</h3>

</div>

<div class="mypage_wrap">
  

<!-- //버튼 -->

<table class="list_table_style" width="100%" border="0" cellpadding="0" cellspacing="0">
   <caption>주문상품</caption>
   <colgroup>
   </colgroup>
   <thead>
      <tr>
         <th scope="col" width=50>멤버NO</th>
         <th scope="col">멤버ID</th>
         <th scope="col">이름</th>
           <th scope="col">회원분류</th>
         <th scope="col">성별</th>
         <th scope="col">나이</th>
         <th scope="col">전화번호</th>
         <th scope="col">우편번호</th>
         <th scope="col">가입일</th>
         <th scope="col" class="goods_delivery_info">작가확인버튼</th>
      </tr>
   </thead>
    
   <tbody>
  <%for(MemberVo mv:list) {%>
  <%if(mv.getM_CATEGORY().equals("일반회원")){ %>
      <tr>
         <td ><%=mv.getMNO() %> </td>
         <td ><%=mv.getM_ID() %></td>
         <td><%=mv.getM_NAME() %></td>
         <td><%=mv.getM_CATEGORY() %></td>
         <td ><%=mv.getM_GENDER() %></td>
         <td><%=mv.getM_age() %></td>
         <td><%=mv.getM_PHONE() %></td>
         <td><%=mv.getM_ADDRESS() %></td>
         <td><%=mv.getENTERDATE() %></td>
         <td class="left goods_delivery_info" rowspan="1">
          <a href="/mwp/enroll.do?memberMno=<%=mv.getMNO() %>&boolean=T">작가등록</a>
            </td>
      
         </tr>
         <%} %>
         <%} %>
            </table>
         

<div class="h3_wrap">
   <h3>작가</h3>

</div>

<div class="mypage_wrap">
  

<!-- //버튼 -->

<<table class="list_table_style" width="100%" border="0" cellpadding="0" cellspacing="0">
   <caption>주문상품</caption>
   <colgroup>
   </colgroup>
   <thead>
      <tr>
         <th scope="col" width=50>멤버NO</th>
         <th scope="col">멤버ID</th>
         <th scope="col">이름</th>
           <th scope="col">회원분류</th>
         <th scope="col">성별</th>
         <th scope="col">나이</th>
         <th scope="col">전화번호</th>
         <th scope="col">우편번호</th>
         <th scope="col">가입일</th>
         <th scope="col" class="goods_delivery_info">작가확인버튼</th>
      </tr>
   </thead>
    
   <tbody>
  <%for(MemberVo mv:list) {%>
  <%if(mv.getM_CATEGORY().equals("작가")){ %>
      <tr>
         <td ><%=mv.getMNO() %> </td>
         <td ><%=mv.getM_ID() %></td>
         <td><%=mv.getM_NAME() %></td>
         <td><%=mv.getM_CATEGORY() %></td>
         <td ><%=mv.getM_GENDER() %></td>
         <td><%=mv.getM_age() %></td>
         <td><%=mv.getM_PHONE() %></td>
         <td><%=mv.getM_ADDRESS() %></td>
         <td><%=mv.getENTERDATE() %></td>
         <td class="left goods_delivery_info" rowspan="1">
            <a href="/mwp/enroll.do?memberMno=<%=mv.getMNO() %>&boolean=F">작가취소</a>
            </td>
      
         </tr>
         <%} %>
         <%} %>
            </table>


</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
<!-- //주문내역 테이블 -->
</div>
</div>
</div>
</div>
</div>
<%@ include file="/views/common1Page/footer.jsp" %>
</body>
</html>

</body>
</html>