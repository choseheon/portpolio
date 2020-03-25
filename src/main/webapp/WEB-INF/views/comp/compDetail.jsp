<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객사</title>
<c:import url="/header"></c:import>
<!-- 주소 API -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<style type="text/css">
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
.related_cl_cnt, .opin_cnt, .related_work {
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
	getClient(3);
	getOpinList();
	getWorkList();
	getCompSche();
	
	// 목록 버튼 클릭 Event
	$("#listBtn").on("click", function() {
		location.href = "compList";
	});
	
	// 수정 버튼 클릭 Event
	$("#updateBtn").on("click", function() {
		$("#dataForm").attr("action", "compEdit");
		$("#dataForm").submit();
	});
	
	// 관련 고객 tr 클릭 Event
	$("#client_list").on("click", "tr", function() {
		$("#client_no").val($(this).attr("name"));
		$("#dataForm").attr("action", "clientDetail");
		$("#dataForm").submit();
	});
	
	// 일정 등록 버튼 클릭 Event
	$("#actiAddBtn").on("click", function() {
		location.href = "scheAdd";
	});
	
	// 비활성화 버튼 클릭 Event
	$("#deleteBtn").on("click", function() {
		makeTwoBtnPopup(1, "비활성화 경고", "정말 비활성화 하시겠습니까?<br>비활성화시 목록에서 노출되지 않습니다.", false, 400, 200, null, "확인", function() {
			closePopup(1);
			var params = "&comp_no=" + $("#view_no").val();
						
			$.ajax({
				type: "post",
				url: "deleteCompAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						makeAlert(1, "비활성화 성공", "비활성화에 성공했습니다.", null);
						location.href = "compList";
					}
					else {
						makeAlert(1, "비활성화 실패", "비활성화에 실패했습니다.", null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}, "취소", function() {
			closePopup(1);
		});
	});
	
	// 관련 고객 펼치기/접기
	$("#relatedClBtn").on("click", function() {
		var flag = $("#re_cl_flag").val();
		if(flag == 0) {
			var params = "&comp_no=" + $("#view_no").val();

			$.ajax({
				type: "post",
				url: "getClientCntAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					getClient(result.cnt);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
			$("#re_cl_flag").val(1);
			$("#relatedClBtn>img").css("transform", "scaleY(-1)");
		}
		else {
			getClient(3);
			$("#re_cl_flag").val(0);
			$("#relatedClBtn>img").css("transform", "scaleY(1)");
		}
	});
	
	// 관련 고객 목록 Get
	function getClient(view) {
		var params = "&comp_no=" + $("#view_no").val() + "&view_cnt=" + view;

		$.ajax({
			type: "post",
			url: "getClientAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.list != null) {
					$(".related_cl_cnt").html("(" + result.cnt + ")");
					drawClient(result.list);
					
					var dp = (result.cnt < 4) ? "none" : "inline-block";
					$("#relatedClBtn").css("display", dp);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	function drawClient(list) {
		var html = "";
		if(list.length > 0) {
			$("#related_cl").show();
			$("#related_cl_table").show();
			
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].CLIENT_NO + "\">";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"contents_pointer\">" + list[i].CLIENT_NAME;
				if(typeof list[i].POSI_NAME != "undefined") {
					html += " | " + list[i].POSI_NAME;
				}
				if(typeof list[i].CLIENT_PH != "undefined") {
					html += " | " + list[i].CLIENT_PH;
				}
				if(typeof list[i].CLIENT_EMAIL != "undefined") {
					html += " | " + list[i].CLIENT_EMAIL;
				}
				html += "</div></td>";
				html += "</tr>";
			}
		}
		else {
			$("#related_cl").hide();
			$("#related_cl_table").hide();
		}
		
		$("#client_list").html(html);
	}
	
	// 의견 작성 버튼 클릭 Event
	$("#opinWriteBtn").on("click", function() {
		if($.trim($("#opin_txt").val()) == "") {
			makeAlert(1, "의견 작성 오류", "내용을 입력해야합니다.", null);
		}
		else {
			var params = "&comp_no=" + $("#view_no").val() + "&opin_txt=" + $("#opin_txt").val() + "&emp_no=" + ${sEmpNo};

			$.ajax({
				type: "post",
				url: "insertCompOpinAjax",
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
	
	// 의견 펼치기/접기
	$("#opinOpenBtn").on("click", function() {
		var flag = $("#opin_flag").val();
		if(flag == 0) {
			getOpinList();
			
			$("#opin_flag").val(1);
			$("#opinOpenBtn>img").css("transform", "scaleY(1)");
		}
		else {
			var html = "";
			html += "<tr class=\"tr_no_uline\" style=\"height: 1px;\">";
			html += "<td class=\"field_contents\" colspan=\"2\"></td>";
			html += "</tr>";
			$("#opin_area").html(html);
			
			$("#opin_flag").val(0);
			$("#opinOpenBtn>img").css("transform", "scaleY(-1)");
		}
	});
	
	// 의견 리스트 Get
	function getOpinList() {
		$("#opin_txt").val("");
		var params = "&comp_no=" + $("#view_no").val();
		
		$.ajax({
			type: "post",
			url: "getCompOpinAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.opin != null) {
					drawOpinList(result.opin);
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
	// 의견 리스트 Draw
	function drawOpinList(opin) {
		var html = "";
		
		if(opin.length > 0) {
			for(var i in opin) {
				html += "<tr>";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"opin_contents\"><pre style=\"margin-top:0;\">" + opin[i].OPIN_CON + "</pre></div>";
				html += "<div class=\"opin_add_data\">" + opin[i].EMP_NAME;
				if(typeof opin[i].POSI_NAME != "undefined") {
					html += " " + opin[i].POSI_NAME;
				}
				html += " | " + opin[i].OPIN_DATE + "</div>";
				html += "</td>";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"contents_align_center\">";
				if('${sEmpNo}' == opin[i].EMP_NO) {
					html += "<div class=\"btn_red btn_size_sqr del_btn no_drag\" id=\"" + opin[i].OPIN_NO + "\">";
					html += "<img src=\"resources/images/button/icon_del_white.png\" alt=\"\" width=\"10px\" />";
					html += "</div>";
				}
				html += "</div>";
				html += "</td>";
				html += "</tr>";
			}
		}
		else {
			html += "<tr class=\"tr_no_uline\" style=\"height: 1px;\">";
			html += "<td class=\"field_contents\" colspan=\"2\"></td>";
			html += "</tr>";
		}
		$("#opin_area").html(html);
		
		// 의견 삭제 버튼 이벤트 할당
		$(".del_btn").off();
		$(".del_btn").on("click", function() {
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
			url: "delCompOpinAjax",
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
	
	// 관련 작업 체크박스  전체 선택 on/off
	$("#allWork").click(function(){
		var stat = $("#allWork").is(":checked")? true : false;
		$(".work_chbox").prop("checked", stat);
	});
	
	// 관련 작업 체크 on/off에 따른 전체 선택 체크 박스 on/off
	$(".work_chbox").on("click", function() {
		var cnt = 0;
		$("#more_cnt").val(1);
		$("#work_filter").val(4);
		
		$(".work_chbox").each(function() {
			cnt += (!$(this).is(":checked")  && $(this).attr("id") != "allWork")? 1 : 0;
		});
		var stat = (cnt > 0)? false : true;
		$("#allWork").prop("checked", stat);
		filterCheck();
		getWorkList();
	});
	// 관련 작업 조회 필터체크
	function filterCheck() {
		var val = 0;
		
		$(".work_chbox").each(function() {
			if($(this).is(":checked") && $(this).attr("id") == "allWork") {
				val = $("#allWork").val();
			}
			else if($(this).is(":checked") && $(this).attr("id") == "progWork") {
				val = $("#progWork").val();
			}
			else if($(this).is(":checked") && $(this).attr("id") == "endWork"){
				val = $("#endWork").val();
			}
			else {
				val = 3;
			}
			
			val = (val < $("#work_filter").val())? val : $("#work_filter").val();
			$("#work_filter").val(val);
		});
	}
	
	// 관련 작업 리스트 Get
	function getWorkList() {
		var params = "&comp_no=" + $("#view_no").val() + "&filter=" + $("#work_filter").val();

		$.ajax({
			type: "post",
			url: "getWorkListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.work != null) {
					var vc = $("#more_cnt").val() * 5;
					vc = (vc > result.cnt)? result.cnt : vc;
					$(".related_work").html("(" + result.cnt + ")");
					drawWorkList(result.work, vc);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 관련 작업 리스트 Draw
	function drawWorkList(work, num) {
		var html = "";
		
		if(work.length > 0) {
			for(var i in work) {
				if(i < num) {
					var div = (work[i].FLAG == 1)? "lead_bg\">리드</div>" : "chance_bg\">기회</div>";
					html += "<tr name=\"" + work[i].FLAG + "_" + work[i].NO + " \">";
					html += "<td class=\"field_contents\">";
					html += "<div class=\"work_block " + div;
					html += "</td>";
					html += "<td class=\"field_contents\" style=\"text-align: center;\">" + work[i].STAT_NAME + "</td>";
					html += "<td class=\"field_contents\">" + work[i].COMP_NAME + " | " + work[i].CLIENT_NAME + " | " + work[i].EMP_NAME + " " + work[i].EMP_POSI;
					html += " 담당 | " + work[i].WORK_NAME + "</td>";
					html += "<td class=\"field_contents\" style=\"text-align: right; font-weight: bold;\">" + work[i].DT + "</td>";
					html += "</tr>";
				}
			}
		}
		else {
			html += "<tr>";
			html += "<td class=\"field_contents\" colspan=\"4\" style=\"text-align:center; height: 70px;\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		}
		
		var total = $(".related_work").html().replace("(", "").replace(")", "");
		if(total > num) {
			html += "<tr style=\"border-bottom: 0 !important;\" class=\"view_more_area\">";
			html += "<td class=\"field_contents\" colspan=\"4\" style=\"text-align: center; cursor:pointer;\" id=\"workMoreBtn\">";
			html += "<span class=\"view_more\">더보기</span>";
			html += "</td>";
			html += "</tr>";
			
			$("#work_area").html(html);
			
			// 더보기 버튼 클릭 Event
			$("#workMoreBtn").on("click", function() {
				$("#more_cnt").val(($("#more_cnt").val()/1) + 1);
				getWorkList();
			});
		}
		else {
			$("#work_area").html(html);
		}
	}
	
	// 고객 관련 작업 클릭했을 때
	$("#work_area").on("click", "tr", function() {
		var select = $(this).attr("name");
		var loc = "";
		if(select.substring(0, select.indexOf("_")) == "1") {
			loc = "leadDetail";
			$("#lead_no").val(select.substring(select.indexOf("_") + 1));
		}
		else {
			loc = "bssDet";
			$("#chnNo").val(select.substring(select.indexOf("_") + 1));
		}
		
		$("#dataForm").attr("action", loc);
		$("#dataForm").submit();
		
	});
	
	// 고객사 관련 활동일정 Get
	function getCompSche() {
		var params = $("#dataForm").serialize();

		$.ajax({
			type: "post",
			url: "getCompScheAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawCompSche(result.list);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	
	// 고객사 관련 활동일정 Draw
	function drawCompSche(sche) {
		var html = "";
		if(sche == ""){
			html += "<tr>";
			html += "<td class=\"field_contents\" colspan=\"3\" style=\"text-align:center; height: 70px;\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} 
		else {
			for(var i in sche){
				var icon = ""; 
				switch(sche[i].CODE_S_CATE){
				case 0:	
					icon = "call";
					break;
				case 1:
					icon = "headphone";
					break;
				case 2:
					icon = "email";
					break;
				case 3:
					icon = "visit"
					break;
				}
				html += "<tr class=\"activity_row\" name=\"" + sche[i].SCHE_NO +"\">";
				html += "<td class=\"activity_left\">";
				html += "<div class=\"activity_cg_icon\">";
				html += "<img src=\"resources/images/activity/" + icon + "_icon.png\" alt=\"\" />";
				html += "</div>";
				html += "</td>";
				html += "<td class=\"activity_right\" colspan=\"" + ((sche[i].SCHE_RES == null) ? "2": "1") +"\">";
				html += "<div class=\"activity_bg\">";
				html += "<div>";
				html += "<div class=\"activity_cg\">" + sche[i].CODE_NAME +"</div>";
				html += "<div class=\"activity_uploadtime\">" + sche[i].SDATE + "</div>";
				html += "</div>";
				html += "<div class=\"activity_contents\">" + sche[i].CLIENT_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
				html += "<div class=\"activity_contents\">" + sche[i].SCHE_CON +"</div>";
				html += "<div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
				html += "</div>";
				html += "</td>";
				if(sche[i].SCHE_RES != null){
					html += "<td class=\"activity_result\">";
		            html += "<div class=\"activity_bg_right\">";
		            html += "<div>";
		            html += "<div class=\"activity_cg\">결과</div>";
		            html += "<div class=\"activity_uploadtime\">" + sche[i].EDATE + "</div>";
		            html += "</div>";
		            html += "<div class=\"activity_contents\">" + sche[i].CLIENT_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
		            if(typeof sche[i].SCHE_RES != "undefined") {
		            	html += "<div class=\"activity_contents\">" + sche[i].SCHE_RES +"</div>";
		            }
		            else {
		            	html += "<div class=\"activity_contents\"></div>";
		            }
		            html += "<div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
		            html += "</div>";
		            html += "</td>";
				}
				html += "</tr>";
			}
		}
		$("#acti_area").html(html);
	}
	
	// 고객사 관련 활동일정 필터링
	$("#allActi").click(function(){
		var stat = $("#allActi").is(":checked")? true : false;
		$(".acti_chbox").prop("checked", stat);
		getCompSche();
	});	
	$(".acti_chbox").on("click", function() {
		var cnt = 0;
		
		$(".acti_chbox").each(function() {
			cnt += $(this).is(":checked") ? 1 : 0;
		});
		var stat = (cnt < 4 && cnt >= 0)? false : true;
		$("#allActi").prop("checked", stat);
		
		getCompSche();
	});
	
	// 고객사 관련 활동일정 클릭 Event
	$("#acti_area").on("click", ".activity_row", function() {
		$("#sche_no").val($(this).attr("name"));
		$("#dataForm").attr("action", "scheDet");
		$("#dataForm").submit();	
	});
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">3</c:param>
	</c:import>
	<div class="title_area no_drag">고객사 정보</div>
	<div class="content_area">
		<form action="#" method="post" id="dataForm">
			<input type="hidden" id="client_no" name="client_no" />
			<input type="hidden" id="lead_no" name="lead_no" />
			<input type="hidden" id="chnNo" name="chnNo" />
			<input type="hidden" id="sche_no" name="sche_no" />
			<input type="hidden" id="scheDivNoM" name="scheDivNoM" value="0"/>
			<input type="hidden" id="view_no" name="view_no" value="${data.COMP_NO}" />
			<div class="contents_wrap">
				<div class="table_top_area">
					<div class="top_title_area no_drag">${data.COMP_NAME}</div>
					<div class="top_btn_area no_drag">
						<div class="btn btn_yellow btn_size_normal" id="updateBtn">수정</div>
						<div class="btn btn_yellow btn_size_normal" id="deleteBtn">비활성화</div>
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
						<td class="field_name first_field_name no_drag">고객사 명</td>
						<td class="field_contents">${data.COMP_NAME}</td>
						<td class="field_name no_drag">담당자</td>
						<td class="field_contents">${data.EMP_NAME}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">전화번호</td>
						<td class="field_contents">${data.COMP_PH}</td>
						<td class="field_name no_drag">등급</td>
						<td class="field_contents">${data.GRADE_NAME}
							<div class="color_view color_view_rel no_drag" style="background-color: ${data.GRADE_COLOR};"></div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">업종</td>
						<td class="field_contents">${data.SECT_NAME}</td>
						<td class="field_name no_drag">상태</td>
						<td class="field_contents">${data.STAT_NAME}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">웹사이트</td>
						<td class="field_contents" colspan="3">${data.COMP_WEBSITE}</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">주소</td>
						<td class="field_contents" colspan="3">
							<c:choose>
								<c:when test="${empty data.ZC}"></c:when>
								<c:otherwise>(${data.ZC}) ${data.ADDR} ${data.DETAIL_ADDR}</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">상세정보</td>
						<td class="field_contents" colspan="3"><pre>${data.DETAIL_INFO}</pre></td>
					</tr>
				</table>
				<div class="blank_space"></div>
				<div class="table_top_area">
					<div class="top_title_area no_drag">의견  <span class="opin_cnt"></span></div>
					<div class="top_btn_area">
						<div class="btn_opac-z btn_size_normal no_drag" id="opinOpenBtn">
							<img src="resources/images/button/icon_align_yellow.png" alt=""/>
							<input type="hidden" id="opin_flag" value="1" />
						</div>
					</div>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="90%" />
						<col width="10%" />
					</colgroup>
					<tbody id="opin_area">
						<tr class="tr_no_uline" style="height: 1px;">
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
								<div class="btn_black btn_size_wfull no_drag" id="opinWriteBtn">작성</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="table_top_area" id="related_cl">
					<div class="blank_space"></div>
					<div class="top_title_area no_drag">관련 고객 <span class="related_cl_cnt"></span></div>
					<div class="top_btn_area">
						<div class="btn_opac-z btn_size_normal no_drag" id="relatedClBtn">
							<img src="resources/images/button/icon_align_yellow.png" alt="" />
							<input type="hidden" id="re_cl_flag" value="0" />
						</div>
					</div>
				</div>
				<table class="table_normal click_table" id="related_cl_table">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody id="client_list"><tr><td style="font-size: 10pt;">조회된 데이터가 없습니다.</td></tr></tbody>
				</table>
				
				<div class="blank_space"></div>
				<div class="table_top_area">
					<div class="top_title_area no_drag">
						관련 작업&nbsp;<span class="related_work"></span>
					</div>
					<div class="top_btn_area no_drag">
						<input type="hidden" id="work_filter" value="0" />
						<div class="chk_grp">
							<input type="checkbox" id="allWork" class="list_chbox work_chbox" checked="checked" value="0" />
							<label for="allWork" class="chbox_lbl"></label> 
							<label for="allWork" class="chk_txt margin_right">전체</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="progWork" class="list_chbox work_chbox" checked="checked" value="1" /> 
							<label for="progWork" class="chbox_lbl"></label> 
							<label for="progWork" class="chk_txt margin_right">진행중인 작업</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="endWork" class="list_chbox work_chbox" checked="checked" value="2" /> 
							<label for="endWork" class="chbox_lbl"></label> 
							<label for="endWork" class="chk_txt">완료된 작업</label>
						</div>
					</div>
				</div>
				<input type="hidden" id="more_cnt" value="1" />
				<table class="table_normal click_table">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="60%" />
						<col width="20%" />
					</colgroup>
					<tbody id="work_area">
						<tr style="border-bottom: 0 !important;" class="view_more_area">
							<td class="field_contents" colspan="4" style="text-align: center; cursor:pointer;" id="workMoreBtn">
								<span class="view_more no_drag">더보기</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="blank_space"></div>
				<div class="table_top_area">
					<div class="top_title_area no_drag">활동 일정</div>
					<div class="top_btn_area no_drag">
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
						<div class="btn btn_yellow btn_size_normal" id="actiAddBtn">등록</div>
					</div>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="8%" />
						<col width="46%" />
						<col width="46%" />
					</colgroup>
					<tbody class="no_drag" id="acti_area">
						<tr class="activity_row">
							<td class="field_contents" colspan="3" style="text-align:center; height: 70px;">조회된 데이터가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>