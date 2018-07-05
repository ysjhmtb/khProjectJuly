<%@page import="product.model.service.ProductService"%>
<%@page import="product.model.vo.BuyVo"%>
<%@page import="product.model.vo.CartVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.in_div{
	float:left;
}
.btn{
	text-decoration:none;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<%
// ArrayList<BuyVo> dList = null;
// ArrayList<BuyVo> pList = null;
// ArrayList<BuyVo> cList = null;
	ArrayList<BuyVo> dList = new ProductService().getMBuyList(0);
	ArrayList<BuyVo> pList = new ProductService().getMBuyList(1);
	ArrayList<BuyVo> cList = new ProductService().getMBuyList(2);
%>

   <%if(member==null){%>
         <script>alert("로그인이 필요합니다.");
         parent.document.location.replace('http://localhost:8081/nycProject/member/login.jsp');
         </script>
         
  <% }else{%>

<!-- //상단영역 : 끝 -->

   <div id="layout_config">
   <div id="wrap_div">
   <div class="in_div">
      <div id="layout_side">
      <div class="side_list">
   <h2>관리자페이지</h2>

   <h3>관리자 페이지</h3>
   <ul>
      <li><a href="/nycProject/cart.jsp">멤버관리</a></li>
      <li><a href="/mypage/wish" >주문관리</a></li>      
      <li><a href="/mypage/taxinvoice" >세금계산서 신청</a></li>
      <li><a href="/mypage/personal" >개인결제</a></li>
      <li><a href="/mypage/delivery_address?tab=1" >주소록</a></li>
      <li><a href="/mypage/return_catalog" >반품/교환 내역</a></li>
      <li><a href="/mypage/refund_catalog" >환불 내역</a></li>
      <li><a href="/mypage/my_minishop" >나의 단골 미니샵</a></li>
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

      <li><a href="/mypage/index">마이페이지</a></li>
      <li>주문/배송 내역</li>

   </ul>
</div>
<!-- //페이지경로 -->

<div class="h3_wrap">
   <h3>미배송 상품</h3>

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="mypage_wrap">
  

<!-- //버튼 -->

<table class="list_table_style" id="deliveryList" width="100%" border="0" cellpadding="0" cellspacing="0">
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
         <th scope="col" class="goods_delivery_info">배송확인</th>
      </tr>
   </thead>
   <tbody>
   <%if(null!=dList){ %>
   <%for(BuyVo bv:dList){ %>
      <tr>
         <td class="left">
         <input type="hidden" name="bno" id="bno" value="<%=bv.getBno() %>"/>
            <dl class="order_thumb_wrap">
               <dt>
                  <a href='#' target='_blank'><img src="/nycProject/<%=new ProductService().selectProduct(bv.getPno()).getImg_src() %>" class="order_thumb" alt="" /></a>
               </dt>
               <dd>
                  <div>
                     <a href='/goods/view?no=11' target='_blank' class="order_name"><%=bv.getP_name() %></a>
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
                  <td align="center">
                     
						<a href="/nycProject/deliveryM.do?bno=<%=bv.getBno()%>" class="btn">배송완료</a>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <%} %>
      <%} %>

   </tbody>
</table>
<!-- //주문내역 테이블 -->
<br></br>
</div>
<div class="h3_wrap">
   <h3>배송 완료 상품</h3>

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="mypage_wrap">
  

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
         <th scope="col" class="goods_delivery_info">입금확인</th>
      </tr>
   </thead>
   <tbody>
   <%if(null!=pList){ %>
   <%for(BuyVo bv:pList){ %>
      <tr>
         <td class="left">
            <dl class="order_thumb_wrap">
               <dt>
                  <a href='#' target='_blank'><img src="/nycProject/<%=new ProductService().selectProduct(bv.getPno()).getImg_src() %>" class="order_thumb" alt="" /></a>
               </dt>
               <dd>
                  <div>
                     <a href='/goods/view?no=11' target='_blank' class="order_name"><%=bv.getP_name() %></a>
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
                  <td align="center">
                     <a href="/nycProject/payM.do?bno=<%=bv.getBno()%>" class="btn">입금완료</a>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <%} %>
	<%} %>
   </tbody>
</table>
<!-- //주문내역 테이블 -->
<br></br>
</div>

      <div class="h3_wrap">
   <h3>배송/입금 완료 상품</h3>

</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="mypage_wrap">
  

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
         <th scope="col" class="goods_delivery_info">배송완료</th>
      </tr>
   </thead>
   <tbody>
   <%if(null!=cList){ %>
   <%for(BuyVo bv:cList){ %>
      <tr>
         <td class="left">
            <dl class="order_thumb_wrap">
               <dt>
                  <a href='#' target='_blank'><img src="/nycProject/<%=new ProductService().selectProduct(bv.getPno()).getImg_src() %>" class="order_thumb" alt="" /></a>
               </dt>
               <dd>
                  <div>
                     <a href='/goods/view?no=11' target='_blank' class="order_name"><%=bv.getP_name() %></a>
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
                     
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <%} %>
      <%} %>

   </tbody>
</table>
</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
<!-- //주문내역 테이블 -->
</div>
</div>
</div>
</div>
</div>
<% }%>
<%@ include file="../footer.jsp" %>
</body>
</html>

</body>
</html>