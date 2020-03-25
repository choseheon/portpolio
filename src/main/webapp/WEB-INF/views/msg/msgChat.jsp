<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/msg/msgChat.css" />
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	console.log("${param}");
	if($("#chatNo").val() == "${param.chatNo}") {
		console.log("정상");
	} else {
		$("#chatNo").val($("#seqNo").val());
	}
	
 	StartChat = setInterval(function() {
		reloadChat();
		scrollDown();
	}, 3000);
	/* clearInterval(StartChat); */
	
	//보내기 이후 스크롤 자동 하단으로 이동시키기, 엔터키 이벤트
	$("#sendBtn").on("click", function() {
		insertChat();
	});
	
	$("#write").on("keypress", function() {
		if(event.keyCode == 13){
			insertChat();
			return false;
		}
	});
	
	
	
	$("#chat_name_btn").on("click", function() {
		var html = "";
		html += "<form action=\"#\" method=\"post\" name=\"editForm\" id=\"editForm\" style=\"width:100%; height:100%;\">";
		html += "<input type=\"hidden\" id=\"chatroomNo\" name=\"chatroomNo\" value=" + $("#chatNo").val() +" />"
		html += "<div class=\"chat_name_edit_area\">";
		html += 	"<div class=\"edit_title\">채팅방 이름 변경</div>";
		html += 	"<input type=\"text\" name=\"chat_name\" class=\"chat_name\" id=\"chat_name\" maxlength=\"20\" placeholder=\"한글 20자, 영어 20자까지 가능합니다.\"/>";
		html += "</div>";
		html += "</form>";
		
		$("#contents").html(html);
		
		makeTwoBtnPopup(1, "방 설정", html, true, 400, 200, null, "변경", function() {
			
			if($.trim($("#chat_name").val()) == ""){
				makeAlert(2, "이름변경 실패", "채팅방 이름을 올바르게 입력 해 주세요.", closePopup(1));
			} else {
				
				var params = $("#editForm").serialize();
				console.log(params);
				$.ajax({
					type : "post", //데이터 전송방식
					url :"chatTitleEditAjax", //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// { 키:값, 키:값, .....} --> json
					success : function(result) {
						reloadChat();
					},
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}
				});
				
				makeAlert(2, "이름변경", "이름이 변경 되었습니다.", closePopup(1));
				
			}
		},"닫기", function() {
			closePopup(1);
		});
	});
	
	$("#chat_name").keyup(function(){
		if ($(this).val().length > $(this).attr('maxlength')) {
			alert('제한길이 초과');
			$(this).val($(this).val().substr(0, $(this).attr('maxlength'))); 
			}
		});

	
	
	$("#list_btn").on("click", function() {
		location.href ="msgList";
	});
	
	$("#list_btn").on("click", function() {
		location.href = "msgList";
	});
	
	$("#exit_btn").on("click", function() {
		var params = $("#actionForm").serialize();
		 
		$.ajax({
			type : "post", //데이터 전송방식
			url :"chatroomExitAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				location.href = "msgList";
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	});
	
	$("#invite_emp_btn").on("click", function() {
		var html = "";
		reloadChatingList();
		/* var html =""; */
		reloadChatroomInviteList();
		makeTwoBtnPopup(1, "초대하기", html, true, 1000, 800, null, "초대", function() {
			
			if($(".invite_area .empbox:checked").length > 0) {
				
				var params = $("#inviteForm").serialize();
				 
				console.log(params);
			
				$.ajax({
					type : "post", //데이터 전송방식
					url :"chatroomInviteAjax", //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// { 키:값, 키:값, .....} --> json
					success : function(result) {
						reloadChat();
					},
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}
				});
			} else {
			makeAlert(2, "알림", "초대 할 사원을 확인 해 주십시오.", null);
			}
			makeAlert(2, "초대완료", "초대 되었습니다.", closePopup(1));
		},"닫기", function() {
			closePopup(1);
		});
	});
	
	function reloadChat() {
		
		var params = $("#actionForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getChatAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				redrawChat(result.chat);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawChat(chat) {
		var html = "";
		var title = "";
		
		if(chat.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">채팅방에 온 것을 환영합니다.</td>";
			html += "</tr>";
		} else {
			for(var i in chat) {
				
				//내가 작성하지 않은 채팅
				if(chat[i].EMP_NO != $("#sEmpNo").val()+"") {
				html += "<div class=\"chat_wrap\">"
				html += 	"<div class=\"chat_area\">";
				html += 		"<div class=\"info_wrap\">";
				html += 			"<div class=\"info_posi\">" + chat[i].EMP_POSI_NAME + "</div><div class=\"info_name\"><div class=\"empty\"></div>" + chat[i].EMP_NAME + "</div><div class=\"info_depart\"><div class=\"empty\"></div>" + chat[i].DEPART_NAME + "</div><div class=\"info_team\"><div class=\"empty\"></div>" + chat[i].TEAM_NAME + "</div>";
				html += 		"</div>";
				html += 		"<div class=\"con_wrap\">";
				html += 			"<div class=\"con\">" + chat[i].CONTENTS + "</div><div class=\"sdate\">" + chat[i].SDATE + "</div>"
				html += 		"</div>";
				html += 	"</div>";
				html += "</div>"
				
				} else {
				//내가 작성한 채팅
					html += "<div class=\"chat_wrap\">"
					html += 	"<div class=\"m_my_chat_area\">";
					html += 		"<div class=\"m_info_wrap\">";
					html += 			"<div class=\"m_info_posi\">" + chat[i].EMP_POSI_NAME + "</div><div class=\"m_info_name\"><div class=\"empty\"></div>" + chat[i].EMP_NAME + "</div><div class=\"m_info_depart\"><div class=\"empty\"></div>" + chat[i].DEPART_NAME + "</div><div class=\"m_info_team\"><div class=\"empty\"></div>" + chat[i].TEAM_NAME + "</div>";
					html += 		"</div>";
					html += 		"<div class=\"m_con_wrap\">";
					html += 			"<div class=\"m_sdate\">" + chat[i].SDATE + "</div><div class=\"m_con\">" + chat[i].CONTENTS + "</div>"
					html += 		"</div>";
					html += 	"</div>";
					html += "</div>"
						
					title = chat[i].CHAT_ROOM_NAME;
				}
			}
		}
		 $("#chat_board").html(html);
		 $("#chat_title").html(title);
	}
	
	function insertChat() {
		if($.trim($("#write").val()) == "") {
			makeAlert(1, "알림", "채팅을 입력 해 주세요.", null);
			$("#write").focus();
		} else {
			
			var params = $("#actionForm").serialize();
			console.log(params);
			
			$.ajax({
				type : "post", //데이터 전송방식
				url :"insertChatAjax", //주소
				dataType : "json", //데이터 전송 규격
				data : params, //보낼 데이터
				// { 키:값, 키:값, .....} --> json
				success : function(result) {
					console.log(result.add);
					addChat();
					$("#write").val("");
					scrollDown();
				},
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
			
		}
	}
	
	function addChat() {
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getAddChatAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				redrawAddChat(result.add);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawAddChat(add) {
		var html = "";
		console.log(add);
		if(add.length != 0) {
		
		//내가 작성한 채팅
		for(var i in add){
			
		html += "<div class=\"chat_wrap\">"
		html += 	"<div class=\"m_my_chat_area\">";
		html += 		"<div class=\"m_info_wrap\">";
		html += 			"<div class=\"m_info_posi\"><div class=\"empty\"></div>" + add[i].EMP_POSI_NAME + "</div><div class=\"m_info_name\"><div class=\"empty\"></div>" + add[i].EMP_NAME + "</div><div class=\"m_info_depart\"><div class=\"empty\"></div>" + add[i].DEPART_NAME + "</div><div class=\"m_info_team\"><div class=\"empty\"></div>" + add[i].TEAM_NAME + "</div>";
		html += 		"</div>";
		html += 		"<div class=\"m_con_wrap\">";
		html += 			"<div class=\"m_sdate\">" + add[i].SDATE + "</div><div class=\"m_con\">" + add[i].CONTENTS + "</div>"
		html += 		"</div>";
		html += 	"</div>";
		html += "</div>"
		}
		
		$("#chat_board").append(html);
		}
	}
	
	function scrollDown() {
		$(".chat_board").animate({
			scrollTop: $(".chat_board").prop("scrollHeight") 
		}, 'slow', function () {});
	}
	
	function reloadChatingList() {
		var params = $("#actionForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getChatInviteListAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				redrawChatingList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawChatingList(list) {
		var html = "";
		
		if(list.length == 0)  {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			} else {
				
					html += 	"<div class=\"chat_room_area\">";
					html += 	"<div class=\"chat_room_title\"><div class=\"title_background\">참여자명단</div></div>";
					html += 	"<div class=\"chat_room_head\">";
					html += 		"<div class=\"chat_room_info\"></div>";
					html += 		"<div class=\"chat_room\">직급</div>";
					html += 		"<div class=\"chat_room\">이름</div>";
					html += 		"<div class=\"chat_room\">부서</div>";
					html += 		"<div class=\"chat_room2\">팀</div>";
					html += 	"</div>";
				for(var i in list) {
					html += 	"<div class=\"chat_room_wrap\">"
					html += 		"<div class=\"chat_room_info\" name=" + list[i].EMP_NO + ">";
					html += 			"<div class=\"chat_room\">" + list[i].EMP_POSI_NAME + "</div>";
					html += 			"<div class=\"chat_room\">" + list[i].EMP_NAME + "</div>";
					html += 			"<div class=\"chat_room\">" + list[i].DEPART_NAME + "</div>";
					html += 			"<div class=\"chat_room2\">" + list[i].TEAM_NAME + "</div>";
					html += 		"</div>";
					html += 	"</div>";
				
			}
				html +="<div>";
		}
		 $(".pop_contents").html(html);
	}
	
	function reloadChatroomInviteList() {
		
		var params = $("#actionForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getChatroomInviteListAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
				console.log("asd");
				redrawChatroomInviteList(result.invite);
				console.log(params);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		
	}
	
	function redrawChatroomInviteList(invite) {
		var html = "";
		console.log($("#chatNo").val())
		if(invite.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		
		} else {
			html += "<div class=\"invite_area\">";
			html += "<form action=\"#\" method=\"post\" name=\"inviteForm\" id=\"inviteForm\" style=\"width:100%; height:100%;\">";
			html += "<input type=\"hidden\" id=\"chatroomNo\" name=\"chatroomNo\" value=\""+$("#chatNo").val()+"\">";
			html += "<div class=\"invite_info_title\"><div class=\"title_background\">초대가능명단</div></div>";
			html += "<div class=\"invite_info_head\">";
			html += 			"<div class=\"invite_info\">   </div>";
			html += 			"<div class=\"invite_info\">직급</div>";
			html += 			"<div class=\"invite_info\">이름</div>";
			html += 			"<div class=\"invite_info\">부서</div>";
			html += 			"<div class=\"invite_info2\">팀</div>";
			html += 		"</div>";
			for(var i in invite) {
				html += 	"<div class=\"invite_info_wrap\">"
				html += 		"<div class=\"invite_info_area\" name=" + invite[i].EMP_NO + ">";
				html += 			"<div class=\"invite_info\"><input type=\"checkbox\" name=\"empbox\" id=\"empbox\" class=\"empbox\" value=\""+ invite[i].EMP_NO +"\" /></div>";
				html += 			"<div class=\"invite_info\">" + invite[i].EMP_POSI_NAME + "</div>";
				html += 			"<div class=\"invite_info\" style=\"overflow:hidden;\">" + invite[i].EMP_NAME + "</div>";
				html += 			"<div class=\"invite_info\">" + invite[i].DEPART_NAME + "</div>";
				html += 			"<div class=\"invite_info2\">" + invite[i].TEAM_NAME + "</div>";
				html += 		"</div>";
				html += 	"</div>";
			}
			html += "</form>";
			html += "</div>";
		}
		$(".pop_contents").append(html);
	}
		
	function redrawChatInviteList(list) {
		var html = "";
		
		if(list.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i in list) {
				html += "<form action=\"#\" method=\"post\" name=\"userForm\" id=\"userForm\">"; 
				html += 	"<div style=\"width:100%;\">"
				html += 		"<table>";
				html += 			"<tr style=\"text-align:center; height:30px;\" name=\""+list[i].EMP_NO+"\">";
				html += 				"<td name=\"num\" style=\"text-align:center;\">" + list[i].EMP_POSI + "</td>";
				html += 				"<td style=\"text-align:center;\">" + list[i].EMP_NAME + "</td>";
				html += 				"<td style=\"text-align:center;\">" + list[i].DEPART_NAME + "</td>";
				html += 				"<td style=\"text-align:center;\">" + list[i].TEAM_NAME + "</td>";
				html += 			"</tr>";
				html += 		"</table>";
				html += 	"</div>";
				html += "</form>";
			}
		}
		 $("#asdf").html(html);
	}
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">16</c:param>
	</c:import>
	<div class="title_area">채팅방</div>
	<div class="content_area">
		<div class="contents_wrap">
			<form action="#" method="post" name="actionForm" id="actionForm">
			<div class="msg">
				<div class="top_bar">
					<div class="chat_title" id="chat_title"></div>
					<div class="chat_top_btn_area">
						<div class="chat_name_btn" id="chat_name_btn" name="chat_name_btn">방 설정</div>
						<div class="list_btn" id="list_btn" name="list_btn">목록</div>
						<div class="invite_emp_btn" id="invite_emp_btn" name="invite_emp_btn">초대</div>
						<div class="exit_btn" id="exit_btn" name="exit_btn">퇴장</div>
					</div>
				</div>
				<div class="board">
					<div class="chat_board" id="chat_board" name="chat_board">
					</div>
					<div class="bottom_bar">
						<input type="text" class="write" id="write" name="write" />
						<div class="send" id="sendBtn" size="50" name="sendBtn">보내기</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="chatNo" name="chatNo" value="${param.chatNo}"/>
			<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}"/>
			<input type="hidden" id="seqNo" name="seqNo" value="${param.seqNo}"/>
			</form>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>