<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리드</title>

<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Gothic A1', sans-serif;
}
/* 테이블 영역 */
.content_table {
	width: 1080px;
	border: 0px;
	vertical-align: top;
}

th {
	font-size: 10pt;
}
/*버튼영역*/
.content_btn_area {
	width: 1080px;
	height: 50px;
}
/*버튼을 div로 만들었습니다.
  버튼 속성입니다.
  버튼 영역 내에 있는 버튼의 속성
*/
.content_btn_area>div {
	display: table;
	width: 80px;
	height: 30px;
	font-size: 10pt;
	color: #595959;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #F2B807;
	margin-top: 10px;
	margin-left: 10px;
	vertical-align: middle;
	line-height: 30px;
}
/*버튼의 hover입니다.
버튼 영역 내에 있는 버튼의 hover효과*/
.content_btn_area>div:hover {
	background-color: #F2CB07;
	cursor: pointer;
}
/* 버튼 사이의 간격을 만들기위한 속성 */
.btn {
	margin-right: 10px;
}
/*테이블 속성입니다.*/
table {
	width: 1080px;
	border-collapse: collapse; /* 셀 테두리 합치기 */
	padding: 0px;
	margin: 0px;
	border-spacing: 0px;
	font-size: 10pt;
	border-top: 2px solid #F2CB07;
}

tr {
	border-bottom: 1px solid #CCC;
}
/*제목.*/
th {
	background-color: #EEEEEE;
	border-right: 1px solid #CCC;
	padding: 0px;
}
/*내용.*/
td {
	padding: 10px 15px;
}

/*내용열에 들어가는 텍스트 박스의 속성입니다.
  기본적으로 내용열에 텍스트박스만 있을때 쓰는 속성입니다.
*/
.table_txt {
	padding-left: 10px;
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
	text-align: left;
}
/*내용열에 텍스트박스와 버튼이 같이 들어갈 경우 사용하는 속성입니다.*/
.table_txt1 {
	padding-left : 10px;
	display: inline-block;
	vertical-align: top;
	/*버튼과 같이해서 width를 조절해주세요.*/
	width: 80%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/*여러열이 변동이 되면  txt1, txt2같이 표시해주세요.*/
.table_txt2 {
	padding-left : 10px;
	display: inline-block;
	vertical-align: top;
	width: 100%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/* 주소영역 반쪽자리 텍스트박스 */
.table_txt3 {
	padding-left : 10px;
	display: inline-block;
	vertical-align: top;
	width: 50%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/* 상세정보 텍스트박스 */
.table_txt4 {
	display: inline-block;
	vertical-align: top;
	width: 100%;
	height: 105px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/* height값을 자동으로 잡음 */
.tr_address {
	height: auto;
}
/* 테이블 내 인풋기본 사이즈 */
.input_size_normal {
	width: 100%;
	height: 35px;
	border-radius: 4px;
}
/* 테이블 내 인풋스타일 기본 */
.input_style_normal {
	font-size: 10pt;
	text-indent: 5px;
	border: 1px solid #cacaca;
	padding: 0px;
}
/* 주소영역 인풋타입 아래 간격 조절 */
.tr_address>td>input {
	margin-bottom: 10px;
}
/* readonly속성 배경색상 */
.is_read_only {
	background-color: #e0e0e0;
}
/*내용열에 들어가는 버튼의 속성입니다.*/
.text_btn {
	display: inline-block;
	width: 55px;
	height: 35px;
	margin-left: 10px;
	border: 0px;
	background-color: #595959;
	color: #F2F2F2;
	border-radius: 5px;
}

.text_btn:hover {
	background-color: #F2CB07;
	color: #595959;
	cursor: pointer;
}
/* *중요표시 글씨속성 */
.acc_txt {
	color: #ff3737;
	font-weight: 800;
}
/* 빨간색 버튼 */
.btn_red {
	display: inline-block;
	margin-left: 10px;
	text-align: center;
	vertical-align: middle;
	border-radius: 3px;
	background-color: #ff2f2f;
	border: 1px solid #ff4d4d;
	color: #ffffff;
	font-size: 10pt;
	font-weight: bold;
	cursor: pointer;
}
/* 정사각형 버튼 크기 - 취소 아이콘 버튼으로 활용 */
.btn_size_sqr {
	width: 20px;
	height: 20px;
	margin-left: 0px;
}
.search_pop_tbody > tr:hover {
	background-color : #eeeeee;
	cursor : pointer;
	text-decoration : underline;
}
/* 첨부파일 영역 */
.attach_area {
	margin-top: 60px;
	width: 1080px;
	border: 0px;
	font-size: 15px;
	vertical-align: top;
}

.attach_area>table {
	border-collapse: collapse;
	padding: 0px;
	margin: 0px;
	border-spacing: 0px;
	font-size: 15px;
	border-top: 2px solid #F2CB07;
	border-bottom: 2px solid #F2CB07;
	width: 1080px;
}

.attach_area>table tr {
	border-bottom: 1px solid #CCC;
}

.attach_area>table td {
	font-size: 15px;
}
/* 첨부파일 제목 */
.attach_title_txt {
	display: inline-block;
	padding: 5px;
	color: #272727;
	font-weight: bold;
	font-size: 15pt;
	line-height: 40px;
	vertical-align : middle;
}

.attach_img {
	display: inline-block;
	vertical-align: top;
	width: 40px;
	height: 40px;
	cursor: pointer;
}
/* 필드 내용 */
.field_icon_contents {
	padding: 10px 15px;
	text-align: center;
	vertical-align: middle;
}

.trash_img {
	cursor: pointer;
}
/* 필드 내용이되 정렬은 가운데로 하고싶을때 */
.contents_align_center {
	text-align: center;
}
.input_search {
	width: 100%;
    height: 50px;
    font-size: 13pt;
    text-indent: 10px;
    border: 1px solid #cacaca;
    border-radius : 5px;
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
	width: 100% !important;
	text-align: center;
    border-collapse: collapse;
    font-size: 10pt !important;
    position: relative;
    top: -20px;
}
.pop_list>tbody>tr {
	cursor: pointer;
}
</style>
<c:import url="/header"></c:import>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
var COMP_ADDR1 = new Array();
var COMP_ADDR2 = new Array();
var COMP_ADDR3 = new Array();
$(document).ready(function() {
	
	$(".reg_Btn").on("click", function(){
		if ($.trim($("#lead_name").val()) == "") {
			makeAlert(7, "망고CRM관리자", "리드명을 입력해주세요.", null)
			$("#lead_name").focus();
		} else if ($.trim($("#table_txt1").val()) == "") {
			makeAlert(7, "망고CRM관리자", "고객명을 입력해주세요.", null)
			$("#table_txt1").focus();
		}else if ($.trim($("#table_txt3").val()) == "") {
			makeAlert(7, "망고CRM관리자", "담당자를 입력해주세요.", null)
				$("#table_txt3").focus();
			}
			else {
			makeTwoBtnPopup(7, "수정 확인 팝업", "수정하시겠어요??", true, 400, 200, null, "수정", function(){
				leadupdate();
				closePopup(7);
			},"취소", function(){
				closePopup(7);	
			});
		}
	});
	$("#mapBtn").postcodifyPopUp();
	
	$("#reg_cancel_Btn").on("click", function(){
		history.back();
	});
	$("#client_Btn").on("click", function(){
		html = "";
		html += "<form action = \"#\" id = \"srchForm\" method = \"post\">"
// 		html += "<input type = \"hidden\" id = \"searchTxt\" name = \"searchTxt\"/>"
		html += "</form>";
		html += "<div>";
		html += "<input type = \"text\" class = \"input_address2\" id=\"txt_client_search\" placeholder = \"Ex)구디아카데미\"/>";
		html += "<img src = \"resources/images/Lead/icon_search_gray.png\" alt = \"\" width = \"30px\" class = \"address_search_icon\">";
		html += "<img src = \"resources/images/Lead/icon_cancel_gray.png\" alt = \"\" width = \"20px\" class = \"address_search_cancel\">";
		html += "</div>";
		html += "<table class = \"pop_table\" style=\"width: 100%; height : auto; position : relative; top : -20px; border-top:0px;\">";
		html += "<colgroup><col width=\"20%\" /><col width=\"40%\" /><col width=\"40%\" /></colgroup>";
		html += "<thead>";
		html += "<tr class = \"search_pop_title\">";
		html += "<td>고객번호</td>";
		html += "<td>고객이름</td>";
		html += "<td>고객사</td>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody class = \"search_pop_tbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class = \"list_paging_area\" style = \"margin-top : 4px !important;\"></div>";
		
		makeNoBtnPopup(7, "고객검색 팝업", html , true, 500, 600, function() {
			reloadList();
			
			$(".search_pop_tbody").on("click", "tr", function(){
				if(($(this).attr("name") != "")){
					$("#cl_nm").val($(this).children(".cl_name").attr("name"));
					$("#cl_no").val($(this).children(".cl_num").attr("name"));
					$("#co_nm").val($(this).children(".co_name").attr("name"));
					$("#table_txt1").val($(this).children(".cl_name").attr("name"));
					$("#table_txt2").val($(this).children(".co_name").attr("name"));
					$("#addr1").val(COMP_ADDR1[$("#cl_no").val()]);
					$("#addr2").val(COMP_ADDR2[$("#cl_no").val()]);
					$("#addr3").val(COMP_ADDR3[$("#cl_no").val()]);
					$("#addr_zc").val(COMP_ADDR1[$("#cl_no").val()]);
					$("#addr").val(COMP_ADDR2[$("#cl_no").val()]);
					$("#addr_detail").val(COMP_ADDR3[$("#cl_no").val()]);
					closePopup(7);
				}
			});
			$(".list_paging_area").on("click", "div", function(){
				if(($(this).attr("name") != "")){
					$("#page").val($(this).attr("name"));
					reloadList();
				}
			});
		});
		$("#txt_client_search").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$(".address_search_icon").click();
				return false;
			}
		});
		
		$(".address_search_icon").on("click", function(){
			$txt_client_search = $("#txt_client_search").val();
			$("#searchTxt").val($txt_client_search);
			console.log($("#searchTxt").val());
			reloadList();
		});
		$(".address_search_cancel").on("click", function(){
			$("#txt_client_search").val("");
			$txt_client_search = $("#txt_client_search").val();
			$("#searchTxt").val($txt_client_search);
			reloadList();
		});
				
	});
	
	function reloadList() {
		var params = $("#popForm").serialize();
		$.ajax({
			type : "post",
			url : "leadpopAjax",
			dataType : "json",
			data : params,

			success : function(result) {
				redrawList(result.pop);
				redrawPaging(result.pb);
				
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	function redrawList(pop) {
		if (pop.length != 0) {
			var html = "";
			var lsize = 7 - pop.length;
			
			for ( var i in pop) {
				COMP_ADDR1[i] = pop[i].COMP_ZC;
				COMP_ADDR2[i] = pop[i].COMP_ADDR;
				COMP_ADDR3[i] = pop[i].COMP_DETAIL_ADDR;
				html += "<tr class = \"cl_no\" name=\"" + pop[i].CLIENT_NO + "\">";
				html += "<td class = \"cl_num\" name=\"" + pop[i].CLIENT_NO + "\">"+pop[i].CLIENT_NO+"</td>";
				html += "<td class=\"cl_name\" name = \"" + pop[i].CLIENT_NAME + "\">"+pop[i].CLIENT_NAME+"</td>";
				html += "<td class=\"co_name\" name = \""+pop[i].COMP_NAME+"\">"+pop[i].COMP_NAME+"</td>";
				html += "</tr>";
			}	
			for(var j = 0; j < lsize; j++){
				html += "<tr>";
				html += "</tr>";
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
	$("#emp_Btn").on("click", function() {
		var html = "";
		
		html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
		html += "<div>";
		html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
		html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
		html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
		html += "</div>";
		html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
		html += "</form>";
		html += "<table class=\"pop_list\" style = \"border-top : 0px;\">";
		html += "<colgroup><col width=\"15%\"/><col width=\"20%\"/><col width=\"20%\"/><col width=\"20%\"/><col width=\"25%\"/>";
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
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
        html += "</div>";
        
        makeNoBtnPopup(1, "담당자 검색", html, true, 600, 600, function() {
        	getEmpList();
        	setEmpEvent();
		});
	});
	// 담당자 목록 Get
	function getEmpList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "getEmpPopAjax",
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
			$("#table_txt3").val(select.substring(select.indexOf("_") + 1));
			$("#emp_no").val(select.substring(0, select.indexOf("_")));
			closePopup(1);
		});
	}
	// 리스트 Paging draw
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
	$("#lead_stat").val("${data.LS_NO}");
	$("#cong_path").val("${data.CP_NO}");
	
	function leadupdate() {
		
		var params = $("#popForm").serialize();
		
		$.ajax({
			type: "post",
			url: "listupdateAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "SUCCESS") {
					$("#popForm").attr("action", "leadDetail");
					$("#popForm").submit();
				}
				else {
					makeAlert(1, "수정 실패", "수정에 실패했습니다.", null);
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


</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">5</c:param>
	</c:import>
	

	<div class="title_area">리드 수정</div>
	<div class="content_area">
	<form action="#" id="popForm" method="post">
		<input type="hidden" id="page" name="page" value="1"> 
		<input type="hidden" id="searchTxt" name="searchTxt" />
		<input type="hidden" id="lead_no" name="lead_no" value = "${data.L_NO}"/>
		<input type="hidden" id="cl_no" name="cl_no"> 
		<input type="hidden" id="cl_nm" name="cl_nm"> 
		<input type="hidden" id="co_nm" name="co_nm"> 
		<input type="hidden" id="emp_no" name="emp_no"> 
		<input type = "hidden" id = "addr_zc" name = "addr_zc">	
		<input type = "hidden" id = "addr" name = "addr">
		<input type = "hidden" id = "addr_detail" name = "addr_detail">
		<input type = "hidden" id = "ci_no" name = "ci_no" value = "${data.C1_NO}">
		<input type = "hidden" id = "em_no" name = "em_no" value = "${data.E_NO}">
		<div class="contents_wrap">
			<!-- 버튼영역 -->
			<div class="content_btn_area">
				<!-- 버튼-->
				<div id="reg_cancel_Btn" class="btn">취소</div>
				<div class="reg_Btn">수정</div>
			</div>
			<!-- 테이블 영역입니다. -->
			<div class="content_table">
				<table>
					<colgroup>
						<!-- 테이블열들의 너비입니다. -->
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<th>리드명<span class="acc_txt">*</span></th>
						<td><input type="text" id = "lead_name" name = "lead_name" class="table_txt" value = "${data.L_NM}"/></td>

						<th>고객명<span class="acc_txt">*</span></th>
						<td><input type="text" id = "table_txt1" class="table_txt1" readonly="readonly" value = "${data.C1_NM}"/>
							<input type="button" id="client_Btn" class="text_btn" value="검색" /></td>
					</tr>
					<tr>
						<th>리드상태</th>
						<td>
							<select class="input_style_normal input_size_normal" id = "lead_stat" name = "lead_stat">
								<option value = "0" selected="selected">Unqualified</option>
								<option value = "1">New</option>
								<option value = "2">Working</option>
								<option value = "3">Nurturing</option>
								<option value = "4">Conversion</option>
							</select>
						</td>
						<th>고객사<span class="acc_txt">*</span></th>
						<td><input type="text" id = "table_txt2" class="table_txt" value = "${data.C2_NM}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th>인지경로</th>
						<td><select class="input_style_normal input_size_normal" name = "cong_path" id = "cong_path">
								<option value = "0" selected="selected">지인추천</option>
								<option value = "1">웹검색</option>
								<option value = "2">광고</option>
								<option value = "3">기타</option>
						</select></td>
						<th>담당자<span class="acc_txt">*</span></th>
						<td><input type="text" id = "table_txt3" class="table_txt1" value = "${data.E_NM}"readonly="readonly" />
							<input type="button" id="emp_Btn" class="text_btn" value="검색" />
						</td>
					</tr>
					<!-- 주소영역 -->
					<tr class="tr_address">
						<th>주소<span class="acc_txt">*</span></th>
						<td colspan="3"><input type="text" id="addr1"
							class="table_txt3 is_read_only  postcodify_postcode5" value = "${data.FA}"readonly="readonly" />
							<input type="text" class="table_txt2 is_read_only postcodify_address" id = "addr2" value = "${data.MA}"readonly="readonly" /> 
							<input type="text" id = "addr3"class="table_txt2 postcodify_details is_read_only" value = "${data.LA}" readonly = "readonly"/></td>
					</tr>
				</table>
			</div>
		</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>