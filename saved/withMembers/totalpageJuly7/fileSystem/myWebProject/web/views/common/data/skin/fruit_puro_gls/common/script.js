/* 전체 카테고리 버튼 스크립트 */
//function setCategoryAllBtnEvent(categoryNavigationKey,url,target){
//	target = (target != undefined && target != "") ? target : categoryNavigationKey;
//	$("#"+categoryNavigationKey+" .categoryAllBtn").live('click',function(){
//		if($("#"+target+" .categoryAllContainer").html()==""){
//			$(".categoryAll").hide();
//			$("#"+target+" .categoryAllContainer").load(url,function(){
//				$("#"+target+" .categoryAll").stop(true,true).slideDown('fastest');
//				
//			});
//		}else{
//			if($("#"+target+" .categoryAll").stop(true,true).is(":visible")){
//				$("#"+target+" .categoryAll").slideUp('fastest');
//				
//				
//			}else{
//				$(".categoryAll").hide();
//				$("#"+target+" .categoryAll").slideDown('fastest');
//			}
//		}
//		return false;
//	});
//	$("#"+target+" .categoryAllClose").live('click',function(){
//		$("#"+target+" .categoryAll").stop(true,true).slideUp('fastest');
//	});
//}

/* 전체 브랜드 버튼 스크립트 */
function setBrandAllBtnEvent(categoryNavigationKey,url,target){
	target = (target != undefined && target != "") ? target : categoryNavigationKey;
	$("#"+categoryNavigationKey+" .categoryAllBtn").live('click',function(){
		if($("#"+target+" .categoryAllContainer").html()==""){
			$(".categoryAll").hide();
			$("#"+target+" .categoryAllContainer").load(url,function(){
				$("#"+target+" .categoryAll").stop(true,true).slideDown('fastest');

				$("#"+target+" .categoryAllBrandListGroup").each(function(){
					if($(".categoryAllBrandListGroupItem",this).length){
						$(this).show();
					}else{
						$(this).hide();
					}
				});
			});
		}else{
			if($("#"+target+" .categoryAll").stop(true,true).is(":visible")){
				$("#"+target+" .categoryAll").slideUp('fastest');
			}else{
				$(".categoryAll").hide();
				$("#"+target+" .categoryAll").slideDown('fastest');
			}
		}
		return false;
	});
	$("#"+target+" .categoryAllClose").live('click',function(){
		$("#"+target+" .categoryAll").stop(true,true).slideUp('fastest');
	});
	$("#"+target+" .brandPrefixBtn").live('click',function(){
		$("#"+target+" .brandPrefixBtn.current").removeClass("current");
		$(this).addClass("current");
		var prefix = $(this).attr("prefix");
		if(prefix=="all"){
			$("#"+target+" .categoryAllBrandListGroup").each(function(){
				if($(".categoryAllBrandListGroupItem",this).length){
					$(this).show();
				}else{
					$(this).hide();
				}
			});
			//$("#"+target+" .categoryAllBrandListGroup").show();
		}else{
			$("#"+target+" .categoryAllBrandListGroup").hide().filter("*[prefix='"+prefix+"']").show();
		}
	});
}

/* 전체 지역 버튼 스크립트 */
function setLocationAllBtnEvent(locationNavigationKey,url,target){
	target = (target != undefined && target != "") ? target : locationNavigationKey;
	$("#"+locationNavigationKey+" .categoryAllBtn").live('click',function(){
		if($("#"+target+" .categoryAllContainer").html()==""){
			$(".categoryAll").hide();
			$("#"+target+" .categoryAllContainer").load(url,function(){
				$("#"+target+" .categoryAll").stop(true,true).slideDown('fastest');
			});
		}else{
			if($("#"+target+" .categoryAll").stop(true,true).is(":visible")){
				$("#"+target+" .categoryAll").slideUp('fastest');
			}else{
				$(".categoryAll").hide();
				$("#"+target+" .categoryAll").slideDown('fastest');
			}
		}
		return false;
	});
	$("#"+target+" .categoryAllClose").live('click',function(){
		$("#"+target+" .categoryAll").stop(true,true).slideUp('fastest');
	});
}

/* 상품디스플레이 탭 스크립트 */
$(function(){	
	$(".displayTabContainer").each(function(){
		var tabContainerObj = $(this);
		tabContainerObj.children('li').bind('mouseover',function(){
			tabContainerObj.children('li.current').removeClass('current');
			$(this).addClass('current');
			var tabIdx = tabContainerObj.children('li').index(this);
			tabContainerObj.closest('.designDisplay, .designCategoryRecommendDisplay').find('.displayTabContentsContainer').hide().eq(tabIdx).show();
		}).eq(0).trigger('mouseover');		
	});	
});

$(function() {
	/* Chrome에서 Skip네비게이션 */
    $("a[href^='#']").on("click", function(e){
        var anchorid = $(e.currentTarget);
        var select_id = $(anchorid.attr("href"));
        select_id.attr("tabindex","-1").css("outline","0").focus();
        select_id.on("focusout",function(){
            $(this).removeAttr("tabindex");
        });
    });
	
	/* 다국어 선택 */
	$(".language").mouseover(function() {
		$(".optionSub").css("display", "block");
	});
	$(".language").mouseleave(function() {
		$(".optionSub").css("display", "none");		
	});
	
	/* 상단 서브메뉴 */
	$(".cs_link > a").bind("focusin mouseenter", function(){
		$(this).next().slideDown();
	});
	$(".cs_link").bind("focusout mouseleave", function(){
		$(".cs_sub").slideUp();
	});

	/* 타이틀바 띄우기 */
	/*$("#layout_header .nav_wrap").each(function(){
		var obj = $(this);
		var top_loc = obj.offset().top+1;
		$(document).scroll(function(){
			if(top_loc<=$(document).scrollTop()){
				obj.addClass("flying");
				$("#leftScrollLayer, #rightScrollLayer, #layout_side, #layout_config_body").addClass("flying");
				if	($('.quick_opt_view').length > 0) {
					display_goods_show_opt_fix();
				}
			}else{
				obj.removeClass('flying');
				$("#leftScrollLayer, #rightScrollLayer, #layout_side, #layout_config_body").removeClass("flying");
				if	($('.quick_opt_view').length > 0) {
					display_goods_show_opt_fix();
				}
			}
		});
	});*/
	$("#layout_topBar").each(function(){
		var obj = $(this);
		var top_loc = obj.offset().top-5;
		$(document).scroll(function(){
			if(top_loc<=$(document).scrollTop()){
				obj.addClass("flying");
				$("#leftScrollLayer, #rightScrollLayer, #layout_side, #layout_config_body").addClass("flying");
			}else{
				obj.removeClass('flying');
				$("#leftScrollLayer, #rightScrollLayer, #layout_side, #layout_config_body").removeClass("flying");
			}
		});
	});	

	/* 토글 레이어 */
	$(".detailDescriptionLayerBtn").click(function(){
		$('div.detailDescriptionLayer').not($(this).siblings('div.detailDescriptionLayer')).hide();
		$(this).siblings('div.detailDescriptionLayer').toggle();
	});	
});