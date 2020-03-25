$(document).ready(function() {
    // 버튼 크기 자동 조절
    $('.btn').each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (10 * leng_diff) + "px");  
        }
    });

    // 비밀번호 확인 일치/불일치 코드
    $("#pass1, #pass2").on("propertychange change keyup paste input", function() {     
        if($('#pass1').val() == $('#pass2').val()) {
            $('#pass2').removeClass("pass_discord");
            $('#pass2').addClass("pass_accord");
        }
        else {
            $('#pass2').removeClass("pass_accord");
            $('#pass2').addClass("pass_discord");
        }
        if($('#pass1').val() == "") {
            $('#pass2').removeClass("pass_accord");
            $('#pass2').removeClass("pass_discord");
            $('#pass2').val("");
        }
    });
});