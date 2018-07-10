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
         
      <% }else{%>
<%
//    ArrayList<BuyVo> list = (ArrayList<BuyVo>)request.getAttribute("list");
//    String name1 = (String)request.getAttribute("list1");
     ArrayList<BuyVo> list = new ProductService().getAllBuyList(member.getM_NAME());
	
%>

   
   
<!-- //상단영역 : 끝 -->

   <div id="layout_config">
    <div>
    <div class="in-div">
      <div id="layout_side">
      <div class="side_list">
   <h2>마이페이지</h2>

   <h3>나의 쇼핑</h3>
   <ul>
      <li><a href="/mwp/views/member/mypage.jsp" class="current">주문/배송 내역</a></li>
      <li><a href="/mwp/views/product/cart.jsp">장바구니</a></li>
      <%if(member.getM_CATEGORY().equals("작가")){ %>
      	<li><a href="/mwp/selectProdList.do?mno=<%=member.getMNO() %>" >내 상품관리</a></li> 
      <%}else{ %>
      	<li><a href="/mypage/wish" >위시리스트</a></li>  
      <%} %>    
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
   <h3>주문/배송 내역</h3>

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="mypage_wrap">
   <ul class="clearbox">
      <li class="fleft mt3"><h4>주문상품</h4></li>
      <li class="fright">
         <button type="button" class="btn_gray" onclick="window.open('/prints/form_print_trade?no=2018070418031417532', '_trade', 'width=960,height=640,scrollbar=1');">거래명세서</button>

         <button type="button" class="btn_gray" onclick="order_cancel('2018070418031417532');">주문무효</button>



      </li>
   </ul>
</div>
<!-- //버튼 -->

<table class="list_table_style" width="100%" border="0" cellpadding="0" cellspacing="0">
   <caption>주문상품</caption>
   <colgroup>
      <col /><col width="5%" /><col width="10%" /><col width="8%" /><col width="9%" />
      <col width="5%" /><col width="5%" /><col width="5%" /><col width="9%" /><col width="15%" class="goods_delivery_info" />
   </colgroup>
   <thead>
      <tr>
         <th scope="col">주문상품</th>
         <th scope="col">수량</th>
         <th scope="col">상품금액</th>
         <th scope="col">할인금액</th>
         <th scope="col">상품 총금액</th>
         <th scope="col">준비</th>
         <th scope="col">완료</th>
         <th scope="col">취소</th>
         <th scope="col">상품상태</th>
         <th scope="col" class="goods_delivery_info">배송비</th>
      </tr>
   </thead>
   <tbody>
   <%if(list!=null&&list.size()!=0){ 
   	ProductVo pv = null;
  	%>
   <%for(BuyVo bv:list){
	   pv = new ProductService().selectProduct(bv.getPno()); %>
      <tr>
         <td class="left">
            <dl class="order_thumb_wrap">
               <dt>
               <%if(pv !=null){ %>
                  <a href='#' target='_blank'><img src="/mwp/<%=pv.getImg_src() %>" class="order_thumb" alt="" /></a>
                  <%} %>
               </dt>
               <dd>
                  <div>
                     <a href="/mwp/detailProduct.do?pno=<%=bv.getPno() %>"><%=bv.getP_name() %></a>
                  </div>
                  <div>
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
         <td><%=bv.getP_count() %></td>
         <td class="right"><%=bv.getP_price() %>원</td>
         <td class="right">
            <div>0원</div>
         </td>
         <td class="right"><%=bv.getP_price()*bv.getP_count() %>원</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>
         <td>주문접수</td>
         <td class="left goods_delivery_info" rowspan="1">
            <table width="100%" cellpadding="0" cellspacing="0">
               <tr>
                  <td>
                     <div class="blue">본사</div>
                     <div>택배</div>
                     <div>무료</div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <%}
   		}else{%>
   		<tr>
     	 	<td colspan="10">등록된 상품이 없습니다.</td>
     	 </tr>
   		
   		<%} %>

   </tbody>
</table>
<!-- //주문내역 테이블 -->

      


<!-- 배송 관련 정보 :: START -->
<div class="order_settle order_view view clearbox">
   <!-- 배송지 정보 :: START -->
   <div class="benefit">
      <div id="view_address_wrap">
         <h4>배송지</h4>
         <ul class="list_inner delivery_member">
            <li class="delivery_member">
               <div>
                  <span class="bold recipient_user_name"><%=member.getM_NAME() %></span>&nbsp;
                     <button type="button" class="btn_chg small" onclick="mode_change('address_wrap', 'edit')">수정</button>
               </div>
            </li>
            <li class="domestic">
               <span class="recipient_address_street"><%=member.getM_ADDRESS() %></span>
               <span class="recipient_address_detail">상세주소</span><br/>
               <span class="desc">
               (
                  <span class="recipient_address"><%=member.getM_ADDRESS() %></span>
                  <span class="recipient_address_detail">상세주소</span>
               )
               </span>
            </li>
            <li class="international hide">
            </li>
            <li>
               <span class="recipient_cellphone"><%=member.getM_PHONE() %></span>
               <span class="recipient_phone hide"> / </span>
               <span class="recipient_email hide"> / </span>
            </li>
            <li>
               배송국가 : <span class="nation_name">대한민국</span>
               <input type="hidden" id="address_nation" name="address_nation" value="KOREA" />
            </li>
            <li class="hide">
               <span class="recipient_ship_message"></span>
            </li>

         </ul>

      </div>

   <% }%>
</div></div>
</div>
</div>

</div>

</div>

</body>
</html>