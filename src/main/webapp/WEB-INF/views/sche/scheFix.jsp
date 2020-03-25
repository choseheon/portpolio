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
	
	/* 일정구분, 활동분류 출력 */
	loadSelectList();
	
	/* 일정 세부데이터 출력 */
	reLoadData();
	
	/* 의견 출력 */
	reloadOpinList();
	
	
	/* 일정 등록 버튼 */
	$("#scheAdd").on("click", function() {		
		
		makeTwoBtnPopup(1, "수정하시겠습니까?", "계속 진행 시 수정합니다.", true, 400, 250, null, "확인", function() {
			

			if($.trim($('select[name="scheActiNo"]').val()) == ""){
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
					url : "scheFixAjax", //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// {키: 값, 키:값, ...} - > json
					
					success : function(result){
						 if(result.res == "SUCCESS"){
								$("#actionForm").attr("action","scheDet");
								$("#actionForm").submit();
							}
							else{
								alert("일정 수정에 실패하였습니다.");
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
	
	/* 일정 삭제 버튼 */
	$("#scheDelete").on("click",function(){
		makeTwoBtnPopup(1, "삭제하시겠습니까", "계속 진행 시 삭제합니다.", true, 400, 250, null, "확인", function() {
			
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post", //데이터 전송방식
				url : "scheFixDeleteAjax", //주소
				dataType : "json", //데이터 전송 규격
				data : params, //보낼 데이터
				// {키: 값, 키:값, ...} - > json
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 location.href = "scheListTest";
						}
						else{
							alert("일정 삭제에 실패하였습니다.");
						}
				} , 
				error : function(request,status,error) {
					console.log("status : "+request.status);
					console.log("text : "+request.responseText);
					console.log("error : "+error);
				}
				
			});	
		},"취소", function() {
			closePopup(1);
		});
	});
	
	/* 첨부자료 등록 */
	$("#attPlusBtn").on("click",function(){
		$(".attachUpload").click();
	
	});
	
	/* 첨부자료 등록 */
	$(".attachUpload").on("change", function() {
		var dataForm = $("#attachForm");
		
		dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
			success: function(responseText, statusText){
				
				console.log(responseText.fileName[0]);
				
				$("#attachFile").val(responseText.fileName[0]);
				
				var params = $("#attachForm").serialize();
				
				$.ajax({
					
					type : "post",
					dataType : "json",
					url : "scheInsertAttatchAjax",
					data : params,
					
					success : function(result){
						 if(result.res == "SUCCESS"){
							 $("#attach_no").val("");
							 	closePopup(1);
								reloadOpinList();
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
	
	/* 일정상품 등록 */
	$("#prodPlusBtn").on("click",function(){
		
		html = "";
		
		html += "<form action=\"#\" method=\"post\" id=\"prodForm\">";
		html += "<input type=\"hidden\" name=\"prod_sche_no\" id=\"prod_sche_no\">";
		html += "<input type=\"hidden\" name=\"prodNo\" id=\"prodNo\">";
		html +=	"<input type=\"hidden\" id=\"searchTxt\" name=\"searchTxt\" />"; 
		html += "<div class=\"pop_content_prod\">                                                                              ";
		html += "<div class=\"pop_comp_search he59\">                                                                               ";
		html += "<input type = \"text\" class = \"input_address2\" id=\"txt_client_search\">";
		html += "<img src = \"resources/images/Lead/icon_search_gray.png\" alt = \"\" width = \"30px\" class = \"address_search_icon\">";
		html += "<img src = \"resources/images/Lead/icon_cancel_gray.png\" alt = \"\" width = \"20px\" class = \"address_search_cancel\">";
		html += "	 </div>                                                                                                    ";
		html += "	 <table class=\"table_area_prod\">                                                                         ";
		html += "	 	<colgroup>                                                                                             ";
		html += "	 		<col width=\"20%\" />                                                                              ";
		html += "	 		<col width=\"30%\" />                                                                              ";
		html += "	 		<col width=\"20%\" />                                                                              ";
		html += "	 		<col width=\"30%\" />                                                                              ";
		html += "	 	</colgroup>                                                                                            ";
		html += "	 	<tr class=\"table_tr\">                                                                                ";
		html += "	 		<td class=\"table_td_1\">제품유형                                   ";
		html += "					</td>                                                                              ";
		html += "	 		<td class=\"table_content\">                                                                       ";
		html += "	 			<select class=\"det_text\" name=\"prod_type\">                                                                    ";
		html += "				<option value=\"1\">인터넷</option>                                                              ";
		html += "				<option value=\"2\">보안</option>										                       ";
		html += "			</select>                                                                                          ";
		html += "	 		</td>                                                                                              ";
		html += "	 		<td class=\"table_td_1\">제품구분                                  ";
		html += "					</td>                                                                              ";
		html += "	 		<td class=\"table_content\">                                                                       ";
		html += "	 			<select class=\"det_text\" name=\"prod_div\">                                                                    ";
		html += "				<option value=\"1\">제품</option>                                                             ";
		html += "				<option value=\"2\">서비스</option>                                                             ";
		html += "			</select>                                                                                          ";
		html += "	 		</td>                                                                                              ";
		html += "	 	</tr>                                                                                                  ";
		html += "	 	<!-- <tr class=\"product_tr\">                                                                         ";
		html += "	 		<td colspan=\"4\">상품명</td>                                                                      ";
		html += "	 	</tr> -->                                                                                              ";
		html += "	 </table>                                                                                                  ";
		html += "	 <div class=\"product_area\">                                                                              ";
		html += "	 	<div class=\"scroll\">                                                                                 ";
		html += "	 	</div>                                                                                                 ";
		html += "	 </div>                                                                                                    ";
		html += "</div>                                                                                                        ";
		
		
		
		 makeNoBtnPopup(1, "일정 상품", html, true, 517, 600, function() {
			 reloadProdList();
		});
		 
		 $(".product_area").on("click",".product_name",function(){
			 
     		$("#prodNo").val($(this).attr("name"));
     		$("#prod_sche_no").val($("#sche_no").val());
     		
     		var params = $("#prodForm").serialize();
 			
 			$.ajax({
 				
 				type : "post",
 				dataType : "json",
 				url : "scheInsertProdAjax",
 				data : params,
 				
 				success : function(result){
 					 if(result.res == "SUCCESS"){
 						 	closePopup(1);
 							reloadOpinList();
 						}
 						else{
 							alert("일정상품 등록에 실패하였습니다.");
 						}
 				},
 				error : function(){
 					console.log("status : "+request.status);
 					console.log("text : "+request.responseText);
 					console.log("error : "+error);
 				}
 			}); 
     		 
     	});
		 
		 $('.scroll').slimScroll({
		        height: '360px',
		        width: '477px'
		 });
		 
		 $(".address_search_icon").on("click", function(){
				$txt_client_search = $("#txt_client_search").val();
				$("#searchTxt").val($txt_client_search);
				reloadProdList();
			});
			
			$(".address_search_cancel").on("click",function(){
				$("#txt_client_search").val("");
				$txt_client_search = $("#txt_client_search").val();
				$("#searchTxt").val($txt_client_search);
				reloadProdList();
			});
	});

	/* 회의록 등록 */
	$("#minutesPlusBtn").on("click",function(){
		
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
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" name=\"minutes_title\"></td>";
		html += "</tr>";
		html += "<tr class=\"table_tr height50\">";
		html +=	"<td class=\"table_td_1\">참석자</td>";
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" name=\"minutes_participant\"></td>";
		html += "</tr>";
		html += "</table>";
		html += "<textarea class=\"det_text_rel\" name=\"minutes_con\"></textarea>";
		html += "</form>";
		
		makeTwoBtnPopup(1, "회의록", html , true, 700, 650, null, "등록", function() {
			$("#minutes_sche_no").val($("#sche_no").val());
			
			var params = $("#minutesForm").serialize();
			
			
			$.ajax({
				
				type : "post",
				dataType : "json",
				url : "scheInsertMinutesAjax",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 	closePopup(1);
							reloadOpinList();
						}
						else{
							alert("회의록 등록에 실패하였습니다.");
						}
				},
				error : function(){
					console.log("status : "+request.status);
					console.log("text : "+request.responseText);
					console.log("error : "+error);
				}
			}); 
			 
		},"취소", function() {
			closePopup(1);
		});
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
});
/* 일정 세부사항,수정 기본 데이터 출력 Ajax*/
function reLoadData(){
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		
		type : "post",
		url : "scheDataAjax",
		dataType : "json",
		data : params,
		
		success : function(result){
			loadData(result.scheData, result.address);
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
function loadData(scheData,address){

	$("#scheRadio").html(scheData.CN);
	
	$("#scheActiNo").children().each(function(){
		if($(this).html() == scheData.DN){
			$(this).attr("selected","true");
		}
	});
	
	$("#scheImportance").children().each(function(){
		if($(this).html() == scheData.SCHE_IMPORTANCE){
			$(this).attr("selected","true");
		}
	});

	$("#sche_sdate").val(scheData.SDATE);
	$("#sche_edate").val(scheData.EDATE);
	$("#sche_stime").val(scheData.STIME);
	$("#sche_etime").val(scheData.ETIME);
	if(scheData.ADDR != "()"){
		$("#sche_addr").html(scheData.ADDR);		
	}
	$("#sche_con").html(scheData.SCHE_CON);
	$("#sche_res").html(scheData.SCHE_RES);
	
	if(address != null){
	var addressData = address.split(",");
	
	$("#sche_postcode").val(addressData[0]);
	$("#sche_addr").val(addressData[1]);
	$("#sche_det_addr").val(addressData[2]);
	}
	
}

/* 일정 세부사항, 수정 기본 고객 데이터 출력 기능 */
function loadScheDiv(scheDivData){
	
	
	
	if($("#scheDivNoM").val() == 0){
		$("#changeScheDivFirst").html("고객");
		$("#changeScheDivSecond").html("고객사");
		if(scheDivData != null){
		$("#sche_comp_no").val(scheDivData.COMP_NAME);
		$("#sche_client_no").val(scheDivData.CLIENT_NAME);
		$("#sche_ci_participant").val(scheDivData.SCHE_CI_PARTICIPANT);
		}
	}
	else if($("#scheDivNoM").val()==1){
		$("#changeScheDivFirst").html("리드명");
		$("#changeScheDivSecond").html("담당자");
		if(scheDivData != null){
		$("#sche_comp_no").val(scheDivData.LEAD_NAME);
		$("#sche_client_no").val(scheDivData.EMP_NAME);
		$("#sche_ci_participant").val(scheDivData.SCHE_CI_PARTICIPANT);
		}
	}
	else{
		$("#changeScheDivFirst").html("영업명");
		$("#changeScheDivSecond").html("담당자");
		if(scheDivData != null){
		$("#sche_comp_no").val(scheDivData.CHN_NAME);
		$("#sche_client_no").val(scheDivData.EMP_NAME);
	 	$("#sche_ci_participant").val(scheDivData.SCHE_CI_PARTICIPANT);
		}
	}
	
}

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
	
	/* 고객,리드, 영업 검색  */
	$(".scheClientBtn").on("click", function(){
		
		var title = "";
		
		html = "";
		html += "<div>";
		html += "<form action=\"#\" method=\"post\" id=\"clientSearchForm\">";
		html += "<input type=\"hidden\" name=\"page\" value=\"1\" id=\"page\"/>";
		html +=	"<input type=\"hidden\" id=\"searchTxt\" name=\"searchTxt\" />"; 
		html +=	"<input type=\"hidden\" id=\"no\" name=\"no\">"; 
	 	html += "<input type=\"hidden\" id=\"schDivNo\" name=\"schDivNo\" value=\""+${param.scheDivNoM}+"\">";
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
	});

}

/* 활동분류 리스트 출력 */
function redrawOptionList(option) {
	
		var html = "";
		
		if($("#sche_div_name").val()=="일정"){
			for ( var i = 0;i<4;i++) {			
				html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\">"+ option[i].CODE_NAME +"</option>";
			}	
		}
		if($("#sche_div_name").val()=="리드"){
			for ( var i = 0;i<4;i++) {			
				html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\">"+ option[i].CODE_NAME +"</option>";
			}	
		}
		if($("#sche_div_name").val()=="영업"){
			for ( var i in option) {
				if(option[i].CODE_NAME == "기타"){
					html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\" selected=\"selected\">"+ option[i].CODE_NAME +"</option>";
				}
				else{				
				html += "<option name=\"sche_acti_no\" value=\""+option[i].CODE_S_CATE+"\">"+ option[i].CODE_NAME +"</option>";
				}
			}		
		}
		
	$("#scheActiNo").html(html);
}

/* ----------------------------------------------- 고객,리드,영업 검색 -----------------------------------*/
function reloadList() {
	
	
	/* $("#schDivNo").val($("#scheDivNoM").val()); */

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
		
		if($("#scheDivNoM").val()==0){
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
		
		if($("#scheDivNoM").val()==1){
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
		
		if($("#scheDivNoM").val()==2){
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


function reloadProdList(){
var params = $("#prodForm").serialize();
	
	$.ajax({
		
		type : "post",
		url : "loadProdListAjax",
		dataType : "json",
		data : params,
		
		success : function(result){
			prodDataList(result.prodList);
		} , 
		error : function(request,status,error) {
			console.log("status : "+request.status);
			console.log("text : "+request.responseText);
			console.log("error : "+error);
		}
	});
}

function prodDataList(prodList){
	
	var html ="";
	
	for(var i in prodList){
		html += "<div class=\"product_name\" name=\""+prodList[i].PROD_NO+"\">"+prodList[i].PROD_NAME+"</div>";   
	}                                                                   

	$(".scroll").html(html);
	
}


/* ----------------------------------------------------의견 -------------------------------------------- */
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
/* ----------------------------------------------------의견end -------------------------------------------- */

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
		var  sessionTeamNo = "<%=session.getAttribute("sTeamNo") %>"; 	
	 if(sessionTeamNo == minuteslist[i].TEAM_NO){
	html +=	"<div class=\"del_btn_div minutesDelBtn\">";
	html +=		"<img src=\"resources/images/sche/icon_del_white.png\" class=\"opin_del_btn\">";
	html +=	"</div>";
	 }
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
	
	/* 회의록 삭제 */
	$(".minutesDelBtn").on("click",function(){
		var minutesNO = $(this).parent(".minute_box").attr("name");
		makeTwoBtnPopup(2, "삭제하시겠습니까", "계속 진행 시 삭제합니다.", true, 400, 250, null, "확인", function() {
			
			
			$("#minutes_no").val(minutesNO);
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				
				type : "post",
				url : "scheMinutesDelAjax",
				dataType : "json",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 closePopup(2);
						 reloadOpinList();
						}
						else{
							alert("회의록 삭제에 실패하였습니다.");
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
	html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" name=\"minutes_title\" value=\""+minutesData.ML_NAME+"\"></td>";
	html += "</tr>";
	html += "<tr class=\"table_tr height50\">";
	html +=	"<td class=\"table_td_1\">참석자</td>";
	if(typeof minutesData.ML_PARTICIPANT == "undefined"){		
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" name=\"minutes_participant\"></td>";
	}
	else{
		html +=	"<td colspan=\"3\" class=\"table_content\"><input type=\"text\" class=\"det_text\" name=\"minutes_participant\" value=\""+minutesData.ML_PARTICIPANT+"\"></td>";
	}
	html += "</tr>";
	html += "</table>";
	html += "<textarea class=\"det_text_rel\" name=\"minutes_con\">"+minutesData.ML_CON+"</textarea>";
	html += "</form>";
	
	makeTwoBtnPopup(1, "회의록", html , true, 700, 650, null, "수정", function() {
		$("#minutes_sche_no").val($("#minutes_no").val());
		
		var params = $("#minutesForm").serialize();
		
		
		$.ajax({
			
			type : "post",
			dataType : "json",
			url : "scheUpdateMinutesjax",
			data : params,
			
			success : function(result){
				 if(result.res == "SUCCESS"){
					 	closePopup(1);
						reloadOpinList();
					}
					else{
						alert("회의록 수정에 실패하였습니다.");
					}
			},
			error : function(){
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
		}); 
		 
	},"취소", function() {
		closePopup(1);
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
	var  sessionTeamNo = "<%=session.getAttribute("sTeamNo") %>"; 	
	 if(sessionTeamNo == attachlist[i].TEAM_NO){
	html +=	"<div class=\"del_btn_div attDelBtn\">";
	html +=		"<img src=\"resources/images/sche/icon_del_white.png\" class=\"opin_del_btn\">";
	html +=	"</div>";
	 }
	html += "</div>";
	
	}
	
	$(".attach-list_count").html(cntHtml);
	$(".attach-bottom_box").html(html);
	
	/* 첨부자료 삭제 기능 */
	$(".attDelBtn").on("click",function(){
		var attachNO = $(this).parent(".att_box").attr("name")
		makeTwoBtnPopup(2, "삭제하시겠습니까", "계속 진행 시 삭제합니다.", true, 400, 250, null, "확인", function() {
			
			
			$("#attach_no").val(attachNO);
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				
				type : "post",
				url : "scheAttachDelAjax",
				dataType : "json",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 closePopup(2);
						 reloadOpinList();
						}
						else{
							alert("첨부자료 삭제에 실패하였습니다.");
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
		
		
	});
	
}// 첨부자료 기능 끝

/* 일정상품 리스트 출력 */
function loadProdList(prodlist,prodCnt){
	var html="";
	var cntHtml ="";	
	
	cntHtml += "(" + prodCnt + ")";
	
	
	
	
	for(var i in prodlist){
		if (typeof prodlist[i].GOODS_NO == "undefined") {
			html += "<div class=\"prod_box\" name=\""+prodlist[i].SERVICE_NO+"\" >";
		} else {
			html += "<div class=\"prod_box\" name=\""+prodlist[i].GOODS_NO+"\" >";
		}
	html += 	"<div class=\"prod_left_box\">                                            ";
	html += 	"<img src=\"resources/images/sche/product_icon.png\" class=\"prod_icon prodDetBtn\" id=\""+prodlist[i].DIV_NO+"\">                                                 ";
	html += 	"</div>                                                                 ";
	html += 	"<div class=\"prod_right_box2\">                                          ";
	html += 	"<div class=\"left_opin_content cursor_p prodDetBtn\" id=\""+prodlist[i].DIV_NO+"\">"+prodlist[i].PROD_NAME+"</div>";
	html += 	"<div class=\"left_user_data\">"+prodlist[i].EMP +" | "+ prodlist[i].DT+"</div>    ";
	html += 	"</div>                                                                 ";
		var  sessionTeamNo = "<%=session.getAttribute("sTeamNo") %>"; 	
		 if(sessionTeamNo == prodlist[i].TEAM_NO){
 	html +=	"<div class=\"del_btn_div prodDelBtn\" name=\""+prodlist[i].SCHE_PROD_NO+"\">";
 	html +=		"<img src=\"resources/images/sche/icon_del_white.png\" class=\"opin_del_btn\">";
 	html +=	"</div>";
	}
	html += "</div>";
	}
	
	$(".prod-list_count").html(cntHtml);
	$(".product_box").html(html);
	
	$(".prodDetBtn").on("click",function() {
				$("#prod").val($(this).attr("id"));

				if ($("#prod").val() == 1) {
					$("#goods_no").val($(this).parent().parent(".prod_box").attr("name"));
				} else {
					$("#service_no").val($(this).parent().parent(".prod_box").attr("name"));
				}
				
				console.log($("#prod").val());
				console.log($("#goods_no").val());
				console.log($("#service_no").val());
				
				$("#actionForm").attr("action", "goodsDet");
				$("#actionForm").submit();
	});
	
	$(".prodDelBtn").on("click",function(){
		var prodNO = $(this).attr("name");
		makeTwoBtnPopup(2, "삭제하시겠습니까", "계속 진행 시 삭제합니다.", true, 400, 250, null, "확인", function() {
			
			
			$("#prod_no").val(prodNO);
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				
				type : "post",
				url : "scheProdDelAjax",
				dataType : "json",
				data : params,
				
				success : function(result){
					 if(result.res == "SUCCESS"){
						 closePopup(2);
						 reloadOpinList();
						}
						else{
							alert("일정상품 삭제에 실패하였습니다.");
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
	});
}

</script>
</head>
<body>
	<c:import url="/topLeft">
			<c:param name="menuNo">7</c:param>
	</c:import>
	<div class="title_area">일정 수정</div>
	<div class="content_area">
		<!-- 세부사항 메인 내용 -->
			<form action="#" method="post" id="actionForm" >
				<div class="MainContent">
					<!-- 세부사항 버튼 공간 -->
					<div class="select_space">
						<div class="top_title_area"></div>
						<div class="content_btn">
							<div id="scheDelete">삭제</div>
							<div id="scheCancel">취소</div>
							<div id="scheAdd">저장</div>
						</div>
					</div>

					<!-- 주황색 선 -->
					<div class="line"></div>
					<!-- 세부사항 메인내용 테이블 -->
					<c:choose>
						<c:when test="${!empty param.client_no}">
							<input type="hidden" name="cNo" id="cNo" value="${param.client_no}"/>
						</c:when>
						<c:when test="${!empty param.lead_no}">
							<input type="hidden" name="cNo" id="cNo" value="${param.lead_no}"/>
						</c:when>
						<c:when test="${!empty param.chnNo}">
							<input type="hidden" name="cNo" id="cNo" value="${param.chnNo}"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="cNo" id="cNo" value="${param.cNo}"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="page" name="page" value="1"> 
					<input type="hidden" name="opin_no" id="opin_no"/>
					<input type="hidden" name="attach_no" id="attach_no"/>
					<input type="hidden" name="minutes_no" id="minutes_no"/>
					<input type="hidden" name="prod_no" id="prod_no"/>
					<input type="hidden" name="prod" id="prod"/>
					<input type="hidden" name="service_no" id="service_no"/>
					<input type="hidden" name="goods_no" id="goods_no"/>
					<input type="hidden" name="sche_div_name" id="sche_div_name" value="${param.sche_div_name}"/>
					<input type="hidden" name="scheDivNoM" id="scheDivNoM" value="${param.scheDivNoM}"/>
					<input type="hidden" name="sche_no" id="sche_no" value="${param.sche_no}"/>
					
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
							<select name="scheImportance" class="det_text" id="scheImportance">
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
									class="det_text2" name="sche_res" id="sche_res"></textarea></td>
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
						<form action="fileUploadAjax" id="attachForm" method="post" enctype="multipart/form-data">
							<img alt="접기 버튼" src="resources/images/sche/file_plus_icon.png"
								class="plus_gabage_icon" id="attPlusBtn"/>
							<input type="file" name="attach" class="attachUpload" accept="image/* , .pdf , .hwp , .docx , .xlsx , audio/* , video/*"/>
							<input type="hidden" name="sche_no_attach" id="sche_no_attach" value="${param.sche_no}"/>
							<input type="hidden" name="attachFile" id="attachFile" />
						</form>
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
							<img alt="추가 버튼" src="resources/images/sche/file_plus_icon.png"
								class="plus_gabage_icon" id="prodPlusBtn"/>
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
							<img alt="추가 버튼" src="resources/images/sche/file_plus_icon.png"
								class="plus_gabage_icon" id="minutesPlusBtn"/>
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