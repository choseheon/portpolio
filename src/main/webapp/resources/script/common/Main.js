/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	/* 메뉴 펼침 이벤트 */
	$(".menu_wrap").on("click", ".first_menu_wrap, .first_menu_wrap_on", function() {
		if($(this).attr("class") != "first_menu_wrap_on") {
			$(".first_menu_wrap_on").attr("class", "first_menu_wrap");
			$(this).attr("class", "first_menu_wrap_on");
		} else {
			$(".first_menu_wrap_on").attr("class", "first_menu_wrap");
		}
	});
});