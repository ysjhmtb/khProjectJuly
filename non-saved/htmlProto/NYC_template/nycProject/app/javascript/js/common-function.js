
var gl_basic_currency					= 'KRW';
var gl_skin_currency					= 'KRW';
var gl_basic_currency_symbol			= '��';
var gl_basic_currency_symbol_position	= 'after';

function strip_tags(html){
	 
	//PROCESS STRING
	if(arguments.length < 3) {
		html=html.replace(/<\/?(?!\!)[^>]*>/gi, '');
	} else {
		var allowed = arguments[1];
		var specified = eval("["+arguments[2]+"]");
		if(allowed){
			var regex='</?(?!(' + specified.join('|') + '))\b[^>]*>';
			html=html.replace(new RegExp(regex, 'gi'), '');
		} else{
			var regex='</?(' + specified.join('|') + ')\b[^>]*>';
			html=html.replace(new RegExp(regex, 'gi'), '');
		}
	}

	//CHANGE NAME TO CLEAN JUST BECAUSE 
	var clean_string = html;

	//RETURN THE CLEAN STRING
	return clean_string;
}

/* input form style ����*/
function apply_input_style(){
	
	setDefaultText();
	setDatepicker();
	
	$(".onlynumber, .onlynumber_signed").live("keydown",function(e){
		if($(this).hasClass('onlynumber')) return onlynumber(e);	
		if($(this).hasClass('onlynumber_signed')) return onlynumber_signed(e);	
	}).live('focusin',function(){
		if($(this).val()=='0') $(this).val('');
	}).live('focusout',function(){
		if($(this).val()=='') $(this).val('0');
	}).live('change',function(){
		if($(this).attr('max')){
			var max = num($(this).attr('max'));
			if(num($(this).val()) > max){
				$(this).val(max).change();
			}
		}
		
		if($(this).attr('min')){
			var min = num($(this).attr('min'));
			if(num($(this).val()) < min){
				$(this).val(min).change();
			}
		}

		$(this).val( $(this).val().replace(/[^0-9\-]*/gi, ''));

	});
	
	$(".onlyfloat").live("keydown",function(e){		
		if (e.keyCode!=190 && e.keyCode!=110) return onlynumber(e);		
	}).live('focusin',function(){
		if($(this).val()=='0') $(this).val('');
	}).live('focusout',function(){
		if($(this).val()=='') $(this).val('0');
	});
	
	$(".percent").bind("keyup",function(){
		if( $(this).val() > 100 ){						
			$(this).val(100);
		}
	});

	help_tooltip();
}

function help_tooltip(){
/* ���� */
	$(".helpicon, .mainhelpicon, .help, .colorhelpicon, .underhelpicon").each(function(){
		
		var options = {
			className: 'tip-darkgray',
			bgImageFrameSize: 8,
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 10,
			allowTipHover: false,
			slide: false,
			showTimeout : 0
		}
		
		if($(this).attr('options')){
			var customOptions = eval('('+$(this).attr('options')+')');
			for(var i in customOptions){
				options[i] = customOptions[i];
			}
		}
				
		$(this).poshytip(options);
	});

	// �� ���̾�â ���� :: 2016-08-17 lwh
	$(".detailDescriptionLayerBtn").unbind("click").bind("click",function(){
		currencyCompareList($(this));
	});

	//�� ���̾�â ���� :: ���콺 ������ @2016-11-08
	$(".detailDescriptionLayerBtn.over").unbind("mouseover").bind("mouseover",function(){
		currencyCompareList($(this));
	});
	$(".detailDescriptionLayerBtn.over").unbind("mouseout").bind("mouseout",function(){
		$('div.detailDescriptionLayer').hide();
	});

	$(".currency_compare_lay .detailDescriptionLayerCloseBtn").bind("click",function(){
		$('div.detailDescriptionLayer').hide();
	});
}

// ����ȭ ����
function currencyCompareList(obj){

	var layer	= $(obj).parent().find('div.detailDescriptionLayer');
	var title	= $(obj).attr("title");
	var idx		= parseInt(Math.random()*10000000);

	if(title){
		var message	= "";
		if($(obj).parent().find('div.detailDescriptionLayer .layer_wrap .layer_inner').html() != null){
			message	= $(obj).parent().find('div.detailDescriptionLayer .layer_wrap .layer_inner').html();
		}else{
			message	= layer.html();
		}
		var cont	= "";
		cont_new	= '<div class="layer_wrap">';
		cont_new	= cont_new + '<h1>' + title + '</h1>';
		cont_new	= cont_new + '<div class="layer_inner">' + message + '</div>';
		cont_new	= cont_new + '<a href="javascript:;" class="detailDescriptionLayerCloseBtn '+idx+'" onclick="detailDescriptionLayerClose('+idx+')"></a>';
		cont_new	= cont_new + '</div>';
		layer.html(cont_new);
		$(".helpicon_noimg").each(function(){ //��ǰ���� ���/���� ���� ���콺������
		
			var options = {
				className: 'tip-darkgray',
				bgImageFrameSize: 8,
				alignTo: 'target',
				alignX: 'left',
				alignY: 'center',
				offsetX: 10,
				allowTipHover: false,
				slide: false,
				showTimeout : 0
			}
			
			if($(this).attr('options')){
				var customOptions = eval('('+$(this).attr('options')+')');
				for(var i in customOptions){
					options[i] = customOptions[i];
				}
			}
					
			$(this).poshytip(options);
		});
	}

	$('div.detailDescriptionLayer').not($(obj).next('div.detailDescriptionLayer')).hide();$(obj).next('div.detailDescriptionLayer').toggle()
}

// Ư�� ���� ������ Ȱ��ȭ
function area_help_tooltip(obj){
	$(obj).find(".helpicon, .mainhelpicon, .help, .colorhelpicon, .underhelpicon").each(function(){
		
		var options = {
			className: 'tip-darkgray',
			bgImageFrameSize: 8,
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 10,
			allowTipHover: false,
			slide: false,
			showTimeout : 0
		}
		
		if($(this).attr('options')){
			var customOptions = eval('('+$(this).attr('options')+')');
			for(var i in customOptions){
				options[i] = customOptions[i];
			}
		}
				
		$(this).poshytip(options);
	});
}

/* input form style ����*/
function chk_small_goods_image(){
	$('img.small_goods_image').error(function(){
		var noImageSrc = '/data/icon/goods/error/noimage_list.gif';
		if (this.src != noImageSrc) {// image was broken, replace with your new image
			this.src = noImageSrc;
		}
	}).each(function(){
		this.setAttribute('src',this.getAttribute('src'));
	});
}

function reMakeHelpIcon(){
	/* ���� */
	$(".addHelpIcon").each(function(){
		
		var options = {
			className: 'tip-darkgray',
			bgImageFrameSize: 8,
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 10,
			allowTipHover: false,
			slide: false,
			showTimeout : 0
		}
		
		if($(this).attr('options')){
			var customOptions = eval('('+$(this).attr('options')+')');
			for(var i in customOptions){
				options[i] = customOptions[i];
			}
		}
				
		$(this).poshytip(options);
	});
}

function setDatepicker(selector){
	
	if(!selector) selector = ".datepicker";
	var randKey = Math.floor(Math.random() * 0x75bcd15);
		
	/* �޷� */
	$(selector).each(function(i){

		if(!$(this).is(".datepicker")){
			return;
		}
		if($(this).data('datepickerSettingDone')){
			return;
		}

		var randId = randKey.toString() + '_' + i.toString();
		
		var options = {
			dateFormat : 'yy-mm-dd',
			timeFormat: 'hh:mm:ss',
			showOn: "button",
			dayNamesMin : ['��', '��', 'ȭ', '��', '��', '��', '��'],
			monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			showButtonPanel : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			closeText : '�ݱ�',
			currentText : '����',
			yearRange : '1900:c+10',
			buttonImage: "/app/javascript/jquery/icon_calendar.gif",
			buttonImageOnly: true
		}

		if($(this).attr('gettype')){
			options.dateFormat	= $(this).attr('gettype');
		}
		
		if(!$(this).attr('id') || $(this).attr('id').substring(0,11)=='datepicker_'){
			$(this).attr('id','datepicker_'+randId);
		}
		
		if($(this).attr('options')){
			var customOptions = eval('('+$(this).attr('options')+')');
			for(var i in customOptions){
				options[i] = customOptions[i];
			}
		}
		
		if($(this).is(".datepicker"))		{
			$(this).datepicker(options);
			$(this).data('datepickerSettingDone',true);
		}

	});
}

function setTimepicker(selector){
	
	if(!selector) selector = ".datetimepicker";
		
	/* �޷� */
	$(selector).each(function(i){
		
		var options = {
			dateFormat : 'yy-mm-dd',
			timeFormat: 'hh:mm:ss',
			showOn: "button",
			dayNamesMin : ['��', '��', 'ȭ', '��', '��', '��', '��'],
			monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			showButtonPanel : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			closeText : '�ݱ�',
			currentText : '����',
			buttonImage: "/app/javascript/jquery/icon_calendar.gif",
			buttonImageOnly: true
		}
		
		if(!$(this).attr('id') || $(this).attr('id').substring(0,11)=='datepicker_'){
			$(this).attr('id','datepicker_'+i);
		}
		
		if($(this).attr('options')){
			var customOptions = eval('('+$(this).attr('options')+')');
			for(var i in customOptions){
				options[i] = customOptions[i];
			}
		}
		
		if($(this).is(".datetimepicker"))	$(this).datetimepicker(options);

	});
}



function onlynumber(event){
	var e = event.keyCode;	

	if (e>=48 && e<=57) return;
	if (e>=96 && e<=105) return;
	if (e>=37 && e<=40) return;
	if (e==8 || e==9 || e==13 || e==46 || (e==229 && gl_set_mode == 'mobile')) return;
	event.returnValue = false;
	return false;
}
function onlynumber_signed(event){
	var e = event.keyCode;	

	if (e>=48 && e<=57) return;
	if (e>=96 && e<=105) return;
	if (e>=37 && e<=40) return;
	if (e==8 || e==9 || e==13 || e==46 || e==109 || e==189) return;
	event.returnValue = false;
	return false;
}

//password -> type change , title add 2012-10-19
function setDefaultText(){
	try{ 
		$('input, textarea')
		.each(function(){
			var thisInputObj = $(this);
			if(thisInputObj.attr('title') != thisInputObj.attr('placeholder') || !thisInputObj.attr('placeholder')) thisInputObj.attr('placeholder',thisInputObj.attr('title'));
		}) 
		// $('input, textarea').placeholder();
	} catch (e) { 
		setTimeout(function(){	
			$("input[type='text'][title!=''], textarea[title!=''], input[type='password'][title!=''][password='password']")
			.each(function(){
				var thisInputObj = $(this);
				$(this.form).submit(function(){
					if(thisInputObj.val() == thisInputObj.attr('title')) thisInputObj.val('');
				})
			})
			.bind('focusin focusout keydown',function(event){
				if(event.type=='focusout') 
				{
					if($(this).val() == '') 
					{ 
						if ( $(this).attr('password') == 'password' && $(this).attr('title')) {
							if(($.browser.version >= 9.0 && $.browser.msie) || !$.browser.msie ) {
								if( $(this).attr("id")){
									document.getElementById($(this).attr("id")).type = "text";
								}else{
									document.getElementsByName($(this).attr("name")).type = "text";
								}
								$(this).val($(this).attr('title')).addClass('input-box-default-text');
							} 
						}else{
							$(this).val($(this).attr('title')).addClass('input-box-default-text');
						}
					}
				}
				if(event.type=='focusin' || event.type=='keydown')
				{
					if($(this).val() == $(this).attr('title') ){
						if ( $(this).attr('password') == 'password' && $(this).attr('title')) {
							if(($.browser.version >= 9.0 && $.browser.msie) || !$.browser.msie ) {
								if( $(this).attr("id")){
									document.getElementById($(this).attr("id")).type = "password";
								}else{
									document.getElementsByName($(this).attr("name")).type = "password";
								}
								$(this).val('');
							} 
						}else{
							$(this).val('');
						}
					}
					$(this).removeClass('input-box-default-text');
				}
			}).focusout();
		},300);
		
		setTimeout(function(){	
			$("input[type='password'][title][password!='password']")
			.each(function(){
				var thisInputObj = $(this);
				if(!thisInputObj.attr('uniqCloneId')){
					var uniqCloneId = uniqid();
					var thisCloneObj = $("<input type='text' />");
					thisCloneObj
					.attr('style',$(this).attr('style'))
					.attr('size',$(this).attr('size'))
					.attr('class',$(this).attr('class'))
					.addClass('input-box-default-text');
					//var thisCloneObj = $(this).clone().attr({'type':'text','name':'','id':uniqCloneId});
					if($(this).attr('tabIndex')) thisCloneObj.attr('tabIndex',$(this).attr('tabIndex'));
					$(this).attr('uniqCloneId',uniqCloneId);
					$(thisCloneObj).attr({'value':$(this).attr('title'),'title':''});
					
					thisCloneObj.bind('focus',function(){
						thisInputObj.show().focus();
						$(this).hide();
					});
					$(this).hide().after(thisCloneObj);
					
					$(this).bind('focusout',function(event){
						if($(this).val() == '') 
						{ 
							$(this).hide();
							thisCloneObj.show();
						}else{
							$(this).show();
							thisCloneObj.hide();
						}
					}).focusout();
				}
			})
			
		},300);
	}
}


//password -> type change , title add 2012-10-19
function areaSetDefaultText(obj){
	try{ 
		$(obj).find('input, textarea')
		.each(function(){
			var thisInputObj = $(this);
			if(thisInputObj.attr('title') != thisInputObj.attr('placeholder') || !thisInputObj.attr('placeholder')) thisInputObj.attr('placeholder',thisInputObj.attr('title'));
		}) 
		// $('input, textarea').placeholder();
	} catch (e) { 
		setTimeout(function(){	
			$(obj).find("input[type='text'][title!=''], textarea[title!=''], input[type='password'][title!=''][password='password']")
			.each(function(){
				var thisInputObj = $(this);
				$(this.form).submit(function(){
					if(thisInputObj.val() == thisInputObj.attr('title')) thisInputObj.val('');
				})
			})
			.bind('focusin focusout keydown',function(event){
				if(event.type=='focusout') 
				{
					if($(this).val() == '') 
					{ 
						if ( $(this).attr('password') == 'password' && $(this).attr('title')) {
							if(($.browser.version >= 9.0 && $.browser.msie) || !$.browser.msie ) {
								if( $(this).attr("id")){
									document.getElementById($(this).attr("id")).type = "text";
								}else{
									document.getElementsByName($(this).attr("name")).type = "text";
								}
								$(this).val($(this).attr('title')).addClass('input-box-default-text');
							} 
						}else{
							$(this).val($(this).attr('title')).addClass('input-box-default-text');
						}
					}
				}
				if(event.type=='focusin' || event.type=='keydown')
				{
					if($(this).val() == $(this).attr('title') ){
						if ( $(this).attr('password') == 'password' && $(this).attr('title')) {
							if(($.browser.version >= 9.0 && $.browser.msie) || !$.browser.msie ) {
								if( $(this).attr("id")){
									document.getElementById($(this).attr("id")).type = "password";
								}else{
									document.getElementsByName($(this).attr("name")).type = "password";
								}
								$(this).val('');
							} 
						}else{
							$(this).val('');
						}
					}
					$(this).removeClass('input-box-default-text');
				}
			}).focusout();
		},300);
		
		setTimeout(function(){	
			$(obj).find("input[type='password'][title][password!='password']")
			.each(function(){
				var thisInputObj = $(this);
				if(!thisInputObj.attr('uniqCloneId')){
					var uniqCloneId = uniqid();
					var thisCloneObj = $("<input type='text' />");
					thisCloneObj
					.attr('style',$(this).attr('style'))
					.attr('size',$(this).attr('size'))
					.attr('class',$(this).attr('class'))
					.addClass('input-box-default-text');
					//var thisCloneObj = $(this).clone().attr({'type':'text','name':'','id':uniqCloneId});
					if($(this).attr('tabIndex')) thisCloneObj.attr('tabIndex',$(this).attr('tabIndex'));
					$(this).attr('uniqCloneId',uniqCloneId);
					$(thisCloneObj).attr({'value':$(this).attr('title'),'title':''});
					
					thisCloneObj.bind('focus',function(){
						thisInputObj.show().focus();
						$(this).hide();
					});
					$(this).hide().after(thisCloneObj);
					
					$(this).bind('focusout',function(event){
						if($(this).val() == '') 
						{ 
							$(this).hide();
							thisCloneObj.show();
						}else{
							$(this).show();
							thisCloneObj.hide();
						}
					}).focusout();
				}
			})
			
		},300);
	}
}
/*
function comma(x)
{
	var temp = "";
	var x = String(uncomma(x));

	num_len = x.length;
	co = 3;
	while (num_len>0){
		num_len = num_len - co;
		if (num_len<0){
			co = num_len + co;
			num_len = 0;
		}
		temp = ","+x.substr(num_len,co)+temp;
	}
	var result = temp.substr(1);
	result = result.replace('-,', '-');
	result = result.replace('-0', '0');

	return result;
}
*/

function comma(data_value) {
	var data_value = String(uncomma(data_value));
    var txtNumber = '' + data_value;    // �Էµ� ���� ���ڿ� ������ �����մϴ�.
    if (isNaN(txtNumber) || txtNumber == "") {    // ���� ������ ���� ���������� �ԷµǾ����� Ȯ���մϴ�.
        alert("���ڸ� �Է� �ϼ���");
        return;
    }
    else {
        var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');    // ���Խ� ���� ����
        var arrNumber = txtNumber.split('.');    // �Է¹��� ���ڸ� . �������� ����. (�����ο� �Ҽ��κ����� �и�)
        arrNumber[0] += '.'; // ������ ���� �Ҽ��� �߰�
        do {
            arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2'); // �����ο��� rxSplit ���ϰ� ��ġ�ϴ� �κ��� ã�� replace ó��
        } while (rxSplit.test(arrNumber[0])); // ���Խ� ���� rxSplit �� ������ ���� �ִ��� Ȯ���ϰ� �ִٸ� true ��ȯ. ���� �ݺ�.
        if (arrNumber.length > 1) { // txtNumber�� ��ħǥ(.)�� �и��� �κ��� 2�� �̻��̶�� (�� �Ҽ��� �κе� �ִٸ�)
            return arrNumber.join(''); // �迭�� �״�� ��Ĩ. (join �Լ��� ���ڰ� ������ ���ڸ� ���а����� �ΰ� ��ħ)
        }
        else { // txtNumber ���̰� 1�̶�� �����θ� �ִٴ� �ǹ�.
            return arrNumber[0].split('.')[0]; // ������ ������ ���� �ٿ��� ��ħǥ(.)�� �״�� ������.
        }
    }
}

function uncomma(x){
	var result		= '';
	var reg			= /(,)*/g;
	var txtNumber	= '' + String(x);
	var arrNumber	= txtNumber.split('.');
	arrNumber[0]	= parseInt(String(arrNumber[0]).replace(reg,""));

	if	(arrNumber.length > 1){
		result		= arrNumber.join('.');
	}else{
		result		= arrNumber[0];
	}

	return (isNaN(result)) ? 0 : result;
}

function uncomma_float(x)
{
	var reg = /(,)*/g;
	x = parseFloat(String(x).replace(reg,""));
	return (isNaN(x)) ? 0 : x;
}

function num(val){
	if(!val || val=='' || isNaN(val)){
		return 0;
	}else{
		return parseInt(val);
	}
}

function num_float(val){
	if(!val || val=='' || isNaN(val)){
		return 0;
	}else{
		return parseFloat(val);
	}
}

// �Ҽ����� ������ comma�Լ�
function float_comma(price){
	var result	= price + '';
	if	(result.search(/\./) != -1){
		var tmp	= result.split('.');
		result	= comma(tmp[0]) + '.' + tmp[1];
	}else{
		result	= comma(price);
	}

	result	= result.replace('-,', '-');
	result	= result.replace('-0', '0');

	return result;
}

/* ī�װ� ��������*/
function category_select_load(preSelectName,selectName,code,callbackFunction){
	$("select[name='" + selectName + "'] option").each(function(){ if( $(this).val() ) $(this).remove(); });
	if(preSelectName && !code) return;		
	$.ajax({
		type: "GET",
		url: "/common/category2json",
		data: "categoryCode=" + code,
		dataType: 'json',
		success: function(result){			
			var options = "";			
			for(var i=0;i<result.length;i++) options += "<option value='"+result[i].category_code+"'>"+result[i].title+"</option>";
			$("select[name='" + selectName + "']").append(options);
			if(options){
				$("select[name='" + selectName + "']").show();
			}
			if(preSelectName){
				$("select[name='" + preSelectName + "'] option[value='"+code+"']").attr("selected",true);
			}

			if(callbackFunction){
				callbackFunction(result);
			}
		}
	});
}


function loadingStart(target,customOptions){ 
	var options = {segments: 12, width: 5.5, space: 6, length: 13, color: '#ffffff', speed: 1.5};
	
	if(customOptions != undefined){
		for(var i in customOptions){
			options[i] = customOptions[i];
		}
	}
	
	if(!target) var target = "#ajaxLoadingLayer";

	$(target).css({'opacity':'0.5'}).activity(options).show();
	$(target).find("div").eq(0).css({'z-index':'1000'});//mobile loadingimg 
}

function loadingStop(target,noHidden){
	if(!target) var target = "#ajaxLoadingLayer";
	if(noHidden){
		$(target).css({'opacity':'1'}).activity(false);
	}else{
		$(target).hide().activity(false);
	}
}

//�����submit üũ
function loadingstartsubmit(){
	loadingStart("body",{segments: 12, width: 25.5, space: 6, length: 23, color: '#000000', speed: 1.5, valign: 'bottom',padding: '1'});
}


/* ���̾�α� ���� (Ÿ��Ʋ, ���̾���̵�, �ɼ�) */
function openDialog(title, layerId, customOptions, callback){

	if((typeof layerId) != 'string') var layerSelector = layerId;
	else if(layerId.substring(0,1)=='#' || layerId.substring(0,1)=='.' || (typeof layerId) != 'string') var layerSelector = layerId;
	else var layerSelector = "#"+layerId;
	
	var options = {
		"zIndex" : 10000,
//		"show" : "fade",
//		"hide" : "fade",
		"modal" : true,
		"resizable" : false,
		"draggable" : true,
		"noClose" : false
	};

	if(customOptions != undefined){
		for(var i in customOptions){
			options[i] = customOptions[i];
		}
	}
	
	options['title'] = title;

	if(callback){
		$(layerSelector).dialog({
			"modal" : options['modal'],
			"close" : function(){
				callback();
			}
		});
	}

	$(function(){
		if(customOptions['autoOpen']==false){
			
			$(layerSelector)
			.dialog({"autoOpen" : false})
			.dialog("option", options);
			
		}else{
			$(layerSelector)
			.dialog({"autoOpen" : false})
			.dialog("option", options)
			.dialog("open")
			.focus();
		}

		// ��ũ�ѽ� ���̾� ��ġ ����
		var top_pos = parseInt($(layerSelector).closest('.ui-dialog').css('top'));
		setTimeout(function(){
			if( top_pos < $(document).scrollTop()){
				top_pos = $(document).scrollTop();
				if( top_pos < 0 ) top_pos = 0;
				$(layerSelector).closest('.ui-dialog').css('top',top_pos+'px');
			}
		},200);

		if(options['noClose']==false){
			$(".ui-dialog-titlebar-close",$(layerSelector).closest(".ui-dialog")).show();
			$(".ui-dialog-titlebar-close").bind("click",function(){
				if(layerId=='recommendDisplayGoodsSelect'){
					parent.$(window).css("overflow-y","auto");
					$(this).dialog("close");
				}else{
					$(window).css("overflow-y","auto");
					$(this).dialog("close");
				}
			});
		}else{
			$(".ui-dialog-titlebar-close",$(layerSelector).closest(".ui-dialog")).hide();
			$(layerSelector).dialog("option","close",function(){
				if(options['noClose'])	$(layerSelector).dialog("open").focus();
			});
		}

		/* �ش�â�� �ֻ����� ������ */
		var maxZindex	= 0;

		$(".ui-widget-overlay").each(function(k){
			if(maxZindex < eval($(this).css("z-index"))) maxZindex = eval($(this).css("z-index"));
		});

		maxZindex++;
		$(layerSelector).css("z-index",eval(maxZindex)+" !important");

	});
	
}

/* ���̾�α� �ݱ� */
function closeDialog(layerId){
	if((typeof layerId) != 'string') var layerSelector = layerId;
	else if(layerId.substring(0,1)=='#' || layerId.substring(0,1)=='.' || (typeof layerId) != 'string') var layerSelector = layerId;
	else var layerSelector = "#"+layerId;
	$(layerSelector).dialog("close");
}

/* ���̾�α� �˾�â����(�̸� div������ ���������ʿ䰡 ����) */
function openDialogPopup(title, layerId, customOptions, onloadCallback){
	closeDialog(layerId);
	
	var layerSelector = "#"+layerId;
	
	if($(layerSelector).length==0){
		layerSelector = $("<div id='"+layerId+"'></div>").appendTo('body');
	}
	
	if(customOptions['url']){
		$.ajax({
			'cache' : false,
			'url' : customOptions['url'],
			'type' : customOptions['type']?customOptions['type']:'get',
			'data' : customOptions['data']?customOptions['data']:{},
			'success' : function(result){
				$(layerSelector).html(result);
				openDialog(title, layerId, customOptions);
				if(onloadCallback){
					onloadCallback();
				}
			}		
		});
	}
	
}

/* Alert ���̾�α� */
/* ��뿹
	openDialogAlert("�����߽��ϴ�.",400,140,function(){
		alert("Ȯ���� �������ϴ�.");
	});
*/
function openDialogAlert(msg,width,height,callback,customOptions){
	if(typeof gl_mobile_mode!="undefined" && gl_mobile_mode && typeof gl_set_mode!="undefined" && gl_set_mode.indexOf('mobile') > -1 ){
		openDialogAlertmobile(msg,width,height,callback,customOptions);
		return;
	}
	var options = {
		"z-index"		: 999999,
		"hideButton"	: false,
		"modal" 		: true
	};
	
	if(customOptions != undefined){
		for(var i in customOptions){
			options[i] = customOptions[i];
		}
	}
	
	if(width) options['width'] = width;
	if(height) options['height'] = height;

	document.getElementById('openDialogLayerMsg').innerHTML = msg;

	admin_flag = check_is_admin();

	//�˸� <span class='desc'>�˸� ������ ǥ���մϴ�.</span>
	title = getAlert('et352');
	if	(admin_flag)
		title = "�˸� <span class='desc'>�˸� ������ ǥ���մϴ�.</span>";
	openDialog(title, "openDialogLayer", options);
	
	if(callback){
		$("#openDialogLayer").dialog({
			"modal" : options['modal'],
			"close" : function(){
				callback();
			}
		});
	}
	//Ȯ��
	btn_y = getAlert('et353')
	if	(admin_flag)
		btn_y = 'Ȯ��';

	options.btn_title	= (options.btn_title) ? options.btn_title : btn_y;
	options.btn_class	= (options.btn_class) ? options.btn_class : 'btn medium';
	options.btn_action	= (options.btn_action) ? options.btn_action : "$('#openDialogLayer').dialog('close');";

	$("#openDialogLayerBtns").remove();
	if(!options.hideButton){
		$("#openDialogLayer").append("<div id='openDialogLayerBtns' align='center' style='padding-top:15px'><span class='" + options.btn_class + "'><input type='button' value='" + options.btn_title + "' onclick=\"" + options.btn_action + "\" /></span></div>");
	}
	$("#openDialogLayerBtns input:eq(0)").focus();

}
function openDialogAlerttitle(title, msg,width,height,callback,customOptions){

	var options = {
		"hideButton"	: false,
		"modal" 		: true
	};

	if(customOptions != undefined){
		for(var i in customOptions){
			options[i] = customOptions[i];
		}
	}

	if(width) options['width'] = width;
	if(height) options['height'] = height;

	document.getElementById('openDialogLayerMsg').innerHTML = msg;
	openDialog(title, "openDialogLayer", options);

	if(callback){
		$("#openDialogLayer").dialog({
			"modal" : options['modal'],
			"close" : function(){
				callback();
			}
		});
	}

	$("#openDialogLayerBtns").remove();
	if(!options.hideButton){
		$("#openDialogLayer").append("<div id='openDialogLayerBtns' align='center' style='padding-top:15px'><span class='btn medium'><input type='button' value='Ȯ��' onclick=\"$('#openDialogLayer').dialog('close');\" /></span></div>");
	}
	$("#openDialogLayerBtns input:eq(0)").focus();

}

/* Confirm ���̾�α� */
/* ��뿹
	openDialogConfirm('�����Ͻðڽ��ϱ�?',400,140,function(){
		alert('���� �������ϴ�.');
	},function(){
		alert('�ƴϿ��� �������ϴ�.');
	});

*/
function openDialogConfirm(msg,width,height,yesCallback,noCallback,params){
	if(typeof gl_mobile_mode!="undefined" && gl_mobile_mode && typeof gl_set_mode!="undefined" && gl_set_mode.indexOf('mobile') > -1 ){
		openDialogConfirmmobile(msg,width,height,yesCallback,noCallback,params);
		return;
	}

	var choicedYes = false;
	admin_flag = check_is_admin();
	
	document.getElementById('openDialogLayerMsg').innerHTML = msg;
	//�˸� <span class='desc'>�˸� ������ ǥ���մϴ�.</span>
	title = getAlert('et352');
	if	(admin_flag)
		title = "�˸� <span class='desc'>�˸� ������ ǥ���մϴ�.</span>";
	openDialog(title, "openDialogLayer", {"width":width,"height":height});		
	
	$("#openDialogLayer").dialog({
			close : function(){
				if(noCallback && !choicedYes){
					noCallback();
				}
			}
	});
	var params = typeof params!='undefined' ? params : {};	
	//��
	btn_y = getAlert('et354');
	if	(admin_flag)
		btn_y = '��';
	if(!params['yesMsg']){params['yesMsg'] = btn_y;}
	//�ƴϿ�
	btn_n = getAlert('et355');
	if	(admin_flag)
		btn_n = '�ƴϿ�';
	if(!params['noMsg']){params['noMsg'] = btn_n;}
		
	$("#openDialogLayerBtns").remove();
	$("#openDialogLayer").append("<div id='openDialogLayerBtns' align='center' style='padding-top:15px'><span class='btn medium'><button type='button' id='openDialogLayerConfirmYesBtn'>"+params['yesMsg']+"</button></span> <span class='btn medium'><button type='button' id='openDialogLayerConfirmNoBtn'>"+params['noMsg']+"</button></span></div>");
	$("#openDialogLayerBtns input:eq(0)").focus();
	
	document.getElementById('openDialogLayerConfirmYesBtn').onclick = function(){
		choicedYes = true;
		$("#openDialogLayer").dialog("close");
		if(yesCallback) yesCallback();
	};
	document.getElementById('openDialogLayerConfirmNoBtn').onclick = function(){
		choicedYes = false;
		$("#openDialogLayer").dialog("close");
	};
}

function openDialogConfirmtitle(title,msg,width,height,yesCallback,noCallback){
	var choicedYes = false;
	
	document.getElementById('openDialogLayerMsg').innerHTML = msg;
	openDialog(title, "openDialogLayer", {"width":width,"height":height});		
	
	$("#openDialogLayer").dialog({
			close : function(){
				if(noCallback && !choicedYes){
					noCallback();
				}
			}
	});

	$("#openDialogLayerBtns").remove();
	$("#openDialogLayer").append("<div id='openDialogLayerBtns' align='center' style='padding-top:15px'><span class='btn medium'><input type='button' value='��' id='openDialogLayerConfirmYesBtn' /></span> <span class='btn medium'><input type='button' value='�ƴϿ�' id='openDialogLayerConfirmNoBtn' /></span></div>");
	$("#openDialogLayerBtns input:eq(0)").focus();
	
	document.getElementById('openDialogLayerConfirmYesBtn').onclick = function(){
		choicedYes = true;
		$("#openDialogLayer").dialog("close");
		if(yesCallback) yesCallback();
	};
	document.getElementById('openDialogLayerConfirmNoBtn').onclick = function(){
		choicedYes = false;
		$("#openDialogLayer").dialog("close");
	};
}


function openSearchSet(id, title){
	var html = "<div class=\"search-form-container\" style='padding:10px;'>";
	html += "<form id='setForm'>";
	html += $("#"+id).html();
	html += "</form>";
	html += "</div>";
	html += "<div style=\"padding-top:10px;\" class=\"center\">";
	html += "<span class=\"btn large black\">";
	html += "<button type=\"submit\" class=\"setBtn\" onclick='settingForm();'>�����ϱ�</button>";
	html += "</span>";
	html += "</div>";
	$('#'+id).html(html);		
	openDialog(title+" <span class='desc'>"+title+"�� �մϴ�.</span>", id, {"width":"900","height":"300"});
}

function JSONtoString(object,quote) {
    var results = [];
    
    if(!quote) quote = '"';
    
    for (var property in object) {
    	var value = object[property];
    	if (value){
    		if(typeof value == "string") value = quote+value+quote;
    		results.push(quote+property.toString()+quote + ':' + value);
    	}
    }
            
    return '{' + results.join(', ') + '}';
}

/**
 * ��â���� �˾��� ���ϴ�
 * popup('zoom.php?seq=7',750,550)
 */
function popup(src,width,height) {
	var scrollbars = "1";
	var resizable = "no";
	if (typeof(arguments[3])!="undefined") scrollbars = arguments[3];
	if (arguments[4]) resizable = "yes";
	window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',toolbar=no,status=no,resizable='+resizable+',menubar=no');
}


function sprintf () {
	// Return a formatted string  
	// 
	// version: 1103.1210
	// discuss at: http://phpjs.org/functions/sprintf    // +   original by: Ash Searle (http://hexmen.com/blog/)
	// + namespaced by: Michael White (http://getsprink.com)
	// +    tweaked by: Jack
	// +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	// +      input by: Paulo Freitas    // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	// +      input by: Brett Zamir (http://brett-zamir.me)
	// +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	// *     example 1: sprintf("%01.2f", 123.1);
	// *     returns 1: 123.10    // *     example 2: sprintf("[%10s]", 'monkey');
	// *     returns 2: '[    monkey]'
	// *     example 3: sprintf("[%'#10s]", 'monkey');
	// *     returns 3: '[####monkey]'
	var regex = /%%|%(\d+\$)?([-+\'#0 ]*)(\*\d+\$|\*|\d+)?(\.(\*\d+\$|\*|\d+))?([scboxXuidfegEG])/g;
	var a = arguments,
		i = 0,
		format = a[i++];

	// pad()
	var pad = function (str, len, chr, leftJustify) {
		if (!chr) {
			chr = ' ';
		}
		var padding = (str.length >= len) ? '' : Array(1 + len - str.length >>> 0).join(chr);
		return leftJustify ? str + padding : padding + str;
	};

	// justify()
	var justify = function (value, prefix, leftJustify, minWidth, zeroPad, customPadChar) {
		var diff = minWidth - value.length;
		if (diff > 0) {
			if (leftJustify || !zeroPad) {
				value = pad(value, minWidth, customPadChar, leftJustify);
			} else {
				value = value.slice(0, prefix.length) + pad('', diff, '0', true) + value.slice(prefix.length);
			}
		}
		return value;
	}; 
	// formatBaseX()
	var formatBaseX = function (value, base, prefix, leftJustify, minWidth, precision, zeroPad) {
		// Note: casts negative numbers to positive ones
		var number = value >>> 0;        prefix = prefix && number && {
			'2': '0b',
			'8': '0',
			'16': '0x'
		}[base] || '';        value = prefix + pad(number.toString(base), precision || 0, '0', false);
		return justify(value, prefix, leftJustify, minWidth, zeroPad);
	};

	// formatString()
	var formatString = function (value, leftJustify, minWidth, precision, zeroPad, customPadChar) {
		if (precision != null) {
			value = value.slice(0, precision);
		}
		return justify(value, '', leftJustify, minWidth, zeroPad, customPadChar);
	};

	// doFormat()
	var doFormat = function (substring, valueIndex, flags, minWidth, _, precision, type) {
		var number;
		var prefix;
		var method;
		var textTransform;
		var value;
		 if (substring == '%%') { return '%'; }

		// parse flags
		var leftJustify = false,
			positivePrefix = '',
			zeroPad = false,
			prefixBaseX = false,
			customPadChar = ' ';
		var flagsl = flags.length;
		for (var j = 0; flags && j < flagsl; j++) {
			switch (flags.charAt(j)) {
				case ' ':
					positivePrefix = ' ';
					break;
				case '+':
					positivePrefix = '+';
					break;
				case '-':
					leftJustify = true;
					break;
				case "'":
					customPadChar = flags.charAt(j + 1);
					break;
				case '0':
					zeroPad = true;
					break;
				case '#':
					prefixBaseX = true;
					break;
			}
		}

		// parameters may be null, undefined, empty-string or real valued
		// we want to ignore null, undefined and empty-string values
		if (!minWidth) {
			minWidth = 0;
		} else if (minWidth == '*') {
			minWidth = +a[i++];
		} else if (minWidth.charAt(0) == '*') {
			minWidth = +a[minWidth.slice(1, -1)];
		} else {
			minWidth = +minWidth;
		} 
		// Note: undocumented perl feature:
		if (minWidth < 0) {
			minWidth = -minWidth;
			leftJustify = true;
		}

		if (!isFinite(minWidth)) {
			throw new Error('sprintf: (minimum-)width must be finite');
		} 
		if (!precision) {
			precision = 'fFeE'.indexOf(type) > -1 ? 6 : (type == 'd') ? 0 : undefined;
		} else if (precision == '*') {
			precision = +a[i++];
		} else if (precision.charAt(0) == '*') {
			precision = +a[precision.slice(1, -1)];
		} else {
			precision = +precision;
		} 
		// grab value using valueIndex if required?
		value = valueIndex ? a[valueIndex.slice(0, -1)] : a[i++];

		switch (type) {
			case 's':
				return formatString(String(value), leftJustify, minWidth, precision, zeroPad, customPadChar);
			case 'c':
				return formatString(String.fromCharCode(+value), leftJustify, minWidth, precision, zeroPad);
			case 'b':
				return formatBaseX(value, 2, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
			case 'o':
				return formatBaseX(value, 8, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
			case 'x':
				return formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
			case 'X':
				return formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad).toUpperCase();
			case 'u':
				return formatBaseX(value, 10, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
			case 'i':
			case 'd':
				number = (+value) | 0;
				prefix = number < 0 ? '-' : positivePrefix;
				value = prefix + pad(String(Math.abs(number)), precision, '0', false);
				return justify(value, prefix, leftJustify, minWidth, zeroPad);
			case 'e':
			case 'E':
			case 'f':
			case 'F':
			case 'g':
			case 'G':
				number = +value;
				prefix = number < 0 ? '-' : positivePrefix;
				method = ['toExponential', 'toFixed', 'toPrecision']['efg'.indexOf(type.toLowerCase())];
				textTransform = ['toString', 'toUpperCase']['eEfFgG'.indexOf(type) % 2];
				value = prefix + Math.abs(number)[method](precision);
				return justify(value, prefix, leftJustify, minWidth, zeroPad)[textTransform]();
			default:
				return substring;
		}
	};
	 
    return format.replace(regex, doFormat);
}




/**
 * ���� �ð��� Time �������� ����
 */
function getCurrentTime(date) {
	return toTimeString(new Date(date));
}

/**
 * �ڹٽ�ũ��Ʈ Date ��ü�� Time ��Ʈ������ ��ȯ
 * parameter date: JavaScript Date Object
 */
function toTimeString(date) {
	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 1��=0,12��=11�̹Ƿ� 1 ����
	var day   = date.getDate();

	if (("" + month).length == 1) {month = "0" + month;}
	if (("" + day).length   == 1) {day   = "0" + day;}

	return ("" + year + month + day)
}
/**
 * ���� Ҵ�� YYYY�������� ����
 */
function getYear(date) {
	return getCurrentTime(date).substr(0,4);
}

/**
 * ���� ���� MM�������� ����
 */
function getMonth(date) {
	return getCurrentTime(date).substr(4,2);
}

/**
 * ���� ���� DD�������� ����
 */
function getDay(date) {
	return getCurrentTime(date).substr(6,2);
}
//
function getDate(day) {
	var d = new Date();
	var dt = d - day*24*60*60*1000;
	return getYear(dt) + '-' + getMonth(dt) + '-' + getDay(dt);
}


/**
 * �޸� ���̱� �Լ�
 * @param value int
 */
function setComma(nStr) {
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}


/**
 * �űԻ��� ���̾�α� â�� ����.
 * <pre>
 * 1. createElementContainer �Լ��� �̿��Ͽ� �Ź� div �±׸� �Է����� �ʰ� ���̾�α� ������ �ڵ����� �����Ѵ�.
 * 2. refreshTable �Լ��� �̿��Ͽ� ���̾�α� ���� �κ��� �ҷ��´�.
 * </pre>
 * @param string url ��ȭ�� �ּ�
 * @param int width ���� ������
 * @param int height ���� ������
 * @param string title ����
 * @param string btn_yn 'false'�̸� �ݱ��ư�� ��Ÿ����.
 */
function addFormDialog(url, width, height, title, btn_yn) {
	newcreateElementContainer(title);
	newrefreshTable(url);

	if (btn_yn != 'false') {
		var buttons = {
			'�ݱ�': function() {
				$(this).dialog('close');
			},
			'�����ϱ�': function() {
				$('#form1').submit();
			}
		}
	} 
	else if (btn_yn == 'close') {
		var buttons =  {
			'�ݱ�': function() {
				$(this).dialog('close');
			}
		}
	}

	// background layer�� z-index�� 9999�ε� ��â�� z-index�� 9999���� ���� ��찡 �߻��ؼ� �߰���.
	var dialog_zIndex	= $('.ui-dialog').last().css('z-index');
	if	(dialog_zIndex < 9999)	dialog_zIndex	= 10001;
	if( height>0 ) {
		$('#dlg').dialog({
			bgiframe: true,
			autoOpen: false,
			width: width,
			height: height,
			resizable: false,
			draggable: false,
			zIndex: dialog_zIndex,
			modal: true,
			overlay: {
				backgroundColor: '#000000',
				opacity: 0.8
			},
			buttons: buttons,
			open: function() { 
					$("#ui-datepicker-div").css("z-index",
					$(this).parents(".ui-dialog").css("z-index")+1);
			}
		}).dialog('open');
	}else{
		$('#dlg').dialog({
			bgiframe: true,
			autoOpen: false,
			width: width, 
			resizable: false,
			draggable: false,
			zIndex: dialog_zIndex,
			modal: true,
			overlay: {
				backgroundColor: '#000000',
				opacity: 0.8
			}, 
			buttons: buttons,
			open: function() { 
					$("#ui-datepicker-div").css("z-index",
					$(this).parents(".ui-dialog").css("z-index")+1);
			}
		}).dialog('open');
	}
	return false;
}

function newcreateElementContainer(title) {
	var dlg_title = title ? title : '��� ��';
	var el = '<div id="dlg" title="' + dlg_title + '"   ><div id="dlg_content" ></div></div>';
	$('#dlg').remove();
	$(el).appendTo('body');
}

function newrefreshTable(url) {
	$.get(url, {}, function(data, textStatus) {
		$('#dlg_content').html(data);
	});
}



function goTwitter(msg,url) {
	var href = "http://twitter.com/intent/tweet?text=" + encodeURIComponent(msg) + " " + encodeURIComponent(url);
	var a = window.open(href, 'twitter', '');
	if ( a ) {
		a.focus();
	}
}
function goMe2Day(msg,url,tag) {
	var href = "http://me2day.net/posts/new?new_post[body]=" + encodeURIComponent(msg) + " " + encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag);
	var a = window.open(href, 'me2Day', '');
	if ( a ) {
		a.focus();
	}
}
function goFaceBook(msg,url) {
	var href = "https://www.facebook.com/sharer/sharer.php?u=" + url + "&t=" + encodeURIComponent(msg);
	var a = window.open(href, 'facebook', '');
	if ( a ) {
		a.focus();
	}
}
function goCyWorld(no) {
	var href = "http://api.cyworld.com/openscrap/post/v1/?xu=http://ticketmonster.co.kr/html/cyworldConnectToXml.php?no=" + no +"&sid=suGPZc14uNs4a4oaJbVPWkDSZCwgY8Xe";
	var a = window.open(href, 'cyworldpost', 'width=450,height=410');
	if ( a ) {
		a.focus();
	}
}
function goYozmDaum(link,prefix,parameter) {
	var href = "http://yozm.daum.net/api/popup/post?sourceid=&link=" + encodeURIComponent(link) + "&prefix=" + encodeURIComponent(prefix) + "&parameter=" + encodeURIComponent(parameter);
	var a = window.open(href, 'yozmSend', 'width=466, height=356');
	if ( a ) {
		a.focus();
	}
}

function snsWin(sns, enc_tit, enc_sbj, enc_tag, enc_url, isMobile,imgurl,imgwidth,imgheight)
{ 
	//ª���ּ�üũ
	var sourturl = enc_url;
	$.ajax({url: '/common/get_shortURL?url='+enc_url,global:false,async: false,dataType: 'json',success: function(data) {if(data) sourturl = data;}});
	
	var snsset = new Array();
	if(isMobile){
		snsset['tw'] = 'http://twitter.com/intent/tweet?text=' + enc_sbj + '+++' + sourturl;
		snsset['me'] = 'http://me2day.net/plugins/mobile_post/new?new_post[body]=' + enc_sbj + '+++["'+enc_tit+'":' + sourturl + '+]&new_post[tags]='+enc_tag;
		snsset['my']		= 'https://m.mypeople.daum.net/mypeople/mweb/share.do?source_id=' + enc_tit + '&link=' + sourturl + '&prefix=' + enc_sbj;
	}else{
		snsset['tw'] = 'http://twitter.com/intent/tweet?text=' + enc_sbj + '+++' + sourturl;
		snsset['me'] = 'http://me2day.net/posts/new?new_post[body]=' + enc_sbj + '+++["'+enc_tit+'":' + sourturl + '+]&new_post[tags]='+enc_tag+'&redirect_url='+sourturl;
		snsset['my']		= 'https://mypeople.daum.net/mypeople/web/share.do?source_id=' + enc_tit + '&link=' + sourturl + '&prefix=' + enc_sbj;
	}

	snsset['ka'] = 'kakaolink://sendurl?msg=' + enc_sbj + '&url=' + sourturl + '&appid=' + document.domain + '&appver=4.0&type=link&appname=' + enc_tit + '&apiver=2.0';
	snsset['kaapi']		= "api";
	snsset['kakaostory']	= 'storylink://posting?post=' + enc_sbj + '&appid=' + document.domain + '&appver=4.0&apiver=1.0&appname=' + enc_tit + '&urlinfo=' + sourturl + '';
	snsset['go']		= 'https://plus.google.com/share?url=' + sourturl;
	snsset['fa'] = 'https://www.facebook.com/sharer/sharer.php?u=' + sourturl + '&t=' + enc_sbj;
	snsset['yo'] = "http://yozm.daum.net/api/popup/prePost?link=" + sourturl + "&prefix=" + enc_sbj + "&parameter=" + sourturl;

	snsset['pi'] = '';//�̹�������
	snsset['na'] = 'http://api.nateon.nate.com/web/note/SendNote.do?msg='+enc_sbj+ '&lurl='+sourturl;
	snsset['cy'] = 'http://csp.cyworld.com/bi/bi_recommend_pop.php?title='+enc_tit+ '&url='+sourturl+ '&thumbnail='+imgurl+ '&summary='+enc_sbj;
	snsset['line']		= 'http://line.me/R/msg/text/?' + enc_sbj + '%0D%0A' + sourturl; 
	
	if( snsset[sns] ) {
		if(sns == 'ka'){//app link copy
			executeURLLink(enc_sbj, enc_tit, sourturl,isMobile);
		}else if(sns == 'kaapi'){ 
			sendKakaotalk(enc_sbj, enc_tit, enc_url,imgurl,imgwidth,imgheight); 
		}else if(sns == 'kakaostory'){ 
			sendKakaostorynew(enc_sbj, enc_tit, sourturl,isMobile,imgurl);
		}else{
			var a = window.open(snsset[sns], "SnsWinUp"+sns);
			if ( a ) {
				a.focus();
			}
		}
	}
}

//īī�����丮����
function sendKakaostorynew(enc_sbj, enc_tit, enc_url,isMobile,imgurl)
{   
	var appid = 'http://' + document.domain;
	kakaostorynew.link("story").send({   
        post : enc_url,
        appid : appid,
        appver : "1.0",
        appname : enc_tit,
        urlinfo : JSON.stringify({title:enc_sbj, imageurl:[imgurl], type:"article"})
    });
}
 


//īī���� ����
function sendKakaotalk(enc_sbj, enc_tit, enc_url,imgurl,imgwidth,imgheight)
{
	if(imgurl && imgwidth >= 81 && imgheight >= 81) {
	Kakao.Link.createTalkLinkButton({
	container: '.kakao-link-btn', 
	label: enc_tit,
	image: {
	src: imgurl,
	width: imgwidth,
	height: imgheight
	},
	webButton: {
	text: enc_sbj,
	url: enc_url
	}
		});
	}else{
		Kakao.Link.createTalkLinkButton({
		container: '.kakao-link-btn', 
		label: enc_tit, 
		webButton: {
		text: enc_sbj,
		url: enc_url
		}
		});
	}
	// �� ������ �� �÷����� ����� �������� URL�̾�� �մϴ�. ������ ����Ʈ�� ����� ������Ʈ �� ù��° URL
}

function executeURLLink(enc_sbj, enc_tit, enc_url,isMobile,imgurl)
{
	if ( !isMobile ) {
		//PC���� ������ ��쿡�� �۵����� �ʽ��ϴ�.\n\nīī������ ��ġ�� ������/�ȵ���̵��������� �����ϴ� ��쿡�� ��� �����մϴ�.
		alert( getAlert('et070') );
		return;
	}
    /* 
    msg, url, appid, appname�� ���� ���񽺿��� ����ϴ� ������ ������Ʈ�Ǿ�� �մϴ�. 
    */
	var appid = 'http://' + document.domain;
    kakao.link("talk").send({
        msg : enc_sbj,
        url : enc_url,
        appid : appid,
        appver : "2.0",
        appname : enc_tit,
        type : "link"
    });

}

//������â
function servicedemoalert(e) { 
	if( e.name == "use_f"  ||e.name == "use_t" ) {
		$("input[name="+e.name+"]").attr("checked",'checked');
	}else if( e.type == "checkbox" ) {
		$("input[name="+e.name+"]").attr("checked",''); 
		$("input[name="+e.name+"]").removeAttr("checked");
	}else if( e.type == "file" ) {
		$("input[name="+e.name+"]").attr("disabled","disabled");
	}
	
	$.ajax({
		type: "get",
		url: "/admin/main/main_demo",
		success: function(result){
			$("#main_demo").html(result);
			openDialog("���� ��� �ȳ�", "main_demo", {"width":"700","height":"700","show" : "fade","hide" : "fade"});
		}
	});

	//alert( "type:" + e.type + "/name:" + e.name );
	//alert( 'ü�� ����Ʈ������ �ش� ����� �������� �ʽ��ϴ�.' );
	return;
}
       

//��������׷��̵�
function serviceUpgrade(){
	window.open('https://firstmall.kr/ec_hosting/addservice/upgrade.php','','');
}
//����� > �Խ����߰�
function serviceBoardAdd(){
	//window.open('http://customer.gabia.com/1to1/1to1.php','','');
	$.get('board_payment', function(data) {
		$('#boardPaymentPopup').html(data);
		openDialog("�Խ��� �߰� ��û", "boardPaymentPopup", {"width":"800","height":"650"});
	});
}

function htmlspecialchars(str) {
	if (typeof(str) == "string") {
		str = str.replace(/&/g, "&amp;"); /* must do &amp; first */
		str = str.replace(/"/g, "&quot;");
		str = str.replace(/'/g, "&#039;");
		str = str.replace(/</g, "&lt;");
		str = str.replace(/>/g, "&gt;");
	}
	return str;
}

//flash(�����ּ�, ����, ����, ����, ��������, ����, ���)
function flash(url,w,h,bg,win,vars,base,target){
	var s=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' align='middle'>"+
	"<param name='allowScriptAccess' value='always' />"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='wmode' value='transparent' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='FlashVars' value='"+vars+"' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<param name='base' value='"+base+"' />"+
	"<embed src='"+url+"' base='"+base+"' wmode='transparent' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' align='middle' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
	"</object>";

	$('.'+target).html(s);
}

function isNumber(s) {
	s += ''; // ���ڿ��� ��ȯ
	s = s.replace(/^\s*|\s*$/g, ''); // �¿� ���� ����
	if (s == '' || isNaN(s)) return false;
	return true;
}

function uniqid (prefix, more_entropy) {
	  // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	  // +    revised by: Kankrelune (http://www.webfaktory.info/)
	  // %        note 1: Uses an internal counter (in php_js global) to avoid collision
	  // *     example 1: uniqid();
	  // *     returns 1: 'a30285b160c14'
	  // *     example 2: uniqid('foo');
	  // *     returns 2: 'fooa30285b1cd361'
	  // *     example 3: uniqid('bar', true);
	  // *     returns 3: 'bara20285b23dfd1.31879087'
	  if (typeof prefix == 'undefined') {
	    prefix = "";
	  }

	  var retId;
	  var formatSeed = function (seed, reqWidth) {
	    seed = parseInt(seed, 10).toString(16); // to hex str
	    if (reqWidth < seed.length) { // so long we split
	      return seed.slice(seed.length - reqWidth);
	    }
	    if (reqWidth > seed.length) { // so short we pad
	      return Array(1 + (reqWidth - seed.length)).join('0') + seed;
	    }
	    return seed;
	  };

	  // BEGIN REDUNDANT
	  if (!this.php_js) {
	    this.php_js = {};
	  }
	  // END REDUNDANT
	  if (!this.php_js.uniqidSeed) { // init seed with big random int
	    this.php_js.uniqidSeed = Math.floor(Math.random() * 0x75bcd15);
	  }
	  this.php_js.uniqidSeed++;

	  retId = prefix; // start with prefix, add current milliseconds hex string
	  retId += formatSeed(parseInt(new Date().getTime() / 1000, 10), 8);
	  retId += formatSeed(this.php_js.uniqidSeed, 5); // add seed hex string
	  if (more_entropy) {
	    // for more entropy we add a float lower to 10
	    retId += (Math.random() * 10).toFixed(8).toString();
	  }

	  return retId;
}


//���� ���±׶���>�ٷα��Ž� ����
function getfbopengraph(gdseq, type, urldomain, id)
{
	
	 if (document.location.protocol == "https:") {
		var url = 'https://'+urldomain+'/sns_process/fbopengraph';
	 }else{
	var url = 'http://'+urldomain+'/sns_process/fbopengraph';
	 }
	$.getJSON(url + "?no="+gdseq+"&id="+id+"&type="+type+"&jsoncallback=?"); 
}

//���̽���>me/feed �۳����
function getfbmefeed(boardseq, type, urldomain, boardid)
{	
	 if (document.location.protocol == "https:") {
		var url = 'https://'+urldomain+'/sns_process/fbmefeed';
	 }else{
		var url = 'http://'+urldomain+'/sns_process/fbmefeed';
	 }
	$.getJSON(url + "?no="+boardseq+"&id="+boardid+"&type="+type+"&jsoncallback=?"); 
}


function chkByte(str){
	var cnt = 0;
	for(i=0;i<str.length;i++) {
		cnt += str.charCodeAt(i) > 128 ? 2 : 1;
		if(str.charCodeAt(i)==10) cnt++;
	}
	return cnt;
}

//�ܵ��̺�Ʈ ���� �ð�
function showClockTime(numberType, year, month, day, hour, min, second, dayDiv, hourDiv, minDiv, secondDiv, goods_seq, classType){
	var close_date = new Date(year, month-1, day, hour, min, second);
	var close_timestamp = Math.floor(close_date.getTime()/1000);
	var now_timestamp = Math.floor((new Date()).getTime()/1000);
	var remind_timestamp = close_timestamp - now_timestamp;

	if(remind_timestamp<0) {
		return;
	}
	
	var remind_days = Math.floor(remind_timestamp/86400);
	var remind_hours = Math.floor((remind_timestamp - (86400 * remind_days))/3600);
	var remind_minutes = Math.floor((remind_timestamp - ((86400 * remind_days) + (3600 * remind_hours))) / 60);
	var remind_seconds = remind_timestamp%60;
	var day="";
	var hour="", min="", second="";

	if(numberType == "img"){
		if (remind_days > 0){ 
			day = "";
			for(var i=0;i<remind_days.toString().length;i++){
				day += "<img src='/data/icon/goods/social_no"+remind_days.toString().substring(i,i+1)+".png'>";
			}
			$('.'+dayDiv).html(day);
		}else{
			day = "<img src='/data/icon/goods/social_no0.png'>";
			$('.'+dayDiv).html(day);
		}
		
		// �ð�ó��
		if (remind_hours > -1){
			if (remind_hours < 10){
				hour = "<img src='/data/icon/goods/social_no0.png'><img src='/data/icon/goods/social_no"+Math.floor(remind_hours % 10)+".png'>";
			} else {
				hour = "<img src='/data/icon/goods/social_no"+Math.floor(remind_hours / 10)+".png'>";
				hour += "<img src='/data/icon/goods/social_no"+Math.floor(remind_hours % 10) +".png'>";
			}
			$('.'+hourDiv).html(hour);
		}

		// ��ó��
		if (remind_minutes > -1){
			if (remind_minutes < 10){
				min = "<img src='/data/icon/goods/social_no0.png'><img src='/data/icon/goods/social_no"+Math.floor(remind_minutes % 10)+".png'>";
			} else {
				min = "<img src='/data/icon/goods/social_no"+Math.floor(remind_minutes / 10)+".png'>";
				min += "<img src='/data/icon/goods/social_no"+Math.floor(remind_minutes % 10)+".png'>";
			}
			$('.'+minDiv).html(min);
		}

		// ��ó��
		if (remind_seconds > -1){
			if (remind_seconds < 10){
				second = "<img src='/data/icon/goods/social_no0.png'><img src='/data/icon/goods/social_no"+Math.floor(remind_seconds % 10)+".png'>";
			} else {
				second = "<img src='/data/icon/goods/social_no"+Math.floor(remind_seconds / 10)+".png'>";
				second += "<img src='/data/icon/goods/social_no"+Math.floor(remind_seconds % 10)+".png'>";
			}
			$('.'+secondDiv).html(second);
		}
	}else{
		remind_hours = strRight("0"+remind_hours, 2);
		remind_minutes = strRight("0"+remind_minutes, 2);
		remind_seconds = strRight("0"+remind_seconds, 2);
		if(classType == 'class'){
			$('.'+dayDiv).html(remind_days);
			$('.'+hourDiv).html(remind_hours);
			$('.'+minDiv).html(remind_minutes);
			$('.'+secondDiv).html(remind_seconds);
		}else{
			$('#'+dayDiv).html(remind_days);
			$('#'+hourDiv).html(remind_hours);
			$('#'+minDiv).html(remind_minutes);
			$('#'+secondDiv).html(remind_seconds);
		}
	}

	return remind_timestamp;
	
}


function strRight(Str, Num){
	if(Num <= 0){
		return "";		
	}else if(Num > String(Str).length){
		return Str;
	}else{
		var iLen = String(Str).length;
		return String(Str).substring(iLen, iLen-Num);
	}
}

function strstr (haystack, needle, bool) {
  // From: http://phpjs.org/functions
  // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   bugfixed by: Onno Marsman
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // *     example 1: strstr('Kevin van Zonneveld', 'van');
  // *     returns 1: 'van Zonneveld'
  // *     example 2: strstr('Kevin van Zonneveld', 'van', true);
  // *     returns 2: 'Kevin '
  // *     example 3: strstr('name@example.com', '@');
  // *     returns 3: '@example.com'
  // *     example 4: strstr('name@example.com', '@', true);
  // *     returns 4: 'name'
  var pos = 0;

  haystack += '';
  pos = haystack.indexOf(needle);
  if (pos == -1) {
    return false;
  } else {
    if (bool) {
      return haystack.substr(0, pos);
    } else {
      return haystack.slice(pos);
    }
  }
}

function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    function hex(x) {
        return ("0" + parseInt(x).toString(16)).slice(-2);
    }
    return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}
 
// ��ۻ� �����ȸ ��ũ ����
var delivery_url_list	= '';
function get_delivery_url_list(codecd, delivery_code, target, provider_seq){
	if	(typeof(provider_seq) == 'undefined') provider_seq = 1;
	$.getJSON("/common/get_delivery_url", {'provider_seq':provider_seq}, function(result){
		delivery_url_list	= result;
		open_search_delivery(codecd, delivery_code, target, provider_seq);
	});
}

// ��ۻ� �����ȸ ��ũ ����
var chk_search	= '';
function open_search_delivery(codecd, delivery_code, target, provider_seq){
	if	(typeof(provider_seq) == 'undefined') provider_seq = 1;
	
	if	(!delivery_url_list){
		get_delivery_url_list(codecd, delivery_code, target, provider_seq);
	}else{
		var url	= delivery_url_list[codecd];
		if	(!url) {
			if(chk_search == 'Y'){
				//��ȸ�Ҽ� �����ϴ�.
				alert(getAlert('et071'));
				return;
			}
			chk_search = 'Y';
			get_delivery_url_list(codecd, delivery_code, target, provider_seq);
			url	= delivery_url_list[codecd];
		}else{
			if	(url && delivery_code){
				if	(url.search(/\=$/) != -1)	url	= url + delivery_code.replace(/[^0-9a-zA-Z]/g, '');

				if	(target){
					eval(target+'.location.href="'+url+'";');
				}else{
					window.open(url);
				}
			}else{
				alert(getAlert('et071'));
			}
		}
	}
}
 
// ���� �� ���� �� Submit
var DomSaver	= function(fDivId, fMethod, fAction, fTarget){
	this.fDivId		= fDivId;
	this.fMethod	= fMethod;
	this.fAction	= fAction;
	this.fTarget	= fTarget;
	this.sTarget	= '';
	this.saveStatus	= 'null';
};
DomSaver.prototype.setTarget	= function(obj){
	this.sTarget	= obj;
	this.saveStatus	= 'ready';
};
DomSaver.prototype.sendValue	= function(val){
	if	(this.saveStatus == 'ready'){

		// �ش� ID�� Div ��ü ���� �� �ʱ�ȭ
		var oDiv		= document.getElementById(this.fDivId);
		oDiv.innerHTML	= '';

		// form ����
		var oForm		= document.createElement('form');
		oForm.method	= this.fMethod;
		oForm.action	= this.fAction;
		if	(this.fTarget)	oForm.target	= this.fTarget;

		// input ����
		var oInput		= '';
		for (var k in val){
			oInput			= '';
			oInput			= document.createElement('input');
			oInput.setAttribute('type', 'hidden');
			oInput.setAttribute('name', k);
			oInput.setAttribute('value', val[k]);
			oForm.appendChild(oInput);
		}

		// form �߰� �� submit
		oDiv.appendChild(oForm);
		oForm.submit();

		// this.saveStatus�� �ʱ�ȭ
		this.saveStatus	= '';
	}
};



//�����ޱ�
function coupondownlist(gl_goods_seq,gl_request_uri)
{
	title = getAlert('gv015');
	if(typeof gl_mobile_mode!="undefined" && gl_mobile_mode){//����ϸ��
		
		$('div#couponDownloadDialogId').dialog('close');
		$('div#couponDownloadDialogBgId').dialog('close');
		var sheight = $('body').prop("scrollHeight");
		$.ajax({
			'global' : false,
			'url':'../coupon/goods_coupon_list?no='+gl_goods_seq+'&return_url='+gl_request_uri,
			'type' : 'get',
			'cache' : false,
			'success' : function(couponDownload){
				try{ 
					$("body").append("<div id='couponDownloadDialogBgId' style='position:absolute;top:0px;background:#000;width:100%;height:"+sheight+"px;z-index:10005;visibility:visible;filter:alpha(opacity=30); opacity:0.3; -moz-opacity:0.3;'></div>");
					$("body").append("<div id='couponDownloadDialogId' style='position:absolute;top:0px;background:#fff;width:100%;height:auto;z-index:10006'></div>");
					var iframe = '<div class="sub_division_title">'+title+'<div class="sub_division_arw sub_division_arw_x" onclick="javascript:closeDialogCoupon()"></div></div>';	
					iframe += '<div style="height:auto:" id="couponDownloadMobile" >';
					iframe += couponDownload;
					iframe += '</div>'; 
					$("#couponDownloadDialogId").html(iframe);
					$(window).scrollTop(0);
				}catch(ex){}
				echo.init({
					offset: 100,
					throttle: 250,
					unload: false
				});
			}
		});
	}else{
		$('div#couponDownloadDialog').dialog('close'); 
		$.get('../coupon/goods_coupon_list?no='+gl_goods_seq+'&return_url='+gl_request_uri, function(data) {
			$("div#couponDownloadDialog").html(data);
		});
		openDialog(title, "couponDownloadDialog", {"width":700});
	}
}

//�ڵ庸��
function codesalelist(gl_goods_seq,gl_request_uri)
{
	title = getAlert('gv061');
	if(typeof gl_mobile_mode!="undefined" && gl_mobile_mode){//����ϸ��
		
		$('div#couponDownloadDialogId').dialog('close');
		$('div#couponDownloadDialogBgId').dialog('close');
		var sheight = $('body').prop("scrollHeight");
		$.ajax({
			'global' : false,
			'url':'../promotion/goods_code_list?no='+gl_goods_seq+'&return_url='+gl_request_uri,
			'type' : 'get',
			'cache' : false,
			'success' : function(couponDownload){
				try{ 
					$("body").append("<div id='couponDownloadDialogBgId' style='position:absolute;top:0px;background:#000;width:100%;height:"+sheight+"px;z-index:10005;visibility:visible;filter:alpha(opacity=30); opacity:0.3; -moz-opacity:0.3;'></div>");
					$("body").append("<div id='couponDownloadDialogId' style='position:absolute;top:0px;background:#fff;width:100%;height:auto;z-index:10006'></div>");
					var iframe = '<div class="sub_division_title">'+title+'<div class="sub_division_arw sub_division_arw_x" onclick="javascript:closeDialogCoupon()"></div></div>';	
					iframe += '<div style="height:auto:" id="couponDownloadMobile" >';
					iframe += couponDownload;
					iframe += '</div>'; 
					$("#couponDownloadDialogId").html(iframe);
					$(window).scrollTop(0);
				}catch(ex){}
				echo.init({
					offset: 100,
					throttle: 250,
					unload: false
				});
			}
		});
	}else{
		$('div#codeSaleDialog').dialog('close'); 
		$.get('../promotion/goods_code_list?no='+gl_goods_seq+'&return_url='+gl_request_uri, function(data) {
			console.log(data);
			$("div#couponDownloadDialog").html(data);
		});
		openDialog(title, "couponDownloadDialog", {"width":700});
	}
}

function closeDialogCoupon()
{
	$("div#couponDownloadDialogId").remove();
	$("div#couponDownloadDialogBgId").remove();
}


function popup_change_pass(){
	//��й�ȣ ����
	openDialog(getAlert('mb188'), "popupChangePassword", {"width":500,"height":250, "noClose":true});
}

function close_popup_change(){
	closeDialog('popupChangePassword');
}

function update_rate_checked(){
	//���߿� �ϱ� Ŭ�� ��....��Ȱ��ȭ
	if($("input[name='update_rate']").attr("checked")){
		$("input[name='old_password']").val('');
		$("input[name='new_password']").val('');
		$("input[name='re_new_password']").val('');
		$(".passwordField").attr("disabled",true);
	}else{
		$(".passwordField").attr("disabled",false);
	}

}


function passwordAfterUpdate(){
	$("input[name='password_mode']").val('after');
	$('#passUpdateForm').submit();
}

function sms_replace(str){
	str = str.replace("{userName}","ȫ�浿");
	return str
}

// ���� ������ �μ�
function thisPagePrint(){
	if	(window.matchMedia) {
		var mediaQueryList = window.matchMedia('print');
		mediaQueryList.addListener(function(mql) {
			if (mql.matches) {	$('.unprints').hide();	} else {	$('.unprints').show();	}
		});
	}

	window.onbeforeprint	= function(){	$('.unprints').hide();	}
	window.onafterprint		= function(){	$('.unprints').show();	}
	window.print();
}

function viewCrm(mseq){
	window.open("/admincrm/main/index?member_seq="+mseq);
}

function changeCrm(mseq){
	top.location.href="/admincrm/main/user_detail?member_seq="+mseq;

}

// ����ã�� �޽��� �ڽ�ó��
function chagne_file_msg(obj){
	var bobj = $(obj);
	var mobj = bobj.closest("span.filebox").parent().find(".filebox_msg");
	if( bobj.val() ){
		mobj.html('���õ�');
	}
}

/* ��Ƽ/�۷ι� ��ȭ���� ���� ó�� */
function get_currency_price(price,mode,currency,currency_symbol,currency_symbol_position,pmode){

	if(typeof(pmode) == "undefined"){ pmode = ""; }

	if(!currency) currency = "basic";
	if(currency == "basic"){
		currency					= gl_basic_currency;
		currency_symbol				= gl_basic_currency_symbol;
		currency_symbol_position	= gl_basic_currency_symbol_position;
	}else if(currency == "skin"){
		currency					= gl_skin_currency;
		currency_symbol				= gl_basic_currency_symbol;
		currency_symbol_position	= gl_basic_currency_symbol_position;
	}

	price = get_cutting_price(price,currency,pmode);

	if(currency == "KRW" || currency == "JPY"){
		if(mode != 1){
			price = comma(price);
		}else{
			price = price;
		}
	}else{
		if(price){
			price = ""+price+"";
			var tmp = price.split(".");
			if(tmp[1]){
				price = tmp[0] + rpad("."+tmp[1],3,"0");
			}else{
				price = price + ".00";
			}
			//price = eval(price);
		}else{
			price = 0;
		}
	}

	if(mode == 2){
		if(currency_symbol_position == "before"){
			price = currency_symbol + " " + price;
		}else if(currency_symbol_position == "after"){
			price =  price + " " + currency_symbol;
		}
	}else if(mode == 3){
		if(currency_symbol_position == "before"){
			price = currency_symbol + price;
		}else if(currency_symbol_position == "after"){
			price =  price + currency_symbol;
		}
	}

	return price;
}

// currency			: ��ȭ
// exchange_rate	: currency ���� ȯ��
// ����ȭ ȯ�� ���� �ݾ�
function get_currency_exchange(price,currency,exchange_rate){

	if(!currency){
		currency		= gl_basic_currency;
	}
	if(!exchange_rate){
		exchange_rate	= gl_currency_exchange;
	}
	
	var basic_amout		= gl_amout_list[currency];	//�⺻��ȭ�� ȯ�� ���ؾ�
	var return_price	= 0;
	return_price		= price / basic_amout * exchange_rate;
	//return_price		= get_currency_price(return_price,'',gl_basic_currency);

	return return_price;
}

 
// ��Ƽ/�۷ι� ȯ��
function get_compare_currency(price){

	var compare_price = {'KRW':1000,'CNY':500,'JPY':1200};
	var compare_data = {};
	
	for(var key in compare_price){
		price				= price * compare_price[key];
		compare_data[key]	= get_currency_price(price,1,key);
	}

	return compare_data;
}


// �⺻ ����ó��(�⺻��ȭ ����) @2016-05-25 pjm
function get_cutting_price(price,currency,mode){

	if(!mode) mode = "backoffice";

	if(!currency) currency = 'basic';
	if(currency == "basic"){
		currency = gl_basic_currency;
	}else if(currency == "skin"){
		currency = gl_skin_currency;
	}

	if(price != "" && typeof(price) == "string"){ 
		price = price.replaceAll(",","");
	}

	//backoffice�� : ��ȭ,��ȭ �Ҽ��� ����/ �׿� �Ҽ��� 3°�ڸ� ����.
	if(mode == "backoffice"){
		if(currency == "KRW" || currency == "JPY"){
			price = Math.floor(price);
		}else{
			price = Math.floor(price * 100) / 100;
		}
	//front�� : ���� > �������� ���� ����.
	}else{

		$.ajax({
			url		: '/common/get_front_cutting_price',
			async	: false,
			data	: {'price':price,'currency':currency},
			success	: function(res){
				price = res;
			}
		});
	}

	return price;
}

function get_front_cutting_price(price,currency){
	
	return $.ajax({
		'url' : '/common/get_front_cutting_price',
		'data' : {'price':price,'currency':currency}
	});

}

// ��� ����� �޷� �˾� :: 2016-07-22 lwh
function hop_calendar_pop(grp_seq, set_seq){
	var cal_lay	= $(".hopCalendarLayer");
	var hop_select_date = $("#hop_select_date").val();
	if(cal_lay.css('display') == 'block'){ cal_lay.hide(); return false; }
	$.ajax({
		'url' : '/goods/hop_calendar_pop',
		'data' : {'grp_seq':grp_seq,'set_seq':set_seq,'hop_select_date':hop_select_date},
		'success' : function(html){
			if(html){
				cal_lay.html(html);
				cal_lay.show();
			}else{
				alert('�޷»����� �����Ͽ����ϴ�.');
			}
		}
	});
}

// �������� ����
function chg_hopdate(hop_date){
	$("#hop_select_date").val(hop_date);
	var myDate = new Date(hop_date);
	$(".hop_view_date").html('(' + (myDate.getMonth()+1) + '/' + myDate.getDate() + ')');
}

// javascript �� STR_PAD :: 2016-07-29 lwh
function pad_zero(str,max,type){
	str = str + "";
	if(str.length < max){
		if(type == 'right'){
			str = str+"0";
		}else{
			str = "0" + str;
		}
		pad_zero(str, max);
	}else{
		return str;
	}
	
	return str.length < max ? pad_zero("0" + str, max) : str;
}


function rpad(originalstr, length, strToPad) {

	while (originalstr.length < length) originalstr = originalstr + strToPad;

	return originalstr;
}

/*
	app/javascript/js/L10n_KOR.js
	arg1 = code
	arg2 = string, array
*/
if(!$.isFunction("getAlert")){
function getAlert(code,args){
	if	(!code) return;
	var ret = L10n[code];
	if	(!ret || ret == undefined) return;
	ret = ret.replace(/%n/g, '\n');
	ret = ret.replace(/%b/g, '<br />');

	if	(ret.indexOf('%s') >  -1) {
		str_len				= ret.match(/%s/g).length;
		arr_len				= $.isArray(args) ? args.length : 1;

		if	(str_len > arr_len) {
			if	(!$.isArray(args)) {
				args_temp	= args;
				args		= new Array();
				args.push(args_temp);
				arr_len		= 1;
			}
			for	( i=0; i<str_len-arr_len; i++ ) args.push('');
		}

		if	(args == undefined) args = '';

		ret = $.isArray(args) ? $.vsprintf(ret, args) : sprintf(ret, args);
	}

	return ret;
}
}

function detailDescriptionLayerClose(idx){
	$('.detailDescriptionLayerCloseBtn.'+idx).parent().parent().parent().find('div.detailDescriptionLayer').toggle();
}

/*
	�� validation ���� �Է� üũ
*/
function validationCheck(area){

	var required_full_text	= new Array();
	var result				= true;
	var exception			= ['order_cellphone[]','international_recipient_cellphone[]','recipient_cellphone[]'];
	var selector			= $("input, select, textarea");

	if	(area != 'all')
		selector			= $("input, select, textarea",$('.'+area));

	required_full_text['KR'] = "%s �׸��� �ʼ��Դϴ�.";
	required_full_text['US'] = "The %s field is required.";
	required_full_text['CN'] = "The %s field is required.";
	required_full_text['JP'] = "The %s field is required.";

	selector.each(function(){

		var required = $(this).attr("required");

		if(typeof required != 'undefined'){

			var title = $(this).attr("title");
			var value = $(this).val().trim();
			
			if( $.inArray($(this).attr("name"), exception) > -1 )
				title = $(this).attr("valid");

			if(typeof title == 'undefined'){ title = $(this).attr("name"); }

			if	(required_full_text[gl_language])
				title = required_full_text[gl_language].replace("%s",title);

			if(value == ''){
				var that = $(this);
				$(this).addClass("bg_yellow");
				openDialogAlert(title,400,150,function(){
					var obj_y = $(that).offset().top - $(window).scrollTop();
					var scroll_pos = 150 - obj_y;
					if(scroll_pos > 0){
						$('html, body').animate({scrollTop : scroll_pos});
					}
					$(that).focus();
					//address_modify('delivery');
					//address_modify('order');
				});
				result = false;
				return false;
			}else{
				$(this).removeClass("bg_yellow");
			}
		}

	});

	return result;

}

function check_is_admin(){
	url			= location.href;
	url_arr		= url.split('/');
	ret			= false;
	if	($.inArray('admin',url_arr) > -1)
		ret		= true;
	return ret;
}

function open_bigdata_quide(){
	html ='<div class="mb10 topinfo">';
	html +='<p class="mb10 fm_default_font left">�������� �ۡۡ۰��� �����ִ� ��ǰ�� ������ �Ʒ��� �����ϴ�. �������� ���� ��ǰ�� ���� ��� ��õ��ǰ ������ ������ �ʽ��ϴ�.</p>';
	html +='<table class="info-table-style" width="100%" border="0" cellpadding="0" cellspacing="0">';
	html +='<tr>';
	html +='<th class="its-th-align">������</th>';
	html +='<th class="its-th-align">�˻� ������</th>';
	html +='<th class="its-th-align">ī�װ� ������</th>';
	html +='<th class="its-th-align">�귣�� ������</th>';
	html +='<th class="its-th-align">���� ������</th>';
	html +='<th class="its-th-align">��ǰ�� ������</th>';
	html +='<th class="its-th-align">��ٱ���</th>';
	html +='<th class="its-th-align">���ø���Ʈ</th>';
	html +='<th class="its-th-align">�ֹ��Ϸ� ������</th>';
	html +='</tr>';
	html +='<tr>';
	html +='<th class="its-th-align">�ۡۡ۰���<br />�����ִ� ��ǰ</th>';
	html +='<td class="its-td-align center">�˻����<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">ī�װ� ������<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">�귣�� ������<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">���� ������<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">��ǰ�� ������<br />��ǰ</td>';
	html +='<td class="its-td-align center">��ٱ��Ͽ� ���<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">���ø���Ʈ�� ���<br />�ֻ��� ��ǰ</td>';
	html +='<td class="its-td-align center">�ֹ� �Ϸ��<br />�ֻ��� ��ǰ</td>';
	html +='</tr>';
	html +='</table>';
	html +='</div>';
	openDialogAlerttitle('<span class="fm_default_font">��õ��ǰ ���� �������� �ۡۡ۰��� ���� �ִ� ��ǰ ����</span>',html,'850','250',function(){});
}




// ����� ������Ʈ ����
var isMobile = {
	Android: function () {
			 return navigator.userAgent.match(/Android/i) == null ? false : true;
	},
	BlackBerry: function () {
			 return navigator.userAgent.match(/BlackBerry/i) == null ? false : true;
	},
	IOS: function () {
			 return navigator.userAgent.match(/iPhone|iPad|iPod/i) == null ? false : true;
	},
	Opera: function () {
			 return navigator.userAgent.match(/Opera Mini/i) == null ? false : true;
	},
	Windows: function () {
			 return navigator.userAgent.match(/IEMobile/i) == null ? false : true;
	},
	any: function () {
			 return (isMobile.Android() || isMobile.BlackBerry() || isMobile.IOS() || isMobile.Opera() || isMobile.Windows());
	}
};