<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents Test</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert(1, "하이", "내용임", null);
	});
	
	$("#oneBtn").on("click", function() {
		makeOneBtnPopup(1, "버튼하나팝업", "내용들감", true, 400, 200, null, "하이", function() {
			closePopup(1);
		});
	});
	
	$("#twoBtn").on("click", function() {
		makeTwoBtnPopup(1, "버튼둘팝업", "내용들감", true, 600, 400, null, "어라라", function() {
			makeAlert(2, "하이", "내용임", null);
		},"하이", function() {
			closePopup(1);
		});
	});
	
	$("#threeBtn").on("click", function() {
		makeThreeBtnPopup(1, "버튼셋팝업", "내용들감", false, 400, 600, null, "어라라", function() {
			closePopup(1);
		},"하이", function() {
			closePopup(1);
		},"마지막", function() {
			closePopup(1);
		});
	});
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">5</c:param>
	</c:import>
	<div class="title_area">Main Title</div>
	<div class="content_area">
		<div class="contents_wrap">
			<input type="button" value="알림창" id="alertBtn" />
			<input type="button" value="1버튼" id="oneBtn" />
			<input type="button" value="2버튼" id="twoBtn" />
			<input type="button" value="3버튼" id="threeBtn" />
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>