<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/msg/msgInvite.css" />
<script type="text/javascript">
$(document).ready(function() {
	getDepartList();
	reloadInviteList();
	
	//부서 변경시 부서 번호 출력
	$("#select_depart").change(function() {
		console.log($(this).val());
	});
	
	//팀 변경시 팀 번호 출력
	$("#select_team").change(function() {
		console.log($(this).val());
	});
	
	$("#srch_btn").on("click", function() {
		reloadInviteList();
	});
	
	$("#back_btn").on("click", function() {
		location.href = "msgList";
	});

	
	
	$("#invite_btn").on("click", function() {
		
		if($(".chat_board .chbox:checked").length > 0) {
			var params = $("#actionForm").serialize();
			console.log(params);
			
			$.ajax({
				type: "post",
				url: "insertChatRoomAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					makeChatEnter(result.seqNo);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		} else {
			makeAlert(1, "알림", "초대 사용자를 선택하여 주십시오.", null);
		}
	});

	function makeChatEnter(seqNo) {
		$("#actionForm").attr("action", "msgChat");
		$("#seqNo").val(seqNo);
		$("#chatNo").val($("#seqNo").val());
		$("#actionForm").submit();
	}
	
	function reloadInviteList() {
		var params = $("#actionForm").serialize();
		console.log(params);
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getMsgInviteListAjax", //주소
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

	function redrawInviteList(list) {
		var html = "";
		
		if(list.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i in list) {
				/*
				[ EMP TABLE ]
				EMP_NO 사원번호
				EMP_POSI_NO 직급번호
				TEAM_NO 팀번호
				EMP_NAME 사원명
				EMP_ID 사원아이디
				EMP_PHONE 사원 전화번호
				EMP_RESIGN_DATE 퇴사일자
				EMP_IMAGE 사원 이미지
				EMP_MEMO_CON 메모내용
				 */
				
				// JOIN TABLE LIST
				/*
				[ TEAM TABLE ]
				TEAM_NO 팀번호
				DEPART_NO 부서번호
				TEAM_NAME 팀명
				
				[ EMP_POSI TABLE ]
				EMP_POSI_NO = 직급번호
				EMP_POSI_NAME 직급명
				*/
				/* html += EMP_POSI_NO + TEAM_NO + EMP_NAME; */
				html += "<div class=\"chat_one\" id=\"chat_one\" name=" + list[i].EMP_NO + ">";
				html += "<div class=\"chat_one_left\" id=\"chat_one_left\" name=" + list[i].EMP_NO + ">";
				html += "<input type=\"checkbox\" name=\"chbox\" id=\"chbox\" class=\"chbox\" value=" + list[i].EMP_NO + " />";
				html += "</div>";
				html += "<div class=\"chat_one_right\">";
				html += "<div class=\"t_chat_one_right\">" + list[i].EMP_NAME + " ( " + list[i].DEPART_NAME + " / " + list[i].TEAM_NAME + " / " + list[i].EMP_PHONE + " ) " + "</div>";
				html += "</div>";
				html += "</div>";
			}
		}
		 $("#chat_board").html(html);
	}

function getDepartList() {
	/* var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", //데이터 전송방식
		url :"getMsgDepartCntAjax", //주소
		dataType : "json", //데이터 전송 규격
		data : params, //보낼 데이터
		// { 키:값, 키:값, .....} --> json
		success : function(result) {
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	}); */
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", //데이터 전송방식
		url :"getMsgDepartListAjax", //주소
		dataType : "json", //데이터 전송 규격
		data : params, //보낼 데이터
		// { 키:값, 키:값, .....} --> json
		success : function(result) {
			redrawDepartList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
	
	/* $("#select_depart")
	  .attr("selected", "selected")
	  .text("추가")
	  .attr("value", "추가")
	  .appendTo("select[name='test']"); */
	}

	function redrawDepartList(list) {
		var html = "";
		
		if(list.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
				$("#select_depart").find("option").remove();
				/* html += "$(\"#select_depart\").append(\"<option value=\"0\">부서 선택</option>\")"; */
				html += "<option value=\"0\">부서 선택</option>";
			for(var i in list) {
				html += "<option value=" + list[i].DEPART_NO + ">" + list[i].DEPART_NAME + "</option>";
				console.log(list[i]);
			}
		 $("#select_depart").html(html);
		}
	}


	/* function getTeamList() {
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getMsgTeamCntAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post", //데이터 전송방식
			url :"getMsgTeamListAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// { 키:값, 키:값, .....} --> json
			success : function(result) {
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		
	} */

	//부서 select 변경 감지 이벤트
	$("#select_depart").on("change", function() {
		if($("#select_depart option:selected").val() != 0) {
			$("#select_team").removeClass("input_readonly");
			$("#select_team").removeAttr("disabled");
			
			var params = "&depart_no=" + $("#select_depart option:selected").val();
	
			$.ajax({
				type: "post",
				url: "getMsgTeamListAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					redrawTeam(result.team);
					$("#select_depart option:selected");
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
		else {
			$("#select_team").addClass("input_readonly");
			$("#select_team option:selected").removeAttr("selected");
			$('#select_team option[value="0"]').attr("selected", "selected");
			$("#select_team").attr("disabled", "disabled");
		}
	});

	// 팀 List Set
	function redrawTeam(team) {
		var html = "<option selected=\"selected\" value=\"0\">없음</option>";
		
		for(var i in team) {
			html += "<option value=\"" + team[i].TEAM_NO + "\">" + team[i].TEAM_NAME + "</option>";
		}
		$("#select_team").html(html);
	}
	
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">17</c:param>
	</c:import>
	<div class="title_area">초대하기</div>
	<div class="content_area">
		<div class="contents_wrap">
			<div class="msg">
				<form action="#" method="post" name="actionForm" id="actionForm" class="actionForm">
				<input type="hidden" id="seqNo" name="seqNo" value="${seqNo}" />
				<input type="hidden" id="chatNo" name="chatNo" value="" />
				<div class="top_bar">
					<div class="top_bar_left">
						<div class="select_depart_area">
							<select name="select_depart" id="select_depart" name="select_depart" class="write2">
								<option>부서 선택</option>
								<c:forEach var="depart" items="${depart}">
                            	<option value="${depart.DEPART_NO}">${depart.DEPART_NAME}</option>
                            </c:forEach>
							</select>
						</div>
						<div class="select_class_area">
							<select id="select_team" name="select_team" class="write2" disabled="disabled">
								<option>팀 선택</option>
								<!-- EMP_POSI TABLE 
								1 = 사원
								2 = 대리 
								3 = 팀장
								4 = 부장
								5 = 실장
								6 = 이사
								7 = 대표이사
								8 = Admin !!!
								-->
								<option value="0">사원</option>
								<option value="1">대리</option>
								<option value="2">팀장</option>
								<option value="3">부장</option>
								<option value="4">실장</option>
								<option value="5">이사</option>
								<option value="6">대표이사</option>
							</select>
						</div>
						<div class="srch">
							<input type="text" class="srch_input" name="srch_input" id="srch_input" size="15" placeholder="검색" />
							<input type="button" class="srch_btn" id="srch_btn" name="srch_btn" value="검색" />
						</div>
					</div>
					<!-- 				<div class = "cho_ent">
						<input type = "button" class = "cho_ent_btn" value = "전체선택" />
					</div>
					<div class = "cho_we_dpt">
						<input type = "button" class = "cho_we_dpt_btn" value = "우리부서 선택" />
					</div> -->
					<div class="top_bar_right">
						<div id="back_btn" name="back_btn" class="back">목록으로</div>
						<!-- <div>전체 선택</div>
						<div>우리부서 선택</div> -->
					</div>
				</div>
				<div class="board">
					<div class="board_title_wrap">
						<div class="board_chk_wrap"></div>
						<div class="board_title">사원정보</div>
					</div>
					<div class="chat_board" id="chat_board" name="chat_board">
						
					</div>
					<div class="invite">
						<div class="invite_btn" id="invite_btn" name="invite_btn">초대하기</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>