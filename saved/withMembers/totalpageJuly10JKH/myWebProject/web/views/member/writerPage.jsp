<%@page import="com.kh.java.product.model.vo.ProductVo"%>
<%@page import="com.kh.java.product.model.service.ProductService"%>
<%@page import="com.kh.java.product.model.vo.BuyVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.in-div{
	float:left;
}

</style>


</head>
<body>
<%@ include file="/views/common1Page/header.jsp" %>

<%if(member==null){%>
         <script>alert("로그인이 필요합니다.");
         parent.document.location.replace('http://localhost:8081/mwp/views/member/login.jsp');
         </script>
         
      <% }else{
	ArrayList<ProductVo> list = (ArrayList<ProductVo>)request.getAttribute("list");
	%>


<script>
function updateP(pno){
	location.href="/mwp/views/product/updateProductForm.jsp?pno="+pno;
}

function deleteP(pno){
	if(confirm("정말 삭제하시겠습니까?")==true){
	      location.href="/mwp/deleteProd.do?mno=<%=member.getMNO() %>&pno="+pno;
	   }else{
	      return;
	   }
}
</script>
   
<!-- //상단영역 : 끝 -->

   <div id="layout_config">
    <div>
    <div class="in-div">
      <div id="layout_side">
      <div class="side_list">
   <h2>마이페이지</h2>

   <h3>나의 쇼핑</h3>
   <ul>
      <li><a href="/mypage/order_catalog" class="current">주문/배송 내역</a></li>
      <li><a href="/mwp/views/product/cart.jsp">장바구니</a></li>
      <li><a href="/mypage/wish" >위시리스트</a></li>      
      <li><a href="/mypage/taxinvoice" >세금계산서 신청</a></li>
      <li><a href="/mypage/personal" >개인결제</a></li>
      <li><a href="/mypage/delivery_address?tab=1" >주소록</a></li>
      <li><a href="/mypage/return_catalog" >반품/교환 내역</a></li>
      <li><a href="/mypage/refund_catalog" >환불 내역</a></li>
      <li><a href="/mypage/my_minishop" >나의 단골 미니샵</a></li>
   </ul>
   <!-- //나의 쇼핑 -->

   <h3>나의 혜택</h3>
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

   <h3>나의 활동</h3>
   <ul>
      <li><a href="/mypage/myqna_catalog" >나의 1:1문의</a></li>
      <li><a href="/mypage/mygdqna_catalog" >나의 상품문의</a></li>
      <li><a href="/mypage/mygdreview_catalog" >나의 상품후기</a></li>
   </ul>
   <!-- //나의 활동 -->

   <h3>나의 정보</h3>
   <ul>
      <li><a href="/mypage/myinfo" >회원정보 수정</a></li>
      <li><a href="/mypage/withdrawal" >회원 탈퇴</a></li>
   </ul>
   <!-- //나의 정보 -->
</div></div>
<!-- //측면영역 - 마이페이지 -->
</div>


<div class="in-div">
<script type="text/javascript">
</script>


      <div id="layout_config_body">
<!-- //페이지경로 -->

<div class="h3_wrap">
   <h3>등록 상품 관리</h3>

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="mypage_wrap">
   <ul class="clearbox">
      <li class="fleft mt3"><h4>등록 상품</h4></li>
      <li class="fright">

      </li>
   </ul>
</div>
<!-- //버튼 -->

<table class="list_table_style" width="100%" border="0" cellpadding="0" cellspacing="0">
   <caption>주문상품</caption>
   <colgroup>
      <col width="50%" /><col width="8%" /><col width="5%" /><col width="5%" />
   </colgroup>
   <thead>
      <tr>
     	 <th scope="col">상품정보</th>
      	 <th scope="col">카테고리</th>
         <th scope="col">상품금액</th>
         <th scope="col">수정/삭제</th>
      </tr>
   </thead>
   <tbody>
   <%if(list!=null&&list.size()!=0){ %>
   <%for(ProductVo pv:list){ %>
      <tr>
         <td class="left">
            <dl class="order_thumb_wrap">
               <dt>
                  <a href='#' target='_blank'><img src="/mwp/<%=pv.getImg_src() %>" class="order_thumb" alt="" /></a>
               </dt>
               <dd>
                  <div>
                     <a href='/goods/view?no=11' target='_blank' class="order_name"><%=pv.getName() %></a>
                  </div>
                  <div>
                  	<input type="hidden" id="pno" value="<%=pv.getPno() %>"/>
                  </div>
                  <div class="order_option mt3 clearbox">
                     <div class="fleft " style="margin-right:4px;">
                     </div>
                     <div class="fleft">
                     </div>
                  </div>
               </dd>
            </dl>
         </td>
          <td>
      	 	<%=pv.getCategory() %>
      	 </td>
         <td class="right"><%=pv.getPrice() %>원</td>
         <td>
         	<input type="button" onclick="updateP(<%=pv.getPno()%>);" value="수정"/><br/>
         	<input type="button" onclick="deleteP(<%=pv.getPno()%>);" value="삭제"/><br/>
         </td>
      </tr>
      <%} %>
      <%}else{ %>
     	 <tr>
     	 	<td colspan="4">등록된 상품이 없습니다.</td>
     	 </tr>
      <%} %>

   </tbody>
</table>
<!-- //주문내역 테이블 -->

   <% }%>
</div>
</div>

</div>

</div>

</body>
</html>