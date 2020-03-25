<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 관리</title>
<c:import url="/header"></c:import>
<!-- 일정 등록,수정,세부사항 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sche/sche.css"/>
<script type="text/javascript">
$(document).ready(function() {

	reLoadData();
	
	reloadOpinList();
	
	/* 일정 수정 */
	$("#scheFixBtn").on("click", function() {
		makeTwoBtnPopup(1, "수정하시겠습니까?", "계속 진행 시 수정페이지로 이동합니다.", true, 400, 250, null, "확인", function() {
			
			$("#actionForm").attr("action","scheFix");
			$("#actionForm").submit();
			
		},"취소", function() {
			closePopup(1);
		});
	});
	
	/* 일정 세부사항 보기 취소 */
	$("#scheCancel").on("click", function() {
		makeTwoBtnPopup(1, "취소하시겠습니까", "계속 진행 시 취소합니다.", true, 400, 250, null, "확인", function() {
			location.href = "scheList";
		},"취소", function() {
			closePopup(1);
		});
	});
	
	/* 첨부자료 리스트 출력 업다운 버튼 */
	$("#attachUpDownBtn").on("click",function(){
		if($(this).attr("class") == "updown_icon"){
			$(this).attr("class","updown_icon_on");
			$(".attach-bottom_box").css("display","none");
		}
		else if($(this).attr("class") == "updown_icon_on"){
			$(this).attr("class","updown_icon");
			$(".attach-bottom_box").css("display","block");
		}
	});
	
	/* 일정상품 리스트 출력 업다운 버튼 */
	$("#prodUpDownBtn").on("click",function(){
		if($(this).attr("class") == "updown_icon"){
			$(this).attr("class","updown_icon_on");
			$(".product_box").css("display","none");
		}
		else if($(this).attr("class") == "updown_icon_on"){
			$(this).attr("class","updown_icon");
			$(".product_box").css("display","block");
		}
	});
	
	/* 회의록 리스트 출력 업다운 버튼 */
	$("#minutesUpDownBtn").on("click",function(){
		if($(this).attr("class") == "updown_icon"){
			$(this).attr("class","updown_icon_on");
			$(".minutes_box_real").css("display","none");
		}
		else if($(this).attr("class") == "updown_icon_on"){
			$(this).attr("class","updown_icon");
			$(".minutes_box_real").css("display","block");
		}
	});
	
	/* 의견 리스트 출력 업다운 버튼 */
	$("#opinUpdownBtn").on("click",function(){
		if($(this).attr("class") == "updown_icon"){
			$(this).attr("class","updown_icon_on");
			$(".opin_box").css("display","none");
		}
		else if($(this).attr("class") == "updown_icon_on"){
			$(this).attr("class","updown_icon");
			$(".opin_box").css("display","block");
		}
	});
	
	/* 일정 의견 등록 버튼 */
	$("#scheOpinAddBtn").on("click",function(){
			var params = $("#opinForm").serialize();
			
			$.ajax({
				
				type : "post",
				dataType : "json",
				url : "scheInsertOpinAjax",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 	$("#sche_opin_con").val("");
						 	closePopup(1);
							reloadOpinList();
						}
						else{
							alert("의견 등록에 실패하였습니다.");
						}
				},
				error : function(){
					console.log("status : "+request.status);
					console.log("text : "+request.responseText);
					console.log("error : "+error);
				}
			}); 
			}); //일정 의견 등록 버튼end
});//ready end

/* 일정 세부사항,수정 기본 데이터 출력 Ajax*/
function reLoadData(){
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		
		type : "post",
		url : "scheDataAjax",
		dataType : "json",
		data : params,
		
		success : function(result){
			loadData(result.scheData);
			loadScheDiv(result.scheDivData);
		} , 
		error : function(request,status,error) {
			console.log("status : "+request.status);
			console.log("text : "+request.responseText);
			console.log("error : "+error);
		}
	});
	
}

/* 일정 세부사항,수정 기본 데이터 출력 기능 */
function loadData(scheData){
	
	$("#sche_div_name").val(scheData.CN);
	
	if(${sTeamNo} != scheData.TEAM_NO){
	$("#scheFixBtn").css("display","none");
	}
	$("#sche_div_no").html(scheData.CN);
	$("#sche_acti_no").html(scheData.DN);
	$("#sche_importance").html(scheData.SCHE_IMPORTANCE);
	$("#sche_sdate").html(scheData.SDATE);
	$("#sche_edate").html(scheData.EDATE);
	$("#sche_stime").html(scheData.STIME);
	$("#sche_etime").html(scheData.ETIME);
	if(scheData.ADDR != "()"){
		$("#sche_addr").html(scheData.ADDR);		
	}
	$("#sche_con").html(scheData.SCHE_CON);
	$("#sche_res").html(scheData.SCHE_RES);
	
}

/* 일정 세부사항, 수정 기본 고객 데이터 출력 기능 */
function loadScheDiv(scheDivData){
		
	if($("#scheDivNoM").val() == 0){
		$("#changeScheDivFirst").html("고객");
		$("#changeScheDivSecond").html("고객사");
		if(scheDivData != null){
			$("#cNo").val(scheDivData.CLIENT_NO);
			$("#sche_comp_no").html(scheDivData.COMP_NAME);
			$("#sche_client_no").html(scheDivData.CLIENT_NAME);
			$("#sche_ci_participant").html(scheDivData.SCHE_CI_PARTICIPANT);
		}	
	}
	else if($("#scheDivNoM").val()==1){
		$("#changeScheDivFirst").html("리드명");
		$("#changeScheDivSecond").html("담당자");
		if(scheDivData != null){
			$("#cNo").val(scheDivData.LEAD_NO);
			$("#sche_comp_no").html(scheDivData.LEAD_NAME);
			$("#sche_client_no").html(scheDivData.EMP_NAME);
			$("#sche_ci_participant").html(scheDivData.SCHE_CI_PARTICIPANT);
		}
	}
	else{
		$("#changeScheDivFirst").html("영업명");
		$("#changeScheDivSecond").html("담당자");
		if(scheDivData != null){
			$("#cNo").val(scheDivData.CHN_NO);
			$("#sche_comp_no").html(scheDivData.CHN_NAME);
			$("#sche_client_no").html(scheDivData.EMP_NAME);
		 	$("#sche_ci_participant").html(scheDivData.SCHE_CI_PARTICIPANT);
		}
	}
	
}

/* 일정 의견 출력 Ajax */
function reloadOpinList(){
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		
		type : "post",
		url : "loadOpinListAjax",
		dataType : "json",
		data : params,
		
		success : function(result){
			loadOpinList(result.list, result.cnt);
			loadMinutesList(result.minuteslist, result.minutesCnt);
			loadAttachList(result.attachlist, result.attachCnt);
			loadProdList(result.prodlist, result.prodCnt);
		} , 
		error : function(request,status,error) {
			console.log("status : "+request.status);
			console.log("text : "+request.responseText);
			console.log("error : "+error);
		}
	});
}

/* 일정 의견 리스트 출력 기능 */
function loadOpinList(list,cnt){
	var html="";
	var cntHtml ="";
	
	cntHtml += "(" + cnt + ")";
	
	for(var i in list){
		html += "<div class=\"opin_box_style\" name=\""+list[i].SCHE_OPIN_NO+"\">";
		html += "<div class=\"left_box\" id=\"opinName\">";
		html +=	"<div class=\"left_opin_content\">"+list[i].SCHE_OPIN_CON+"</div>";
		html +=	"<div class=\"left_user_data\">"+ list[i].EMP +" | " +list[i].SCHE_DATE +"</div>";
		html += "</div>";
		html += "<div class=\"right_box_del\">";
		var  sessionEmpNo = "<%=session.getAttribute("sEmpNo") %>"; 	
		if(sessionEmpNo == list[i].EMP_NO){
		html +=	"<div class=\"del_btn_div\">";
		html +=		"<img src=\"resources/images/sche/icon_del_white.png\" class=\"opin_del_btn\">";
		html +=	"</div>";
					}
		html += "</div>";
		html += "</div>";
	}
	
	$(".opin-list_count").html(cntHtml);
	$(".opin_box").html(html);
	
	/* 일정 의견 삭제 기능 */
	$(".del_btn_div").on("click",function(){
		var opinNO = $(this).parent().parent(".opin_box_style").attr("name")
		makeTwoBtnPopup(2, "삭제하시겠습니까", "계속 진행 시 삭제합니다.", true, 400, 250, null, "확인", function() {
			
			
			$("#opin_no").val(opinNO);
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				
				type : "post",
				url : "scheOpinDelAjax",
				dataType : "json",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 closePopup(2);
						 reloadOpinList();
						}
						else{
							alert("의견 삭제에 실패하였습니다.");
						}
				},
				error : function(request,status,error){
					console.log("status : "+request.status);
					console.log("text : "+request.responseText);
					console.log("error : "+error);
				}
				
			});
			
		},"취소", function() {
			closePopup(2);
		});
		
		
	});// 일정 의견 삭제 기능end
}//일정 의견 리스트 출력 기능end

/* 회의록 리스트 출력 */
function loadMinutesList(minuteslist, minutesCnt){
	var html="";
	var cntHtml ="";
	
	
	for(var i in minuteslist){
	html += "	<div class=\"minute_box\" name=\""+minuteslist[i].ML_NO+"\">"
	html += "	<div class=\"minutes_left_box\">"
	html += "		<img src=\"resources/images/sche/file_icon.png\" class=\"minutes_icon minutes_image\" name=\""+minuteslist[i].ML_NO+"\">"
	html += "	</div>"
	html += "	<div class=\"minutes_right_box2\">"
	html += "		<div class=\"left_opin_content cursor_p minutes_name\" name=\""+minuteslist[i].ML_NO+"\">"+minuteslist[i].ML_NAME+"</div>"
	html += "		<div class=\"left_user_data\">"+minuteslist[i].EMP +" | "+ minuteslist[i].ML_DATE+"</div>"
	html += "	</div>"
	html += "	</div>"
	}
	cntHtml += "(" + minutesCnt + ")";
	
	$(".minutes-list_conut").html(cntHtml);
	$(".minutes_box_real").html(html);
	
	$(".minutes_image, .minutes_name").on("click",function(){
		
		var minutesNO = $(this).attr("name");
		$("#minutes_no").val(minutesNO);
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			
			type : "post",
			url : "scheMinutesDetAjax",
			dataType : "json",
			data : params,
			
			success : function(result){
				 reloadMinutesData(result.minutesData);	
			},
			error : function(request,status,error){
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
			
		});
		
	});
}

/* 선택한 회의록 데이터 출력 */
function reloadMinutesData(minutesData){
	
	html = "";
	html += "<form action=\"#\" method=\"post\" id=\"minutesForm\">";
	html += "<input type=\"hidden\" name=\"minutes_sche_no\" id=\"minutes_sche_no\">";
	html += "<table class=\"table_area_rel\">";
	html += "<colgroup>";
	html +=	"<col width=15% />";
	html +=	"<col width=35% />";
	html +=	"<col width=15% />";
	html +=	"<col width=35% />";
	html += "</colgroup>";
	html += "<tr class=\"table_tr height50\">";
	html +=	"<td class=\"table_td_1\">회의명칭<span class=\"important_text\"> *</span></td>";
	html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" readonly=\"readonly\" name=\"minutes_title\" value=\""+minutesData.ML_NAME+"\"></td>";
	html += "</tr>";
	html += "<tr class=\"table_tr height50\">";
	html +=	"<td class=\"table_td_1\">참석자</td>";
	if(typeof minutesData.ML_PARTICIPANT == "undefined"){		
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" readonly=\"readonly\" class=\"det_text\" name=\"minutes_participant\"></td>";
	}
	else{
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" readonly=\"readonly\" class=\"det_text\" name=\"minutes_participant\" value=\""+minutesData.ML_PARTICIPANT+"\"></td>";
	}
	html += "</tr>";
	html += "</table>";
	html += "<textarea class=\"det_text_rel\" name=\"minutes_con\" readonly=\"readonly\">"+minutesData.ML_CON+"</textarea>";
	html += "</form>";
	
	 makeNoBtnPopup(1, "회의록", html, true, 700, 650, function() {
	});
}

/* 첨부자료 리스트 출력 */
function loadAttachList(attachlist, attachCnt){
	var html="";
	var cntHtml ="";
	
	cntHtml += "(" + attachCnt + ")";
	
	for(var i in attachlist){
		
	html += "<div class=\"att_box\" name=\""+attachlist[i].SCHE_ATTACH_NO+"\">";
	html +=		"<div class=\"prod_left_box\">";
	html +=   "<a class=\"fs0\" href = \"resources/upload/"+attachlist[i].SCHE_ATTACH_NAME+"\" download><img src=\"resources/images/sche/save.png\" class=\"prod_icon2\"></a>";
	html +=		"</div>";
	html +=		"<div class=\"prod_right_box2\">";
	html +=			"<div class=\"left_opin_content cursor_p\"><a class=\"left_opin_content uunderline\" href = \"resources/upload/"+attachlist[i].SCHE_ATTACH_NAME+"\" download>"+attachlist[i].SCHE_ATTACH_NAME+"</a></div>";
	html +=			"<div class=\"left_user_data\">"+attachlist[i].EMP + " | " +attachlist[i].DT+"</div>";
	html +=		"</div>";
	html += "</div>";
	
	}
	
	$(".attach-list_count").html(cntHtml);
	$(".attach-bottom_box").html(html);
}// 첨부자료 기능 끝


/* 일정상품 리스트 출력 */

	function loadProdList(prodlist, prodCnt) {
		var html = "";
		var cntHtml = "";
		

		cntHtml += "(" + prodCnt + ")";
		
		for ( var i in prodlist) {
			
			if (typeof prodlist[i].GOODS_NO == "undefined") {
				html += "<div class=\"prod_box\" name=\""+prodlist[i].SERVICE_NO+"\" >";
			} else {
				html += "<div class=\"prod_box\" name=\""+prodlist[i].GOODS_NO+"\" >";
			}
			html += "<div class=\"prod_left_box\">                                            ";
			html += "<img src=\"resources/images/sche/product_icon.png\" class=\"prod_icon prodDetBtn\" id=\""+prodlist[i].DIV_NO+"\">                                                 ";
			html += "</div>                                                                 ";
			html += "<div class=\"prod_right_box2\">                                          ";
			html += "<div class=\"left_opin_content cursor_p prodDetBtn\" id=\""+prodlist[i].DIV_NO+"\">"
					+ prodlist[i].PROD_NAME + "</div>";
			html += "<div class=\"left_user_data\">" + prodlist[i].EMP + " | "
					+ prodlist[i].DT + "</div>    ";
			html += "</div>                                                                 ";
			html += "</div>";
		}

		$(".prod-list_count").html(cntHtml);
		$(".product_box").html(html);

		$(".prodDetBtn").on(
				"click",
				function() {
					$("#prod").val($(this).attr("id"));

					if ($("#prod").val() == 1) {
						$("#goods_no").val(
								$(this).parent().parent(".prod_box").attr(
										"name"));
					} else {
						$("#service_no").val(
								$(this).parent().parent(".prod_box").attr(
										"name"));
					}

					$("#actionForm").attr("action", "goodsDet");
					$("#actionForm").submit();
		});

	}
</script>
</head>
<body>
	<c:import url="/topLeft">
			<c:param name="menuNo">7</c:param>
	</c:import>
	<div class="title_area">일정</div>
	<div class="content_area">
		
		<!-- 세부사항 메인 내용 -->
				<div class="MainContent">
					<!-- 세부사항 버튼 공간 -->
					<div class="select_space">
						<div class="top_title_area"></div>
						<div class="content_btn">
							<div id="scheCancel">취소</div>
							<div id="scheFixBtn">수정</div>
						</div>
					</div>

					<!-- 주황색 선 -->
					<div class="line"></div>
					<!-- 세부사항 메인내용 테이블 -->
					<form action="#" method="#" id="actionForm">
					<input type="hidden" name="opin_no" id="opin_no"/>
					<input type="hidden" name="minutes_no" id="minutes_no"/>
					<input type="hidden" name="prod_no" id="prod_no"/>
					<input type="hidden" name="prod" id="prod"/>
					<input type="hidden" name="service_no" id="service_no"/>
					<input type="hidden" name="goods_no" id="goods_no"/>
					<input type="hidden" name="cNo" id="cNo"/>
					<input type="hidden" name="sche_div_name" id="sche_div_name"/>
					<input type="hidden" name="sche_no" id="sche_no" value="${param.sche_no}"/>
					<input type="hidden" name="scheDivNoM" id="scheDivNoM" value="${param.scheDivNoM}"/>
					
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
							<td class="table_content table_first radio_font_size">
								<div
								class="det_text_div witdh100" id="sche_div_no"></div>
							</td>
							<td class="table_td_1 table_first">활동분류<span
								class="important_text"> *</span></td>
							<td class="table_content table_first">
								<div class="det_text_div" id="sche_acti_no">
								</div>
							</td>
						</tr>
						<tr class="">
							<td class="table_td_1" id="changeScheDivFirst">고객</td>
							<td class="table_content"><div
								class="det_text_div witdh100" id="sche_client_no"></div></td>
							<td class="table_td_1" id="changeScheDivSecond">고객사</td>
							<td class="table_content"><div
								class="det_text_div witdh100" id="sche_comp_no"></div></td>
						</tr>
							<tr class="">
							<td class="table_td_1">고객 측</br>참가자</td>
							<td class="table_content"><div
								class="det_text_div witdh100" id="sche_ci_participant"></div></td>
							<td class="table_td_1">중요도<span
								class="important_text"> *</span></td>
							<td class="table_content">
							<div class="det_text_div" id="sche_importance"></div>
							</td>
						</tr>
						<tr class="">
							<td class="table_td_1">일정 날짜<span class="important_text">
									*</span></td>
							<td class="table_content"><span
								class="date_time_box_div" id="sche_sdate"></span> ~ <span
								class="date_time_box_div t_i" id="sche_edate"></span></td>
							<td class="table_td_1">일정 시간<span class="important_text">
									*</span></td>
							<td class="table_content"><span
								class="date_time_box_div" id="sche_stime"></span> ~ <span
								class="date_time_box_div t_i" id="sche_etime"></span></td>
						</tr>
						<tr class="">
							<td class="table_td_1">주소</td>
							<td colspan="3" class="table_content"></div>
								<div
								 class="map_text3_div" id="sche_addr"></div></td>
						</tr>
						<tr class="u_s_tr">
							<td class="table_td_1">일정 내용<span
								class="important_text"> *</span></td>
							<td colspan="3" class="table_content"><textarea
									class="det_text2" readonly="readonly" id="sche_con"></textarea></td>
						</tr>
						<tr class="u_s_tr">
							<td class="table_td_1">일정 결과</td>
							<td colspan="3" class="table_content"><textarea
									class="det_text2" readonly="readonly" id="sche_res"></textarea></td>
						</tr>
					</table>
					<!-- 여기까지 세부사항 메인내용 테이블 -->
				</div>
				<!-- 세부사항 메인 내용 여기까지 -->
				</form>
				<div class="blank_space"></div>

				<div class="blank_space"></div>
				
				<!-- 첨부자료  -->
				<div class="rel_box">
					<!-- 첨부자료 상단 영역 -->
					<div class="rel_box_top">
						<!-- 상단 텍스트 영역 -->
						<div class="rel_text_2">
							첨부자료 <span class="list_count attach-list_count"></span>
						</div>
						<!-- 상단 버튼 영역 -->
						<div class="rel_button">
							<img alt="접기 버튼" src="resources/images/sche/Icon_align.png"
								class="updown_icon" id="attachUpDownBtn"/>
						</div>
					</div>
					<!-- 첨부자료 하단 영역 -->
					<div class="rel_box_bottom">
						<div class="attach-bottom_box">
						</div>
					</div>
				</div>
				<!-- 첨부자료 여기까지 -->
				
				<div class="blank_space"></div>

				<div class="blank_space"></div>

				<!-- 연관제품  -->
				<div class="rel_box">
					<!-- 연관제품 상단 영역 -->
					<div class="rel_box_top">
						<!-- 상단 텍스트 영역 -->
						<div class="rel_text_2">
							일정 상품 <span class="list_count prod-list_count"></span>
						</div>
						<!-- 상단 버튼 영역 -->
						<div class="rel_button">
							<img alt="접기 버튼" src="resources/images/sche/Icon_align.png"
								class="updown_icon" id="prodUpDownBtn"/>
						</div>
					</div>
					<!-- 연관제품 하단 영역 -->
					<div class="rel_box_bottom">
						<div class="minutes_box product_box">	
						</div>
					</div>
				</div>
				<!-- 연관제품 여기까지 -->
				
				<div class="blank_space"></div>

				<div class="blank_space"></div>

				<!-- 회의록 -->
				<div class="rel_box">
					<!-- 회의록 상단 영역 -->
					<div class="rel_box_top">
						<!-- 상단 텍스트 영역 -->
						<div class="rel_text_2">
							회의록 <span class="list_count minutes-list_conut"></span>
						</div>
						<!-- 상단 버튼 영역 -->
						<div class="rel_button">
							<img alt="접기 버튼" src="resources/images/sche/Icon_align.png"
								class="updown_icon" id="minutesUpDownBtn"/>
						</div>
					</div>
					<!-- 회의록 하단 영역 -->
					<div class="rel_box_bottom">
						<div class="minutes_box_real">
						</div>
					</div>
				</div>
				<!-- 회의록 여기까지 -->
				
				<div class="blank_space"></div>

				<div class="blank_space"></div>



				<!-- 의견 -->
				<div class="rel_box">
					<!-- 의견 상단 영역 -->
					<div class="rel_box_top">
						<!-- 상단 텍스트 영역 -->
						<div class="rel_text_2">
							의견 <span class="opin-list_count"></span>
						</div>
						<!-- 상단 버튼 영역 -->
						<div class="rel_button">
							<img alt="접기 버튼" src="resources/images/sche/Icon_align.png"
								class="updown_icon" id="opinUpdownBtn" />
						</div>
					</div>
					<!-- 의견 중단 영역 -->
					<div class="rel_box_bottom">
						<div class="opin_box">
						</div>
						<!-- 의견 하단 영역 -->
						<div class="opin_box_1">
							<!-- 하단 내용 입력 영역 -->
							<div class="left_box">
							<form action="#" id="opinForm" method="post">
								<input type="hidden" id="sche_no_opin" name="sche_no_opin" value="${param.sche_no}"/>
								<textarea class="input_style_normal1 input_min_mix1" id="sche_opin_con" name="sche_opin_con"></textarea>
								</form>
							</div>
							<!-- 하단 버튼 영역 -->
							<div class="right_box">
								<div class="btn_style_black1 btn_size_big1" id="scheOpinAddBtn">작성</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 의견 여기까지 -->
				<div class="blank_space"></div>
				<div class="blank_space"></div>
				<div class="blank_space"></div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>