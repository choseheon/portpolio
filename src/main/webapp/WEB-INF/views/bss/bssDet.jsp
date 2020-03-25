<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업상세보기</title>
<c:import url="/header"></c:import>
<style type="text/css">
/* 의견 파트 */
.opin_contents {
	margin-bottom: 5px;
}

.opin_add_data {
	color: #a0a0a0;
}

/*영업팀 css 추가사항*/
.btn_left_input {
	width: calc(100% - 94px);
}
/*윤제추가*/
.bss_category {
	height: 50px;
	box-shadow: 0px 0px 5px #ccc;
	font-size: 0px;
	vertical-align: middle;
	text-indent: 10px;
}

.category_content {
	line-height: 50px;
	display: inline-block;
	font-size: 15pt;
	font-weight: bold;
}

.category_img_area {
	height: 0px;
	display: inline-block;
	float: right;
	padding: 15.5px;
}
/**** 추가 css */
/* border : 0*/
.input_border_0 {
	width: 100%;
	height: 30px;
	border: 0;
	font-size: 10pt;
	text-indent: 5px;
}

.input_border_0:focus {
	border: 0;
}

.category_img_area>img {
	cursor: pointer;
}
/*팝업*/
.pop_tbl {
	text-align: center;
	border-collapse: collapse;
	font-size: 10pt;
	font-weight: bold;
	width: 100%;
	height: 100%;
}

.td_font {
	font-size: 11pt;
}

.pop_tbl>tbody>tr {
	border-bottom: 1px solid #cacaca;
}
/* 담당자 검색 영역 */
.pop_manager_select {
	width: 100%;
	padding: 10px;
	height: 80px;
	display: inline-block;
	vertical-align: top;
}

.pop_btn_manager {
	display: inline-block;
	width: 130px;
	padding: 8px 25px 8px 8px;
	color: #333;
	text-align: left;
	border: 1px solid #E1E6EB;
	background-color: #FBFCFD;
	border-radius: 2px;
	font-size: 14px;
	margin-right: 10px;
	cursor: pointer;
}

.pop_column {
	height: 40px;
}

.pop_column td:hover {
	cursor: pointer;
}

.address_contents_card {
	height: 550px;
}

.company_contents_card {
	height: 100%;
}

/* 담당자검색 */
.input_search {
	width: 100%;
	height: 50px;
	font-size: 13pt;
	text-indent: 10px;
	border: 1px solid #cacaca;
	border-radius: 5px;
}

.input_search::placeholder {
	font-size: 13pt;
	color: #cacaca;
}

.search_icon {
	float: right;
	position: relative;
	top: -40px;
	left: -10px;
	cursor: pointer;
}

.add_icon {
	float: right;
	position: relative;
	top: -40px;
	left: -20px;
	cursor: pointer;
}

.cancel_icon {
	float: right;
	position: relative;
	top: -35px;
	left: -20px;
	cursor: pointer;
}

.pop_list {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	font-size: 10pt;
	position: relative;
	top: -20px;
}

.pop_list>tbody>tr {
	cursor: pointer;
}

.vali_area {
	font-size: 10pt;
	color: #ff0000;
	margin-top: 5px;
}
/* POPUP */
/*상품등록팝업*/
.prod_left {
	display: inline-block;
	float: left;
	font-size: 0px;
	width: 400px;
	vertical-align: top;
}

.prod_left_top {
	display: inline-block;
	width: 100%;
	height: 100px;
}

.prod_left_bottom {
	display: inline-block;
	width: 100%;
	height: 400px;
}

.prod_middle {
	display: inline-block;
	width: 100px;
	height: 500px;
}

.prod_right {
	display: inline-block;
	width: 400px;
	height: 500px;
	float: right;
}

.prod_middle_btn {
	display: inline-block;
	width: 60px;
	margin-left: 25px;
	margin-top: 200px;
}

.pop_list_top_none {
	top: 0 !important;
}

.prod_middle_btn>img {
	cursor: pointer;
	display: inline-block;
}

#popDefaultProdList {
	width: 400px;
}
/* 의견 */
.opin_cnt {
	font-size: 10pt;
	color: #555555;
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

/* 첨부파일 */
.sgtAttachUpload, .ngtAttachUpload, .ctractAttachUpload {
	display: none;
}

.two_btn_left_input {
	width: calc(100% - 187px);
}
</style>

<script type="text/javascript">
/*진행번호가져오기*/
function bssFirst(){
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "getFirstAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			$("#bssProgNo").val(result.data.PROG_NO)
			/*상세보기 표 만들기*/
			if($("#bssProgNo").val() *1 > 0){
				/*기회파트*/
				$("#ChnBtn").on("click", function(){
					var params = $("#actionForm").serialize();
					$.ajax({
						type : "post",
						url : "getChnAjax",
						dataType : "json",
						data : params,
						success : function(result) {
							redrawChn(result.data);
							chnEvent();
						},
						error : function(request, status, error) {
							console.log("text : " + request.responseText);
							console.log("error : " + error);
						}
					});
				});
			}
			if($("#bssProgNo").val() *1 > 1){
				/*제안파트*/
				$("#SgtBtn").on("click", function(){
					redrawSgt();
					SgtEvent();
				});
			}
			if($("#bssProgNo").val() *1 > 2){
				/*협상파트*/
				$("#NgtBtn").on("click", function(){
					redrawNgt();
					NgtEvent();
				});
			}
			if($("#bssProgNo").val() *1 > 3){
				/*계약파트*/
				$("#ctrackBtn").on("click", function(){
					redrawCtrack();
					ctrackEvent();
				});
			}
			if($("#bssProgNo").val() *1 > 4){
				$("#registerBtn").css("display", "none");
			}
			console.log($("#bssProgNo").val());
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
/*마감 진행상태 확인 함수*/
function selectChk(){
	/*마감시*/
	var html = "";
	if($("#selectChk").val() == "1"){
		html += "마감을 하시면 현 진행상태에서는 <br/> 더이상 수정하실 수 없습니다. <br /> 계속하시겠습니까?";
	}
	/*실패시*/
	else if ($("#selectChk").val() == "2"){
		html += "실패 시 영업은 종료됩니다.<br /> 계속하시겠습니까?";
	}
	/*보류시*/
	else {
		html += "보류 시 영업은 현 진행상태에서 멈춤니다.<br /> 계속하시겠습니까?";
	}
	return html;
}
//영업진행상태확인
function bssProgChk(){
	//넘어가기 전에 처리해야할 것들 ... 다음 단계의 테이블 생성... 그 테이블을 생성한 값들 가져와서 상품 테이블 만들기..
	//1. 다음 단계의 테이블 생성 + 다음 단계로 넘어갈때 현재 단계 마감시키기..
	//DropDowList가 마감인  경우 실행합니다.
	if($("#selectChk").val() * 1 == 1 ){
		var params = $("#popupForm").serialize();
		$.ajax({
			type : "post",
			url : "bssNextProgAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				$("#bssNo").val(result.bssNo);
				var list = result.list;
				for(var i in list){
					$("#bssProdNo").val(list[i].PROD_NO);
					$("#bssProdCnt").val(list[i].CNT);
					$("#bssProdPrice").val(list[i].PRICE);
					console.log($("#bssProdNo").val());
					console.log($("#bssProdCnt").val());
					console.log($("#bssProdPrice").val());
					console.log($("#bssNo").val());
					var params = $("#popupForm").serialize();
					console.log($("#bssProdNo").val());
					console.log($("#bssProdCnt").val());
					console.log($("#bssProdPrice").val());
					console.log($("#bssNo").val());
					console.log(params);
					$.ajax({
						type : "post",
						url : "bssNextProgProdAjax",
						dataType : "json",
						data : params,
						success : function(result) {
							
						},
						error : function(request, status, error) {
							console.log("text : " + request.responseText);
							console.log("error : " + error);
						}
					});
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	} else{
	}
	//버튼 눌렀을 때 다음 단계로 넘어가기...
	var params = $("#popupForm").serialize();
	$.ajax({
		type : "post",
		url : "bssProgChkAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			closePopup(2);
			closePopup(1);
			location.reload();
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
/*영업시작 팝업*/
function bssStartPop(){
	var html = "";
	html +="<form action=\"#\" id=\"popupForm\"  method=\"post\">";
	html += "<input type=\"hidden\" id=\"chnNo\" name=\"chnNo\" value=\"" + ${sChnNo} + "\">";
	html += "<input type=\"hidden\" id=\"bssProgEnd\" name=\"bssProgEnd\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssNo\" name=\"bssNo\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdNo\" name=\"bssProdNo\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdCnt\" name=\"bssProdCnt\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdPrice\" name=\"bssProdPrice\" value=\"\"/>";
	html += "	<table class=\"pop_tbl\">                                                    ";
	html += "	<colgroup>                                                                 ";
	html += "		<col width=\"20%\" />                   	                                 ";
	html += "		<col width=\"80%\" />                                                    ";
	html += "	</colgroup>                                                                ";
	html += "	<tbody>                                                                    ";
	html += "		<tr>                                                                   ";
	html += "			<th class=\"td_font\">마감상태</th>                                      ";
	html += "			<td  class=\"field_contents\"><select class=\"input_normal\" id=\"selectChk\" name=\"selectChk\"  >       ";
	html += "							<option value=\"1\" selected=\"selected\">마감</option>              ";
	html += "							<option value=\"3\">보류</option>                                  ";
	html += "					</select></td>                                             ";
	html += "		</tr>                                                                  ";
	html += "		</tbody>                                                               ";
	html += "	</table>              ";
	html += "</form>";
	
	makeTwoBtnPopup(1, "영업시작", html, true, 400, 200, null, "확인", function() {
		makeTwoBtnPopup(2, "결과확인", selectChk(), true, 400, 200, null, "마감", function() {
			$("#bssProgEnd").val($("#bssProgNo").val());
			console.log($("#bssProgEnd").val());
			bssProgChk();
		},"취소", function() {
			closePopup(2);
		});
	},"취소", function() {
		closePopup(1);
	});
}
/*나머지영업종료 팝업*/
function bssProgEndPop(){
	var html = "";
	html +="<form action=\"#\" id=\"popupForm\"  method=\"post\">";
	html += "<input type=\"hidden\" id=\"chnNo\" name=\"chnNo\" value=\"" + ${sChnNo} + "\">";
	html += "<input type=\"hidden\" id=\"bssProgEnd\" name=\"bssProgEnd\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssNo\" name=\"bssNo\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdNo\" name=\"bssProdNo\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdCnt\" name=\"bssProdCnt\" value=\"\"/>";
	html += "<input type=\"hidden\" id=\"bssProdPrice\" name=\"bssProdPrice\" value=\"\"/>";
	html += "	<table class=\"pop_tbl\">                                                    ";
	html += "	<colgroup>                                                                 ";
	html += "		<col width=\"20%\" />                   	                                 ";
	html += "		<col width=\"80%\" />                                                    ";
	html += "	</colgroup>                                                                ";
	html += "	<tbody>                                                                    ";
	html += "		<tr>                                                                   ";
	html += "			<th class=\"td_font\">마감상태</th>                                      ";
	html += "			<td  class=\"field_contents\"><select class=\"input_normal\" id=\"selectChk\" name=\"selectChk\"  >       ";
	html += "							<option value=\"1\" selected=\"selected\">마감</option>              ";
	html += "							<option value=\"2\">실패</option>                                  ";
	html += "							<option value=\"3\">보류</option>                                  ";
	html += "					</select></td>                                             ";
	html += "		</tr>                                                                  ";
	html += "		</tbody>                                                               ";
	html += "	</table>              ";
	html += "</form>";
	
	makeTwoBtnPopup(1, "영업종료", html, true, 400, 200, null, "확인", function() {
		makeTwoBtnPopup(2, "결과확인", selectChk(), true, 400, 200, null, "마감", function() {
			$("#bssProgEnd").val($("#bssProgNo").val());
			console.log($("#bssProgEnd").val());
				bssProgChk();
		},"취소", function() {
			closePopup(2);
		});
	},"취소", function() {
		closePopup(1);
	});
}

	$(document).ready(function() {
		//맨처음 화면로딩 = 기회번호 넘어왔을때 진행번호가져오기.
		bssFirst();
		getOpinList();
		getBssSche();
		/*버튼 글자 수 늘어날때마다 길이 늘리기*/
		$('button').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});
		$('.content_btn>div').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});
		/*수정확인팝업*/
		$("#registerBtn").on("click", function() {
			makeTwoBtnPopup(1, "영업수정", "수정하시겠습니까?", true, 400, 200, null, "수정", function() {
				bssRegisterEvent();
				closePopup(1);
			},"취소", function() {
				closePopup(1);
			});
		});
		
		/* 목록 버튼 */
		$("#listBtn").on("click", function() {
			location.href = "bssMain";
		});
		
		/* ------------------------------의견-------------------------------- */
		
		// 의견 작성 버튼 클릭 Event
		$("#opinWriteBtn").on("click", function() {
			if($.trim($("#opin_txt").val()) == "") {
				makeAlert(1, "의견 작성 오류", "내용을 입력해야합니다.", null);
			}
			else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type: "post",
					url: "insertBssOpinAjax",
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
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post",
				url: "getBssOpinAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.opin != null) {
						drawOpinList(result.opin);
						$(".opin_cnt").html("(" + result.cnt + ")");
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
				url: "delBssOpinAjax",
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
		
		/* ---------------------------활동일정--------------------------- */
		// 영업 관련 활동일정 Get
		function getBssSche() {
			var params = $("#actionForm").serialize();

			$.ajax({
				type: "post",
				url: "getBssScheAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					drawBssSche(result.list);
					console.log(result.list);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
		
		// 영업 관련 활동일정 Draw
		function drawBssSche(list) {
			var html = "";
			if(list == ""){
				html += "<tr class=\"activity_row\">";
				html += "<td class=\"field_contents\" colspan=\"3\" style=\"text-align:center; height: 70px;\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
				console.log(html);
			} 
			else {
				for(var i in list){
					var icon = ""; 
					switch(list[i].CODE_S_CATE){
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
					html += "<tr class=\"activity_row\" name=\"" + list[i].SCHE_NO +"\">";
					html += "<td class=\"activity_left\">";
					html += "<div class=\"activity_cg_icon\">";
					html += "<img src=\"resources/images/activity/" + icon + "_icon.png\" alt=\"\" />";
					html += "</div>";
					html += "</td>";
					html += "<td class=\"activity_right\" colspan=\"" + ((list[i].EDATE == null) ? "2": "1") +"\">";
					html += "<div class=\"activity_bg\">";
					html += "<div>";
					html += "<div class=\"activity_cg\">" + list[i].CODE_NAME +"</div>";
					html += "<div class=\"activity_uploadtime\">" + list[i].SDATE + "</div>";
					html += "</div>";
					html += "<div class=\"activity_contents\">" + list[i].CLIENT_NAME + " | " + list[i].CLIENT_PNM +"</div>";
					html += "<div class=\"activity_contents\">" + list[i].SCHE_CON +"</div>";
					html += "<div class=\"activity_contents\">" + list[i].EMP_NAME + " " + list[i].EMP_PNM +" 담당</div>";
					html += "</div>";
					html += "</td>";
					if(list[i].EDATE != null){
						html += "<td class=\"activity_result\">";
			            html += "<div class=\"activity_bg_right\">";
			            html += "<div>";
			            html += "<div class=\"activity_cg\">결과</div>";
			            html += "<div class=\"activity_uploadtime\">" + list[i].EDATE + "</div>";
			            html += "</div>";
			            html += "<div class=\"activity_contents\">" + list[i].CLIENT_NAME + " | " + list[i].CLIENT_PNM +"</div>";
			            html += "<div class=\"activity_contents\">" + list[i].SCHE_RES +"</div>";
			            html += "<div class=\"activity_contents\">" + list[i].EMP_NAME + " " + list[i].EMP_PNM +" 담당</div>";
			            html += "</div>";
			            html += "</td>";
					}
					html += "</tr>";
				}
			}
			console.log(html);
			$("#acti_area").html(html);
			console.log(html);
		}
		
		// 일정 등록 버튼 클릭 Event
		$("#actiAddBtn").on("click", function() {
			location.href = "scheAdd";
		});
		
		// 영업 관련 활동일정 필터링
		$("#allActi").click(function(){
			var stat = $("#allActi").is(":checked")? true : false;
			$(".acti_chbox").prop("checked", stat);
			getBssSche();
		});	
		$(".acti_chbox").on("click", function() {
			var cnt = 0;
			
			$(".acti_chbox").each(function() {
				cnt += $(this).is(":checked") ? 1 : 0;
			});
			var stat = (cnt < 4 && cnt >= 0)? false : true;
			$("#allActi").prop("checked", stat);
			
			getBssSche();
		});
		
		// 영업 관련 활동일정 클릭 Event
		$("#acti_area").on("click", "tr", function() {
			$("#chnNo").val($(this).attr("name"));
			$("#actionForm").attr("action", "scheDet");
			$("#actionForm").submit();	
		});
	});
	
	/* ------------------------------첨부자료---------------------------- */
	/* 제안 첨부자료 목록 가져오기 */
	function reloadSgtAttachList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "sgtAttatchListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
					redrawSgtAttachList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}
		
	/* 제안 첨부자료 목록 나타내기 */
	function redrawSgtAttachList(list) {
		var html = "";
		if (list.length > 0) {
			for ( var i in list) {
				html += "<option value=" + list[i].SGT_ATTACH_NO + ">" + list[i].SGT_ATTACH_NAME + "</option>";
				}
		} else {
			html += "<option></option>";
			}
		$("#sgt_attach_name").html(html);
	}
	
	/* 협상 첨부자료 목록 가져오기 */
	function reloadNgtAttachList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "ngtAttatchListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
					redrawNgtAttachList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}
		
	/* 협상 첨부자료 목록 나타내기 */
	function redrawNgtAttachList(list) {
		var html = "";
		if (list.length > 0) {
			for ( var i in list) {
				html += "<option value=" + list[i].NGT_ATTACH_NO + ">" + list[i].NGT_ATTACH_NAME + "</option>";
				}
		} else {
			html += "<option></option>";
			}
		$("#ngt_attach_name").html(html);
	}
	
	/* 계약 첨부자료 목록 가져오기 */
	function reloadCtractAttachList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "ctractAttatchListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
					redrawCtractAttachList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}
		
	/* 계약 첨부자료 목록 나타내기 */
	function redrawCtractAttachList(list) {
		var html = "";
		if (list.length > 0) {
			for ( var i in list) {
				html += "<option value=" + list[i].CTRACT_ATTACH_NO + ">" + list[i].CTRACT_ATTACH_NAME + "</option>";
				}
		} else {
			html += "<option></option>";
			}
		$("#ctract_attach_name").html(html);
		console.log($("#ctract_attach_name").html());
	}
	
	/*기회 그리기*/
	var htmlChn = "";
	function redrawChn(data){
		if(htmlChn != ""){
			htmlChn = "";
			$("#ChnBtn").attr("src", "resources/images/bss/close_tab.png");
		}
		else {
			if(data.BSS_TYPE_NO == null || data.BSS_TYPE_NO == ""){
				htmlChn += "<input type=\"hidden\" id=\"BssTypeNo\" name=\"BssTypeNo\" value=\"\">";
			}
			else {
				htmlChn += "<input type=\"hidden\" id=\"BssTypeNo\" name=\"BssTypeNo\" value=\""+data.BSS_TYPE_NO+"\">";
			}
			if(data.SALES_DIV_NO == null || data.SALES_DIV_NO == ""){
				htmlChn += "<input type=\"hidden\" id=\"SalesDivNo\" name=\"SalesDivNo\" value=\"\">";
			}
			else {
				htmlChn += "<input type=\"hidden\" id=\"SalesDivNo\" name=\"SalesDivNo\" value=\""+data.SALES_DIV_NO+"\">";
			}
			htmlChn += "<input type=\"hidden\" id=\"emp_no2\" name=\"emp_no2\" value=\""+data.EMP_NO+"\">";	
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "		<td class=\"field_name first_field_name\">진행상태 <span                   ";
	htmlChn += "			class=\"acc_txt\"></span>                                              ";
	htmlChn += "		</td>                                                                    ";
	htmlChn += "		<td class=\"field_contents\"><input type=\"text\" id=\"prog_name\" name=\"prog_name\" value=\""+data.PROG_NAME+"\"                             ";
	htmlChn += "			class=\"input_border_0\" readonly=\"readonly\" /></td>                   ";
	
	if(data.PROG_NO * 1 == 1){
		htmlChn += "		<td class=\"field_name\">영업기회명 <span class=\"acc_txt\"> *</span></td>   ";
		htmlChn += "		<td class=\"field_contents\"><input type=\"text\" id=\"chn_name\" name=\"chn_name\" value=\""+data.CHN_NAME+"\"                            ";
		htmlChn += "			class=\"input_normal\" placeholder=\"50자 이내로 작성부탁드립니다.\" /></td>";
	} else {
		htmlChn += "		<td class=\"field_name\">영업기회명 <span class=\"acc_txt\"></span></td>   ";
		htmlChn += "		<td class=\"field_contents\"><input type=\"text\" id=\"chn_name\" name=\"chn_name\" value=\""+data.CHN_NAME+"\"                            ";
		htmlChn += "			class=\"input_border_0\" readonly=\"readonly\" placeholder=\"50자 이내로 작성부탁드립니다.\" /></td>";
	}
	
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	                                                             
	if(data.PROG_NO *1 == 1){
		htmlChn += "			<td class=\"field_name first_field_name\">영업시작<span                ";
		htmlChn += "				class=\"acc_txt\"> *</span>                                        ";
		htmlChn += "			</td>   ";
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"CHN_DATE\" name=\"CHN_DATE\"   value=\"\"                      ";
		htmlChn += "				class=\"input_short btn_left_input\" readonly=\"readonly\" />        ";
		htmlChn += "				<div class=\"btn_black btn_size_normal select\" id=\"bssStart\" name=\"bssStart\">시작</div></td>    ";
	} else{
		htmlChn += "			<td class=\"field_name first_field_name\">영업시작<span                ";
		htmlChn += "				class=\"acc_txt\"></span>                                        ";
		htmlChn += "			</td>   ";
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"CHN_DATE\" name=\"CHN_DATE\"   value=\""+data.CHN_DATE+"\"                      ";
		htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" />        ";
	}
	htmlChn += drawBssType();
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	
	if(data.EXPECT_SALES == null || data.EXPECT_SALES == ""){
		htmlChn += "			<td class=\"field_name first_field_name\">예상매출 <span               ";
		htmlChn += "				class=\"acc_txt\"> *</span>                                        ";
		htmlChn += "			</td>                                                                ";
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"expect_sales\" name=\"expect_sales\"                   ";
		htmlChn += "				class=\"input_normal\"/></td>                                     ";
	} else {
		if(data.PROG_NO *1 == 1){
			htmlChn += "			<td class=\"field_name first_field_name\">예상매출 <span               ";
			htmlChn += "				class=\"acc_txt\"> *</span>                                        ";
			htmlChn += "			</td>                                                                ";
			htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"expect_sales\" name=\"expect_sales\" value=\""+data.EXPECT_SALES+"\"                        ";
			htmlChn += "				class=\"input_normal\"/></td>                                     ";
		} else {
			htmlChn += "			<td class=\"field_name first_field_name\">예상매출 <span               ";
			htmlChn += "				class=\"acc_txt\"></span>                                        ";
			htmlChn += "			</td>                                                                ";
			htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"expect_sales\" name=\"expect_sales\" value=\""+data.EXPECT_SALES+"\"                        ";
			htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>                                     ";
		}
		
		
		
	}
	
	htmlChn += drawSalesDiv();
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">담당자<span                  ";
	htmlChn += "				class=\"acc_txt\"> *</span>                                        ";
	htmlChn += "			</td>                                                                ";
	if($("#bssProgNo").val() * 1 > 4){
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"emp_name\" name=\"emp_name\"   value=\""+data.EMP_NAME+"\"                     ";
		htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" />        ";
		htmlChn += "				</td>    ";
		htmlChn += "			<td class=\"field_name\">담당자P.H<span class=\"acc_txt\"></span></td>   ";
	} else {
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"emp_name\" name=\"emp_name\"   value=\""+data.EMP_NAME+"\"                     ";
		htmlChn += "				class=\"input_short btn_left_input\" readonly=\"readonly\" />        ";
		htmlChn += "				<div class=\"btn_black btn_size_normal select\" id=\"empRegisterBtn\" name=\"empRegisterBtn\">수정</div></td>    ";
		htmlChn += "			<td class=\"field_name\">담당자P.H<span class=\"acc_txt\"></span></td>   ";
	}
	
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"emp_phone\" name=\"emp_phone\"     value=\""+data.EMP_PHONE+"\"                   ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">담당팀 <span                 ";
	htmlChn += "				class=\"acc_txt\"></span></td>                                     ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"team_name\" name=\"team_name\"    value=\""+data.TEAM_NAME+"\"                    ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "			<td class=\"field_name\">담당팀P.H <span class=\"acc_txt\"></span></td>    ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"team_call\" name=\"team_call\"    value=\""+data.TEAM_CALL+"\"                    ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">기업명 <span                 ";
	htmlChn += "				class=\"acc_txt\"></span></td>                                     ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"comp_name\" name=\"comp_name\"     value=\""+data.COMP_NAME+"\"                    ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "			<td class=\"field_name\">기업P.H <span class=\"acc_txt\"></span></td>    ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\" id=\"comp_ph\" name=\"comp_ph\"    value=\""+data.COMP_PH+"\"                   ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">고객명 <span                 ";
	htmlChn += "				class=\"acc_txt\"></span></td>                                     ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\"  id=\"client_name\" name=\"client_name\"   value=\""+data.CLIENT_NAME+"\"                   ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "			<td class=\"field_name\">고객P.H <span class=\"acc_txt\"></span></td>    ";
	htmlChn += "			<td class=\"field_contents\"><input type=\"text\"  id=\"client_ph\" name=\"clinet_ph\"       value=\""+data.CLIENT_PH+"\"               ";
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">팩스 <span                   ";
	htmlChn += "				class=\"acc_txt\"></span></td>                                     ";
	if(data.CLIENT_FAX == null || data.CLIENT_FAX == ""){
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\"    id=\"client_fax\" name=\"client_fax\"   value=\"조회된 데이터가 없습니다.\"                 ";	
	} else {
		
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\"    id=\"client_fax\" name=\"client_fax\"   value=\""+data.CLIENT_FAX+"\"                 ";
	}
	
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "			<td class=\"field_name\">이메일 <span class=\"acc_txt\"></span></td>     ";
	if(data.CLIENT_EMAIL == null || data.CLIENT_EMAIL == ""){
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\"    id=\"client_email\" name=\"client_email\"   value=\"조회된 데이터가 없습니다.\"                 ";	
	} else {
		htmlChn += "			<td class=\"field_contents\"><input type=\"text\"    id=\"client_email\" name=\"client_email\"   value=\""+data.CLIENT_EMAIL+"\"                 ";
		
	}
	
	htmlChn += "				class=\"input_border_0\" readonly=\"readonly\" /></td>               ";
	htmlChn += "		</tr>                                                                    ";
	htmlChn += "		<tr>                                                                     ";
	htmlChn += "			<td class=\"field_name first_field_name\">상품<span                    ";
	htmlChn += "				class=\"acc_txt\"> *</span>                                        ";
	htmlChn += "			</td>                                                                ";
	htmlChn += drawProd();
	
	htmlChn += "		</tr>                                                                    ";
	$("#ChnBtn").attr("src", "resources/images/bss/open_tab.png");
		}
		$("#ChnTbl>tbody").html(htmlChn);
	}
	/*상품목록*/
	function drawProd(){
		var html = "";
		html += "			<td colspan=\"3\" class=\"field_contents\"><select id=\"prod_name\" name=\"prod_name\"  style = \"font-size : 10pt;\"                     ";
		html += "				class=\"input_normal btn_left_input\">";
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "getProdAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				drawProdAll(result.listGoods, result.listService);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		html += "</select>                             ";
		if($("#bssProgNo").val() * 1 > 3){
			
		} else {
			html += "				<div class=\"btn_black btn_size_normal select\" id=\"prodSaveBtn\" name=\"prodSaveBtn\">조회</div></td>    ";
		}
		
		return html;
	}
	function drawProdAll(list, list2){
		var html = "";
		html += drawProdGoods(list);
		html += drawProdService(list2);
		$("#prod_name").html(html);
	}
	/*상품목록리스트 불러오기.*/
	function drawProdGoods(list){
		var html = "";
		if(list.length == 0){
			
		} else {
			for (var i in list){
				html += "<option id=\""+list[i].GOODS_NO+"\" name=\""+list[i].GOODS_NO+"\">상품코드 : "+list[i].GOODS_CODE +" / 상품명 : " + list[i].PROD_NAME + " / 사이즈 : " + list[i].GOODS_SIZE + " / REMARKS : " + list[i].REMARKS + " / 개당가격 : " + list[i].PRICE +" / 수량 : " + list[i].CNT +"</option>";
			}
			return html;
		}
	}
	function drawProdService(list){
		var html = "";
		if(list.length == 0){
			
		} else {
			for (var i in list){
				html += "<option id=\""+list[i].SERVICE_NO+"\" name=\""+list[i].SERVICE_NO+"\">상품코드 : "+list[i].SERVICE_CODE +" / 상품명 : " + list[i].PROD_NAME + " / 기간 : " + list[i].SERVICE_PERIOD + " / REMARKS : " + list[i].REMARKS + " / 설치비용 : " + list[i].INSTALL_PRICE + " / 기간당비용: " + list[i].SERVICE_PRICE +" / 수량 : " + list[i].CNT +"</option>";
			}
			return html;
		}
	}
	/*사업유형 select 만들기*/
	function drawBssType(){
		var html = "";
		html += "			<td class=\"field_name\">사업유형 <span class=\"acc_txt\"> *</span></td> ";
		html += "			<td class=\"field_contents\"><select class=\"input_normal\" id=\"bss_type_name\" name=\"bss_type_name\">   ";
		html += "			</select></td>    ";
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "getBssTypeAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					drawBssTypeSelect(result.list);
				},
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		
		
		return html;
	}
	/*사업유형 내용만들기*/
	function drawBssTypeSelect(list){
		var html = "";
		if(list.length == 0){
			html += "<option>아직 등록된 값이 없습니다. 관리자에게 문의하세요.</option>"
		}
		else {
			
			for(var i in list){
				if($("#BssTypeNo").val() == list[i].BSS_TYPE_NO){
					html += "<option selected=\"selected\" id=\""+list[i].BSS_TYPE_NO+"\" name=\""+list[i].BSS_TYPE_NO+"\" value=\""+list[i].BSS_TYPE_NAME+"\">"+list[i].BSS_TYPE_NAME+"</option>";
				}
				else{
					html += "<option id=\""+list[i].BSS_TYPE_NO+"\" name=\""+list[i].BSS_TYPE_NO+"\" value=\""+list[i].BSS_TYPE_NAME+"\">"+list[i].BSS_TYPE_NAME+"</option>";
				}
				
			}
		}
		$("#bss_type_name").html(html);
	}
	/*매출구분 select만들기*/
	function drawSalesDiv(){
		var html = "";
		html += "			<td class=\"field_name\">매출구분 <span class=\"acc_txt\"> *</span></td> ";
		html += "			<td class=\"field_contents\"><select class=\"input_normal\" id=\"sales_div_name\" name=\"sales_div_name\">   ";
		html += "			</select></td>                                                       ";
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "getBssSalesDivAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				drawSalesdivSelect(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		return html;
	}
	/*매출구분 select 내용만들기*/
	function drawSalesdivSelect(list){
		var html = "";
		if(list.length == 0){
			html += "<option>아직 등록된 값이 없습니다. 관리자에게 문의하세요.</option>"
		}
		else {
			
			for(var i in list){
				if($("#SalesDivNo").val() == list[i].SALES_DIV_NO){
					html += "<option selected=\"selected\" value=\""+list[i].SALES_DIV_NAME+"\" name=\""+list[i].SALES_DIV_NO+"\" id=\""+list[i].SALES_DIV_NO+"\">"+list[i].SALES_DIV_NAME+"</option>";
				}
				else{
					html += "<option id=\""+list[i].SALES_DIV_NO+"\"name=\""+list[i].SALES_DIV_NO+"\" value=\""+list[i].SALES_DIV_NAME+"\">"+list[i].SALES_DIV_NAME+"</option>";
				}
				
			}
		}
		$("#sales_div_name").html(html);
	}
	/*상품명 쓰기*/
	function drawProdName(list){
		
	}
	/*기회파트 이벤트*/
	function chnEvent(){
		/*기회파트 영업시작*/
		$("#bssStart").on("click", function(){
			bssStartPop();
		});
		/*담당자 수정 팝업*/
		$("#empRegisterBtn").on("click", function(){
			empRegisterPop();
			/*담당자 팝업*/
			function empRegisterPop(){
				var html = "";
				html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
				html += "<div>";
				html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
				html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
				html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
				html += "</div>";
				html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
				html += "</form>";
				html += "<table class=\"pop_list\">";
				html += "<colgroup><col width=\"15%\"/><col width=\"20%\"/><col width=\"15%\"/><col width=\"25%\"/><col width=\"25%\"/>";
				html += "<thead>";
				html += "<tr class = \"table_list_header\">";
				html += "<td>번호</td>";
				html += "<td>부서</td>";
				html += "<td>팀</td>";
				html += "<td>이름</td>";
				html += "<td>직급</td>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				html += "<tr class=\"list_contents\">";
				html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
				html += "</tbody>";
				html += "</table>";
				html += "<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
		        html += "</div>";
		        
		        makeNoBtnPopup(1, "담당자찾기", html, true, 600, 600, function() {
		        	getEmpList();
		        	setEmpEvent();
				});
			}
			// 담당자 팝업 이벤트 할당
			function setEmpEvent() {
				// 검색 버튼 클릭 Event
				$("#empSearchBtn").on("click", function() {
					getEmpList();
				});
				// 검색 엔터키 입력 Event
				$("#searchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						$("#empSearchBtn").click();
						return false;
					}
				});
				// 검색 초기화 버튼 클릭 Event
				$("#empCancelBtn").on("click", function() {
					$("#searchTxt").val("");
					getEmpList();
				});	
				// Paging 버튼 클릭 이벤트
				$(".list_paging_area").on("click", "div", function() {
					if(!isNaN($(this).attr("name") * 1)) {
						$("#page").val($(this).attr("name"));
						getEmpList();
					}
				});	
				// 담당자 값 선택 Event
				$(".pop_list>tbody").on("click", "tr", function() {
					var select = $(this).attr("name");
					$("#emp_name").val(select.substring(select.indexOf("_") + 1));
					$("#emp_no").val(select.substring(0, select.indexOf("_")));
					$("#emp_no2").val(select.substring(0, select.indexOf("_")));
					closePopup(1);
				});
			}
			
		});
		/*상품등록팝업*/
		$("#prodSaveBtn").on("click", function(){
			prodPop();
			
		});
	}
	//----------------------------기회에서 사용하는 함수------------------------------
	/*팝업 페이징*/
	function drawListPaging(pb) {
		var html = "";
		html += "<div class=\"btn_paging\" name=\"1\">&lt;&lt;</div>";

		html += "<div class=\"btn_paging\"name=\"";
		html += ($("#page").val() == "1")? "1" : ($("#page").val() * 1 - 1);
		html += "\">&lt;</div>";

		for(var i = pb.startPcount; i <= pb.endPcount; i++) {		
			html += "<div class=\"btn_paging";
			html += ($("#page").val() == i)? "_on\">" : "\" name=\"" + i + "\">";
			html += i + "</div>";
		}
		
		html += "<div class=\"btn_paging\"name=\"";
		html += ($("#page").val() == (pb.maxPcount))? pb.maxPcount : ($("#page").val() * 1 + 1);
		html += "\">&gt;</div>";

		html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;&gt;</div>";
		
		$(".list_paging_area").html(html);
	}
	// 담당자 목록 Get
	function getEmpList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "getBssEmpPopAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawListPaging(result.pb);
				drawEmpList(result.list);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 담당자 목록 draw
	function drawEmpList(list) {
		var html = "";
		
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].EMP_NO + "_" + list[i].EMP_NAME + "\">";
		  		html += "<td>" + list[i].EMP_NO + "</td>";
		  		html += "<td>" + list[i].DEPART_NAME + "</td>";
		  		html += "<td>" + list[i].TEAM_NAME + "</td>";
		  		html += "<td>" + list[i].EMP_NAME + "</td>";
		  		html += "<td>" + list[i].POSI_NAME + "</td>";
				html += "</tr>";
			}
		}
		else {
			html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
			html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			$(".list_paging_area").html("");
		}
		$(".pop_list>tbody").html(html);
	}
	/*상품등록팝업*/
	/*기본틀*/
			function prodPop(){
				var html = "";
				//기회번호
				
				html += "<form action=\"#\" method=\"post\" id=\"prodForm\" name=\"prodForm\">";
				//기회
				html += "<input type=\"hidden\" id=\"chnNo\" name=\"chnNo\" value=\""+${sChnNo}+"\"/>"
				html += "<input type=\"hidden\" id=\"bssProgNo\" name=\"bssProgNo\" value=\""+$("#bssProgNo").val()+"\"/>"
				//진행상태일때 그에 해당하는 영업번호가져오기
				html += "<input type=\"hidden\" id=\"bssNo\" name=\"bssNo\" value=\"\"/>"
				//기존 상품 표의 페이징
				html += "<input type=\"hidden\" name=\"page1\" id=\"page1\" value=\"1\" />";
				//현재 상품 표의 페이징
				html += "<input type=\"hidden\" name=\"page2\" id=\"page2\" value=\"1\" />";
				//기존 상품 표에서 상품눌렸을때 값.
				html += "<input type=\"hidden\" name=\"prodDefaultNo\" id=\"prodDefaultNo\" />";
				html += "<input type=\"hidden\" name=\"getProdPrice\" id=\"getProdPrice\"/>";
				//현재 상품 표에서 상품을 눌렀을때의 값.
				html += "<input type=\"hidden\" name=\"prodNowNo\" id=\"prodNowNo\" />";
				//완료 버튼을 눌렀을 시 현재 상품 표에서의 상품들의 넘버값과 수량값.
				html += "<input type=\"hidden\" name=\"prodNowEndNo\" id=\"prodNowEndNo\" />";
				html += "<input type=\"hidden\" name=\"prodNowEndCnt\" id=\"prodNowEndCnt\" />";
				html += prodDefaultPop();
				html += "<div class=\"prod_middle\">";
				html += prodBtnPop();
				html += "</div>           ";
				html += "		<div class=\"prod_right\">";
				html += prodNowPop();
				html += "</div>            ";
				html += "</form>";
				
				makeTwoBtnPopup(1, "상품등록", html, true, 920, 600, function() {
					prodPopEvent();
					getProdNowList();
				}, "완료", function() {
					prodPopEndEvent();
					//closePopup(1);
				},"취소", function() {
					closePopup(1);
				});
				
			}
	/*상품완료버튼 시 함수 = 수량 저장하기...*/
	function prodPopEndEvent(){
		var arr1 = new Array();
		var arr2 = new Array();
		$("#popNowProdList tr").each(function(i){
			var td = $(this).children();
			var input = td.children("#prodCnt");
			arr2.push(input.val());
			arr1.push($(this).attr("name"));
		});
		for(var i = 1; i < $("#popNowProdList tr").length; i++ ){
			$("#prodNowEndNo").val(arr1[i]);
			$("#prodNowEndCnt").val(arr2[i]);
			console.log($("#prodNowEndNo").val());
			console.log($("#prodNowEndCnt").val());
			console.log($("#popNowProdList tr").length);
				var params = $("#prodForm").serialize();
	
				$.ajax({
					type: "post",
					url: "updateNowProdEndAjax",
					dataType: "json",
					data: params,
					success: function(result) {	
						drawProd();
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
			
			}
		makeOneBtnPopup(2, "수정확인", "수정되었습니다.", true, 400, 200, null, "완료", function() {
			closePopup(2);
				});
		closePopup(1);
	}
	//상품함수이벤트
	function prodPopEvent(){
		console.log($("#bssProgNo").val());
		// 검색 버튼 클릭 Event
		$("#prodSearchBtn").on("click", function() {
			getProdDefaultList();
		});
		// 검색 엔터키 입력 Event
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#prodSearchBtn").click();
				return false;
			}
		});
		// 검색 초기화 버튼 클릭 Event
		$("#prodCancelBtn").on("click", function() {
			$("#searchTxt").val("");
			getProdDefaultList();
		});
		// 기존상품 페이징
		$("#popDefaultProdListPage").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page1").val($(this).attr("name"));
				getProdDefaultList();
			}
		});
		// 현재상품 페이징
		$("#popNowProdListPage").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page2").val($(this).attr("name"));
				getProdNowList();
			}
		});
		//상품등록
		$("#prod_update").on("click", function(){
			$("#popNowProdList>tbody>tr").css("background-color", "white");
			$("#popNowProdList>tbody>tr").removeClass("prod_on");
			
				var params = $("#prodForm").serialize();

				$.ajax({
					type: "post",
					url: "getPopBssNoProdAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						if($("#bssProgNo").val() *1 > 1){
							$("#bssNo").val(result.cnt);
						}
						var params = $("#prodForm").serialize();

						$.ajax({
							type: "post",
							url: "updateNowProdAjax",
							dataType: "json",
							data: params,
							success: function(result) {
								getProdNowList();
							},
							error : function(request, status, error) {
								console.log("status : " + request.status);
								console.log("text : " + request.responseTest);
								console.log("error : " + error);
							}
						});
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
		});
		//상품삭제
		$("#prod_delete").on("click", function(){
			var params = $("#prodForm").serialize();

			$.ajax({
				type: "post",
				url: "getPopBssNoProdAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if($("#bssProgNo").val() *1 > 1){
						$("#bssNo").val(result.cnt);
					}
						var params = $("#prodForm").serialize();
			
						$.ajax({
							type: "post",
							url: "deleteNowProdAjax",
							dataType: "json",
							data: params,
							success: function(result) {
								getProdNowList();
							},
							error : function(request, status, error) {
								console.log("status : " + request.status);
								console.log("text : " + request.responseTest);
								console.log("error : " + error);
							}
						});
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		});
	}
			/*기존상품조회*/
			function prodDefaultPop(){
				var html = "";
				html += "		<div class=\"prod_left\">                   ";
				html += "		<div class=\"prod_left_top\">               ";
				html += "	<table class=\"pop_tbl\">                                                    ";
				html += "	<colgroup>                                                                 ";
				html += "		<col width=\"20%\" />                   	                                 ";
				html += "		<col width=\"80%\" />                                                    ";
				html += "	</colgroup>                                                                ";
				html += "	<tbody>                                                                    ";
				html += "		<tr>                                                                   ";
				html += drawSelectProdDiv();
				html += "		</tr>                                                                  ";
				html += "		<tr>                                                                   ";
				html += drawSelectProdType();
				html += "		</tr>                                                                  ";
				html += "		</tbody>                                                               ";
				html += "	</table>              ";
				html += "		</div>                                    ";
				html += "		<div class=\"prod_left_bottom\">";
				html += "<div>";
				html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
				html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"prodSearchBtn\">";
				html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"prodCancelBtn\">";
				html += "</div>";
				html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
				html += "<table class=\"pop_list\" id=\"popDefaultProdList\">";
				html += "<colgroup><col width=\"110px\"/><col width=\"45px\"/><col width=\"76px\"/><col width=\"48px\"/>";
				html += "<thead>";
				html += "<tr class = \"table_list_header\">";
				html += "<td>상품명</td>";
				html += "<td>코드</td>";
				html += "<td>사이즈<br />(기간)</td>";
				html += "<td>판매가</td>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				html += "<tr class=\"list_contents1\">";
				html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
				html += "</tbody>";
				html += "</table>";
				html += "<div class=\"list_paging_area\" id=\"popDefaultProdListPage\" style=\"margin-top: 0px;\">";
		        html += "</div>";
		        html += "</div>      ";
				html += "		</div>                                    ";
				return html;
			}
			//기본상품 리스트 값가져오기
			function getProdDefaultList(){
				var params = $("#prodForm").serialize();

				$.ajax({
					type: "post",
					url: "getProdDefaultListAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						drawProdDefaultList(result.list);
						drawListPaging1(result.pb);
						getProdDefaultListEvent();
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
			}
			//기존상품 리스트를 눌렀을 경우
			function getProdDefaultListEvent(){
				$("#popDefaultProdList>tbody").on("click", "tr", function(){
					if($("#prodDefaultNo").val() != null && $("#prodDefaultNo").val() != ""){
						$("#popDefaultProdList>tbody>tr").css("background-color", "white");
						$("#popDefaultProdList>tbody>tr").removeClass("prod_on");
					}
					$(this).addClass("prod_on");
					$("#prodDefaultNo").val($(this).attr("name"));
					$(this).css("background-color", "#eee");
						$("#getProdPrice").val($(this).children("#prodPrice").html());
				});
			}
			//현재상품리스트 눌렀을 경우
			function getProdNowListEvent(){
				$("#popNowProdList>tbody").on("click", "tr", function(){
					if($("#prodNowNo").val() != null && $("#prodNowNo").val() != ""){
						$("#popNowProdList>tbody>tr").css("background-color", "white");
						$("#popNowProdList>tbody>tr").removeClass("prod_on");
					}
					$(this).addClass("prod_on");
					$("#prodNowNo").val($(this).attr("name"));
					console.log($("#prodNowNo").val());
					$(this).css("background-color", "#eee");
				});
			}
			/*기존상품 표 그리기*/
			function drawProdDefaultList(list){
				var html = "";
				
				if(list.length > 0) {
					for(var i in list) {
						html += "<tr class=\"list_contents\" id=\"" + list[i].PROD_NO+"\" name=\"" + list[i].PROD_NO+"\">";
				  		html += "<td id=\"prodName\">" + list[i].NAME + "</td>";
				  		html += "<td id=\"prodCode\">" + list[i].CODE + "</td>";
				  		html += "<td id=\"prodSize\">" + list[i].SIZ + "</td>";
				  		html += "<td id=\"prodPrice\">" + list[i].PRICE	 + "</td>";
						html += "</tr>";
					}
				}
				else {
					html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
					html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
					html += "</tr>";
					$(".list_paging_area1").html("");
				}
				$("#popDefaultProdList>tbody").html(html);
			}
			/*기존상품 페이징*/
			function drawListPaging1(pb) {
				var html = "";
				html += "<div class=\"btn_paging\"  name=\"1\">&lt;&lt;</div>";

				html += "<div class=\"btn_paging\"  name=\"";
				html += ($("#page1").val() == "1")? "1" : ($("#page1").val() * 1 - 1);
				html += "\">&lt;</div>";

				for(var i = pb.startPcount; i <= pb.endPcount; i++) {		
					html += "<div class=\"btn_paging";
					html += ($("#page1").val() == i)? "_on\">" : "\" name=\"" + i + "\">";
					html += i + "</div>";
				}
				
				html += "<div class=\"btn_paging\" name=\"";
				html += ($("#page1").val() == (pb.maxPcount))? pb.maxPcount : ($("#page1").val() * 1 + 1);
				html += "\">&gt;</div>";

				html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;&gt;</div>";
				
				$("#popDefaultProdListPage").html(html);
			}
			/*사업구분Select가져오기*/
			function drawSelectProdDiv(){
				var html = "";
				html += "			<th class=\"td_font\">상품구분</th>                                      ";
				html += "			<td  class=\"field_contents\"><select class=\"input_normal\" id=\"div_name\" name=\"div_name\"  >       ";
				var params = $("#actionForm").serialize();

				$.ajax({
					type: "post",
					url: "getSelectProdDivAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						ProdDiv(result.list);
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
				html += "					</select></td>                                             ";
				return html;
			}
			
			/*사업유형Select가져오기*/
			function drawSelectProdType(){
				var html = "";
				html += "			<th class=\"td_font\">상품유형</th>                                      ";
				html += "			<td  class=\"field_contents\"><select class=\"input_normal\" id=\"type_name\" name=\"type_name\"  >       ";
				var params = $("#actionForm").serialize();

				$.ajax({
					type: "post",
					url: "getSelectProdTypeAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						
						ProdType(result.list);
						
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
				html += "					</select></td>                                             ";
				return html;
			}
			/*상품구분*/
			function ProdType(list){
				var html = "";
				if(list.length == 0){
					html += "<option>아직 등록된 값이 없습니다. 관리자에게 문의하세요.</option>"
				}
				else {
					html += "<option id=\"0\" value=\"0\">전부</option>"
					for(var i in list){
							html += "<option value=\""+list[i].TYPE_NO+"\">"+list[i].TYPE_NO+"</option>";
					}
				}
				$("#type_name").html(html);
			}
			function ProdDiv(list){
				var html = "";
				if(list.length == 0){
					html += "<option>아직 등록된 값이 없습니다. 관리자에게 문의하세요.</option>"
				}
				else {
					html += "<option id=\"0\" value=\"0\">전부</option>"
					for(var i in list){
							html += "<option value=\""+list[i].DIV_NO+"\">";
							if(list[i].DIV_NO == "1"){
								html += "제품";
							}
							else {
								html += "서비스";
							}
							html += "</option>";
					}
				}
				$("#div_name").html(html);
			}
			
			/*추가한 상품조회*/
			function prodNowPop(){
				var html = "";
				html += "<div style=\"line-height : 50px; font-size : 20pt; font-weight : bold;\">";
				html += "<span>현재등록상품</span>";
				html += "</div>";
 				html += "<table class=\"pop_list pop_list_top_none\" id=\"popNowProdList\">";
				html += "<colgroup><col width=\"45px\"/><col width=\"110px\"/><col width=\"76px\"/><col width=\"48px\"/>";
				html += "<thead>";
				html += "<tr class = \"table_list_header\">";
				html += "<td>번호</td>";
				html += "<td>상품명</td>";
				html += "<td>코드</td>";
				html += "<td>수량<br /> (기간)</td>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				html += "<tr class=\"list_contents\">";
				html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
				html += "</tbody>";
				html += "</table>";
				html += "<div class=\"list_paging_area\" id=\"popNowProdListPage\" style=\"margin-top: 0px;\">";
		        html += "</div>";
				return html;
			}
			//현재상품 가져오기
			function getProdNowList(){
				var params = $("#prodForm").serialize();

				$.ajax({
					type: "post",
					url: "getProdNowistAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						drawListPaging2(result.pb);
						drawProdNowList(result.list);
						getProdNowListEvent();
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
			}
			/*현재상품 표 그리기*/
			function drawProdNowList(list){
				var html = "";	
				
				if(list.length > 0) {
					for(var i in list) {
						html += "<tr class=\"list_contents\" id=\""+i+"\" name=\"" + list[i].PROD_NO +"\">";
						html += "<td>" + list[i].RNUM + "</td>";
				  		html += "<td>" + list[i].NAME + "</td>";
				  		html += "<td>" + list[i].CODE + "</td>";
				  		html += "<td><input type=\"text\" class=\"input_normal\" id=\"prodCnt\" name=\"prodCnt\" style=\"text-align : center;\" value=\""+ list[i].CNT + "\"></td>";
						html += "</tr>";
					}
				}
				else {
					html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
					html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
					html += "</tr>";
					$(".list_paging_area2").html("");
				}
				$("#popNowProdList>tbody").html(html);
			}
			/*기존상품 페이징*/
			function drawListPaging2(pb) {
				var html = "";
				html += "<div class=\"btn_paging\"  name=\"1\">&lt;&lt;</div>";

				html += "<div class=\"btn_paging\"  name=\"";
				html += ($("#page2").val() == "1")? "1" : ($("#page2").val() * 1 - 1);
				html += "\">&lt;</div>";

				for(var i = pb.startPcount; i <= pb.endPcount; i++) {		
					html += "<div class=\"btn_paging";
					html += ($("#page2").val() == i)? "_on\">" : "\" name=\"" + i + "\">";
					html += i + "</div>";
				}
				
				html += "<div class=\"btn_paging\" name=\"";
				html += ($("#page2").val() == (pb.maxPcount))? pb.maxPcount : ($("#page2").val() * 1 + 1);
				html += "\">&gt;</div>";

				html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;&gt;</div>";
				
				$("#popNowProdListPage").html(html);
			}
			
			/*상품등록버튼*/
			function prodBtnPop(){
				var html = "";
				html +="<div class=\"prod_middle_btn\">";
				html += "<img src =\"resources/images/bss/update.png\" alt=\"\" width=\"50px\" height=\"50px\" class=\"prod_update\" id=\"prod_update\">";
				html += "<img src =\"resources/images/bss/delete.png\" alt=\"\" width=\"50px\" height=\"50px\" class=\"prod_delete\" id=\"prod_delete\">";
				html +="</div>";
				return html;
			}
	
	
	
	/*제안 그리기*/
	var htmlSgt = "";
	function redrawSgt(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type: "post",
			url: "getSgtAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				redrawSgtCon(result.data)
				getSgtChnDt();
				SgtEvent();
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	function redrawSgtCon(data){
			
		
		if(htmlSgt != ""){
			htmlSgt = "";
			$("#SgtBtn").attr("src", "resources/images/bss/close_tab.png");
		}
		else {
			htmlSgt += "			<tr>                                                                    ";
			htmlSgt += "			<td class=\"field_name first_field_name\">제안시작일 <span                ";
			htmlSgt += "				class=\"acc_txt\"></span></td>                                        ";
			htmlSgt += "			<td class=\"field_contents\"><input type=\"text\" id=\"chn_date\" name=\"chn_date\"                          ";
			htmlSgt += "				class=\"input_border_0\" readonly=\"readonly\" /></td>                  ";
			htmlSgt += "			<td class=\"field_name\">제안마감일<span class=\"acc_txt\"> *</span>       ";
			htmlSgt += "			</td>                                                                   ";
			if($("#bssProgNo").val() * 1 == 2){
				htmlSgt += "			<td class=\"field_contents\"><input type=\"text\" id=\"sgt_date\" name=\"sgt_date\"                          ";
				htmlSgt += "				class=\"input_short btn_left_input\" readonly=\"readonly\" />           ";
				htmlSgt += "				<div class=\"btn_black btn_size_normal select\" id=\"sgtEndBtn\" name=\"sgtEndBtn\">마감</div></td>       ";
			} else {
				htmlSgt += "			<td class=\"field_contents\"><input type=\"text\" id=\"sgt_date\" name=\"sgt_date\"                          ";
				htmlSgt += "				class=\"input_border_0\" readonly=\"readonly\" value=\""+data.SGT_DATE+"\" />           ";
				htmlSgt += "				</td>       ";
			}
			
			htmlSgt += "			</tr>                                                                   ";
			htmlSgt += "			<tr>                                                                    ";
			htmlSgt += "				<td class=\"field_name first_field_name\">첨부파일 <span              ";
			htmlSgt += "					class=\"acc_txt\"></span></td>                                    ";
			htmlSgt += "				<td colspan=\"3\" class=\"field_contents\">";
			
			if($("#bssProgNo").val() * 1 == 2){
				htmlSgt += "<input type=\"hidden\" name=\"attachFile\" id=\"attachFile\" />";
				htmlSgt += "<input type=\"file\" name=\"attach\" class=\"sgtAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
				htmlSgt += "<select  id=\"sgt_attach_name\" name=\"sgt_attach_name\" class=\"input_normal two_btn_left_input\">";
				htmlSgt += "</select>";
				htmlSgt += "<div class=\"btn_black btn_size_normal select\" id=\"sgtAttachSaveBtn\" name=\"sgtAttachSaveBtn\">등록</div>";
				htmlSgt += "<div class=\"btn_black btn_size_normal select\" id=\"sgtAttachDelBtn\" name=\"sgtAttachDelBtn\">삭제</div></td>";
			} else {
				htmlSgt += "<input type=\"hidden\" name=\"attachFile\" id=\"attachFile\" />";
				htmlSgt += "<input type=\"file\" name=\"attach\" class=\"sgtAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
				htmlSgt += "<select  id=\"sgt_attach_name\" name=\"sgt_attach_name\" class=\"input_normal\">";
				htmlSgt += "</select>";
			}
			
			htmlSgt += "</tr>";
			$("#SgtBtn").attr("src", "resources/images/bss/open_tab.png");
		}
		$("#SgtTbl>tbody").html(htmlSgt);
	}
	/*날짜읽어오기..*/
	function getSgtChnDt(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type: "post",
			url: "getSgtChnDtAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				$("#chn_date").val(result.data.CHN_DATE);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	/*제안이벤트*/
	function SgtEvent(){
		getSgtChnDt();
		/*제안마감팝업*/
		$("#sgtEndBtn").on("click", function(){
			bssProgEndPop();
		});
		
		/* 첨부자료 등록 버튼 */
		$("#sgtAttachSaveBtn").on("click",function(){
			$("#actionForm").attr("action", "fileUploadAjax");
			$(".sgtAttachUpload").click();
			//console.log(responseText);
		});
		
		/* 첨부자료 등록 */
		$(".sgtAttachUpload").on("change", function() {
			var dataForm = $("#actionForm");
			
			dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
				success: function(responseText, statusText){
					console.log(responseText);
					$("#attachFile").val(responseText.fileName[0]);
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						
						type : "post",
						dataType : "json",
						url : "sgtInsertAttatchAjax",
						data : params,
						
						success : function(result){
							 if(result.res == "SUCCESS"){
								 $("#attachNo").val("");
								 reloadSgtAttachList();
								 	/* closePopup(1); */
								}
								else{
									alert("첨부자료 등록에 실패하였습니다.");
								}
						},
						error : function(){
							console.log("status : "+request.status);
							console.log("text : "+request.responseText);
							console.log("error : "+error);
						}
					});
				}, //ajax error
				error: function(){
					alert("에러발생!!"); 
				}
			});
			dataForm.submit();
		});
		
		reloadSgtAttachList();
		
		/* 첨부자료 삭제 */
		$("#sgtAttachDelBtn").on("click", function() {
			
			makeTwoBtnPopup(2, "첨부자료 삭제 확인", "정말로 삭제하시겠습니까?", flase, 400, 300, "확인", function() {
					$("#attachNo").val($("#sgt_attach_name option:selected").val())
					
					var params = $("#actionForm").serialize();

					$.ajax({
						type : "post", //데이터 전송방식
						url : "sgtAttatchDelAjax", //주소
						dataType : "json", //데이터 전송 규칙
						data : params, //보낼 데이터
						// {키:값, 키:값,...} -> json
						success : function(result) {
							reloadSgtAttachList();
						},
						error : function(request, status, error) {
							console.log("text : " + request.reponseText);
							console.log("error : " + error);
						}
					});
			}, "취소", function() {
						closePopup(2);
					});
		});
	}
	//--------------------------------제안에서 사용하는 함수------------------//
	
	/*협상 그리기*/
	var htmlNgt = "";
	function redrawNgt(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type: "post",
			url: "getNgtAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				redrawNgtCon(result.data);
				NgtEvent();
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	function redrawNgtCon(data){
		if(htmlNgt != ""){
			htmlNgt = "";
			$("#NgtBtn").attr("src", "resources/images/bss/close_tab.png");
		}
		else {
htmlNgt += "			<tr>                                                             ";
htmlNgt += "			<td class=\"field_name first_field_name\">협상시작일 <span         ";
htmlNgt += "				class=\"acc_txt\"></span></td>                                 ";
htmlNgt += "			<td class=\"field_contents\"><input type=\"text\" id=\"ngt_sdate\" name=\"ngt_sdate\"  value=\""+data.NGT_SDATE+"\"                 ";
htmlNgt += "				class=\"input_border_0\" readonly=\"readonly\" /></td>           ";
htmlNgt += "			<td class=\"field_name \">협상마감일<span class=\"acc_txt\"> *</span>";
htmlNgt += "			</td>                                                            ";
if($("#bssProgNo").val() * 1 == 3){
	htmlNgt += "			<td class=\"field_contents\"><input type=\"text\"  id=\"ngt_edate\" name=\"ngt_edate\"                  ";
	htmlNgt += "				class=\"input_short btn_left_input\" readonly=\"readonly\" />    ";
	htmlNgt += "				<div class=\"btn_black btn_size_normal select\" id=\"ngtEndBtn\" name=\"ngtEndBtn\">마감</div></td>";
} else {
	if(data.NGT_EDATE != null){
		htmlNgt += "			<td class=\"field_contents\"><input type=\"text\"  id=\"ngt_edate\" name=\"ngt_edate\"  value=\""+data.NGT_EDATE+"\"                 ";
		htmlNgt += "				class=\"input_border_0\" readonly=\"readonly\" />    ";
		htmlNgt += "				</td>";
	} else {
		htmlNgt += "			<td class=\"field_contents\"><input type=\"text\"  id=\"ngt_edate\" name=\"ngt_edate\"  value=\"\"                 ";
		htmlNgt += "				class=\"input_border_0\" readonly=\"readonly\" />    ";
		htmlNgt += "				</td>";
	}
	
}

htmlNgt += "		</tr>                                                                ";
htmlNgt += "		<tr>                                                                 ";
htmlNgt += "			<td class=\"field_name first_field_name\">첨부파일 <span           ";
htmlNgt += "				class=\"acc_txt\"></span></td>                                 ";

if($("#bssProgNo").val() * 1 == 3){
	htmlNgt += "			<td colspan=\"3\" class=\"field_contents\"><select  id=\"ngt_attach_name\" name=\"ngt_attach_name\"                 ";
	htmlNgt += "				class=\"input_normal two_btn_left_input\">                         ";
	htmlNgt += "<input type=\"file\" name=\"attach\" class=\"ngtAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
	htmlNgt += "			</select>                                                        ";
	htmlNgt += "				<div class=\"btn_black btn_size_normal select\" id=\"ngtAttachSaveBtn\" name=\"ngtAttachSaveBtn\">등록</div>";
	htmlNgt += "				<div class=\"btn_black btn_size_normal select\" id=\"ngtAttachDelBtn\" name=\"ngtAttachDelBtn\">삭제</div></td>";
} else {
	htmlNgt += "			<td colspan=\"3\" class=\"field_contents\"><select  id=\"ngt_attach_name\" name=\"ngt_attach_name\"                 ";
	htmlNgt += "				class=\"input_normal\">                         ";
	htmlNgt += "<input type=\"file\" name=\"attach\" class=\"ngtAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
	htmlNgt += "			</select>                                                        ";
}

htmlNgt += "		</tr>                                                                ";
$("#NgtBtn").attr("src", "resources/images/bss/open_tab.png");
		}
		$("#NgtTbl>tbody").html(htmlNgt);
	}
	/*협상이벤트*/
	function NgtEvent(){
		/*협상마감팝업*/
		$("#ngtEndBtn").on("click", function(){
			bssProgEndPop();
		});
		
		/* 첨부자료 등록 버튼 */
		$("#ngtAttachSaveBtn").on("click",function(){
			$("#actionForm").attr("action", "fileUploadAjax");
			$(".ngtAttachUpload").click();
			//console.log(responseText);
		});
		
		/* 첨부자료 등록 */
		$(".ngtAttachUpload").on("change", function() {
			var dataForm = $("#actionForm");
			
			dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
				success: function(responseText, statusText){
					console.log(responseText);
					$("#attachFile").val(responseText.fileName[0]);
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						
						type : "post",
						dataType : "json",
						url : "ngtInsertAttatchAjax",
						data : params,
						
						success : function(result){
							 if(result.res == "SUCCESS"){
								 $("#attachNo").val("");
								 reloadNgtAttachList();
								 	/* closePopup(1); */
								}
								else{
									alert("첨부자료 등록에 실패하였습니다.");
								}
						},
						error : function(){
							console.log("status : "+request.status);
							console.log("text : "+request.responseText);
							console.log("error : "+error);
						}
					});
				}, //ajax error
				error: function(){
					alert("에러발생!!"); 
				}
			});
			dataForm.submit();
		});
		
		reloadNgtAttachList();
		
		/* 첨부자료 삭제 */
		$("#ngtAttachDelBtn").on("click", function() {
			
			makeTwoBtnPopup(2, "첨부자료 삭제 확인", "정말로 삭제하시겠습니까?", flase, 400, 300, "확인", function() {
					$("#attachNo").val($("#ngt_attach_name option:selected").val())
					
					var params = $("#actionForm").serialize();

					$.ajax({
						type : "post", //데이터 전송방식
						url : "ngtAttatchDelAjax", //주소
						dataType : "json", //데이터 전송 규칙
						data : params, //보낼 데이터
						// {키:값, 키:값,...} -> json
						success : function(result) {
							reloadNgtAttachList();
						},
						error : function(request, status, error) {
							console.log("text : " + request.reponseText);
							console.log("error : " + error);
						}
					});
				}, "취소", function() {
						closePopup(2);
			});
		});
		
	}
	
	var htmlCtrack = "";
	/*계약 그리기*/
	function redrawCtrack(){
		var params = $("#actionForm").serialize();
		$.ajax({
			
			type : "post", //데이터 전송방식
			url : "getCtractAjax	", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			success : function(result){
				redrawCtrackCon(result.data);
				ctrackEvent();
			},
			error : function(){
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
		});
	}
	function redrawCtrackCon(data){
		if(htmlCtrack != ""){
			htmlCtrack = "";
			
			$("#ctrackBtn").attr("src", "resources/images/bss/close_tab.png");
		}
		else {
			if(data != null){
				htmlCtrack += "<input type=\"hidden\" id=\"deperNo\" name=\"deperNo\" value=\"0\">";
				htmlCtrack += "		<tr>                                                                    ";
				htmlCtrack += "		<td class=\"field_name first_field_name\">계약일 <span                    ";
				htmlCtrack += "			class=\"acc_txt\"></span></td>                                        ";
				if($("#bssProgNo").val() * 1 == 7){
					htmlCtrack += "		<td class=\"field_contents\"><input type=\"text\"   id=\"ctract_date\" name=\"ctract_date\"  value=\""+data.CTRACT_DATE+"\"                       ";
					htmlCtrack += "			class=\"input_border_0\" readonly=\"readonly\" /></td>                  ";	
				}
				else {
					htmlCtrack += "		<td class=\"field_contents\"><input type=\"text\"   id=\"ctract_date\" name=\"ctract_date\"  value=\"\"                       ";
					htmlCtrack += "			class=\"input_border_0\" readonly=\"readonly\" /></td>                  ";
				}
				htmlCtrack += "		<td class=\"field_name \">입금상태<span class=\"acc_txt\"> *</span>         ";
				htmlCtrack += "		</td>                                                                   ";
				console.log($("#bssProgNo").val());
				if($("#bssProgNo").val() * 1 == 7){
					htmlCtrack += "		<td class=\"field_contents\"><select  id=\"credit_type\" name=\"credit_type\"                                    ";
					htmlCtrack += "			class=\"input_normal\">                                ";
					htmlCtrack += "				<option value=\"2\">유</option>                                               ";
					htmlCtrack += "		</select> </td>";	
				}
				else if($("#bssProgNo").val() * 1 != 4){
					htmlCtrack += "		<td class=\"field_contents\"><select  id=\"credit_type\" name=\"credit_type\"                                    ";
					htmlCtrack += "			class=\"input_normal\">                                ";
					htmlCtrack += "				<option value=\"1\">무</option>                                               ";
					htmlCtrack += "		</select> </td>";
				}
				else {
					htmlCtrack += "		<td class=\"field_contents\"><select  id=\"credit_type\" name=\"credit_type\"                                    ";
					htmlCtrack += "			class=\"input_normal btn_left_input\">                                ";
					htmlCtrack += "				<option selected=\"selected\" value=\"1\">무</option>                           ";
					htmlCtrack += "				<option value=\"2\">유</option>                                               ";
					htmlCtrack += "		</select> ";
					htmlCtrack += "			<div class=\"btn_black btn_size_normal select\" id=\"ctrackEndBtn\" name=\"ctrackEndBtn\">마감</div></td>       ";
				}
				htmlCtrack += "		</tr>                                                   	                ";
				htmlCtrack += "		<tr>                                                                    ";
				htmlCtrack += "			<td class=\"field_name first_field_name\">예금주명<span               ";
				htmlCtrack += "				class=\"acc_txt\"> *</span>                                       ";
				htmlCtrack += "			</td>                                                               ";
					
				if($("#bssProgNo").val() * 1 == 7){
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"  id=\"deper\" name=\"deper\"  value=\""+data.DEPER+"\"                    ";
					htmlCtrack += "				class=\"input_border_0\" readonly=\"readonly\" />       ";
					htmlCtrack += "				</td>   ";
				} else if($("#bssProgNo").val() * 1 == 4){
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"  id=\"deper\" name=\"deper\"  value=\""+data.DEPER+"\"                     ";
					htmlCtrack += "				class=\"input_normal btn_left_input\" readonly=\"readonly\" />       ";
					htmlCtrack += "<div class=\"btn_black btn_size_normal select\" id=\"deperSrchBtn\" name=\"deperSrchBtn\">찾기</div></td>";
				}
				else {
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"  id=\"deper\" name=\"deper\"  value=\"\"                    ";
					htmlCtrack += "				class=\"input_border_0\" readonly=\"readonly\" />       ";
					htmlCtrack += "				</td>   ";
				}
				if($("#bssProgNo").val() * 1 == 7 || $("#bssProgNo").val() == 4){
					htmlCtrack += "			<td class=\"field_name\">계좌번호 <span class=\"acc_txt\"></span></td>";
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"   id=\"account_no\" name=\"account_no\"  value=\""+data.ACCOUNT_NO+"\"                ";
					htmlCtrack += "				class=\"input_border_0\" readonly=\"readonly\" /></td>              ";
				}
				else {
					htmlCtrack += "			<td class=\"field_name\">계좌번호 <span class=\"acc_txt\"></span></td>";
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"   id=\"account_no\" name=\"account_no\"                  ";
					htmlCtrack += "				class=\"input_border_0\" readonly=\"readonly\" /></td>              ";
				}
				
				
				htmlCtrack += "		</tr>                                                                   ";
				htmlCtrack += "		<tr>                                                                 ";
				htmlCtrack += "			<td class=\"field_name first_field_name\">첨부파일 <span      ";
				htmlCtrack += "				class=\"acc_txt\"></span></td>                                 ";
				if($("#bssProgNo").val() * 1 == 4){
					htmlCtrack += "			<td colspan=\"3\" class=\"field_contents\"><select id=\"ctract_attach_name\" name=\"ctract_attach_name\"                  ";
					htmlCtrack += "				class=\"input_normal two_btn_left_input\">                         ";
					htmlCtrack += "			</select>                                                        ";
					htmlCtrack += "<input type=\"file\" name=\"attach\" class=\"ctractAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
					htmlCtrack += "				<div class=\"btn_black btn_size_normal select\" id=\"ctractAttachSaveBtn\" name=\"ctractAttachSaveBtn\">등록</div>";
					htmlCtrack += "				<div class=\"btn_black btn_size_normal select\" id=\"ctractAttachDelBtn\" name=\"ctractAttachDelBtn\">삭제</div></td>";
				} else {
					htmlCtrack += "			<td colspan=\"3\" class=\"field_contents\"><select id=\"ctract_attach_name\" name=\"ctract_attach_name\"                  ";
					htmlCtrack += "				class=\"input_normal\">                         ";
					htmlCtrack += "			</select>                                                        ";
					htmlCtrack += "<input type=\"file\" name=\"attach\" class=\"ctractAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
				}
				
				htmlCtrack += "		</tr>                                                                ";
				$("#ctrackBtn").attr("src", "resources/images/bss/open_tab.png");
			}
			else {
				htmlCtrack += "<input type=\"hidden\" id=\"deperNo\" name=\"deperNo\" value=\"0\">";
				htmlCtrack += "		<tr>                                                                    ";
				htmlCtrack += "		<td class=\"field_name first_field_name\">계약일 <span                    ";
				htmlCtrack += "			class=\"acc_txt\"></span></td>                                        ";
				if($("#bssProgNo").val() * 1 == 7){
					htmlCtrack += "		<td class=\"field_contents\"><input type=\"text\"   id=\"ctract_date\" name=\"ctract_date\"  value=\""+data.CTRACT_DATE+"\"                       ";
					htmlCtrack += "			class=\"input_border_0\" readonly=\"readonly\" /></td>                  ";	
				}
				else {
					htmlCtrack += "		<td class=\"field_contents\"><input type=\"text\"   id=\"ctract_date\" name=\"ctract_date\"  value=\"\"                       ";
					htmlCtrack += "			class=\"input_border_0\" readonly=\"readonly\" /></td>                  ";
				}
				htmlCtrack += "		<td class=\"field_name \">입금상태<span class=\"acc_txt\"> *</span>         ";
				htmlCtrack += "		</td>                                                                   ";
				if($("#bssProgNo").val() * 1 != 4 && $("#bssProgNo").val() * 1 != 7){
					htmlCtrack += "		<td class=\"field_contents\"><select  id=\"credit_type\" name=\"credit_type\"                                    ";
					htmlCtrack += "			class=\"input_normal\">                                ";
					htmlCtrack += "				<option selected=\"selected\" value=\"1\">무</option>                           ";
					htmlCtrack += "		</select> ";
					htmlCtrack += "			</td>       ";
				} else {
					htmlCtrack += "		<td class=\"field_contents\"><select  id=\"credit_type\" name=\"credit_type\"                                    ";
					htmlCtrack += "			class=\"input_normal btn_left_input\">                                ";
					htmlCtrack += "				<option selected=\"selected\" value=\"1\">무</option>                           ";
					htmlCtrack += "				<option value=\"2\">유</option>                                               ";
					htmlCtrack += "		</select> ";
					htmlCtrack += "			<div class=\"btn_black btn_size_normal select\" id=\"ctrackEndBtn\" name=\"ctrackEndBtn\">마감</div></td>       ";
				}
				htmlCtrack += "		</tr>                                                   	                ";
				htmlCtrack += "		<tr>                                                                    ";
				htmlCtrack += "			<td class=\"field_name first_field_name\">예금주명<span               ";
				htmlCtrack += "				class=\"acc_txt\"> *</span>                                       ";
				htmlCtrack += "			</td>                                                               ";
					
					if($("#bssProgNo").val() * 1 == 4){
						htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"  id=\"deper\" name=\"deper\"  value=\"\"                    ";
						htmlCtrack += "				class=\"input_normal btn_left_input\" readonly=\"readonly\" />       ";
						htmlCtrack += "<div class=\"btn_black btn_size_normal select\" id=\"deperSrchBtn\" name=\"deperSrchBtn\">찾기</div></td>";
					}
					else {
						htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"  id=\"deper\" name=\"deper\"  value=\"\"                    ";
						htmlCtrack += "				class=\"input_normal\" readonly=\"readonly\" />       ";
						htmlCtrack += "</td>";
					}
					htmlCtrack += "			<td class=\"field_name\">계좌번호 <span class=\"acc_txt\"></span></td>";
					htmlCtrack += "			<td class=\"field_contents\"><input type=\"text\"   id=\"account_no\" name=\"account_no\"                  ";
					htmlCtrack += "				class=\"input_border_0\" readonly=\"readonly\" /></td>              ";
					
				htmlCtrack += "		</tr>                                                                   ";
				htmlCtrack += "		<tr>                                                                 ";
				htmlCtrack += "			<td class=\"field_name first_field_name\">첨부파일 <span      ";
				htmlCtrack += "				class=\"acc_txt\"></span></td>                                 ";
				if($("#bssProgNo").val() * 1 == 4){
					htmlCtrack += "			<td colspan=\"3\" class=\"field_contents\"><select id=\"ctract_attach_name\" name=\"ctract_attach_name\"                  ";
					htmlCtrack += "				class=\"input_normal two_btn_left_input\">                         ";
					htmlCtrack += "			</select>                                                        ";
					htmlCtrack += "<input type=\"file\" name=\"attach\" class=\"ctractAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
					htmlCtrack += "				<div class=\"btn_black btn_size_normal select\" id=\"ctractAttachSaveBtn\" name=\"ctractAttachSaveBtn\">등록</div>";
					htmlCtrack += "				<div class=\"btn_black btn_size_normal select\" id=\"ctractAttachDelBtn\" name=\"ctractAttachDelBtn\">삭제</div></td>";
				} else {
					htmlCtrack += "			<td colspan=\"3\" class=\"field_contents\"><select id=\"ctract_attach_name\" name=\"ctract_attach_name\"                  ";
					htmlCtrack += "				class=\"input_normal\">                         ";
					htmlCtrack += "			</select>                                                        ";
					htmlCtrack += "<input type=\"file\" name=\"attach\" class=\"ctractAttachUpload\" accept=\"image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*\"/>";
				}
				
				htmlCtrack += "		</tr>                                                                ";
				$("#ctrackBtn").attr("src", "resources/images/bss/open_tab.png");
			}
		}
		$("#ctrackTbl>tbody").html(htmlCtrack);
	}
	/*계약이벤트*/
	function ctrackEvent(){
		
		/*계약마감팝업*/
		$("#ctrackEndBtn").on("click", function(){
			bssProgEndPop();
		})
		/*예금주 찾기 팝업*/
		$("#deperSrchBtn").on("click", function(){
			deperSrchPop();
			setDepEvent();
		});
		
		/* 첨부자료 등록 버튼 */
		$("#ctractAttachSaveBtn").on("click",function(){
			$("#actionForm").attr("action", "fileUploadAjax");
			$(".ctractAttachUpload").click();
			//console.log(responseText);
		});
		/* 첨부자료 등록 */
		$(".ctractAttachUpload").on("change", function() {
			var dataForm = $("#actionForm");
			
			dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
				success: function(responseText, statusText){
					console.log(responseText);
					$("#attachFile").val(responseText.fileName[0]);
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						
						type : "post",
						dataType : "json",
						url : "ctractInsertAttatchAjax",
						data : params,
						
						success : function(result){
							 if(result.res == "SUCCESS"){
								 $("#attachNo").val("");
								 reloadCtractAttachList();
								 	/* closePopup(1); */
								}
								else{
									alert("첨부자료 등록에 실패하였습니다.");
								}
						},
						error : function(){
							console.log("status : "+request.status);
							console.log("text : "+request.responseText);
							console.log("error : "+error);
						}
					});
				}, //ajax error
				error: function(){
					alert("에러발생!!"); 
				}
			});
			dataForm.submit();
		});
		
		reloadCtractAttachList();
		
		/* 첨부자료 삭제 */
		$("#ctractAttachDelBtn").on("click", function() {
			
			makeTwoBtnPopup(2, "첨부자료 삭제 확인", "정말로 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
					$("#attachNo").val($("#ctract_attach_name option:selected").val())
					
					var params = $("#actionForm").serialize();

					$.ajax({
						type : "post", //데이터 전송방식
						url : "ctractAttatchDelAjax", //주소
						dataType : "json", //데이터 전송 규칙
						data : params, //보낼 데이터
						// {키:값, 키:값,...} -> json
						success : function(result) {
							reloadCtractAttachList();
							closePopup(2);
						},
						error : function(request, status, error) {
							console.log("text : " + request.reponseText);
							console.log("error : " + error);
						}
					});
			}, "취소", function() {
						closePopup(2);
					});
		});
	}
	//---------------------------계약에서 사용되는 함수----------------------------------------//
	/*예금주 찾기 팝업*/
	function deperSrchPop(){
		var html = "";
		html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
		
		html += "<div>";
		html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
		html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"depSearchBtn\">";
		html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"depCancelBtn\">";
		html += "</div>";
		html += "<input type=\"hidden\" name=\"page3\" id=\"page3\" value=\"1\" />";
		html += "</form>";
		html += "<table class=\"pop_list\" id=\"deperSrch\">";
		html += "<colgroup><col width=\"10%\"/><col width=\"15%\"/><col width=\"15%\"/><col width=\"60%\"/>";
		html += "<thead>";
		html += "<tr class = \"table_list_header\">";
		html += "<td>번호</td>";
		html += "<td>이름</td>";
		html += "<td>은행</td>";
		html += "<td>계좌번호</td>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "<tr class=\"list_contents\">";
		html += "<td colspan=\"4\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"list_paging_area list_paging_area3\" style=\"margin-top: 0px;\">";
        html += "</div>";

        makeTwoBtnPopup(1, "예금주찾기", html, true, 600, 600, null, "완료", function() {
        	
        	setDepEvent();        	
		},"취소", function() {
			
			closePopup(1);
		});      
	}
		function setDepEvent() {
			// 예금주 검색 버튼 클릭 Event
			$("#depSearchBtn").on("click", function() {
				getDepList();
			});
			// 검색 엔터키 입력 Event
			$("#searchTxt").on("keypress", function(event) {
				if(event.keyCode == 13) {
					$("#empSearchBtn").click();
					return false;
				}
			});
			// 검색 초기화 버튼 클릭 Event
			$("#depCancelBtn").on("click", function() {
				$("#searchTxt").val("");
				getDepList();
			});	
			// Paging 버튼 클릭 이벤트
			$(".list_paging_area3").on("click", "div", function() {
				if(!isNaN($(this).attr("name") * 1)) {
					$("#page3").val($(this).attr("name"));
					getDepList();
				}
			});	
			// 예금주 값 선택 Event
			$("#deperSrch>tbody").on("click", "tr", function() {
				var select = $(this).attr("name");
				$("#deper").val(select.substring(select.indexOf("_") + 1));
				$("#account_no").val(select.substring(0, select.indexOf("_")));
				var temp = $(this).children("#dep_account_no").val();
				$("#deperNo").val(temp);
				closePopup(1);
			});
		}
		/* 예금주 팝업 팝업 페이징*/
		function drawListPaging3(pb) {
			var html = "";
			html += "<div class=\"btn_paging\" name=\"1\">&lt;&lt;</div>";

			html += "<div class=\"btn_paging\"name=\"";
			html += ($("#page3").val() == "1")? "1" : ($("#page3").val() * 1 - 1);
			html += "\">&lt;</div>";

			for(var i = pb.startPcount; i <= pb.endPcount; i++) {		
				html += "<div class=\"btn_paging";
				html += ($("#page3").val() == i)? "_on\">" : "\" name=\"" + i + "\">";
				html += i + "</div>";
			}
			
			html += "<div class=\"btn_paging\"name=\"";
			html += ($("#page3").val() == (pb.maxPcount))? pb.maxPcount : ($("#page3").val() * 1 + 1);
			html += "\">&gt;</div>";

			html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;&gt;</div>";
			
			$(".list_paging_area3").html(html);
		}
		// 예금주 목록 Get
		function getDepList() {
			var params = $("#searchForm").serialize();

			$.ajax({
				type: "post",
				url: "getBssDepPopAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					drawListPaging3(result.pb);
					drawDepList(result.list);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
		// 예금주 목록 draw
		function drawDepList(list) {
			var html = "";
			
			if(list.length > 0) {
				for(var i in list) {
					html += "<tr class=\"list_contents\" name=\"" + list[i].ACCOUNT_NO + "_" + list[i].DEPER + "\">";
					html += "<input type=\"hidden\" name=\"dep_account_no\" id=\"dep_account_no\" value=\""+list[i].DEP_ACCOUNT_NO+"\" />";
			  		html += "<td>" + list[i].RNUM + "</td>";
			  		html += "<td>" + list[i].DEPER + "</td>";
			  		html += "<td>" + list[i].BANK_NAME + "</td>";
			  		html += "<td id=\"ACCOUNT_NO\" name=\"ACCOUNT_NO\">" + list[i].ACCOUNT_NO + "</td>";
					html += "</tr>";
				}
			}
			else {
				html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
				html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
				$(".list_paging_area3").html("");
			}
			$("#deperSrch>tbody").html(html);
		}
//수정버튼 클릭시
		function bssRegisterEvent(){
					if($("#bssProgNo").val() * 1 == 1){
					$("#BssTypeNo").val($("#bss_type_name > option").attr("name"));
					$("#SalesDivNo").val($("#sales_div_name > option").attr("name"));
					var params = $("#actionForm").serialize();
					$.ajax({
						type: "post",
						url: "updateBssChnAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							location.reload();
						},
						error : function(request, status, error) {
							console.log("status : " + request.status);
							console.log("text : " + request.responseTest);
							console.log("error : " + error);
						}
					});
				} else if($("#bssProgNo").val() * 1 == 2){
					
				} else if($("#bssProgNo").val() * 1 == 3){
					
				} else if($("#bssProgNo").val() * 1 == 4){
					var params = $("#actionForm").serialize();
					$.ajax({
						type: "post",
						url: "updateBssChnAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							location.reload();
						},
						error : function(request, status, error) {
							console.log("status : " + request.status);
							console.log("text : " + request.responseTest);
							console.log("error : " + error);
						}
					});
				} else {
					alert("진행번호가 읽히지 않습니다... 관리자에게 문의하세요.");
				}
			if($("#bssProgNo").val() * 1 > 4){
				$("#registerBtn").css("display", "none");
			}else {
				
			}
		}

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo"></c:param>
	</c:import>

	<div class="title_area">영업상세보기</div>
	<div class="content_area">
		<form action="#" method="post" id="actionForm"
			enctype="multipart/form-data">
			<!-- 메인페이지에서 넘어오는 기회번호 -->
			<input type="hidden" id="chnNo" name="chnNo" value="${sChnNo}" /> <input
				type="hidden" id="cNo" name="cNo" value="${sChnNo}" /> <input
				type="hidden" id="empNo" name="empNo" value="${sEmpNo}" /> <input
				type="hidden" id="scheDivNoM" name="scheDivNoM" value="2" /> <input
				type="hidden" id="view_no" name="view_no" value="" />
			<!-- 제안, 협상, 계약번호 -->
					<input type="hidden" id="ctractNo" name="ctractNo" value="${bssNoData.CTRACT}"/>
					<input type="hidden" id="ngtNo" name="ngtNo" value="${bssNoData.NGT_NO}"/>
					<input type="hidden" id="sgtNo" name="sgtNo" value="${bssNoData.SGT_NO}"/>
					<input type="hidden" id="bssNo" name="bssNo" />
			<input type="hidden" id="bssProgNo" name="bssProgNo" /> <input type="hidden"
				name="attachNo" id="attachNo" />
			<div class="contents_wrap">
				<div class="table_top_area">
					<div class="top_title_area"></div>
					<div class="top_btn_area">
						<div class="btn_yellow btn_size_normal add" id="registerBtn">수정</div>
						<div class="btn_yellow btn_size_normal cancel" id="listBtn">목록</div>
					</div>
				</div>
				<div class="bss_category">
					<div class="category_content">기회</div>
					<div class="category_img_area">
						<img class="sample_img" id="ChnBtn" name="ChnBtn" alt="열닫"
							src="resources/images/bss/close_tab.png" width="21px"
							height="21px" />
					</div>
				</div>
				<table class="table_normal" id="ChnTbl" name="ChnTbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tbody>
					</tbody>
				</table>
				<div class="bss_category">
					<div class="category_content">제안</div>
					<div class="category_img_area">
						<img class="sample_img" alt="열닫" id="SgtBtn" name="SgtBtn"
							src="resources/images/bss/close_tab.png" width="21px"
							height="21px" />
					</div>
				</div>
				<table class="table_normal" id="SgtTbl" name="SgtTbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tbody>

					</tbody>
				</table>
				<div class="bss_category">
					<div class="category_content">협상</div>
					<div class="category_img_area">
						<img class="sample_img" alt="열닫" id="NgtBtn" name="NgtBtn"
							src="resources/images/bss/close_tab.png" width="21px"
							height="21px" />
					</div>
				</div>
				<table class="table_normal" id="NgtTbl" name="NgtTbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tbody>
					</tbody>
				</table>
				<div class="bss_category">
					<div class="category_content">계약</div>
					<div class="category_img_area">
						<img class="sample_img" alt="열닫" id="ctrackBtn" name="ctrackBtn"
							src="resources/images/bss/close_tab.png" width="21px"
							height="21px" />
					</div>
				</div>
				<table class="table_normal" id="ctrackTbl" name="ctrackTbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tbody>
					</tbody>
				</table>
				<div class="blank_space"></div>

				<!-- 의견 테이블 -->
				<div class="table_top_area">
					<div class="top_title_area">
						의견 <span class="opin_cnt"></span>
					</div>
					<div class="top_btn_area">
						<div class="btn_opac-z btn_size_normal" id="opinOpenBtn">
							<img src="resources/images/button/icon_align_yellow.png" alt="" />
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
							<td class="field_contents"><textarea
									class="textarea_noresize" id="opin_txt" name="opin_txt"></textarea>
							</td>
							<td class="field_contents">
								<div class="btn_black btn_size_wfull" id="opinWriteBtn">작성</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="blank_space"></div>

				<!-- 활동 일정 -->
				<div class="table_top_area">
					<div class="top_title_area no_drag">활동 일정</div>
					<div class="top_btn_area no_drag">
						<div class="chk_grp">
							<input type="checkbox" id="allActi" class="list_chbox"
								checked="checked" /> <label for="allActi" class="chbox_lbl"></label>
							<label for="allActi" class="chk_txt margin_right">전체</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="actiCall"
								class="list_chbox acti_chbox" value="0" checked="checked"
								name="acti0" /> <label for="actiCall" class="chbox_lbl"></label>
							<label for="actiCall" class="chk_txt margin_right">전화</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="actiCounsel"
								class="list_chbox acti_chbox" value="1" checked="checked"
								name="acti1" /> <label for="actiCounsel" class="chbox_lbl"></label>
							<label for="actiCounsel" class="chk_txt margin_right">상담</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="actiVisit"
								class="list_chbox acti_chbox" value="3" checked="checked"
								name="acti3" /> <label for="actiVisit" class="chbox_lbl"></label>
							<label for="actiVisit" class="chk_txt margin_right">방문</label>
						</div>
						<div class="chk_grp">
							<input type="checkbox" id="actiEmail"
								class="list_chbox acti_chbox" value="2" checked="checked"
								name="acti2" /> <label for="actiEmail" class="chbox_lbl"></label>
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
						<!-- 활동 일정 영역 -->
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>