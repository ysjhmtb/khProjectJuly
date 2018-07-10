<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String p_names = request.getParameter("pnames");
	String p_prices= request.getParameter("prices");
	String p_counts= request.getParameter("counts");
	String p_nos= request.getParameter("pnos");
	String c_nos= request.getParameter("cnos");
	String infoStr = request.getParameter("infoStr");
%>
<!DOCTYPE html >

<html>
  <head>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  </head>
  <body>
  <div style="display:none;">
<%@ include file="/views/common1Page/header.jsp" %>
  </div>
  
  <script type="text/javascript">
  
  IMP.init('imp32618817'); 
  IMP.request_pay({
       pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
       merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
       name : '주문명:결제테스트',
       amount : <%=request.getParameter("totalPrice")%>,
       buyer_email : '<%=member.getM_ID()%>',
       buyer_name : '<%=member.getM_NAME()%>',
       buyer_tel : '<%=member.getM_PHONE()%>', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
       buyer_addr : '<%=member.getM_ADDRESS().split(", ")[1]%> <%=member.getM_ADDRESS().split(", ")[2]%>',
       buyer_postcode : '<%=member.getM_ADDRESS().split(", ")[0]%>'
   }, function(rsp) {
       if ( rsp.success ) {
          alert("확인");
          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
//              var msg = '결제가 완료되었습니다.';
//                 msg += '\n고유ID : ' + rsp.imp_uid;
//                 msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//                 msg += '\결제 금액 : ' + rsp.paid_amount;
//                 msg += '카드 승인번호 : ' + rsp.apply_num;
                
//                 alert(msg);
          jQuery.ajax({
             url: "/mwp/buyProduct2.do", //cross-domain error가 발생하지 않도록 주의해주세요
             type: 'POST',
             data: {
                "imp_uid" : rsp.imp_uid,
                "merchant_uid" : rsp.merchant_uid,
                "m_name" : rsp.buyer_name,
                "totalPrice" : rsp.paid_amount,
                "p_names" : '<%=p_names%>',
                "p_prices" : '<%=p_prices%>',
                "p_counts" : '<%=p_counts%>',
                "p_nos" : '<%=p_nos%>',
                "c_nos" : '<%=c_nos%>',
                "infoStr" : '<%=infoStr%>'
                //기타 필요한 데이터가 있으면 추가 전달
             },success:function(data) {
                 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                 var msg = '결제가 완료되었습니다.';
                 msg += '\n고유ID : ' + rsp.imp_uid;
                 msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                 msg += '\결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                 alert("결제완료");
                 opener.location.href=data;
                 window.close();
                 
//                  
           	},error:function(e){
           		alert("error");
           	}
          
          }).done(function(data) {
             //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
//                 var msg = '결제가 완료되었습니다.';
//                 msg += '\n고유ID : ' + rsp.imp_uid;
//                 msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//                 msg += '\결제 금액 : ' + rsp.paid_amount;
//                 msg += '카드 승인번호 : ' + rsp.apply_num;
                
//                 alert(data);
          });
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
           
           alert(msg);

       }
   });
      </script>
  </body>
</html>