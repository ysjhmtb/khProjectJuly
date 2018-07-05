<%@page import="java.sql.Date"%>
<%@page import="product.model.service.ProductService"%>
<%@page import="product.model.vo.BuyVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bnumber = (String)request.getParameter("bnumber");
	int totalPrice = 0;
	int prodKind = Integer.parseInt(request.getParameter("prodKind"));

	ArrayList<BuyVo> list = new ProductService().getBuyList(bnumber);
	String payday = list.get(0).getPayday();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	tr.line td{
		border-bottom:1px solid lightgray;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	String[] addrs = member.getM_ADDRESS().split(", ");
%>
<div class="order2_step">
	<ul>
		<li><h3>STEP 1<span>장바구니</span></h3></li>
		<li><h3>STEP 2<span>주문/결제</span></h3></li>
		<li class="active"><h3>STEP 3<span>결제완료</span></h3></li>
	</ul>
</div>
<!-- //주문/결제 스텝 -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table_style">
	<caption>주문상품</caption>
	<colgroup>
		<col /><col style="width:8%" /><col style="width:10%" /><col style="width:10%" /><col style="width:10%" />
		<col style="width:16%" class="goods_delivery_info" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">주문상품</th>
			<th scope="col">수량</th>
			<th scope="col">상품금액</th>
			<th scope="col">할인금액</th>
			<th scope="col">상품 총금액</th>
			<th scope="col" class="goods_delivery_info">배송비</th>
		</tr>
	</thead>
	<tbody>
	<%for(BuyVo bv : list){ %>
	<%totalPrice += bv.getP_price()*bv.getP_count(); %>
		<tr class="line">
			<td class="left">
				<dl class="order_thumb_wrap">
					<dt>
						<img src="<%=new ProductService().selectProduct(bv.getPno()).getImg_src() %>" class="order_thumb" onerror="this.src='/data/skin/fruit_puro_gls/images/common/noimage_list.gif'" alt="" />
					</dt>
					<dd>
						<a href="#" title="다양한 배송방법 지원" class="order_name"><%=bv.getP_name() %></a>
						<div>
						</div>
					</dd>
				</dl>
			</td>
			<td>1</td>
			<td class="right"><%=bv.getP_price() %>원</td>
			<td class="right">
					0원
				<input type="hidden" name="coupon_download[]" value="" />
			</td>
			<td class="right"><span><%=bv.getP_price()*bv.getP_count() %>원</span></td>
			<td class="left goods_delivery_info" rowspan="1">
				<div class="domestic">
					<div class="blue">본사</div>
					<div>택배</div>
					<div class="hand detailDescriptionLayerBtn">
						착불 2,500원
					</div>

				</div>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>
<!-- //주문내역 테이블 -->

<!-- 배송 관련 정보 :: START -->
<div class="order_settle view clearbox">
	<!-- 배송지 정보 :: START -->
	<div class="info_left">
		<h4>배송지</h4>
		<ul class="item">
			<li><%=member.getM_NAME() %></li>
			<li>
				(<%=addrs[0] %>) 
				<%=addrs[1] %> 
				<%=addrs[2] %><br/>
			</li>
			<li>
				<%=member.getM_PHONE() %>
			</li>
			<li>배송국가 : 대한민국</li>
		</ul>
	</div>
	<!-- 배송지 정보 :: END -->

	<!-- 주문자 정보 :: START -->
	<div class="info_right bgcolor">
		<h4>주문자</h4>
		<ul class="item clearbox">
			<li><%=member.getM_NAME() %></li>
			<li><%=member.getM_PHONE() %></li>
			<li><%=member.getM_ID() %></li>
			<li class="pdt5"></li>
			<li>- 주문자 정보로 주문 관련 정보가 문자와 이메일로 발송됩니다.</li>
			<li>- 비회원은 이메일과 주문번호로 주문조회가 가능합니다.</li>
		</ul>
	</div>
	<!-- 주문자 정보 :: END -->
</div>
<!-- 배송 관련 정보 :: END -->

<!-- 주문 및 금액 관련 정보 :: START -->
<div class="order_settle view clearbox">
	<!-- 주문결제 정보 :: START -->
	<div class="benefit">
		<h4>주문결제정보<span class="pdl10 desc"><span class="btn_trade" style="/*font-size:11px;display: inline-block; background: #000; color: #fff; line-height: 20px; padding: 0px 7px; cursor: pointer;*/" onclick="window.open('/prints/form_print_trade?no=2018070416070317530', '_trade', 'width=960,height=640,scrollbar=1');">거래명세서</span></span></h4>
		<dl class="clearbox">
			<dt>주문번호</dt>
			<dd><%=request.getParameter("bnumber") %> (2018-07-04 16:07)</dd>
			<dt>결제일시</dt>
			<dd>
				<%=payday %>
			</dd>
			<dt>결제방식</dt>
			<dd>
				카카오페이
			</dd>
			<dt>결제금액</dt>
			<dd><strong><%=totalPrice+(prodKind*2500) %>원</strong></dd>
		</dl>
	</div>
	<!-- 주문결제 정보 :: END -->

	<!-- 금액 정보 :: END -->
	<div class="settle bgcolor">
		<dl class="clearbox">
			<dt>상품금액</dt>
			<dd><%=totalPrice %>원</dd>
			<dt>배송비
			</dt>
			<dd><span class="normal">(+)</span> <%=prodKind*2500%>원</dd>
			<dt>할인금액
			</dt>
			<dd><span class="normal">(-)</span> 0원</dd>
			<dt class="total" style="width:30%">총 결제금액</dt>
			<dd class="total " style="width:70%">
				<span class="price tahoma"><%=totalPrice+(prodKind*2500) %>원</span>
				<span class="total_result_price tahoma"></span>
			</dd>
		</dl>
	</div>
	<!-- 금액 정보 :: END -->
</div>
<!-- 주문 및 금액 관련 정보 :: END -->

<!-- 주의 내용 :: START -->
<div class="mt10 pd10 hide">
	<h4 class="mb10 red"><span class="ico_ import">중요표시</span> 주의</h4>
	<ul class="ul_list2">
		<li>비회원 주문의 경우, 주문번호로 주문이 조회되오니 주문번호를 꼭 기억하세요.</li>
		<li>무통장입금의 경우, 11일 이내로 입금 하셔야 하며 이후 입금되지 않은 주문은 자동으로 취소됩니다.</li>
		<li>배송은 결제완료 후 지역에 따라 1~7일 가량 소요됩니다. 상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.</li>
		<li>주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고해 주세요.</li>
	</ul>
</div>
<!-- 주의 내용 :: END -->

<div class="btn_wrap">
	<a href="/nycProject/index.jsp" class="btn_move large">쇼핑 계속하기</a>
	<a href="/nycProject/mypage/mypage.jsp" class="btn_chg large">MY페이지 주문내역</a>
</div>
<!-- //버튼 -->
<!-- //본문내용 끝 -->
<%@ include file="footer.jsp" %>
</body>
</html>