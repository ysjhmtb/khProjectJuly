<%@page import="product.model.vo.CartVo"%>
<%@page import="product.model.service.ProductService"%>
<%@page import="product.model.vo.ProductVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.line{
	border-top:1px solid gray;
	border-bottom:1px solid gray;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
   <%if(member==null){%>
         <script>alert("로그인이 필요합니다.");
         parent.document.location.replace('http://localhost:8081/nycProject/member/login.jsp');
         </script>
         
      <% }else{%>
<%
// 	ArrayList<CartVo> list = (ArrayList<CartVo>)request.getAttribute("list");
	int mno = member.getMNO();
	ArrayList<CartVo> list = new ProductService().getCartList(mno);
	int totalPrice = 0;
//임시 회원 번호 mno=1
// 	int mno = 1;
// 	if(list==null){
// 		list = (ArrayList<CartVo>)new ProductService().getCartList(mno);
// 	}
%>
<script>
	function addCount(btn){
		var count = $(btn).parent().children("input.count");
		$(count).val(Number($(count).val())+1);
	}
	
	function subCount(btn){
		var count = $(btn).parent().children("input.count");
		if(1<$(count).val()){
			$(count).val(Number($(count).val())-1);
		}
	}
	
	function updateCount(uCount){
		var cno = $(uCount).parent().parent().parent().children("td.getcno").children("input").eq(3).val();
		var count = $(uCount).parent().parent().children("div").children("input").val();
		location.href="/nycProject/updateCartCount.do?cno="+cno+"&count="+count;
	}
	
	$(function(){
//	 	전체주문버튼
		$("#allBuyBtn").click(function(){
			location.href="/nycProject/buyProd.do?mno=<%=mno%>";
		});
		
//	 	선택주문버튼
		$("#selectBuyBtn").click(function(){
			
		});
	});
</script>
	<div id="layout_config">
		<div id="layout_config_full"><script type='text/javascript'>var fbv='2.6';</script><script type='text/javascript' src='/app/javascript/js/facebook.js?v=20150501' charset='utf8'></script>

<div class="category_depth">
	<ul class="list2">
		<li><a href="/main/index">&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

		<li>장바구니</li>

	</ul>
</div>
<!-- //페이지경로 -->

<div class="h3_wrap">
	<h3>장바구니</h3>
	<p>장바구니에 담은 상품은 일주일동안 보관됩니다. 일주일 후에는 상품이 삭제될 수 있음을 알려드립니다. 오랫동안 보관하고 싶은 상품은 위시리스트에 추가해주세요.</p>
	
</div>
<!-- //타이틀 -->

<!-- 본문내용 시작 -->
<div class="order2_step">
	<ul>
		<li class="active"><h3>STEP 1<span>장바구니</span></h3></li>
		<li><h3>STEP 2<span>주문/결제</span></h3></li>
		<li><h3>STEP 3<span>결제완료</span></h3></li>
	</ul>
</div>
<!-- //주문/결제 스텝 -->

<form name="orderFrm" id="orderFrm" method="post" action="cacluate" target="actionFrame"></form>
<!-- <form name="cart_form" id="cart_form" method="post" target="actionFrame" action="buyProd.do"> -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table_style">
	<caption>주문상품</caption>
	<colgroup>
		<col style="width:5%" /><col /><col style="width:8%" /><col style="width:10%" /><col style="width:10%" />
		<col style="width:10%" /><col style="width:16%" />	</colgroup>
	<thead>
		<tr>
			<th scope="col"><input type="checkbox" class="chk_select_all" /></th>
			<th scope="col">주문상품</th>
			<th scope="col">수량</th>
			<th scope="col">상품금액</th>
			<th scope="col">할인금액</th>
			<th scope="col">상품 총금액</th>
			<th scope="col" class="hide">적립</th>
			<th scope="col">배송비</th>
		</tr>
	</thead>
	<tbody>
	<%if(null!=list){ %>
		
		<%for(CartVo cv:list){ %>
		<tr>
			<td class="line getcno">
				<input type="checkbox" name="cart_option_seq[]" value="82" stat="Y" />
				<input type="hidden" name="ship_possible[82]" value="Y"/>
				<input type="hidden" name="ship_nation[82]" value="korea"/>
				<input type="hidden" name="cno" value="<%=cv.getCno()%>"/>
				<input type="hidden" name="mno" value="<%=mno%>"/>
			</td>
			<td class="relative line">
				<dl class="order_thumb_wrap">
					<dt>
						<a href="#"><img src="<%=cv.getPv().getImg_src() %>" class="order_thumb" onerror="this.src='/data/skin/fruit_puro_gls/images/common/noimage_list.gif'" alt="쇼핑몰 쉽게 꾸밀수 있어요" /></a>
					</dt>
					<dd>
						<a href="#" class="order_name"><%=cv.getPv().getName() %></a>
						<div>
						</div>
					</dd>
				</dl>
				<!-- 배송불가 -->
				<dl class="ship_no hide">
					<dd></dd>
				</dl>
				<!-- //배송불가 -->
			</td>
			<td class="line">
				<div>
					<button onclick="subCount(this)" class=" btn_chg small">-</button>
					<input type="text" size="1" class="count" value="<%=cv.getCount() %>" style="width:16px;"/>
					<button onclick="addCount(this)" class=" btn_chg small">+</button>
				</div>
				<div class="pdt5">
					<button type="button" class=" btn_chg small" onclick="updateCount(this)">변경</button>
				</div>
			</td>
			<td class="right line"><%=cv.getPv().getPrice() %></td>
			<td class="right line">
				<div id="cart_option_sale_total_82">
					-
				</div>
			</td>
			<td class="right bold line">
				<span class="cart_option_price_82"><%=(cv.getCount()*cv.getPv().getPrice()) %></span>원
				
			</td>
			<td class="hide">
				<table align="center" border="0">
					<tbody>
						<tr>
							<td><img src="/admin/skin/default/images/common/icon/icon_ord_emn.gif" title="마일리지" /></td>
							<td class="right"><span id="option_reserve_82">310</span>원</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td class="left line" rowspan="1">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div class="blue">본사</div>
							<div>택배</div>
							<div>무료</div>
						</td>
						<td>
							<!-- 배송방법 변경 :: START -->
							<div class="order_change">
								<button type="button" class="btn_shipping_modify btn_chg small" cart_seq="77" prepay_info="delivery" nation="korea" goods_seq="17" hop_date="" reserve_txt="">변경</button>
							</div>
							<!-- 배송방법 변경 :: END -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<%
			totalPrice += (cv.getCount()*cv.getPv().getPrice());
		}
		%>
	<%}else{ %>
		<tr>
			<td class="nodata" colspan="7">장바구니에 담긴 상품이 없습니다.</td>
		</tr>
	<%} %>
	</tbody>
</table>
<!-- //주문상품 테이블 -->

<div class="order_settle clearbox">
	<div class="benefit">
		<dl class="clearbox" style="height:52px;">
			<dt>구매적립 혜택</dt>
			<dd>
				구매확정 시
				마일리지 <span id="total_reserve" class="bold">310</span>원				<span class="ico_ quest detailDescriptionLayerBtn">자세히보기</span>
				<div class="detailDescriptionLayer hide" style="width:300px;">
					<div class="layer_wrap">
						<h1>구매적립</h1>
						<div class="layer_inner">
							<p>마일리지액은 할인쿠폰(또는 할인코드)이 적용된 금액을 기준으로 적립되므로 쿠폰(또는 코드) 사용여부에 따라 마일리지액이 달라질 수 있습니다.</p>
						</div>
						<a href="javascript:;" class="detailDescriptionLayerCloseBtn">닫기</a>
					</div>
				</div>
			</dd>
			<dt>리뷰작성 혜택</dt>
			<dd>
				상품후기 작성 시 
				마일리지 <strong>0</strong>원
			</dd>
		</dl>
		<dl class="ship clearbox">
			<dt>배송국가</dt>
			<dd>
				<span class="">대한민국</span>&nbsp;
			</dd>
		</dl>
	</div>
	<div class="settle bgcolor">
		<dl class="clearbox">
			<div class="hide">
				<dt>총 수량</dt>
				<dd>1개</dd>
			</div>
			<dt>상품금액</dt>
			<dd>
				<%=totalPrice %>원
			</dd>
			<dt>배송비
				<span class="ico_ quest detailDescriptionLayerBtn">자세히보기</span>
				<div class="detailDescriptionLayer hide" style="width:280px;">
					<div class="layer_wrap">
						<h1>배송비내역</h1>
						<div class="layer_inner">
							<!-- 선불 배송비 상세 :: START -->
							<p class="center">주문 시 결제 배송비 : 총
								<span class="red">
									<span class="total_org_shipping_price totalprice">0</span>원
								</span>
							</p>
							<table class="tbl_col" width="100%" border="0" cellpadding="0" cellspacing="0">
								<caption>주문 시 결제 배송비</caption>
								<colgroup>
									<col style="width:50%" /><col style="width:50%" />
								</colgroup>
								<thead class="hide">
									<tr>
										<th scope="col">항목</th>
										<th scope="col">배송비</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">기본배송비</th>
										<td>
											<span class="basic_delivery">0</span>원
										</td>
									</tr>
									<tr class="total_add_delivery_lay">
										<th scope="row">추가배송비</th>
										<td>
											<span class="add_delivery">0</span>원
										</td>
									</tr>
									<tr>
										<th scope="row">희망일 배송비</th>
										<td>
											<span class="hop_delivery">0</span>원
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 선불 배송비 상세 :: END -->
							<!-- 착불 배송비 상세 :: START -->
							<p class="mt10 center">
								착불 결제 배송비 : 총
								<span class="red">
									<span class="totalprice">0</span>원
								</span>
							</p>
							<table class="tbl_col" width="100%" border="0" cellpadding="0" cellspacing="0">
								<caption>착불 결제 배송비</caption>
								<colgroup>
									<col style="width:50%" /><col style="width:50%" />
								</colgroup>
								<thead class="hide">
									<tr>
										<th scope="col">항목</th>
										<th scope="col">배송비</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">기본배송비</th>
										<td>
											<span class="basic_delivery">0</span>원
										</td>
									</tr>
									<tr class="total_add_delivery_lay">
										<th scope="row">추가배송비</th>
										<td>
											<span class="add_delivery">0</span>원
										</td>
									</tr>
									<tr>
										<th scope="row">희망일 배송비</th>
										<td>
											<span class="hop_delivery">0</span>원
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 착불 배송비 상세 :: END -->
						</div>
						<a href="javascript:;" class="detailDescriptionLayerCloseBtn">닫기</a>
					</div>
				</div>
			</dt>
			<dd>
0원
			</dd>
			<dt>할인금액
				<span class="ico_ quest detailDescriptionLayerBtn">자세히보기</span>
				<div class="detailDescriptionLayer hide" style="width:280px;">
					<div class="layer_wrap">
						<h1>할인내역</h1>
						<div class="layer_inner">
							<p class="center">총 <span class="red"><span class="total_sales_price totalprice">0</span>원</span> 할인</p>
							<table class="tbl_col" width="100%" border="0" cellpadding="0" cellspacing="0">
								<caption>할인내역</caption>
								<colgroup>
									<col style="width:50%" /><col style="width:50%" />
								</colgroup>
								<thead class="hide">
									<tr>
										<th scope="col">항목</th>
										<th scope="col">할인금액</th>
									</tr>
								</thead>
								<tbody>
									<tr id="total_referer_sale_tr" class="hide">
										<th scope="row">유입경로</th>
										<td class="bolds ends prices">
											<span id="total_referer_sale">0</span>원
										</td>
									</tr>
									<tr id="total_member_sale_tr" class="hide">
										<th scope="row">등급할인</th>
										<td class="bolds ends prices">
											<span id="total_member_sale">0</span>원
										</td>
									</tr>
									<tr id="total_like_sale_tr" class="hide">
										<th scope="row">좋아요</th>
										<td class="bolds ends prices">
											<span id="total_like_sale">0</span>원
										</td>
									</tr>
									<tr class="hide">
										<th scope="row">에누리</th>
										<td>
											<span id="enuri">0</span>원
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<a href="javascript:;" class="detailDescriptionLayerCloseBtn">닫기</a>
					</div>
				</div>
			</dt>
			<dd>
<span id="total_sale">0</span>원
			</dd>
			<dt class="total">결제예정금액</dt>
			<dd class="total">				
				<div style="display:inline-block;" class="price"><span class="tahoma"><%=totalPrice %></span>원</div>
				<div style="display:inline-block; position:relative;" class="totalprice"></div>
			</dd>
		</dl>
	</div>
</div>
<!-- //결제금액 -->

<div class="mt10">
	<button type="button" class="btn_select_all btn_gray hide">전체선택</button>
	<button type="button" class="btn_select_del btn_gray">선택상품 삭제</button>
	<button type="button" class="btn_select_estimate btn_gray">견적서</button>
</div>
<!-- //버튼 -->

<div id="facebook_mgs" class="center">
</div>
<!-- //페이스북 메시지 -->

<div class="btn_wrap">
	<button type="button" class="btn_move large" onclick="location='/main/index'">계속 쇼핑하기</button>
	<span class="btn_selected_order"><button type="button" class="btn_move large" id="selectBuyBtn">선택상품 주문하기</button></span>
	<span class="btn_all_order"><button type="button" class="btn_chg large" id="allBuyBtn">주문하기</button></span>
</div>
<!-- //버튼 -->
</form>

<!-- //본문내용 끝 -->

<div id="optional_changes_dialog" style="display:none;"></div>
<div id="shipping_detail_lay" style="display:none;"></div>

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


<script type="text/javascript">

	$(document).ready(function() {

		// 전체 선택
		$("form#cart_form input.chk_select_all").bind("click", function(){
			var chkSt = $(this).is(":checked");
			checked_all_order(chkSt);
		});

		$("form#cart_form .btn_select_all").bind("click", function(){
			var order_chk = $("form#cart_form input.chk_select_all");
			var chkSt = false;
			if	(!order_chk.attr('checked'))
				chkSt = true;
			order_chk.attr('checked',chkSt);
			checked_all_order(chkSt);
		});

		// 선택삭제
		$(".btn_select_del").click(function() {
			var selected_order = '';
			$("input[name='cart_option_seq[]']").each(function(e, el) {
				if( $(el).attr('checked') == 'checked' ){
					selected_order += $(el).val() + ",";
				}
			});

			if(!selected_order){
				//삭제할 상품을 선택해 주세요.
				openDialogAlert(getAlert('oc003'),'400','140');
				return false;
			}

			$("form#cart_form").attr("action","del");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 수량변경
		$("button.btn_ea_modify").bind("click",function() {
			closeDialog("optional_changes_dialog");//diglog 초기화
			var url = "optional_changes?option_catalog=1&no="+$(this).attr("id");
			$.get(url, function(data) {
				$("div#optional_changes_dialog").html(data);
			});
			//선택한 상품의 주문내역
			openDialog(getAlert('oc004'), "optional_changes_dialog", {"width":500,"height":600});
		});

		// 선택 주문
		$(".btn_selected_order").bind("click",function() {
			var selected_order = '';
			var ship_possible = true;
			$("input[name='cart_option_seq[]']").each(function(e, el) {
				if( $(el).attr('checked') == 'checked' ){
					if( $(el).attr('stat') != 'Y' ){
						ship_possible = false;
						return false;
					}
					selected_order += $(el).val() + ",";
				}
			});

			if(!ship_possible){
				// 주문이 불가능한 상품이 있습니다.
				openDialogAlert(getAlert('os142'),'400','140');
				return false;
			}

			if(!selected_order){
				//주문할 상품을 선택해 주세요.
				openDialogAlert(getAlert('oc005'),'400','140');
				return false;
			}

			$("form#cart_form").attr("action","addsettle?mode=choice");
			//$("form#cart_form").attr("target","");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 전체 주문
		$(".btn_all_order").bind("click",function() {
			$("form#cart_form").attr("action","addsettle");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 선택 위시리스트 저장
		$("button.btn_select_wishlist").bind("click",function(){
			$("form#cart_form").attr("action","../mypage/wish_add?mode=cart");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		//  견적서 출력
		$("button.btn_select_estimate").bind("click",function(){
			var win = window.open('/prints/form_print_estimate?code=cart', '_estimate', 'width=960,height=640,scrollbar=1');
			win.focus();
		});

		// 배송 방법 변경 :: 2016-07-30 lwh
		$("button.btn_shipping_modify").bind("click",function() {
			var cart_seq	= $(this).attr('cart_seq');
			var prepay_info = $(this).attr('prepay_info');
			var nation		= $(this).attr('nation');
			var hop_date	= $(this).attr('hop_date');
			var goods_seq	= $(this).attr('goods_seq');
			var reserve_txt	= $(this).attr('reserve_txt');

			$.ajax({
				'url'	: '/goods/shipping_detail_info',
				'data'	: {'mode':'cart','cart_seq':cart_seq,'prepay_info':prepay_info,'nation':nation,'hop_date':hop_date,'goods_seq':goods_seq,'reserve_txt':reserve_txt},
				'type'	: 'get',
				'dataType': 'text',
				'success': function(html) {
					if(html){
						$("div#shipping_detail_lay").html(html);
						//배송방법 안내 및 변경
						openDialog(getAlert('oc040'), "shipping_detail_lay", {"width":500,"height":650});
					}else{
						//오류가 발생했습니다. 새로고침 후 다시시도해주세요.
						alert(getAlert('oc041'));
						document.location.reload();
					}
				}
			});
		});

		$(".price_area").bind("mouseover",function(){
			$(this).parent().find(".sale_price_layer").show();
		}).bind("mouseout",function(){
			$(this).parent().find(".sale_price_layer").hide();
		});

		/* 토글 레이어 */
		$(".detailDescriptionLayerBtn").click(function(){
			$('div.detailDescriptionLayer').not($(this).siblings('div.detailDescriptionLayer')).hide();
			$(this).siblings('div.detailDescriptionLayer').toggle();
		});
		$(".detailDescriptionLayerCloseBtn").click(function(){
			$(this).closest('div.detailDescriptionLayer').hide();
		});
	});

	function checked_all_order(flag){
		$("input[name='cart_option_seq[]']").each(function(){
			if($(this).attr("disabled") != 'disabled'){
				$(this).attr("checked", flag);
			}
		});
	}

	function getPromotionckloding() {
		var cartpromotioncode = '';
		if( cartpromotioncode  ) {
			$.ajax({
				'url' : '../promotion/getPromotionJson?mode=cart',
				'data' : {'cartpromotioncode':cartpromotioncode},
				'type' : 'post',
				'dataType': 'json',
				'success': function(data) {
					order_price_calculate();
				}
			});
		}
	}

	function order_price_calculate() {
		var f = $("form#orderFrm");

		f.attr("action","calculate?mode=cart");
		f.attr("target","actionFrame");
		f[0].submit();
	}

	// 장바구니 배송국가 변경
	function chg_shipping_nation(nation){
		var tmpFrm	= '<form name="nationFrm" id="nationFrm" method="post" action="./cart"><input type="hidden" name="nation" value="' + nation + '"></form>';
		$('body').append(tmpFrm);
		$("#nationFrm").submit();
	}
      <%}%>
</script></div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>