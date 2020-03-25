<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MangoCRM - 로그인</title>
<!-- Favicon -->
<link rel="shortcut icon" href="resources/favicon/favicon.png">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/Main.css" />
<!-- 버튼 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/btn.css" />
<!-- input 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/input.css" />
<!-- 팝업 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/pop.css" />
<!-- 로그인 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/login.css" />
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Gothic+A1:300&display=swap"	rel="stylesheet" />

<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 버튼 js 파일 -->
<script type="text/javascript" src="resources/script/common/btn.js"></script>
<!-- 팝업 js 파일 -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!-- Util js 파일 -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".login_footer").on("click", function() {
		if(checkEmpty(".login_id")) {
			makeAlert(1, "로그인 안내", "아이디를 입력해 주세요.", function() {
				$(".login_id").focus();
			});
		} else if(checkEmpty(".login_pw")) {
			makeAlert(1, "로그인 안내", "비밀번호를 입력해 주세요.", function() {
				$(".login_pw").focus();
			});
		} else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "contentsTest";
					} else if(result.res == "FAILED") {
						makeAlert(1, "로그인 실패", "아이디나 비밀번호가 틀렸습니다.", null);
					} else {
						makeAlert(1, "로그인 경고", "로그인 체크 중 문제가 발생하였습니다.", null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$(".big_login_area").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$(".login_footer").click();
			return false;
		}
	});
});
</script>
</head>
<body>
	<div class="big_login_area">
		<div class="login_blank"></div>
		<div class="login_title">
			<img src="resources/images/common/logo.png"> <span>Mango</span> CRM
		</div>
		<form action="#" id="loginForm" method="post">
			<input type="text" class="login_id" name="id" placeholder="ID" /> <br />
			<input type="password" class="login_pw" name="pw" placeholder="PW" /> <br />
		</form>
		<div class="login_footer">
			<div>로그인</div>
		</div>
	</div>
</body>
</html>