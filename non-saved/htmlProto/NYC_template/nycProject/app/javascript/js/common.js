//ie8이하 start
if(!Array.indexOf){
 Array.prototype.indexOf = function(obj){
  for(var i=0; i<this.length; i++){
   if(this[i]==obj){
    return i;
   }
  }
  return -1;
 }
}

if (!Object.keys) Object.keys = function(o) {
 if (o !== Object(o))
  throw new TypeError('Object.keys called on a non-object');
 var k=[],p;
 for (p in o) if (Object.prototype.hasOwnProperty.call(o,p)) k.push(p);
 return k;
}

if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}
//ie8이하 end

if(typeof L10n != 'object')
	document.write('<script type="text/javascript" src="/data/js/language/L10n_KR.js"></script>');

// 함수부만 따로 호출
document.write('<script type="text/javascript" src="app/javascript/js/common-function.js?v=140729"></script>');

$(function(){	
	/* 스타일적용 */
	apply_input_style();
	
	//상품디스플레이의 동영상클릭시 -> 동영상자동실행설정되어있어야함
	$(".goodsDisplayVideoWrap").bind("click",function(e){
		$(this).find("img").addClass("hide");
		$(this).find(".thumbnailvideo").hide();
		$(this).find(".mobilethumbnailvideo").hide();
		$(this).find("iframe").removeClass("hide");
		$(this).find("embed").removeClass("hide");
	});
	
	//동영상넣기의 동영상클릭시-> 동영상자동실행설정되어있어야함
	$(".DisplayVideoWrap").bind("click",function(e){
		$(this).find("img").addClass("hide");
		$(this).find(".thumbnailvideo").hide();
		$(this).find(".mobilethumbnailvideo").hide();
			$(this).find("iframe").removeClass("hide");
			$(this).find("embed").removeClass("hide"); 
	});

	/* 동영상넣기/상품디스플레이 동영상이미지체크 */ 
	$(".thumbnailvideo").each(function(){
		var width = ($(this).attr("width"))?$(this).attr("width"):400;
		var height = ($(this).attr("height"))?$(this).attr("height"):200;
		$(this).css({'width':width});
		$(this).css({'height':height});
	});
	
	$(".mobilethumbnailvideo").each(function(){
		var width = ($(this).attr("width"))?$(this).attr("width"):150;
		var height = ($(this).attr("height"))?$(this).attr("height"):50;
		$(this).css({'width':width});
		$(this).css({'height':height});
	});
});

$(window).load(function() {
	/* 스타일적용 */
	chk_small_goods_image();
	/*	
	$('img.small_goods_image').each(function() {	 
		if (!this.complete ) {// image was broken, replace with your new image
			this.src = '/data/icon/goods/error/noimage_list.gif';
		}
	});
	*/
	
	/* 동영상넣기/상품디스플레이 동영상이미지체크 */ 
	$(".thumbnailvideo").each(function(){
		var width = ($(this).attr("width"))?$(this).attr("width"):400;
		var height = ($(this).attr("height"))?$(this).attr("height"):200;
		$(this).css({'width':width});
		$(this).css({'height':height});
	});
	
	$(".mobilethumbnailvideo").each(function(){
		var width = ($(this).attr("width"))?$(this).attr("width"):150;
		var height = ($(this).attr("height"))?$(this).attr("height"):50;
		$(this).css({'width':width});
		$(this).css({'height':height});
	});

});

String.prototype.replaceAll = function (str1,str2){
	var str    = this;     
	var result   = str.replace(eval("/"+str1+"/gi"),str2);
	return result;
}

//통계서버로 통계데이터 전달
function statistics_firstmall(act,goods_seq,order_seq,review_point)
{
	var url = '/_firstmallplus/statistics';
	var allFormValues = "act="+act+"&goods_seq="+goods_seq;
	if( order_seq ) allFormValues += "&order_seq="+order_seq;
	if( review_point ) allFormValues += "&review_point="+review_point;
	
	if(act == 'order' && !order_seq) return false;
	if(act == 'review' && !review_point) return false;
	if(!goods_seq) return false;
	$.ajax({
		cache:false,
		timeout:1000,  
		type:"POST",
		url:url,
		data:allFormValues,
		error:function(){},
		success:function(response){}
	});
	return true;
}

// 사은품 지급 조건 상세 2015-05-14 pjm
$(".gift_log").bind('click', function(){
	$.ajax({
		type: "post",
		url: "./gift_use_log",
		data: "order_seq="+$(this).attr('order_seq')+"&item_seq="+$(this).attr('item_seq'),
		success: function(result){
			if	(result){
				$("#gift_use_lay").html(result);
				//사은품 이벤트 정보
				openDialog(getAlert('mo023'), "gift_use_lay", {"width":"450","height":"250"});
			}
		}
	});
});


//문자열 바이트 체크(utf-8도 가능)
String.prototype.byteLength = function(mode){
	mode	= (!mode) ? 'euc-kr' : mode;
	text	= this;
	byte	= 0;
	switch(mode){
		case	'utf-8' :
			for(byte=i=0;char=text.charCodeAt(i++);byte+=char>>11?3:char>>7?2:1);
			break;
		
		default :
			for(byte=i=0;char=text.charCodeAt(i++);byte+=char>>7?2:1);
		
	}
    return byte
};


/*
 * form RSA 암호화 프로세스
 *  - form 내에 file이 있을 경우 기존 프로세스에서도 file 데이터 전송은 동작하지 않았음.
 * 확인된 submit 예외 사항
 * - front script 레벨에서 form을 생성한 후 body에 추가하지 않고 submit
 *  -> 이 경우는 https://www.w3.org/TR/html5/forms.html#constraints 4.10.22.3 를 위반하여 일부 브라우저에서 submit이 발생하지 않음.
 * - ajax나 iframe을 통해 새로운 페이지를 생성한 후 document.sslForm.submit() 를 통해 submit
 *  -> DOM 객체로 submit 호출과 동일
 * - 스크립트 호출과 바인딩이 이루어지기 전 $(document).ready() 와 동시에 submit
 */ 
// RSA 전역 변수 선언
var getPublicKeyUrl = ["/ssl/getRSAPublicKey","/RSA/ssl/getRSAPublicKey"];
var handshakeUrl = ["/ssl/getRSAHandShake","/RSA/ssl/getRSAHandShake"];
var arrCheckActions = ["/ssl/relayRsa?action=", "/RSA/ssl/setRSAReturnPost/"];
// 동적 스크립트 호출
$.loadScript = function (url, callback) {$.ajax({url: url,dataType: 'script',success: callback,async: true});}
$(document).ready(function(){
    // jquery 버전이 1.7 이하 일경우 관리자에서 사용중이므로 https 강화를 제외한다.
    if($().jquery >= "1.7"){
        $.loadScript("/app/javascript/plugin/jcryption/jquery.jcryption.3.1.0_custom.js", function(){
            initJcryption();
        });
    }
});
// 암호화 적용
var initJcryption = function(){
    // 폼에서 프로토콜을 포함한 host name을 얻는다.
    function getHostNameFromForm(formObj) {
        var formActionUrl = formObj.attr("action");
        return getHostNameFromUrl(formActionUrl);
    }
    function getHostNameFromUrl(url){
        var arr = url.split("/");
        var result = arr[0]+"//"+arr[2];
        return result;
    }
    // SSL 적용 폼인지 여부 확인
    var checkSSLForm = function (formObj){
        var formActionUrl = formObj.attr("action");
        if(formActionUrl){
            for(var i in arrCheckActions){
                if(formActionUrl.indexOf(arrCheckActions[i])>-1){
                    return i;
                }
            }
        }
        return -1;
    }
    // 이벤트가 바인드 된 폼인지 확인
    var checkBindEventForm = function (formObj){
        var data = (formObj.data("jCryptionInit") === true);
        if(data){
            return true;
        }
        return false;
    }
    // 속성을 확인한다
    function getAttributes ( $node ) {
        var attrs = {};
        $.each( $node[0].attributes, function ( index, attribute ) {
            attrs[attribute.name] = attribute.value;
        } );

        return attrs;
    }
    var convertSubmit = function(){
        var $formEl = $(this);
        // console.log("submit convert event binding!", $formEl);
        // submit 전용 폼인지 체크
        if(checkBindEventForm($formEl)){
            // console.log("already!", $formEl);
            var action = $formEl.attr("action");
            if(checkSSLForm($formEl)!=0){
                action = action+"/"+$.jCryption.getAESSessionKey($formEl);
            }
            $formEl.attr("action",action);
            return true;
        }else{
            // SSL 적용폼인지 체크
            if(checkSSLForm($formEl)>-1){
                // 스크립트가 로드되었는지 체크
                if(typeof $.jCryption === "function"){
                    // rsa 폼 삭제
                    $(".rsaForm").remove();

                    // 암호화 적용
                    var AESEncryptionKey = $.jCryption.getAESEncryptionKey($formEl);
                    // console.log(AESEncryptionKey);
                    var hostName = getHostNameFromForm($formEl);

                    var $submitElement = $formEl.find(":input:submit");
                    var $encryptedElement = $("<input />",{
                      type:'hidden',
                      name:'jCryption'
                    });

                    // 암호화 submit 전용 form 
                    var $submitRSAForm = $("<form class='rsaForm'/>");
                    var formAttrs = getAttributes($formEl);
                    for (var i in formAttrs){
                        if(i!="id" && i!="name"){
                            $submitRSAForm.attr(i,formAttrs[i]);
                        }
                    }
                    var remakeHandshakeUrl = handshakeUrl[checkSSLForm($formEl)];
                    if(checkSSLForm($formEl)!=0){
                        remakeHandshakeUrl = remakeHandshakeUrl+"/"+$.jCryption.getAESSessionKey($submitRSAForm);
                    }

                    $.jCryption.authenticate(
                        AESEncryptionKey, 
                        hostName+getPublicKeyUrl[checkSSLForm($formEl)],
                        hostName+remakeHandshakeUrl, 
                        function(AESEncryptionKey) {
                            var toEncrypt = $formEl.serialize();
                            // console.log(toEncrypt);
                            // console.log($formEl);
                            if ($submitElement.is(":submit")) {
                                toEncrypt = toEncrypt + "&" + $submitElement.attr("name") + "=" + $submitElement.val();
                            }
                            $encryptedElement.val($.jCryption.encrypt(toEncrypt, AESEncryptionKey));
                            // console.log($submitRSAForm);
                            $submitRSAForm.append($encryptedElement);
                            $("body").append($submitRSAForm);
                            $submitRSAForm.data("jCryptionInit",true);
                            $submitRSAForm.submit()
                        },
                        function() {
                            // Authentication with AES Failed ... sending form without protection
                            confirm("Authentication with Server failed, are you sure you want to submit this form unencrypted?", function() {
                                $formEl.submit();
                            });
                        }
                    );
                }else{
                    alert("필수 스크립트가 로드되지 않았습니다. 다시 시도해주세요.");
                    // $formEl.submit();
                }
                return false;
            }else{
                return true;
            }
        }
    }
    // 모든 폼 엘리먼트에 이벤트를 바인딩 한다
    $("body").on("submit","form",convertSubmit);
    
    function setupJoinMemberPageCheckId(){
        var url = location.href;
        var tmp_url = url.split("?");
        var domain = getHostNameFromUrl(tmp_url[0]);
        var sub_url = tmp_url[0].replace(domain,"");
        
        // 회원가입페이지 일 경우
        if(sub_url=="/member/register"){
            
            // 현재 회원가입 폼의 action 을 통해 유료/무료 SSL을 확인한다.
            var registFrmAction = $("#registFrm").attr("action");
            var registFrmHost = getHostNameFromUrl(registFrmAction);
            if(registFrmHost.indexOf("http")>-1){
                var sslSubUrlIndex = 0;
                if(registFrmHost == "https://ssl.gabiafreemall.com"){
                    sslSubUrlIndex = 1;
                }
                var idCheckFormUrl = registFrmHost+arrCheckActions[sslSubUrlIndex];

                var idCheckCallbackUrl = domain+"/member/"+"../member_process/id_chk";
                var encodeIdCheckCallbackUrl = Base64.encode(idCheckCallbackUrl);
                encodeIdCheckCallbackUrl = encodeIdCheckCallbackUrl.replace(/[\+]/g,"-");
                encodeIdCheckCallbackUrl = encodeIdCheckCallbackUrl.replace(/[\/]/g,"_");
                var idCheckFormAction = idCheckFormUrl+encodeIdCheckCallbackUrl;

                $("input[name='userid']").unbind("blur");
                $("input[name='userid']").blur(function() {

                    if($(this).val()){
                        // rsa 폼 삭제
                        $("#idchkform").remove();
                        $(".rsaForm").remove();
                        $formEl = $("<form id='idchkform' method='post' target='actionFrame' action='"+idCheckFormAction+"'/>");
                        var idval = $("<input type='hidden' name='userid' value='"+$(this).val()+"'>");
                        $formEl.append(idval);
                        $("body").append($formEl);

                        // 암호화 적용
                        var AESEncryptionKey = $.jCryption.getAESEncryptionKey($formEl);
                        // console.log(AESEncryptionKey);
                        var hostName = getHostNameFromForm($formEl);

                        var $submitElement = $formEl.find(":input:submit");
                        var $encryptedElement = $("<input />",{
                          type:'hidden',
                          name:'jCryption'
                        });

                        // 암호화 submit 전용 form 
                        var $submitRSAForm = $("<form class='rsaForm'/>");
                        var formAttrs = getAttributes($formEl);
                        for (var i in formAttrs){
                            if(i!="id" && i!="name"){
                                $submitRSAForm.attr(i,formAttrs[i]);
                            }
                        }
                        var remakeHandshakeUrl = handshakeUrl[checkSSLForm($formEl)];
                        if(checkSSLForm($formEl)!=0){
                            remakeHandshakeUrl = remakeHandshakeUrl+"/"+$.jCryption.getAESSessionKey($submitRSAForm);
                        }

                        $.jCryption.authenticate(
                            AESEncryptionKey, 
                            hostName+getPublicKeyUrl[checkSSLForm($formEl)],
                            hostName+remakeHandshakeUrl, 
                            function(AESEncryptionKey) {
                                var toEncrypt = $formEl.serialize();
                                // console.log(toEncrypt);
                                // console.log($formEl);
                                if ($submitElement.is(":submit")) {
                                    toEncrypt = toEncrypt + "&" + $submitElement.attr("name") + "=" + $submitElement.val();
                                }
                                $encryptedElement.val($.jCryption.encrypt(toEncrypt, AESEncryptionKey));
                                // console.log($submitRSAForm);
                                $submitRSAForm.append($encryptedElement);
                                $("body").append($submitRSAForm);
                                $submitRSAForm.data("jCryptionInit",true);
                                $submitRSAForm.submit();
                            },
                            function() {
                                // Authentication with AES Failed ... sending form without protection
                                confirm("Authentication with Server failed, are you sure you want to submit this form unencrypted?", function() {
                                    $formEl.submit();
                                });
                            }
                        );

                    }
                });
            }
        }
    }
    setupJoinMemberPageCheckId();
}
function callbackIdChk(json){
    var response = $.parseJSON(json);
    var text = response.return_result;
    var userid = response.userid;
    $("#id_info").html(text);
    $("input[name='userid']").val(userid);
}