<%@page import="product.model.vo.CartVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CartVo> list = (ArrayList<CartVo>)request.getAttribute("list");
	String name1 = (String)request.getAttribute("list1");
	int totalPrice = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div.line{
		border-top:1px solid lightgray;
 	}
/* 	div span{  */
/*  		font-size:30px;  */
/*   	}   */
/*  	div input{ */
/*  	} */

	.addrInfo{
		width:66.1%;
		height:70%;
		padding:30px;
	}
	.addrInfo >*{
		width:66%;
		height:70%;
		padding:30px;
	}
	ul input{
		font-size:15px;
	}
</style>

</head>
<body>
<%@ include file="header.jsp" %>
<%
	String[] phones = member.getM_PHONE().split("-");
	String[] addrs = member.getM_ADDRESS().split(", ");
%>
<script>
		$(function(){
			$("#modifyBtn").click(function(){
				$("#recipient_user_name").val("<%=member.getM_NAME()%>");
				$("#recipient_address_street").val("<%=addrs[1]%>");
				$("#recipient_address_detail").val("<%=addrs[2]%>");
				$("#international_postcode").val("<%=addrs[0]%>");
				$("#phone1").val("<%=phones[0]%>");
				$("#phone2").val("<%=phones[1]%>");
				$("#phone3").val("<%=phones[2]%>");
				$("#recipient_email").val("<%=member.getM_ID()%>");
			});
			
			$("#pay").click(function(){
// 				location.href="/nycProject/buyPage.jsp";
				<% String names="";%>
				<% String prices="";%>
				<% String counts="";%>
				<% String pno="";%>
				<% String cno="";%>
				<%for(CartVo cv:list){
					names += cv.getPv().getName()+"/";
					prices += cv.getPv().getPrice()+"/";
					counts += cv.getCount()+"/";
					pno += cv.getPv().getPno()+"/";
					cno += cv.getCno()+"/";
					totalPrice += cv.getPv().getPrice()*cv.getCount();
				}%>
<%-- 				window.open("/nycProject/buyPage.jsp?totalPrice=<%=totalPrice%>&pnames=<%=names%>","_black","width=390, height=500, left=200, top=200"); --%>
				window.open("/nycProject/buyPage.jsp?totalPrice=<%=totalPrice+list.size()*2500%>&pnames=<%=names%>&prices=<%=prices%>&counts=<%=counts%>&pnos=<%=pno%>&cnos=<%=cno%>","_black","width=390, height=500, left=200, top=200");
			});
		});
			

</script>
<!-- 본문내용 시작 -->
<div class="order2_step">
	<ul>
		<li><h3>STEP 1<span>장바구니</span></h3></li>
		<li class="active"><h3>STEP 2<span>주문/결제</span></h3></li>
		<li><h3>STEP 3<span>결제완료</span></h3></li>
	</ul>
</div>
<!-- //주문/결제 스텝 -->

<div id="kakaopay_layer" class="hide"></div>
<form name="orderFrm" id="orderFrm" method="post" action="cacluate" target="actionFrame">
<input type="hidden" name="mode" value="cart" />
<input type="hidden" name="order_version" value="2.0" />
<input type="hidden" name="delivery_coupon" value="" />
<input type="hidden" name="coupon_sale" id="shipping_coupon_sale" value="" />
<input type="hidden" name="member_seq" id="member_seq" value="" />
<input type="hidden" name="person_seq" id="person_seq" value="" />
<input type="hidden" name="enuri" id="enuri" value="" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table_style">
	<caption>주문상품</caption>
	<colgroup>
		<col /><col style="width:8%" /><col style="width:10%" /><col style="width:10%" />
		<col style="width:10%" /><col style="width:16%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">주문상품</th>
			<th scope="col">수량</th>
			<th scope="col">상품금액</th>
			<th scope="col">할인금액</th>
			<th scope="col">할인적용금액</th>
			<th scope="col">배송비 <button type="button" class="btn_shipping_modify hide">변경</button></th>
		</tr>
	</thead>
	<tbody>
	<%for(CartVo cv:list){ %>
		<tr class="goods_1_1_delivery">
			<td class="left">
				<input type="hidden" name="coupon_download[82][87]" value="" />
				<dl class="order_thumb_wrap">
					<dt>
						<img src="<%=cv.getPv().getImg_src() %>" class="order_thumb" onerror="this.src='/data/skin/fruit_puro_gls/images/common/noimage_list.gif'" alt="다양한 배송방법 지원" />
					</dt>
					<dd>
						<a href="#" title="다양한 배송방법 지원" class="order_name"><%=cv.getPv().getName() %></a>
						<div>
						</div>

					</dd>
				</dl>
			</td>
			<td>1</td>
			<td class="right"><%=cv.getPv().getPrice()*cv.getCount() %>원</td>
			<td class="right">
				<div id="cart_option_sale_total_87">
					-
				</div>
			</td>
			<td class="right bold">
				<span id="cart_option_price_87"><%=cv.getPv().getPrice() %></span>원
				<div class="price_cell"></div>
			</td>
			<td class="left grp_shipping_1_1_delivery" rowspan="1">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div class="blue shipper_name">본사</div>
							<div class="shipping_set_name">택배</div>
						</td>
						<td>
<!-- 							배송방법 변경 :: START -->
<!-- 							<div class="order_change"> -->
<!-- 								<button type="button" class="btn_shipping_modify btn_chg small" cart_seq="82" prepay_info="delivery" nation="korea" goods_seq="11" hop_date="" reserve_txt="">변경</button> -->
<!-- 							</div> -->
<!-- 							배송방법 변경 :: END -->
								착불 2,500원
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>
<!-- //주문상품 테이블 -->

<div class="hide">
	<b>기본배송비 : <span class="basic_delivery">0</span>원</b>
	<b class="total_add_delivery_lay hide" style="padding-left:20px;">추가배송비 : <span class="add_delivery">0</span>원</b>
	<b><span id="shipping_coupon_sale"></span></b>
	<b><span id="shipping_code_sale"></span></b>
</div>

<!-- 배송 및 주문자 정보 :: START -->
<div class="order_settle clearbox">
	<!-- 배송지 정보 :: START -->
	<div class="benefit line addrInfo">
		<h4>배송지</h4>
		<ul class="list_inner">
			<!-- 배송불가 MSG :: START -->
			<li class="ship_possible red hide">
				<input type="hidden" id="ship_possible" name="ship_possible" value="Y" />
				아래의 국가(<span class="kr_nation bold international_nation">대한민국</span>)<span class="kr_nation_region"></span>(으)로 배송이 불가능한 상품이 있습니다.<br />
				장바구니에서 주문 상품을 변경하시거나 다른 국가를 선택해 주세요. &nbsp;
				<button type="button" class="btn_move small red mt-5" onclick="location='/order/cart'">장바구니로 돌아가기</button>
			</li>
			<!-- 배송불가 MSG :: END -->
		</ul>
		<ul class="list_inner delivery_member" style="margin-top:-10px">
			<!-- 회원일 경우 :: START -->
<!-- 			<li class="delivery_member"> -->
<!-- 				받는분 -->
				<div>
					<span class="bold recipient_user_name">주문자와 동일</span> &nbsp;<button type="button" class="btn_chg small" id="modifyBtn">수정</button>
				</div>
<!-- 				주소 -->
<!-- 				<div class="bold goods_delivery_info "> -->
<!-- 					<span class="kr_zipcode hide">(<span class="recipient_zipcode"></span>)</span> <span class="recipient_address">배송주소 없음</span> <span class="recipient_address_detail"></span> -->
<!-- 				</div> -->
<!-- 				연락처 -->
<!-- 				<div> -->
<!-- 					휴대폰번호 -->
<!-- 					<span class="bold cellphone">휴대폰번호 없음</span> -->
<!-- 					/ -->
<!-- 					추가연락처 -->
<!-- 					<span class="bold phone">추가연락처 없음</span> -->
<!-- 					<span class="hide"> -->
<!-- 					/ -->
<!-- 					이메일 -->
<!-- 					<span class="bold recipient_email coupon_delivery_info">이메일주소 없음</span> -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 				배송국가 -->
<!-- 				<div class="goods_delivery_info hide" > -->
<!-- 					배송국가 : <span class="international_nation">대한민국</span> -->
<!-- 					<input type="hidden" id="address_nation" name="address_nation" value="KOREA" /> -->
<!-- 					<input type="hidden" id="address_nation_key" name="address_nation_key" value="KOR" /> -->
<!-- 				</div> -->
<!-- 			</li> -->
			<!-- 회원일 경우 :: END -->
		</ul>
		<!-- 받는분 정보 입력 란 :: START -->
		<ul class="list_inner delivery_input ulstyle" style="margin-top:-10px">
			<li>
				<input type="text" name="recipient_user_name" id="recipient_user_name" value="" title="받는분" />
			</li>
			<!-- 국내 -->
			<li class="domestic goods_delivery_info">
				<input type="text" name="recipient_address_street" id="recipient_address_street" value="" size="45" readonly title="도로명 주소" />	
			</li>
			<!-- 해외 -->
			<li class="international goods_delivery_info">
				<input type="text" name="recipient_address_detail" id="recipient_address_detail" value="" size="45" title="상세주소" required />
			</li>
			<li class="international goods_delivery_info">
				<input type="text" name="international_postcode" id="international_postcode" value="" title="우편번호" required />
			</li>
			<!-- 연락처 -->
			<li class="base_phone">
				<input type="text" name="recipient_cellphone[]" id="phone1" value="" size="3" maxlength="4" onkeydown="onlyNumber(this)" title="휴대폰" valid="받는분 휴대폰" /> -
				<input type="text" name="recipient_cellphone[]" id="phone2" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" valid="받는분 휴대폰" /> -
				<input type="text" name="recipient_cellphone[]" id="phone3" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" valid="받는분 휴대폰" />
			</li>
			<!-- 이메일 -->
			<li class="coupon_delivery_info">
				<input type="text" name="recipient_email" id="recipient_email" value="" title="받는분 이메일주소" />
			</li>
		</ul>
		<!-- 받는분 정보 입력 란 :: END -->
		<ul class="list_inner" style="margin-top:-15px">
			<!-- 선택국가 :: START -->
			<li class="goods_delivery_info hide">
				<span class="international_nation">대한민국</span> &nbsp;
				<button type="button" class="btn_move small detailDescriptionLayerBtn">다른국가 선택</button>
				<div class="detailDescriptionLayer hide" style="width:300px;">
					<div class="layer_wrap">
						<h1>배송국가 선택</h1>
						<div class="layer_inner">
							<dl class="ship_country clearbox">
								<dt>현재 배송 국가 : <strong class="international_nation">대한민국</strong>
								<img id="nation_img" src="/admin/skin/default/images/common/icon/nation/KOREA.png" height="20" alt=""></dt>
								<dd id="nation_gl_type" class="hide"><button type="button" class="btn_move small" onclick="chg_shipping_nation('KOREA');">대한민국으로 변경</button></dd>
							</dl>
							<div style="padding-right:5px; height:187px; overflow-y:scroll;">
							</div>
						</div>
						<a href="javascript:;" class="detailDescriptionLayerCloseBtn">닫기</a>
					</div>
				</div>
			</li>
			<!-- 선택국가 :: END -->
			<!-- 기타 안내 :: START -->
			<li class="hide">
				매장수령 상품은 매장에서 상품을 수령하세요.
			</li>
			<li class="hide">
				티켓상품의 티켓번호는 문자와 이메일로 보내 드립니다.
			</li>
			<!-- 기타 안내 :: END -->
			<!-- 배송메세지 :: START -->
			<li class="goods_delivery_info">
				<div class="fleft pdr10 pdb10">
					<div class="ship-lay total_ship_msg">
						<span class="ship_message">
							<input type="text" class="ship_message_txt" name="memo" id="memo" size="70" title="배송 메시지를 입력하세요." value="" />
							<span class="click"></span>
							<ul class="add_message">
								<li>배송 전에 미리 연락해 주세요.</li>
								<li>부재시 경비실에 맡겨 주세요.</li>
								<li>부재시 전화 주시거나 문자 남겨 주세요.</li>
							</ul>
						</span>
						<span class="desc"><span class="cnt_txt">0</span>/300</span>
					</div>
					<div class="each_ship_msg hide">
						<div class="ship-lay pdb10">
							<div class="goods_info_txt">
							다양한 배송방법 지원
색상: 블랙							</div>
							<span class="ship_message">
								<input type="text" class="ship_message_txt" name="each_memo[]" size="70" title="배송 메시지를 입력하세요." value="" />
								<span class="click"></span>
								<ul class="add_message">
									<li>배송 전에 미리 연락해 주세요.</li>
									<li>부재시 경비실에 맡겨 주세요.</li>
									<li>부재시 전화 주시거나 문자 남겨 주세요.</li>
								</ul>
							</span>
							<span class="desc"><span class="cnt_txt">0</span>/300</span>
						</div>
					</div>
				</div>
				<div class="ship-msg-lay hide">
					<input type="checkbox" id="each_msg" name="each_msg" onchange="ship_each_input();" value="Y" /> <label for="each_msg">상품별 입력</label>
				</div>
			</li>
			<!-- 배송메세지 :: END -->
		</ul>
	</div>
	<!-- 배송지 정보 :: END -->

	<!-- 주문자 정보 :: START -->
	<div class="settle bgcolor line">
		<h4>주문자</h4>
		<input type="hidden" name="order_zipcode[]" value="" />
		<input type="hidden" name="order_zipcode[]" value="" />
		<input type="hidden" name="order_address_type" value="" />
		<input type="hidden" name="order_address" value="" />
		<input type="hidden" name="order_address_street" value="" />
		<input type="hidden" name="order_address_detail" value=""/>
		<ul class="list_inner">
			<!-- 회원일 경우 :: START -->
			<li class="order_member">
				<ul>
					<li><span class="bold order_user_name">주문자 : </span><%=member.getM_NAME() %></li>
					<li><span>휴대폰번 : </span><%=member.getM_PHONE() %></li>
					<li><span>이메일 : </span><%=member.getM_ID() %></li>
				</ul>
			</li>
			<!-- 회원일 경우 :: END -->
			<!-- 주문자 정보 입력 란 :: START -->
			<li class="order_input hide">
				<input type="text" name="order_user_name" value="" title="주문자명"  required />
				<label for="copy_delivery_info"><input type="checkbox" name="copy_delivery_info" class="hide" /><button type="button" class="btn_move small" id="copy_delivery_info">배송지 정보와 동일</button></label>
			</li>
			<li class="order_input hide">
				<input type="text" name="order_cellphone[]" value="" size="3" maxlength="4" onkeydown="onlyNumber(this)" required title="휴대폰" valid="주문자 휴대폰" /> -
				<input type="text" name="order_cellphone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" required valid="주문자 휴대폰" /> -
				<input type="text" name="order_cellphone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" required valid="주문자 휴대폰" />
				&nbsp;
				<span class="add_phone_btn hand" id="btn_order_add_phone" onclick="add_phone(this,'open');">추가연락처 열기 ▼</span>
			</li>
			<li class="add_phone pdt5 hide">
				<input type="text" class="add_phone_input" name="order_phone[]" value="" size="3" maxlength="4" onkeydown="onlyNumber(this)" title="추가" /> -
				<input type="text" class="add_phone_input" name="order_phone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)"  /> -
				<input type="text" class="add_phone_input" name="order_phone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" />
			</li>
			<li class="order_input hide">
				<input type="text" name="order_email" value="" title="주문자 이메일주소" required />
			</li>
			<!-- 주문자 정보 입력 란 :: END -->
			<li>
				<ul class="ul_list2 mt5">
					<li>주문자 정보로 주문관련 정보가 문자와 이메일로 발송됩니다.</li>
					<li>정확한 휴대폰번호와 이메일주소를 확인하세요.</li>
					<li>비회원은 이메일과 주문번호로 주문조회가 가능합니다.</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- 주문자 정보 :: END -->
</div>
<!-- 배송 및 주문자 정보 :: END -->

<!-- 할인/적립 및 결제금액 정보 :: START -->
<div class="order_settle clearbox line">
	<!-- 할인 및 적립 :: START -->
	<div class="benefit">
		<h4></h4>
		<dl class="save clearbox">
			<dt></dt>
			<dd class="gray"></dd>
			<dt></dt>
			<dd class="gray"></dd>
			
			<dt></dt>
			<dd class="gray"></dd>
		</dl>
	</div>
	<!-- 할인 및 적립 :: END -->
	<!-- 결제금액 :: START -->
	<div class="settle bgcolor line">
		<dl class="clearbox">
			<dt>상품금액</dt>
			<dd><span id="total_goods_price"><%=totalPrice %></span>원</dd>
			<dt class="goods_delivery_info">
				배송비
			</dt>
			<dd class="goods_delivery_info"><span class="normal">(+)</span> <span class="total_delivery_shipping_price"><%=list.size()*2500 %></span>원</dd>
			<dt>
				할인금액
					
			</dt>
			<dd>
				<div class="p_area">
					<span class="normal minus">(-)</span> 
					<span class="total_sales_price">0</span>원
				</div>
			</dd>
			<dt class="total" style="width:30%">최종 결제금액</dt>
			<dd class="total" style="width:70%;">
				<span class="price tahoma"><span class="settle_price tahoma"><%=(totalPrice+(list.size()*2500)) %></span>원</span>
				<span class="settle_price_compare total_result_price tahoma"></span>
			</dd>
		</dl>
	</div>
	<!-- 결제금액 :: END -->
</div>
<!-- 할인/적립 및 결제금액 정보 :: END -->

<!-- 결제정보 및 약관동의 정보 :: START -->
<div class="order_settle clearbox hide">
	<!-- 결제정보 :: START -->
	<div class="benefit">
		<h4>결제정보</h4>
		<div class="list_inner">
			<ul id="payment_type" class="clearbox">
				
				<!--  -->				
				<li>
					<div class="card">
						<label><input type="radio" name="payment" value="card" /></label>
					</div>
					<p>신용카드</p>
				</li>
				<li>
					<div class="escrow_account">
						<label><input type="radio" name="payment" value="escrow_account" /></label>
					</div>
					<p>실시간<br />계좌이체<br />(에스크로)</p>
				</li>
				<li>
					<div class="escrow_virtual">
						<label><input type="radio" name="payment" value="escrow_virtual" /></label>
					</div>
					<p>가상계좌<br />(에스크로)</p>
				</li>
				<!--  -->
				
				<li>
					<div class="bank2">
						<label><input type="radio" name="payment" value="bank" checked="checked" /></label>
					</div>
					<p>무통장입금</p>
				</li>
				<li>
					<div class="paypal">
						<label><input type="radio" name="payment" value="paypal" checked="checked" /></label>
					</div>
					<p>Paypal</p>
				</li>
			</ul>
			<div id="payment_type_zero" class="hide">
				<strong>전액할인</strong>
			</div>
			<table class="bank" width="100%" border="0" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="18%" /><col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">입금자명</th>
						<td><input type="text" name="depositor" title="홍길동" /></td>
					</tr>
					<tr>
						<th scope="row">입금은행</th>
						<td>
							<select name="bank">
								<option value="">입금은행을 선택해 주세요.</option>
								<option value="국민은행 000000-00-000000 (예금주:김대표)">국민은행 000000-00-000000 (예금주:김대표)</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- //무통장입금 정보 -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="18%" /><col />
				</colgroup>
				<tbody>
					<tr id="typereceiptlay" class="">
						<th scope="row">발급정보</th>
						<td>
							<select name="" style="width:130px;display:none;">
								<option value="0">발급안함</option>
								<option value="2">현금영수증</option>
								<option value="1">세금계산서</option>
							</select>
							<input type="radio" name="typereceipt" id="typereceipt0" value="0" checked="checked"> <label for="typereceipt0">발급안함</label>
							<span class='cach_voucherchk'>
							<input type="radio" name="typereceipt" id="typereceipt2" value="2"> <label for="typereceipt2">현금영수증 </label>
							</span>
							<span class='tax_voucherchk'>
							<input type="radio" name="typereceipt" id="typereceipt1" value="1"> <label for="typereceipt1">세금계산서 </label>
							</span>
						</td>
					</tr>
					<tr id="typereceiptcardlay" class="hide">
						<th scope="row">발급정보</th>
						<td>카드매출전표(또는 휴대폰결제전표)로 대체합니다.</td>
					</tr>
					<tr id="typereceipttablelay" class="hide">
						<th scope="row"></th>
						<td>
							<!-- ~~~~~~~ 현금영수증 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<ul id="cash_container" class="typereceiptlay hide">
								<li>
									<input type="radio" name="cuse" id="cuse0" value="0" checked="checked"/> <label for="cuse0">개인 소득공제</label>
									<input type="radio" name="cuse" id="cuse1" value="1"/> <label for="cuse1">사업자 지출증빙</label>
								</li>
								<li id="personallay">
								  <input type="text" name="creceipt_number[0]" class="line number" maxlength="13" title="휴대폰번호('-' 없이 입력)" />
								</li>
								<li id="businesslay" class="hide">
								  <input type="text" name="creceipt_number[1]" class="line number" maxlength="10" title="사업자번호('-' 없이 입력)" />
								</li>
								<li id="personallay">
								  <input type="text" name="sales_email" class="line" title="이메일주소" />
								</li>
								<li id="duplicate_message" class="desc">
									※ 결제창에서 다시 현금영수증을 신청하지 마세요. 중복발행 됩니다.
								</li>
							</ul>
							<!-- ~~~~~~~ 세금계산서 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<ul id="tax_container" class="typereceiptlay hide">
								<li>
									<input type="text" name="co_name" id="co_name" value="" title="상호명" />
								</li>
								<li>
									<input type="text" name="busi_no" id="busi_no" value="" title="사업자번호" /> <span class="desc">ex) 123-12-12345</span>
								</li>
								<li>
									<input type="text" name="co_ceo" id="co_ceo" value="" title="대표자명" />
								</li>
								<li>
									<input type="text" name="co_status" id="co_status" value="" title="업태" /> /
									<input type="text" name="co_type" id="co_type" value="" title="업종" />
								</li>
								<li>
									<input type="text" name="co_new_zipcode" value="" title="우편번호" />
									<button type="button" class="btn_move small" onclick="window.open('../popup/zipcode?mtype=co_','popup_zipcode','width=600,height=350')">검색</button>
								</li>
								<li>
									<input type="hidden" name="co_address_type" id="co_address_type" value="" title="주소" />
									<input type="text" name="co_address" id="co_address" size="40" value=""  title="주소" />
									<input type="text" name="co_address_street" id="co_address_street" size="40" value=""  class="hide"  title="주소" />
									<input type="text" name="co_address_detail" id="co_address_detail" size="40" value="" title="상세주소" />
								</li>
								<li>
									<input type="text" name="person" id="person" value="" title="담당자명" />
								</li>
								<li>
									<input type="text" name="email" id="email" value="" title="이메일주소" />
								</li>
								<li>
									<input type="text" name="phone" id="phone" value="" title="연락처" />
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 결제정보 :: END -->
	<!-- 약관동의 :: START -->
	<div class="settle bgcolor">
		<ul class="agreement">
			<li>
				<input type="checkbox" name="agree1" id="agree1" value="Y" />
				<label for="agree1">(<span class="red">필수</span>) 서비스 이용 약관 동의</label>
				<div class="agree_area">전자상거래(인터넷사이버몰) 표준약관<br />
<br />
표준약관 제10023호<br />
(2014. 9. 19. 개정)<br />
<br />
 <br />
<br />
제1조(목적) 이 약관은(주) 귀사의 회사명 회사(전자상거래 사업자)가 운영하는 (주) 귀사의 회사명 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br />
<br />
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br />
<br />
제2조(정의)<br />
<br />
  ① “몰”이란 (주) 귀사의 회사명 회사가 재화 또는 용역(이하 “재화 등” 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br />
<br />
  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br />
<br />
  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br />
<br />
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br />
<br />
제3조 (약관 등의 명시와 설명 및 개정) <br />
<br />
  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 (주) 귀사의 회사명 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br />
<br />
  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br />
<br />
  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />
<br />
  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.<br />
     다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br />
<br />
  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />
<br />
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.<br />
<br />
제4조(서비스의 제공 및 변경) <br />
<br />
  ① “몰”은 다음과 같은 업무를 수행합니다.<br />
<br />
    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br />
    2. 구매계약이 체결된 재화 또는 용역의 배송<br />
    3. 기타 “몰”이 정하는 업무<br />
<br />
  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br />
<br />
  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br />
<br />
  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br />
<br />
제5조(서비스의 중단) <br />
<br />
  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br />
<br />
  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br />
<br />
  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br />
<br />
제6조(회원가입) <br />
<br />
  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br />
<br />
  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br />
<br />
    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br />
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br />
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br />
<br />
  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br />
<br />
  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br />
<br />
제7조(회원 탈퇴 및 자격 상실 등) <br />
<br />
  ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br />
<br />
  ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br />
<br />
    1. 가입 신청 시에 허위 내용을 등록한 경우<br />
    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br />
    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br />
    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br />
<br />
  ③ “몰”이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br />
<br />
  ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br />
<br />
제8조(회원에 대한 통지)<br />
<br />
  ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br />
<br />
  ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br />
<br />
제9조(구매신청)<br />
<br />
  ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br />
<br />
    1. 재화등의 검색 및 선택<br />
    2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br />
    3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인<br />
    4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시<br />
    5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br />
    6. 결제방법의 선택<br />
<br />
  ② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다.<br />
     다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br />
<br />
제10조 (계약의 성립)<br />
<br />
  ① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br />
<br />
    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br />
    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br />
    3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br />
<br />
  ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br />
<br />
  ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br />
<br />
제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br />
<br />
    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체<br />
    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br />
    3. 온라인무통장입금<br />
    4. 전자화폐에 의한 결제<br />
    5. 수령 시 대금지급<br />
    6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제<br />
    7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제<br />
    8. 기타 전자적 지급 방법에 의한 대금 지급 등<br />
<br />
제12조(수신확인통지·구매신청 변경 및 취소)<br />
<br />
  ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br />
<br />
  ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.<br />
<br />
제13조(재화 등의 공급)<br />
<br />
  ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br />
<br />
  ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br />
<br />
제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br />
<br />
제15조(청약철회 등)<br />
<br />
  ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다.<br />
     다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.<br />
<br />
  ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br />
<br />
    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br />
    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br />
    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br />
    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br />
<br />
  ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br />
<br />
  ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br />
<br />
제16조(청약철회 등의 효과)<br />
<br />
  ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br />
<br />
  ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br />
<br />
  ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br />
<br />
  ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br />
<br />
제17조(개인정보보호)<br />
<br />
  ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br />
<br />
  ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br />
<br />
  ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br />
<br />
  ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br />
<br />
  ⑤ “몰”이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br />
<br />
  ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br />
<br />
  ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br />
<br />
  ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br />
<br />
  ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br />
<br />
제18조(“몰“의 의무)<br />
<br />
  ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.<br />
<br />
  ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br />
<br />
  ③ “몰”이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br />
<br />
  ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br />
<br />
제19조(회원의 ID 및 비밀번호에 대한 의무)<br />
<br />
  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br />
<br />
  ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br />
<br />
  ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.<br />
<br />
제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.<br />
<br />
    1. 신청 또는 변경시 허위 내용의 등록<br />
    2. 타인의 정보 도용<br />
    3. “몰”에 게시된 정보의 변경<br />
    4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br />
    5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br />
    6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br />
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br />
<br />
제21조(연결“몰”과 피연결“몰” 간의 관계)<br />
<br />
  ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br />
<br />
  ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br />
<br />
제22조(저작권의 귀속 및 이용제한)<br />
<br />
  ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br />
<br />
  ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br />
<br />
  ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br />
<br />
제23조(분쟁해결)<br />
<br />
  ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.<br />
<br />
  ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br />
<br />
  ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br />
<br />
제24조(재판권 및 준거법)<br />
<br />
  ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br />
<br />
  ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br />
<br />
<br />
</div>
			</li>
			<!--//서비스 이용 약관 동의 -->
			<li>
				<input type="checkbox" name="agree2" id="agree2" value="Y" />
				<label for="agree2">(<span class="red">필수</span>) 개인정보 수집 및 이용 동의</label>
				<div class="agree_area">(주) 귀사의 회사명(이하 '회사'는)은<br />
고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br />
<br />
[개인정보의 수집 및 이용목적]<br />
<br />
<br />
<br />
[개인정보의 보유 및 이용기간]<br />
<br />
<br />
<br />
<br />
[개인정보의 파기절차 및 방법]<br />
<br />
</div>
			</li>
			<!--//개인정보 수집 및 이용 동의 -->
		</ul>
	</div>
	<!-- 약관동의 :: END -->
</div>
<!-- 결제정보 및 약관동의 정보 :: END -->

<div class="pdt30 pay_layer center">
	<button type="button" class="btn_move large" onclick="location='/order/cart'">장바구니로 돌아가기</button>
	<button type="button" name="button_pay" id="pay" class="btn_chg large">결제하기</button>
</div>
<!-- //버튼 -->
<!-- //본문내용 끝 -->

<div style="display:none;" class="pay_layer center">
	<div class="hide"><img src="/data/skin/fruit_puro_gls/images/design/img_paying.gif" alt="" /></div>
	<div class="pdt20"><img src="/data/skin/fruit_puro_gls/images/design/progress_bar.gif" alt="" /></div>
</div>
</form>

<div id="coupon_apply_dialog" class="hide">
	<ul class="ul_coupon">
		<li>
			<span class="ico_de">iCON</span> <strong>상품 쿠폰</strong>
			<ul id="coupon_goods_lay" class="ul_list2">
				<li>상품명  |  상품갯수
					<div class="">
						<select id="" style="width:85%;">
							<option value="" selected="selected">coupons</option>
							<option value=""></option>
						</select>
						<button type="button" class="btn_move small" disabled>쿠폰정보</button>
					</div>
				</li>
			</ul>
		</li>
		<li>
			<span class="ico_de">iCON</span> <strong>배송비 쿠폰</strong>
			<ul id="coupon_shipping_lay" class="ul_list2">
				<div id="coupon_shipping_select" class="">
					<select id="" style="width:85%;">
						<option value=""></option>
					</select>
					<button type="button" class="btn_move small">쿠폰정보</button>
				</div>
			</ul>
		</li>
	</ul>
	<div class="btn_wrap">
		<button type="button" id="coupon_order" style="height:30px;" class="btn_sch medium couponbtn">적용</button>
	</div>
</div>
<div id="shipping_detail_lay" style="display:none;"></div><!--배송정보-->
<div id="delivery_address_dialog" style="display:none;"></div><!--주소록-->
<div id="PromotionDialog" class="hide"></div>
<div id="couponDownloadDialog" style="display:none"></div>
<div class="relative absolute orderpromotionlay hide">
	<div  style="width:280px;height:190px;" class="orderleft_mbox hand left" >
		<span class="orderleft_rb"></span>
		<span class="orderleft_lb"></span>
		<span class="orderleft_rt"></span>
		<span class="orderleft_lt"></span>
		<div class="orderleft_mbody">
			<div class="orderleft_mcontent" >
				<span class="bold" style=" font-family:dotum; font-size:12px; color:#ef1b1a;" >&nbsp;프로모션코드?</span>
				<div style="padding-bottom:5px;" >
					<span style=" font-family:dotum; font-size:11px; color:#888;" >
					- 프로모션 또는 포인트 교환에 의해 발급되는 Code <br />
					- 16자리로 된 Code를 적용하여 사용이 가능하며,<br />
					&nbsp;&nbsp;주문시 결제완료 후 Code가 소멸되며 재발급되지<br />
					&nbsp;&nbsp;않는 점 주의 바랍니다.(개별코드)
					</span>
				</div>
				<div style="border:1px solid #dcdcdc;" ></div>
				<div style="padding-top:5px;" >
					<span  style=" font-family:dotum; font-size:11px; color:#ef1b1a;" >1개의 주문건당 1개의 프로모션코드만 사용이 가능하며,
				중복적용은 되지 않습니다.</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div class="relative absolute ordershoppinglay hide"> -->
<!-- 	<div  style="width:280px;height:140px;" class="orderleft_mbox hand left" > -->
<!-- 		<span class="orderleft_rb"></span> -->
<!-- 		<span class="orderleft_lb"></span> -->
<!-- 		<span class="orderleft_rt"></span> -->
<!-- 		<span class="orderleft_lt"></span> -->
<!-- 		<div class="orderleft_mbody"> -->
<!-- 			<div class="orderleft_mcontent" > -->
<!-- 				<span class="red bold" style=" font-family:dotum; font-size:12px; color:#ef1b1a;">&nbsp;배송비?</span> -->
<!-- 				<div style="padding-bottom:5px;" > -->
<!-- 					<span style=" font-family:dotum; font-size:11px; color:#888;" > -->
<!-- 					- 본사배송 상품 또는 각 파트너사별로 5만원 미만 구매시 2,500원의 배송비가 발생합니다.<br/> -->
<!-- 					- 제주도 및 도서산간지역은 최종 결제시 2,000원의 별도 추가 배송비가 청구됩니다 </span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <div class="relative absolute orderwmoneylay hide"> -->
<!-- 	<div  style="width:280px;height:160px;" class="orderright_mbox hand left" > -->
<!-- 		<span class="orderright_rb"></span> -->
<!-- 		<span class="orderright_lb"></span> -->
<!-- 		<span class="orderright_rt"></span> -->
<!-- 		<span class="orderright_lt"></span> -->
<!-- 		<div class="orderright_mbody"> -->
<!-- 			<div class="orderright_mcontent" > -->
<!-- 				<span class="red bold">&nbsp;마일리지+예치금?</span> -->
<!-- 				<div style="padding-bottom:5px;" > -->
<!-- 					<span style=" font-family:dotum; font-size:11px; color:#888;"> -->
<!-- 					- 환불 또는 교환 시 차액 또는 전액을 적립하는 <br /> -->
<!-- 					&nbsp;&nbsp;예치금 와 프로모션으로 발급되는 <br /> -->
<!-- 					&nbsp;&nbsp;프로모션 예치금가 있습니다. <br /> -->
<!-- 					- 예치금 는 마이페이지의 예치금 현황을 <br /> -->
<!-- 					&nbsp;&nbsp;통해 환불이 가능합니다. -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <div class="relative absolute orderpontlay hide"> -->
<!-- 	<div  style="width:280px;height:140px;" class="orderright_mbox hand left" > -->
<!-- 		<span class="orderright_rb"></span> -->
<!-- 		<span class="orderright_lb"></span> -->
<!-- 		<span class="orderright_rt"></span> -->
<!-- 		<span class="orderright_lt"></span> -->
<!-- 		<div class="orderright_mbody"> -->
<!-- 			<div class="orderright_mcontent" > -->
<!-- 				<span class="red bold" style=" font-family:dotum; font-size:12px; color:#ef1b1a;">&nbsp;예상포인트?</span> -->
<!-- 				<div style="padding-bottom:5px;" > -->
<!-- 					<span style=" font-family:dotum; font-size:11px; color:#888;" > -->
<!-- 					- 구매금액 1,000원당 1point가 지급됩니다. <br/> -->
<!-- 					- 발생한 포인트는 구매확정시 지급되며, 프로모션코드 발급, 사은품 교환등에 사용됩니다</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- 배송지등록 / 수정 :: START -->
<!-- <div id="inAddress" class="hide"> -->
<!-- 	<form id="in_Address" method="post" > -->
<!-- 	<input type="hidden" name="insert_mode" /> -->
<!-- 	<input type="hidden" name="page_type" value="order" /> -->
<!-- 	<input type="hidden" name="address_seq" /> -->
<!-- 	<div>- 자주쓰는 배송지는 최대 30개까지 등록할 수 있습니다.</div> -->
<!-- 	<table width="100%" class="info_table_style mt10" border="0" cellpadding="5" cellspacing="0"> -->
<!-- 		<colgroup> -->
<!-- 			<col width="90" /><col /> -->
<!-- 		</col> -->
<!-- 		<tbody> -->
<!-- 			<tr > -->
<!-- 				<th scope="row">그룹</th> -->
<!-- 				<td> -->
<!-- 					<select name="select_address_group"> -->
<!-- 						<option value="기본 그룹">기본 그룹</option> -->
<!-- 						<option value="">새 그룹 만들기</option> -->
<!-- 					</select> -->
<!-- 					<input type="text" name="address_group" value="" size="20" maxlength="20" /> -->
<!-- 					<div class="mt5"><label><input type="checkbox" name="save_delivery_address" value="1" /> 기본 배송지로 지정합니다.</label></div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr > -->
<!-- 				<th scope="row">설명</th> -->
<!-- 				<td><input type="text" name="address_description" value="" size="45" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th scope="row">받는분</th> -->
<!-- 				<td><input type="text" name="recipient_user_name" value="" size="20" title="받는분" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr class="shipping_nation_tr"> -->
<!-- 				<th scope="row">국가</th> -->
<!-- 				<td> -->
<!-- 					<div style="float:left;padding-right:10px;" class="international_layer"> -->
<!-- 						<select name="nation_select" onchange="chg_address_nation(this);"> -->
<!-- 							국가옵션
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="domestic"> -->
<!-- 				<th scope="row">주소</th> -->
<!-- 				<td> -->
<!-- 					<input type="text" name="recipient_new_zipcode" value="" size="10" title="우편번호" readonly /> -->
<!-- 					<input type="hidden" name="check_new_zipcode" value="NEW" /> -->
<!-- 					<button type="button"  class="btn_move small" onclick="window.open('../popup/zipcode?mtype=delivery','popup_zipcode','width=600,height=480')">주소찾기</button> -->
<!-- 					<input type="hidden" name="recipient_address_type" value="" title="배송지 주소지타입(도로명/지번)" /> -->
<!-- 					<div class="mt5"><input type="text" class="address_street" name="recipient_address_street" value="" size="45" title="도로명 주소" readonly /> <span class="desc">도로명 주소</span></div> -->
<!-- 					<div class="mt5"><input type="text" name="recipient_address" value="" size="45" title="주소" readonly /> <span class="desc">지번 주소</span></div> -->
<!-- 					<div class="mt5"><input type="text" name="recipient_address_detail" value="" size="45" title="나머지주소" /> <span class="desc">나머지주소</span></div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="international hide"> -->
<!-- 				<th scope="row" valign="top">주소</td> -->
<!-- 				<td> -->
<!-- 					<input type="text" name="international_address" value="" size="45" title="주소" /> <span class="desc">주소</span> -->
<!-- 					<div class="mt5"><input type="text" name="international_town_city" value="" size="30" title="시도" /> <span class="desc">시도</span></div> -->
<!-- 					<div class="mt5"><input type="text" name="international_county" value="" size="22" title="주" /> <span class="desc">주</span></div> -->
<!-- 					<div class="mt5"><input type="text" name="international_postcode" value="" size="15" title="우편번호" /> <span class="desc">우편번호</span></div> -->
<!-- 					<div class="hide"><input type="text" name="international_country" value="" size="30" title="국가" /> <span class="desc">국가</span></div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th scope="row">연락처</th> -->
<!-- 				<td> -->
<!-- 					<ul class="list_inner"> -->
<!-- 					<li class="cellphone_li"> -->
<!-- 						<input type="text" name="recipient_cellphone[]" value="" size="3" maxlength="4" onkeydown="onlyNumber(this)" title="받는분 휴대폰"/> - -->
<!-- 						<input type="text" name="recipient_cellphone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" /> - -->
<!-- 						<input type="text" name="recipient_cellphone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" /> -->
<!-- 						&nbsp; -->
<!-- 						<span class="add_phone_btn hand" id="btn_inAddress_add_phone" onclick="add_phone(this,'open');">추가연락처 열기 ▼</span> -->
<!-- 					</li> -->
<!-- 					<li class="add_phone pdt5 hide"> -->
<!-- 						<input type="text" class="add_phone_input" name="recipient_phone[]" value="" size="3" maxlength="4" onkeydown="onlyNumber(this)" /> - -->
<!-- 						<input type="text" class="add_phone_input" name="recipient_phone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" /> - -->
<!-- 						<input type="text" class="add_phone_input" name="recipient_phone[]" value="" size="2" maxlength="4" onkeydown="onlyNumber(this)" /> -->
<!-- 					</li> -->
<!-- 					</ul> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
<!-- 	<div class="btn_wrap"> -->
<!-- 		<button type="button" id="insert_address" class="btn_chg">확인</button> -->
<!-- 	</div> -->
<!-- 	</form> -->
<!-- </div> -->
<!-- 배송지등록 / 수정 :: END -->

<div id="international_shipping_info" class="hide">
1. 주문하신 물품의 총 결제금액이 15만원 이상 (환율의 변동에 따라 다를 수 있음) 이면 과부가세가 발생합니다.  관부가세는 고객님께서 부담하시는 금액으로 문자를 통해 입금내역이 발송되며 해당 관세사로 입금하시면 통관처리됩니다. <br/>
<br/>
2. 해외구매 특성상 주문에서 배송까지는 평균 10~15일이 소요됩니다. 간혹 현지 제품 수급에 따라 부득이하게 시일이 더 소요 될 수 있으니 구매시 좀 더 여유있게 주문하시길 권합니다.<br/>
<br/>
3. 해외 내수품인 관계로 A/S에 대해서는 별도의 책임을 지지 않습니다.<br/>
<br/>
4. 해외배송 특성상 주문접수후 배송상태가 배송준비중으로 넘어간 경우 해외에서 국내로의 배송이 이루어지고 있다는 뜻입니다. 따라서 배송준비중으로 배송상태가 넘어간 경우 취소및 반품이 불가하므로 이점 양해 부탁드립니다. <br/>
<br/>
5. 타 해외구매대행 사이트에서 주문하신 물건과 주문날짜가 겹치지않도록 주의해 주십시오. 통관날짜가 같을 경우 합산관세가 부가되게 됩니다.
</div>

<!-- SCRIPT :: START -->
<script type="text/javascript" src="/app/javascript/jquery/jquery.form.js" charset="utf8"></script>
<script type="text/javascript">
	var multiShippingItemNoCnt	= 0;

	var order_version			= $("input[name='order_version']").val();
	var gl_mode					= 'cart';
	var gl_region				= new Array();
	var gl_mobile				= '';
	var gl_ssl_action			= "../order/pay?mode=cart";
	var gl_ssl_estimate_action  = "../prints/form_print_estimate?code=order&mode=cart";
	var gl_pg_company			= 'kcp';
	var gl_isuser				= false;
	var gl_cashreceiptuse		= '1';
	var gl_taxuse				= '1';
	var gl_chk_tot_price		= '19000';
	var gl_request_uri			= '%2Forder%2Fsettle%3Fmode%3Dcart%26nation%3DKOREA';
	var gl_goods_seq			= 0;
	var gl_skin					= "fruit_puro_gls";
	var gl_http_host			= 'edge-sample17.firstmall.kr';
	var gl_sub_domain			= 'edge-sample17.firstmall.kr';
	var gl_iscancellation		= false;

	gl_region[0] = new Array();
	gl_region[0][0] = "미국";

	var is_file_facebook_tag	= true
	var fblike_ordertype		= "1";
	var fblikesale				= false;
	var fbuser					= false;
	var APP_USE					= "f";
	var APP_DOMAIN				= "edge-sample17.firstmall.kr";
	var HTTP_HOST				= "edge-sample17.firstmall.kr";
	var firstmallcartid			= "08ea53aaa5c0703a5a79d1d91b12b1a89ffeeb56";
	var APP_VER					= '2.6';

	var shipping_policy_count	= "0";

	var shipping_policy_count_detail = false;
	var escrow_view				= false;
	var cart_promotioncode		= "";
	var is_goods				= true;
	var is_direct_store			= false;
	var is_coupon				= false;
	var is_members				= false;
	var is_address				= false;

	var get_nation				= "KOREA";
</script>
<script type="text/javascript" src="/app/javascript/js/order-settle.js?dummy=20180703160358" charset="utf8"></script>
<script type="text/javascript" src="/app/javascript/js/skin-order-settle.js" charset="utf8"></script>
<!-- SCRIPT :: END -->

	<!-- 좋아요할인 : 삭제하지 말아주세요 -->
	<script language="JavaScript" src="../order/fblike_opengraph?files=settle&mode=cart"></script>
	<!-- 좋아요할인 : 삭제하지 말아주세요 -->
</div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>