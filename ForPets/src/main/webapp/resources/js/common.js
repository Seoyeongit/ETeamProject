/**
 * ajax 로딩시 생성되는 로딩페이지 입니다.
 */

$.ajaxSetup({
	beforeSend: function(){
	    var width = 0;
	    var height = 0;
	    var left = 0;
	    var top = 0;

	    width = 50;
	    height = 50;
	    top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
	    left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

	    if($("#div_ajax_load_image").length != 0) {
	           $("#div_ajax_load_image").css({
	                  "top": top+"px",
	                  "left": left+"px"
	           });
	           $("#div_ajax_load_image").show();
	    }
	    else {
	           $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="file://D:\\temp\\ajax_loader.gif" style="width:50px; height:50px;"></div>');
	    }
	},
	complete: function () {
       $("#div_ajax_load_image").hide();
        }
});

