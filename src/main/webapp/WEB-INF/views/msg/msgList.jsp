<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/msg/msgList.css" />
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	reloadChatList();
	
	$("#invite_btn").on("click", function() {
		location.href = "msgInvite";
	});
	
	$("#right_area").on("click", function() {
		$("#cNo").val($(this).attr("name"));
		$("#actionForm").submit();
	});
	
	$("#right").on("click", "div", function() {
		$("#actionForm").attr("action", "msgChat");
		$("#chatNo").val($(this).attr("name"));
		$("#actionForm").submit();
	});
	
	function reloadBookmarkList() {
		
		var params = $("#actionForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getChatBookmarkListAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				redrawInviteList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function reloadChatList() {
		
		var params = $("#actionForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getChatListAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				redrawChatList(result.chat);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawChatList(chat) {
		
			var html = "";
			
			if(chat.length == 0) {
				html += "<tr>";
				html += "<td colspan=\"5\">참가한 채팅방이 없습니다.</td>";
				html += "</tr>";
			} else {
				for(var i in chat) {
					html += "<div class=\"right_area\" name=" + chat[i].CHAT_ROOM_NO +">";
					html += "<div class=\"nick_name\">" + chat[i].CHAT_ROOM_NAME + "</div>";
					html += "<div class=\"right_chat_info\">"
					html += "<div class=\"chat\">" + chat[i].CONTENTS + "</div>";
					html += "<div class=\"last_chat\">마지막 채팅 " + chat[i].SDATE + "</div>";
					html += "</div>"
					html += "</div>";
				}
			}
			 $("#right").html(html);
	}
	
});

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">16</c:param>
	</c:import>
	<div class="title_area">목록</div>
	<div class="content_area">
		<div class="contents_wrap">
			<form action="#" id="actionForm" method="post">
			<!-- 채팅방 번호 달 곳 -->
			<input type="hidden" id="chatNo" name="chatNo" />
			<!-- 세션에 로그인 한 사원번호 달 곳 -->
			<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}" />
			</form>
			<div class="msg">
				<div class="top_bar">
					<div class="srch">
						<!-- <input type="text" class="write" /> <input type="button" class="srch_btn" value="검색" /> -->
					</div>
					<div class="invite_btn" id="invite_btn" name="invite_btn" >초대하기</div>
				</div>
				<div class="board_wrap">
					<div class="title_wrap">
						<div class="left_title_wrap">
							<div class="left_title">채팅방 이름</div>
						</div>
						<div class="right_title_wrap">
							<div class="right_title">채팅방 목록</div>
						</div>
					</div>
					<div class="right" id="right" name="right">
						<!-- <div class="right_area">
							<div class="nick_name">이름</div>
							<div class="chat">채팅 내용 내용 내용 내용</div>
							<div></div>
						</div> -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>