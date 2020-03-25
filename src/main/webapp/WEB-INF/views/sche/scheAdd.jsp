<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 관리</title>
<c:import url="/header"></c:import>
<!-- 주소 API -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<!-- 일정 등록,수정,세부사항 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sche/sche.css"/>

<script type="text/javascript">
$(document).ready(function() {
	// 주소 검색 버튼 클릭 Event
	$("#mapBtn").postcodifyPopUp();
	
	loadSelectList();
	
	/* 일정 등록 버튼 */
	$("#scheAdd").on("click", function() {		
		
		makeTwoBtnPopup(1, "등록하시겠습니까?", "계속 진행 시 등록을 합니다.", true, 400, 250, null, "확인", function() {
			
			if($.trim($('input[name="sche_div_no"]:checked').val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "일정구분을 선택해주세요.", null);
				closePopup(1);
				$("#scheRadio").focus();			
			}
			else if($.trim($('select[name="scheActiNo"]').val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "활동분류를 선택해주세요..", null);
				closePopup(1);
				$('select[name="scheActiNo"]').focus();		
			}
			else if($.trim($('select[name="scheImportance"]').val()) == 0){
				makeAlert(2, "필수 입력 사항 미 입력!", "중요도를 선택해주세요.", null);
				closePopup(1);
				$('select[name="scheImportance"]').focus();		
			}
			else if($.trim($("#sche_sdate").val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "날짜를 선택해주세요.", null);
				closePopup(1);
				$("#sche_sdate").focus();		
			}
			else if($.trim($("#sche_edate").val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "날짜를 선택해주세요.", null);
				closePopup(1);
				$("#sche_edate").focus();		
			}
			else if($.trim($("#sche_stime").val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "시간을 선택해주세요.", null);
				closePopup(1);
				$("#sche_stime").focus();		
			}
			else if($.trim($("#sche_etime").val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "시간을 선택해주세요.", null);
				closePopup(1);
				$("#sche_etime").focus();		
			}
			else if($.trim($("#sche_con").val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "일정내용을 입력해주세요.", null);
				closePopup(1);
				$("#sche_con").focus();		
			}
			else{
				
				
				
				var params = $("#actionForm").serialize();
				$.ajax({
					type : "post", //데이터 전송방식
					url : "scheAddAjax", //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// {키: 값, 키:값, ...} - > json
					
					success : function(result){
						 if(result.res == "SUCCESS"){
								history.back();
							}
							else{
								alert("일정 등록에 실패하였습니다.");
							}
					} , 
					error : function(request,status,error) {
						console.log("status : "+request.status);
						console.log("text : "+request.responseText);
						console.log("error : "+error);
					}
					
				});
			}
		
		},"취소", function() {
			closePopup(1);
		});
	});
	
	/* 일정 취소 버튼  */
	$("#scheCancel").on("click", function() {
		makeTwoBtnPopup(1, "취소하시겠습니까", "계속 진행 시 취소합니다.", true, 400, 250, null, "확인", function() {
			history.back();
		},"취소", function() {
			closePopup(1);
		});
	});
	
	$(".scheClientBtn").on("click",function(){
		
		console.log("실행되었습니다.");
		
		if($.trim($('input[name="sche_div_no"]:checked').val()) == ""){
			makeAlert(2, "필수 입력 사항 미 입력!", "일정구분을  선택하고 검색버튼을 눌러주세요!", null);
		}
	});
	
});

/* 일정구분, 활동분류 데이터 출력 Ajax */
function loadSelectList(){
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "scheSelectListAjax",
		dataType : "json",
		data : params,

		success : function(result) {
			redrawRadioList(result.radio);
			redrawOptionList(result.option);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

/* 일정구분 리스트 출력 */
function redrawRadioList(radio) {
	var html ="";
	
	for ( var i in radio) {
		if($("#scheDivNoM").val() == ""){
			html += "<input type=\"radio\"  name=\"sche_div_no\" value=\""+radio[i].CODE_S_CATE+"\" class=\"radio_size_kh\">"+radio[i].CODE_NAME;
		}else if($("#scheDivNoM").val() == radio[i].CODE_S_CATE){
			html += "<input type=\"radio\"  name=\"sche_div_no\" value=\""+radio[i].CODE_S_CATE+"\" class=\"radio_size_kh\" checked>"+radio[i].CODE_NAME;
		}
		else{
		html += "<input type=\"radio\"  name=\"sche_div_no\" value=\""+radio[i].CODE_S_CATE+"\" class=\"radio_size_kh\">"+radio[i].CODE_NAME;	
		}

	}	
		
	$("#scheRadio").html(html);
	
	
	
	/* 리드, 기회, 고객 세부사항 페이지에서 일정 등록 시 이벤트  */
	
	
		if($.trim($('input[name="sche_div_no"]:checked').val())==0){
			$("#changeScheDivFirst").html("고객");
			$("#changeScheDivSecond").html("고객사");
			$("#sche_comp_no").val("");
			
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\">검색</div>";
			
			$("#changeScheDivFirsts").html(html);
			
			$("#sche_client_no").val('${client.CLIENT_NAME}');
			$("#sche_comp_no").val('${client.COMP_NAME}');
			
			
		}
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==1){

			$("#changeScheDivFirst").html("리드명");
			$("#changeScheDivSecond").html("담당자");
			$("#sche_comp_no").val("");
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\" >검색</div>";
			
			$("#changeScheDivFirsts").html(html);
			
			$("#sche_client_no").val('${lead.LEAD_NAME}');
			$("#sche_comp_no").val('${lead.EMP_NAME}');
			
			
			
		}
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==2){
			$("#changeScheDivFirst").html("영업명");
			$("#changeScheDivSecond").html("담당자");
			$("#sche_comp_no").val("");
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\">검색</div>";
			
			$("#changeScheDivFirsts").html(html);
			
			$("#sche_client_no").val('${bss.CHN_NAME}');
			$("#sche_comp_no").val('${bss.EMP_NAME}');
			
		}
	
	
	
	/* 일정구분 클릭 시 이벤트 */
	$("input:radio[name=sche_div_no]").click(function(){
		if($.trim($('input[name="sche_div_no"]:checked').val())==0){
			$("#changeScheDivFirst").html("고객");
			$("#changeScheDivSecond").html("고객사");
			$("#sche_comp_no").val("");
			
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\">검색</div>";
			
			
			$("#changeScheDivFirsts").html(html);
			$("#scheDivNoM").val($('input[name="sche_div_no"]:checked').val());
			
			loadSelectList();
			
		}
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==1){

			$("#changeScheDivFirst").html("리드명");
			$("#changeScheDivSecond").html("담당자");
			$("#scheDivNoM").val($('input[name="sche_div_no"]:checked').val());
			$("#sche_comp_no").val("");
			
			
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\" >검색</div>";
	
			$("#changeScheDivFirsts").html(html);
			$("#scheDivNoM").val($('input[name="sche_div_no"]:checked').val());
			
			loadSelectList();
			
		}
		if($.trim($('input[name="sche_div_no"]:checked').val())==2){
			$("#changeScheDivFirst").html("영업명");
			$("#changeScheDivSecond").html("담당자");
			$("#sche_comp_no").val("");
			
			var html = "";
			
			html += "<input type=\"text\" class=\"det_text witdh80 ta_l\" name=\"shce_client_no\" id=\"sche_client_no\" readonly=\"readonly\">";
			html += "<div class=\"bottom_btn_2 scheClientBtn\">검색</div>";
			
			$("#changeScheDivFirsts").html(html);
		$("#scheDivNoM").val($('input[name="sche_div_no"]:checked').val());
			
			loadSelectList();
			
		}
		
		
		/* 고객,리드,영업 검색  */
		$(".scheClientBtn").on("click", function(){
			if($.trim($('input[name="sche_div_no"]:checked').val()) == ""){
				makeAlert(2, "필수 입력 사항 미 입력!", "일정구분을  선택하고 검색버튼을 눌러주세요!", null);
			}else{
				
			loadClientLeadBssList();
			}
		});
		
	});
	
	/* 고객,리드,영업 검색  */
	$(".scheClientBtn").on("click", function(){
		if($.trim($('input[name="sche_div_no"]:checked').val()) == ""){
			makeAlert(2, "필수 입력 사항 미 입력!", "일정구분을  선택하고 검색버튼을 눌러주세요!", null);
		}else{
			
		loadClientLeadBssList();
		}
	
	});
	
	
}

/* 활동분류 리스트 출력 */
function redrawOptionList(option) {
		
		var html = "";
		
		for ( var i in option) {
			if(option[i].CODE_NAME == "기타"){
				html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\" selected=\"selected\">"+ option[i].CODE_NAME +"</option>";
			}
			else{				
			html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\">"+ option[i].CODE_NAME +"</option>";
			}
		}	
		
		
	$("#scheActiNo").html(html);
}

/* ----------------------------------------------- 고객,리드,영업 검색 -----------------------------------*/
function reloadList() {
	
	
	$("#schDivNo").val($.trim($('input[name="sche_div_no"]:checked').val()));
	
	var params = $("#clientSearchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "scheClientSearchAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			redrawList(result.list);
			redrawPaging(result.pb);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function redrawList(list) {
	if (list.length != 0) {
		var html = "";
		var lsize = 7 - list.length;
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==0){
			for ( var i in list) {
				html += "<tr>";
				html += "<td id=\"clientNo\">"+list[i].CLIENT_NO+"</td>";
				html += "<td id=\"clientName\">"+list[i].CLIENT_NAME+"</td>";
				html += "<td id=\"compName\">"+list[i].COMP_NAME+"</td>";
				html += "</tr>";
			}	
			for(var j = 0; j < lsize; j++){
				html += "<tr>";
				html += "</tr>";
			}
		}
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==1){
			for ( var i in list) {
				html += "<tr>";
				html += "<td id=\"clientNo\">"+list[i].LEAD_NO+"</td>";
				html += "<td id=\"clientName\">"+list[i].LEAD_NAME+"</td>";
				html += "<td id=\"compName\">"+list[i].EMP_NAME+"</td>";
				html += "</tr>";
			}	
			for(var j = 0; j < lsize; j++){
				html += "<tr>";
				html += "</tr>";
			}
		}
		
		if($.trim($('input[name="sche_div_no"]:checked').val())==2){
			for ( var i in list) {
				html += "<tr>";
				html += "<td id=\"clientNo\">"+list[i].CHN_NO+"</td>";
				html += "<td id=\"clientName\">"+list[i].CHN_NAME+"</td>";
				html += "<td id=\"compName\">"+list[i].EMP_NAME+"</td>";
				html += "</tr>";
			}	
			for(var j = 0; j < lsize; j++){
				html += "<tr>";
				html += "</tr>";
			}
		}
		
	} 
	
	$(".search_pop_tbody").html(html);
}

function redrawPaging(pb){
	var html = "";
	//처음
	html += "<div class = \"btn_paging\" name=\"1\">&lt;&lt;</div>&nbsp;";
	//이전
	if($("#page").val() == "1"){
	html += "<div class = \"btn_paging\" name=\"1\">&lt;</div>&nbsp;";
	}
	else{
		html += "<div class = \"btn_paging\" name=\"" + ($("#page").val() * 1 - 1) + "\">&lt;</div>&nbsp;";			
	}
	//숫자
	for(var i = pb.startPcount ; i <= pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<div class = \"btn_paging\"><b>"+ i +"</b></div>&nbsp;";	
		}
		else{
			html += "<div class = \"btn_paging\" name=\"" + i + "\">"+ i + "</div>&nbsp;";	
		}
	}
	//다음
	if($("#page").val() == pb.maxPcount){
	html += "<div class = \"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;</div>&nbsp;";
	}
	else{
		html += "<div class = \"btn_paging\" name=\"" + ($("#page").val() * 1 + 1) + "\">&gt;</div>&nbsp;";			
	}
	
	//마지막
	html += "<div class = \"btn_paging\" name = \"" + pb.maxPcount + "\">&gt;&gt</div>";
	
	$(".list_paging_area").html(html);
}
/* ----------------------------------------------- 고객 검색end -----------------------------------*/
function loadClientLeadBssList(){
	
	
	var title = "";
	
	html = "";
	html += "<div>";
	html += "<form action=\"#\" method=\"post\" id=\"clientSearchForm\">";
	html += "<input type=\"hidden\" name=\"page\" value=\"1\" id=\"page\"/>";
	html +=	"<input type=\"hidden\" id=\"searchTxt\" name=\"searchTxt\" />"; 
	html +=	"<input type=\"hidden\" id=\"no\" name=\"no\">"; 
	html += "<input type=\"hidden\" id=\"schDivNo\" name=\"schDivNo\">";
	html += "<input type = \"text\" class = \"input_address2\" id=\"txt_client_search\">";
	html += "<img src = \"resources/images/Lead/icon_search_gray.png\" alt = \"\" width = \"30px\" class = \"address_search_icon\">";
	html += "<img src = \"resources/images/Lead/icon_cancel_gray.png\" alt = \"\" width = \"20px\" class = \"address_search_cancel\">";
	html += "</form>";
	html += "</div>";
	html += "<table class = \"pop_table\" style=\"width: 100%; height : auto; position : relative; top : -20px; border-top:0px;\">";
	html += "<colgroup><col width=\"20%\" /><col width=\"40%\" /><col width=\"40%\" /></colgroup>";
	html += "<thead>";
	html += "<tr class = \"search_pop_title\">";
	if($.trim($('input[name="sche_div_no"]:checked').val())==0){
		title = "고객검색 팝업";
		html += "<td>고객번호</td>";
		html += "<td>고객명</td>";
		html += "<td>고객사</td>";
	}
	if($.trim($('input[name="sche_div_no"]:checked').val())==1){
		title = "리드검색 팝업";
		html += "<td>리드번호</td>";
		html += "<td>리드명</td>";
		html += "<td>담당자</td>";
	}
	if($.trim($('input[name="sche_div_no"]:checked').val())==2){
		title = "영업검색 팝업";
		html += "<td>영업번호</td>";
		html += "<td>영업명</td>";
		html += "<td>담당자</td>";
	}
	html += "</tr>";
	html += "</thead>";
	html += "<tbody class = \"search_pop_tbody\">";
	html += "</tbody>";
	html += "</table>";
	html += "<div class = \"list_paging_area\" style = \"margin-top : 4px !important;\"></div>";
	
	makeNoBtnPopup(7, title, html , true , 500, 600, function() {
		reloadList();
	});
	
	$(".list_paging_area").on("click", "div", function(){
		if(($(this).attr("name") != "")){
			$("#page").val($(this).attr("name"));
			reloadList();
		}
	});
	
	$(".address_search_icon").on("click", function(){
		$txt_client_search = $("#txt_client_search").val();
		$("#searchTxt").val($txt_client_search);
		reloadList();
	});
	
	$(".address_search_cancel").on("click",function(){
		$("#txt_client_search").val("");
		$txt_client_search = $("#txt_client_search").val();
		$("#searchTxt").val($txt_client_search);
		reloadList();
	});
	
	$(".search_pop_tbody").on("click","tr",function(){
		$("#cNo").val($(this).children("#clientNo").html());
		$("#sche_client_no").val($(this).children("#clientName").html());
		$("#sche_comp_no").val($(this).children("#compName").html());
		closePopup(7);
	});	
	
}
</script>
</head>
<body>
	<c:import url="/topLeft">
			<c:param name="menuNo">7</c:param>
	</c:import>
	<div class="title_area">일정 등록</div>
	<div class="content_area">
		<!-- 세부사항 메인 내용 -->
				<div class="MainContent">
					<!-- 세부사항 버튼 공간 -->
					<div class="select_space">
						<div class="top_title_area"></div>
						<div class="content_btn">
							<div id="scheCancel">취소</div>
							<div id="scheAdd">등록</div>
						</div>
					</div>

					<!-- 주황색 선 -->
					<div class="line"></div>
					<!-- 세부사항 메인내용 테이블 -->
					<form action="#" method="post" id="actionForm">
					<c:choose>
						<c:when test="${!empty param.client_no}">
							<input type="hidden" name="cNo" id="cNo" value="${param.client_no}"/>
						</c:when>
						<c:when test="${!empty param.lead_no}">
							<input type="hidden" name="cNo" id="cNo" value="${param.lead_no}"/>
						</c:when>
						<c:when test="${!empty sChnNo}">
							<input type="hidden" name="cNo" id="cNo" value="${sChnNo}"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="cNo" id="cNo"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="page" name="page" value="1"> 
					<input type="hidden" id="scheDivNoM" name="scheDivNoM" value="${param.scheDivNoM}"/>
					<table class="table_area">
						<colgroup>
							<col width=10% />
							<col width=40% />
							<col width=10% />
							<col width=40% />
						</colgroup>
						<tr class="">
							<td class="table_td_1 table_first">일정구분<span
								class="important_text"> *</span>
							</td>
							<td class="table_content table_first radio_font_size" id="scheRadio">
							</td>
							<td class="table_td_1 table_first">활동분류<span
								class="important_text"> *</span></td>
							<td class="table_content table_first">
								<select name="scheActiNo" class="det_text" id="scheActiNo">
								</select>
							</td>
						</tr>
						<tr class="">
							<td class="table_td_1" id="changeScheDivFirst">고객</td>
							<td class="table_content" id="changeScheDivFirsts"><input type="text" class="det_text witdh80 ta_l" name="shce_client_no" id="sche_client_no" readonly="readonly"><div class="bottom_btn_2" id="scheClientBtn">검색</div>
							</td>
							<td class="table_td_1" id="changeScheDivSecond">고객사</td>
							<td class="table_content"><input type="text"
								class="det_text witdh100 ta_l" name="sche_comp_no" id="sche_comp_no" readonly="readonly"></td>
						</tr>
							<tr class="">
							<td class="table_td_1">고객 측</br>참가자</td>
							<td class="table_content"><input type="text"
								class="det_text witdh100 ta_l" name="sche_ci_participant" id="sche_ci_participant"></td>
							<td class="table_td_1">중요도<span
								class="important_text"> *</span></td>
							<td class="table_content">
							<select name="scheImportance" class="det_text">
										<option name="sche_importance" value="상">상</option>
										<option name="sche_importance" value="중">중</option>
										<option name="sche_importance" value="하">하</option>
										<option name="sche_importance" value="0" selected="selected">선택하세요</option>
							</select>
							</td>
						</tr>
						<tr class="">
							<td class="table_td_1">일정 날짜<span class="important_text">
									*</span></td>
							<td class="table_content"><input type="date"
								class="date_time_box ta_l" name="sche_sdate" id="sche_sdate"/> ~ <input type="date"
								class="date_time_box ta_l" name="sche_edate" id="sche_edate"/></td>
							<td class="table_td_1">일정 시간<span class="important_text">
									*</span></td>
							<td class="table_content"><input type="time"
								class="date_time_box ta_l" name="sche_stime" id="sche_stime"/> ~ <input type="time"
								class="date_time_box ta_l" name="sche_etime" id="sche_etime"/></td>
						</tr>
						<tr class="">
							<td class="table_td_1">주소</td>
							<td colspan="3" class="table_content"><input type="text"
								placeholder="우편번호" name="sche_postcode" id="sche_postcode"
								class="map_text1 input_readonly ta_l postcodify_postcode5">
								<div class="map_search" id="mapBtn">검색</div> <input type="text"
								placeholder="주소" name="sche_addr" id="sche_addr"
								class="map_text2 input_readonly ta_l postcodify_address"> <input type="text" name="sche_det_addr" id="sche_det_addr"
								placeholder="상세주소"  class="map_text3 ta_l postcodify_details">
								<div class="td_1_email_map">
								</div></td>
						</tr>
						<tr class="u_s_tr">
							<td class="table_td_1">일정 내용<span
								class="important_text"> *</span></td>
							<td colspan="3" class="table_content"><textarea
									class="det_text2" name="sche_con" id="sche_con"></textarea></td>
						</tr>
						<tr class="u_s_tr">
							<td class="table_td_1">일정 결과</td>
							<td colspan="3" class="table_content"><textarea
									class="det_text2" name="sche_res" id="sche_res" readonly="readonly"></textarea></td>
						</tr>
					</table>
					<!-- 여기까지 세부사항 메인내용 테이블 -->
				</div>
				<!-- 세부사항 메인 내용 여기까지 -->
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>