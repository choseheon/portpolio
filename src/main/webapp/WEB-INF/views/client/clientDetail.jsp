<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객</title>
<c:import url="/header"></c:import>

<style type="text/css">
/*내용열입니다.*/
td {
	padding: 10px 15px;
	font-size: 10pt;
}
.cp_chbox {
    background-color: initial;
    cursor: default;
    -webkit-appearance: checkbox;
    box-sizing: border-box;
    margin: 8px 3px 3px 4px;
    padding: initial;
    border: initial;
    width: 20px;
    height: 20px;
}


.attach_image {
	display: inline-block;
	width: 80%;
	height: 130px;
	background-color: #ffffff;
	border: 1px solid #cacaca;
	text-align: center;
}
.color_view_rel {
	display: block !important;
	float: right;
}
.related_cl_cnt, .opin_cnt , .memo_cnt {
	font-size: 10pt;
	color: #555555;
}

/* 의견 파트 */
.opin_contents {
	margin-bottom: 5px;
}

.opin_add_data {
	color: #a0a0a0;
}

/* 활동 일정 파트 */
/* 활동 row - tr */
.activity_row {
	height: 139px;
	border-bottom: 0;
}
/* 활동 일정 왼쪽 cell */
.activity_left {
	text-align: center;
	vertical-align: middle;
	border-right: 1px solid #cacaca;
}
/* 활동 일정 오른쪽 cell */
.activity_right {
	height: 139px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 25px;
}

.activity_result {
	height: 139px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
}
/* 활동 구분 아이콘 영역 */
.activity_cg_icon {
	display: inline-block;
	width: 35px;
	height: 35px;
	border-radius: 3px;
	background-color: #f2b807;
	text-align: center;
	vertical-align: middle;
	position: relative;
	top: -30px;
	left: 43px;
}
/* 활동 구분 아이콘 이미지 */
.activity_cg_icon>img {
	margin-top: 7px;
}
/* 활동 일정 말풍선 배경 */
.activity_bg {
	position: relative;
	border: 1px solid #cacaca;
	background: #ffffff;
	margin-left: 10px;
	height: 100%;
	font-size: 0;
	padding: 10px 15px;
	cursor: pointer;
}

.activity_bg:before {
	content: '';
	position: absolute;
	left: 0;
	top: 25%;
	width: 0;
	height: 0;
	border-left: 11px solid transparent;
	border-right: 11px solid #cacaca;
	border-top: 11px solid transparent;
	border-bottom: 11px solid transparent;
	margin-top: -11px;
	margin-left: -22px;
}

.activity_bg:after {
	content: '';
	position: absolute;
	left: 0;
	top: 25%;
	width: 0;
	height: 0;
	border-left: 11px solid transparent;
	border-right: 11px solid #ffffff;
	border-top: 11px solid transparent;
	border-bottom: 11px solid transparent;
	margin-top: -11px;
	margin-left: -21px;
}
/* 활동 분류 */
.activity_cg {
	display: inline-block;
	width: 50%;
	font-size: 12pt;
	font-weight: 700;
	text-indent: 10px;
	text-align: left;
}
/* 활동 등록시간 */
.activity_uploadtime {
	display: inline-block;
	width: 50%;
	font-size: 12pt;
	font-weight: 700;
	text-align: right;
}
/* 활동 내용 */
.activity_contents {
	margin-top: 8px;
	font-size: 10pt;
	font-weight: 300;
	text-indent: 30px;
	text-align: left;
}
/* 날짜 정렬 */
.activity_arrow {
	cursor: pointer;
}

/* 활동 일정 내용 오른쪽 영역 */
.activity_bg_right {
	border: 1px solid #cacaca;
	height: 100%;
	font-size: 0;
	padding: 10px 15px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	getOpinList();
	getMemoList();
	getSche();
	// 목록 버튼 클릭 Event
	$("#listBtn").on("click", function() {
		location.href = "clientList";
	});
	
	// 수정 버튼 클릭 Event
	$("#updateBtn").on("click", function() {
		$("#dataForm").attr("action","clientUpdate");
		$("#dataForm").submit();
	});
	// 삭제 버튼 클릭 Event
	$("#deleteBtn").on("click", function() {
		makeTwoBtnPopup(1, "고객 삭제 경고", "정말로 고객을 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
			$("#client_no").val($("#view_no").val());
			getclientdel();
			closePopup(1);
		}, "취소", function() {
			closePopup(1);
		});
		
	});
	
	// 관련 작업 체크박스  전체 선택 on/off
	$("#allActi").click(function(){
		var stat = $("#allActi").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
	});
	
	$(".list_chbox").on("click", function() {
		var cnt = 0;
		
		$(".acti_chbox").each(function() {
			cnt += $(this).is(":checked") ? 1 : 0;
		});
		var stat = (cnt < 4 && cnt >= 0)? false : true;
		$("#allActi").prop("checked", stat);
		
		getSche();
	});
	
	if($(".cp_chbox").val() == '1'){
		$(".cp_chbox").prop("checked",true);
		//클릭이 안되있으면
	}else{
		$(".cp_chbox").prop("checked",false);
	}
	
	$("#sche_add").on("click", function() {
		$("#dataForm").attr("action","scheAdd");
		$("#dataForm").submit();
	});
	// 의견 작성 버튼 클릭 Event
	$("#opinWriteBtn").on("click", function() {
		if($.trim($("#opin_txt").val()) == "") {
			makeAlert(1, "의견 작성 오류", "내용을 입력해야합니다.", null);
		}
		else {
			var params = "&client_no=" + $("#view_no").val() + "&opin_txt=" + $("#opin_txt").val() + "&emp_no=" + ${sEmpNo};

			$.ajax({
				type: "post",
				url: "insertClientOpinAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						getOpinList();
					}
					else {
						makeAlert(1, "의견 작성 실패", "의견 작성에 실패했습니다.", null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
	});
	//고객 삭제
	function getclientdel() {
		var params = $("#dataForm").serialize();

		$.ajax({
			type: "post",
			url: "clientddelAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "SUCCESS") {
					makeAlert(1, "고객 삭제 성공", "고객 삭제에 성공했습니다.", null);
					location.href = "clientList";
				}
				else {
					makeAlert(1, "고객 삭제 실패", "고객 삭제에 실패했습니다.", null);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	
	// 의견 리스트 Get
	function getOpinList() {
		$("#opin_txt").val("");
		var params = "&client_no=" + $("#view_no").val();
		
		$.ajax({
			type: "post",
			url: "getClientOpinAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.opin != null) {
					setOpinList(result.opin);
					$(".opin_cnt").html("(" + result.cnt + ")")
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 의견 리스트 Set
	function setOpinList(opin) {
		var html = "";
		if(opin.length > 0) {
			for(var i in opin) {
				html += "<tr>";
				html += "<td class=\"field_contents\">";
// 				html += "<div class=\"opin_contents\"><pre>" + opin[i].OPIN_CON + "</pre></div>";
				html += `<div class="opin_contents"><pre>` + opin[i].OPIN_CON + `</pre></div>`;
// 				html += "<div class=\"opin_add_data\">" + opin[i].EMP_NAME;
				html += `<div class="opin_add_data">`+ opin[i].EMP_NAME;
				if(typeof opin[i].POSI_NAME != "undefined") {
					html += " " + opin[i].POSI_NAME;
				}
				html += " | " + opin[i].OPIN_DATE + "</div>";
				html += "</td>";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"contents_align_center\">";
				if(${sEmpNo} == opin[i].EMP_NO) {
					html += "<div class=\"btn_red btn_size_sqr opin_del_btn\" id=\"" + opin[i].OPIN_NO + "\">";
					html += "<img src=\"resources/images/button/icon_del_white.png\" alt=\"\" width=\"10px\" />";
					html += "</div>";
				}
				html += "</div>";
				html += "</td>";
				html += "</tr>";
			}
		}
		$("#opin_area").html(html);
		
		$(".opin_del_btn").off();
		$(".opin_del_btn").on("click", function() {
			var target = $(this).attr("id");
			
			makeTwoBtnPopup(1, "의견 삭제 경고", "정말로 의견을 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
				closePopup(1);
				delOpin(target);
			}, "취소", function() {
				closePopup(1);
			});
			
		});
	}
	
	// 의견 삭제
	function delOpin(opin_no) {
		var params = "&opin_no=" + opin_no;
		
		$.ajax({
			type: "post",
			url: "delClientOpinAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "SUCCESS") {
					getOpinList();
				}
				else {
					makeAlert(1, "의견 삭제 실패", "의견 삭제에 실패했습니다.", null);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 메모 작성 버튼 클릭 Event
	$("#memoWriteBtn").on("click", function() {
		if($.trim($("#memo_txt").val()) == "") {
			makeAlert(1, "메모 작성 오류", "내용을 입력해야합니다.", null);
		}
		else {
			var params = "&client_no=" + $("#view_no").val() + "&memo_txt=" + $("#memo_txt").val() + "&emp_no=" + ${sEmpNo};

			$.ajax({
				type: "post",
				url: "insertClientMemoAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						getMemoList();
					}
					else {
						makeAlert(1, "메모 작성 실패", "메모 작성에 실패했습니다.", null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
	});
	
	
	// 메모 리스트 Get
	function getMemoList() {
		$("#memo_txt").val("");
		var params = "&client_no=" + $("#view_no").val();
		
		$.ajax({
			type: "post",
			url: "getClientMemoAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.memo != null) {
					setMemoList(result.memo);
					$(".memo_cnt").html("(" + result.cnt + ")")
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 메모 리스트 Set
	function setMemoList(memo) {
		var html = "";
		
		if(memo.length > 0) {
			for(var i in memo) {
				html += "<tr>";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"opin_contents\"><pre>" + memo[i].MEMO_CON + "</pre></div>";
				html += "<div class=\"opin_add_data\">" + memo[i].EMP_NAME;
				if(typeof memo[i].POSI_NAME != "undefined") {
					html += " " + memo[i].POSI_NAME;
				}
				html += " | " + memo[i].MEMO_DATE + "</div>";
				html += "</td>";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"contents_align_center\">";
				if(${sEmpNo} == memo[i].EMP_NO) {
					html += "<div class=\"btn_red btn_size_sqr memo_del_btn\" id=\"" + memo[i].MEMO_NO + "\">";
					html += "<img src=\"resources/images/button/icon_del_white.png\" alt=\"\" width=\"10px\" />";
					html += "</div>";
				}
				html += "</div>";
				html += "</td>";
				html += "</tr>";
			}
		}
		$("#memo_area").html(html);
		
		$(".memo_del_btn").off();
		$(".memo_del_btn").on("click", function() {
			var target = $(this).attr("id");
			
			makeTwoBtnPopup(1, "메모 삭제 경고", "정말로 메모를 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
				closePopup(1);
				delMemo(target);
			}, "취소", function() {
				closePopup(1);
			});
			
		});
	}
	
	// 메모 삭제
	function delMemo(memo_no) {
		var params = "&memo_no=" + memo_no;
		
		$.ajax({
			type: "post",
			url: "delClientMemoAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "SUCCESS") {
					getMemoList();
				}
				else {
					makeAlert(1, "메모 삭제 실패", "메모 삭제에 실패했습니다.", null);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	
	// 고객사 관련 활동일정 클릭 Event
	$("#acti_area").on("click", "tr", function() {
		$("#sche_no").val($(this).attr("id"));
		$("#dataForm").attr("action", "scheDet");
		$("#dataForm").submit();	
	});
});

function getSche() {
	var params = $("#dataForm").serialize() + "&" + $("#actiForm").serialize();
	$.ajax({
		type: "post",
		url: "getClientScheAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			drawSche(result.scheList);
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}

function drawSche(sche) {
	var html = "";
	
	if(sche == ""){
		html += "<tr>"
		html += "	<td>"
		html += "		<div> 조회된 데이터가 없습니다. </div>"
		html += "	</td>"
		html += "</tr>"
	} else {
		for(var i in sche){
			var icon = ""; 
			// 활동 분류 
			switch(sche[i].CODE_S_CATE){
			// 전화
			case 0:	
				icon = "call";
				break;
			// 상담
			case 1:
				icon = "headphone";
				break;
			// 메일
			case 2:
				icon = "email";
				break;
			// 방문
			case 3:
				icon = "visit"
				break;
			}
			html += "<tr class=\"activity_row\" id=\"" + sche[i].SCHE_NO +"\">";
			html += "    <td class=\"activity_left\">";
			html += "        <div class=\"activity_cg_icon\">";
			html += "            <img src=\"resources/images/activity/" + icon + "_icon.png\" alt=\"\" />";
			html += "        </div>";
			html += "    </td>";
			html += "    <td class=\"activity_right\" colspan=\"" + ((sche[i].SCHE_RES == null) ? "2": "1") +"\">";
			html += "        <div class=\"activity_bg\">";
			html += "            <div>";
			html += "                <div class=\"activity_cg\">" + sche[i].CODE_NAME +"</div>";
			html += "                <div class=\"activity_uploadtime\">" + sche[i].SDATE + "</div>";
			html += "            </div>";
			html += "            <div class=\"activity_contents\">" + sche[i].CLIENT_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
			html += "            <div class=\"activity_contents\">" + sche[i].SCHE_CON +"</div>";
			html += "            <div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
			html += "        </div>";
			html += "    </td>";
			if(sche[i].SCHE_RES != null){
				html += "<td class=\"activity_result\">";
	            html += "    <div class=\"activity_bg_right\">";
	            html += "        <div>";
	            html += "            <div class=\"activity_cg\">결과</div>";
	            html += "            <div class=\"activity_uploadtime\">" + sche[i].EDATE + "</div>";
	            html += "        </div>";
	            html += "        <div class=\"activity_contents\">" + sche[i].CLIENT_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
	            html += "        <div class=\"activity_contents\">" + sche[i].SCHE_RES +"</div>";
	            html += "        <div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
	            html += "    </div>";
	            html += "</td>";
			}
			html += "</tr>";
			// 일정 결과가 있을 때 
		}
	}
	
	$("#acti_area").html(html);
}
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">2</c:param>
	</c:import>
	<div class="title_area">고객 정보</div>
	<div class="content_area">
		<form action="addForm" method="post" id="dataForm">
			<input type="hidden" id="client_no" name="client_no" value="${data.CLIENT_NO}"  />
			<input type="hidden" id="cNo" name="cNo" value="${data.CLIENT_NO}"  />
			<input type="hidden" id="view_no" name="view_no" value="${data.CLIENT_NO}" />
			<input type="hidden" id="sche_no" name="sche_no" value="${data.CLIENT_NO}" />
			<input type="hidden" id="scheDivNoM" name="scheDivNoM" value="0"/>
			<div class="contents_wrap">
				<div class="table_top_area">
					<div class="top_title_area">${data.CLIENT_NAME}</div>
					<div class="top_btn_area">
						<div class="btn btn_yellow btn_size_normal" id="updateBtn">수정</div>
						<div class="btn btn_yellow btn_size_normal" id="deleteBtn">삭제</div>
						<div class="btn btn_yellow btn_size_normal" id="listBtn">목록</div>
					</div>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<td class="field_name first_field_name">이름</td>
						<td class="field_contents" >
						<input type="hidden" id="CLIENT_NAME" name="CLIENT_NAME" value="${data.CLIENT_NAME}" />
						${data.CLIENT_NAME}</td>
						<td class="field_name">고객사</td>
						<td class="field_contents" >
						<input type="hidden" id="COMP_NAME" name="COMP_NAME" value="${data.COMP_NAME}" />
						<input type="hidden" id="COMP_NO" name="COMP_NO" value="${data.COMP_NO}" />
						${data.COMP_NAME}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">부서</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_DEPART_NAME" name="CLIENT_DEPART_NAME" value="${data.CLIENT_DEPART_NAME}" />
						${data.CLIENT_DEPART_NAME}</td>
						<td class="field_name">직책</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_POSI_NAME" name="CLIENT_POSI_NAME" value="${data.CLIENT_POSI_NAME}" />
						${data.CLIENT_POSI_NAME}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">휴대번호</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_PH" name="CLIENT_PH" value="${data.CLIENT_PH}" />
						${data.CLIENT_PH}</td>
						<td class="field_name">유선번호</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_LN" name="CLIENT_LN" value="${data.CLIENT_LN}" />
						${data.CLIENT_LN}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">팩스</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_FAX" name="CLIENT_FAX" value="${data.CLIENT_FAX}" />
						${data.CLIENT_FAX}</td>
						<td class="field_name">웹사이트</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_WEBSITE" name="CLIENT_WEBSITE" value="${data.CLIENT_WEBSITE}" />
						${data.CLIENT_WEBSITE}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">이메일</td>
						<td class="field_contents">
						<input type="hidden" id="CLIENT_EMAIL" name="CLIENT_EMAIL" value="${data.CLIENT_EMAIL}" />
						${data.CLIENT_EMAIL}</td>
						<td class="field_name">등급</td>
						<td class="field_contents">
						<input type="hidden" id="CC_GRADE_NAME" name="CC_GRADE_NAME" value="${data.CC_GRADE_NAME}" />
						${data.CC_GRADE_NAME}
							<input type="hidden" id="CC_GRADE_NO" name="CC_GRADE_NO" value="${data.CC_GRADE_NO}" />
							<input type="hidden" id="CC_GRADE_COLOR" name="CC_GRADE_COLOR" value="${data.CC_GRADE_COLOR}" />
							<div class="color_view color_view_rel" style="background-color: ${data.CC_GRADE_COLOR};"></div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">중요인물</td>
						<td class="field_contents">
						<input id="CLIENT_CP" name="CLIENT_CP" type="hidden"  value="${data.CLIENT_CP}"/>
						<input class="cp_chbox" type="checkbox" disabled="disabled" value="${data.CLIENT_CP}"/>
						</td>
						<td class="field_name">담당자</td>
						
						<td class="field_contents">
						<input type="hidden" id="EMP_NO" name="EMP_NO" value="${data.EMP_NO}" />
						<input type="hidden" id="EMP_NAME" name="EMP_NAME" value="${data.EMP_NAME}" />
						${data.EMP_NAME}</td>
					</tr>
				</table>
				<div class="blank_space"></div>
				<div class="table_top_area">
					<div class="top_title_area">의견  <span class="opin_cnt"></span></div>
					<div class="top_btn_area"></div>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="90%" />
						<col width="10%" />
					</colgroup>
					<tbody id="opin_area">
						<tr class="tr_no_uline">
							<td class="field_contents" colspan="2"></td>
						</tr>	
					</tbody>
				</table>
				<table class="table_normal" style="border: 0;">
					<colgroup>
						<col width="90%" />
						<col width="10%" />
					</colgroup>
					<tbody id="opin_write">
						<tr class="tr_no_uline">
							<td class="field_contents">
								<textarea class="textarea_noresize" id="opin_txt" name="opin_txt"></textarea>
							</td>
							<td class="field_contents">
								<div class="btn_black btn_size_wfull" id="opinWriteBtn">작성</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="blank_space"></div>
				<div class="table_top_area">
					<div class="top_title_area">메모  <span class="memo_cnt"></span></div>
					<div class="top_btn_area"></div>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="90%" />
						<col width="10%" />
					</colgroup>
					<tbody id="memo_area">
						<tr class="tr_no_uline">
							<td class="field_contents" colspan="2"></td>
						</tr>	
					</tbody>
				</table>
				<table class="table_normal" style="border: 0;">
					<colgroup>
						<col width="90%" />
						<col width="10%" />
					</colgroup>
					<tbody id="memo_write">
						<tr class="tr_no_uline">
							<td class="field_contents">
								<textarea class="textarea_noresize" id="memo_txt" name="memo_txt"></textarea>
							</td>
							<td class="field_contents">
								<div class="btn_black btn_size_wfull" id="memoWriteBtn">작성</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
				<div class="blank_space"></div>
				<form action="#" method="post" id="actiForm">
					<div class="table_title" style="font-size:0;">
						<div class="top_title_area">
							활동 일정
						</div>
						<div class="top_btn_area">
							<div class="chk_grp">
								<input type="checkbox" id="allActi" class="list_chbox" checked="checked"/>
								<label for="allActi" class="chbox_lbl"></label> 
								<label for="allActi" class="chk_txt margin_right">전체</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiCall" class="list_chbox acti_chbox" value="0" checked="checked" name="acti0"/> 
								<label for="actiCall" class="chbox_lbl"></label> 
								<label for="actiCall" class="chk_txt margin_right">전화</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiCounsel" class="list_chbox acti_chbox" value="1" checked="checked" name="acti1" /> 
								<label for="actiCounsel" class="chbox_lbl"></label> 
								<label for="actiCounsel" class="chk_txt margin_right">상담</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiVisit" class="list_chbox acti_chbox" value="3" checked="checked" name="acti3" /> 
								<label for="actiVisit" class="chbox_lbl"></label>
								<label for="actiVisit" class="chk_txt margin_right">방문</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiEmail" class="list_chbox acti_chbox" value="2" checked="checked" name="acti2" />
								<label for="actiEmail" class="chbox_lbl"></label>
								<label for="actiEmail" class="chk_txt margin_right">이메일</label>
							</div>
							<div class="btn btn_yellow btn_size_normal" id="sche_add">등록</div>
						</div>
					</div>
				</form>
				<table class="table_normal">
	                <colgroup>   
	                    <col width="8%" />
	                    <col width="46%" />
	                    <col width="46%" />
	                </colgroup>
	                <tbody id="acti_area">
		                <tr class="activity_row">
		                    <td class="activity_left">
		                        <div class="activity_cg_icon">
		                                <img src="resources/images/activity/call_icon.png" alt="" />
		                        </div>
		                    </td>
		                    <td class="activity_right">
		                        <div class="activity_bg">
		                            <div>
		                                <div class="activity_cg">전화</div>
		                                <div class="activity_uploadtime">2019.10.01</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">자사 이벤트 소개 및 다음 방문 일정 조율</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                    <td class="activity_result">
		                        <div class="activity_bg_right">
		                            <div>
		                                <div class="activity_cg">결과</div>
		                                <div class="activity_uploadtime">2019.10.10</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">긍정적 반응</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                </tr>
		                <tr class="activity_row">
		                    <td class="activity_left">
		                        <div class="activity_cg_icon">
		                            <img src="resources/images/activity/headphone_icon.png" alt="" />
		                        </div>
		                    </td>
		                    <td class="activity_right">
		                        <div class="activity_bg">
		                            <div>
		                                <div class="activity_cg">상담</div>
		                                <div class="activity_uploadtime">2019.10.01</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">자사 이벤트 소개 및 다음 방문 일정 조율</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                    <td class="activity_result">
		                        <div class="activity_bg_right">
		                            <div>
		                                <div class="activity_cg">결과</div>
		                                <div class="activity_uploadtime">2019.10.10</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">긍정적 반응</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                </tr>
		                <tr class="activity_row">
		                    <td class="activity_left">
		                        <div class="activity_cg_icon">
		                            <img src="resources/images/activity/visit_icon.png" alt="" />
		                        </div>
		                    </td>
		                    <td class="activity_right" colspan="2">
		                        <div class="activity_bg">
		                            <div>
		                                <div class="activity_cg">방문</div>
		                                <div class="activity_uploadtime">2019.10.01</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">자사 이벤트 소개 및 다음 방문 일정 조율</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                </tr>
		                <tr class="activity_row">
		                    <td class="activity_left">
		                        <div class="activity_cg_icon">
		                            <img src="resources/images/activity/email_icon.png" alt="" />
		                        </div>
		                    </td>
		                    <td class="activity_right" colspan="2">
		                        <div class="activity_bg">
		                            <div>
		                                <div class="activity_cg">이메일</div>
		                                <div class="activity_uploadtime">2019.10.01</div>
		                            </div>
		                            <div class="activity_contents">테스터 | 부장</div>
		                            <div class="activity_contents">자사 이벤트 소개 및 다음 방문 일정 조율</div>
		                            <div class="activity_contents">홍길동 대리 담당</div>
		                        </div>
		                    </td>
		                </tr>
	                </tbody>
	            </table>
	            <div class="div_line"></div>
			</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>