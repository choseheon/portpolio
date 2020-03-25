<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<style type="text/css">
table {
	width: 1200px;
	text-align: center;
	border-collapse: collapse;
	font-size: 10pt;
}

.card_view_top {
	height: 100px;
	width: 1200px;
}

.srch_table_view {
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: top;
}

.srch_table_view>img {
	width: 100%;
	height: 100%;
}

.srch_card_view {
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: top;
}

.srch_card_view>img {
	width: 100%;
	height: 100%;
}
/* Unqualified, New, Working, Nurturing, Conversion 단계별 */
.card_view_title_stat {
	display: inline-block;
	width: calc(20% - 15px);
	height: 100%;
	vertical-align: top;
	text-align: center;
}

/*  */
.card_view_stat_plus {
	display: inline-block;
	width: 180px;
	height: 40px;
	border-radius: 3px;
	background-color: #F2CB07;
	border: 0px solid #c5960a;
	color: #595959;
	font-size: 10pt;
	font-weight: bold;
	line-height: 40px;
	vertical-align: middle;
	cursor: pointer;
}
.card_view_stat {
	display: inline-block;
	width: 180px;
	height: 40px;
	border-radius: 3px;
	background-color: #F2CB07;
	border: 0px solid #c5960a;
	color: #595959;
	font-size: 10pt;
	font-weight: bold;
	line-height: 40px;
	vertical-align: middle;
	cursor: pointer;
}

.card_view_stat_plus:hover {
	box-shadow: 1px 1px 8px #c8c8c8;
}
.card_view_stat:hover {
	box-shadow: 1px 1px 8px #c8c8c8;
}
/* 카드 내부 */
.card {
	display: block;
	width: 180px;
	height: 100px;
	background-color: #FFFFFF;
	border: 1px solid #d0d0d0;
	border-radius: 3px;
	margin-top: 10px;
	margin-left: 22px;
	text-align: left;
	padding: 5pt 3pt;
	vertical-align: middle;
}
.card2 {
	display: block;
	width: 180px;
	height: 100px;
	background-color: #FFFFFF;
	border: 1px solid #d0d0d0;
	border-radius: 3px;
	margin-top: 10px;
	margin-left: 22px;
	text-align: left;
	padding: 5pt 3pt;
	vertical-align: middle;
}

.card:hover {
	box-shadow: 1px 1px 8px #c8c8c8;
	cursor: pointer;
}
.card2:hover {
	box-shadow: 1px 1px 8px #c8c8c8;
	cursor: pointer;
}


/* 카드 내부 리드 이름 */
.card_name {
	display: inline-block;
	width: calc(100% - 30px);
	height: auto;
	color: #F2B807;
	padding-left: 5px;
	font-size: 12pt;
	font-weight: bold;
	vertical-align: top;
}

/* 회사명, 전화번호 */
.card_people, .card_emp, .card_prod {
	font-size: 10pt;
	text-indent: 5pt;
	margin-top: 3px;
}

/* 수직 구분선 */
.vertical_line {
	display: inline-block;
	width: 1px;
	height: 100%;
	background-color: #d0d0d0;
	border: 0px solid #000000;
	border-radius: 1px;
	margin-top: 40px;
}
/* 수평  컬러 구분선 */
.div_line_yellow {
	display: inline-block;
	width: 1200px;
	height: 2px;
	background-color: #F2CB07;
	border: 0px solid #000000;
	margin-bottom: 2px;
}
/* 수평 구분선 */
.div_line {
	height: 2px;
}

/* -----------테이블 영역------------ */
.table_list_td {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #cccccc;
}

.table_list_td:hover {
	background-color: #EEEEEE;
}

.table_list_td:hover input {
	background-color: #EEEEEE;
	outline: none;
	cursor: pointer;
}

.table_list_td:focus input {
	outline: none;
}

.table_list_header {
	font-size: 10pt;
	cursor: text;
}

.card_view_stat_plus>img {
	width: 20px;
	height: 20px;
	vertical-align: middle;
}
.card2>img {
	width: 20px;
	height: 20px;
	margin-left: 75px;
	margin-top: 30px;
}
textarea{
resize : none;
}
.btn_left_input{
width : calc(100% - 94px);
}
/*팝업*/
.pop_tbl{
	text-align : center;
	border-collapse : collapse;
	font-size : 10pt;
	font-weight : bold;
	width : 100%;
	height : 150px;
}
.td_font{
	font-size : 11pt;
}
.pop_tbl>tbody>tr{
	/* border-bottom : 1px solid #cacaca; */
}

.table_list_header:hover {
	cursor: text;
}

.font_color {
	color: #fff;
}

/* 팝업 */


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
/* 리드 카드보기 가운데부분  */
.card_view_title {
	width: 100%;
	height: 100%;
	margin: 10px 0;
}
.card_wrap {
	 width: 225px;
	 height: 700px;
}
</style>
<c:import url="/header"></c:import>
<script type="text/javascript">
var sum = 0;
var temp = 0;
var cnt = 0;
	$(document).ready(function() {
		reloadList();
		$(".card_view_title").slimscroll({
			 width: '1200px', 
			 height: '700px',
			 axis: 'x'
		});
		
		$("#cardViewTitle").on("click",".card", function(){
			$("#team_no").val($(this).attr("name"));
		var html = "";
			
			html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
			html += "<div>";
			html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
			html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
			html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
			html += "</div>";
			html += "<input type=\"hidden\" id=\"sAuthorNo\" name=\"sAuthorNo\" value=\""+${sAuthorNo}+"\"/>	";
			html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
			html += "<input type=\"hidden\" id=\"depart_no\" name=\"depart_no\"/>	";
			html += "<input type=\"hidden\" name=\"team_no\" id=\"team_no\" value=\""+$("#team_no").val()+"\"/>	";
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
			html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
			html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			html += "</tbody>";
			html += "</table>";
			html += "<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
	        html += "</div>";
			html += "</form>";
	        
	        makeNoBtnPopup(1, "사원 조회", html, true, 600, 650, function() {
	        	getEmpList();
	        	setEmpEvent();
			});
		});
		/* 조회팝업 */
		// 담당자 목록 Get
		function getEmpList() {
			var params = $("#searchForm").serialize();

			$.ajax({
				type: "post",
				url: "departPopAjax",
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
					html += "<tr class=\"list_contents\" name=\"" + list[i].NO + "_" + list[i].NAME + "_" + list[i].EMAIL + "_" + list[i].DEPART_NAME + "_" + list[i].DEPART_NO + "\">";
			  		html += "<td>" + list[i].NO + "</td>";
			  		html += "<td>" + list[i].DEPART_NAME + "</td>";
			  		html += "<td>" + list[i].TEAM_NAME + "</td>";
			  		html += "<td>" + list[i].NAME + "</td>";
			  		html += "<td>" + list[i].POSI_NAME + "</td>";
					html += "</tr>";
					cnt++;
					$("#cnt").val(cnt);
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
				$("#page").val("1");
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
			/* // 담당자 값 선택 Event
			$(".pop_list>tbody").on("click", "tr", function() {
				var select = $(this).attr("name");
				var array = select.split("_");
				$("#mgr_no").val(array[0]);
				$("#mgr_name").val(array[1]);
				$("#mgr_email").val(array[2]);
				$("#depart_name").val(array[3]);
				$("#depart_no").val(array[4]);
				closePopup(1);
			}); */
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
		$("#cardViewTitle").on("click","div[name=departno]>div", function(){
			if($(this).attr("class") == "card_view_stat"){
			$("#depart_no").val($(this).attr("name"));
			$("#flag").val("true");
			$("#departmgr_no").val($(this).attr("id"));
			$("#actionForm").attr("action", "departInfo");
			$("#actionForm").submit();
			}
		});
		
		$("#departAdd").on("click",function() {
			departPop();
			makeTwoBtnPopup(1, "부서등록", departPop() , true, 600, 350, function(){
		}, "확인", function() {
	    	if ($.trim($("#DepartName").val()) == "") {
	    		makeAlert(2, "알림", "부서명을 입력하시오.", null);
	    		$("#DepartName").focus();
	    	} 
	    	/* else if ($.trim($("#newDepartMgr").val()) == "") {
	    		makeAlert(2, "알림", "부서장을 입력하시오.", null);
	    		$("#newDepartMgr").focus();
	    	} */
	    	else if ($.trim($("#DepartTask").val()) == "") {
	    		makeAlert(2, "알림", "업무를 입력하시오.", null);
	    		$("#DepartTask").focus();
	    	}
	    	else if ($.trim($("#DepartCall").val()) == "") {
	    		makeAlert(2, "알림", "전호번호를 입력하시오.", null);
	    		$("#DepartCall").focus();
	    	}else {

				$("#newInAndOut").val($("#inAndOut").val());
				$("#newDepartName").val($("#DepartName").val());
				$("#newDepartTask").val($("#DepartTask").val());
				$("#newDepartCall").val($("#DepartCall").val());
	    		var params = $("#actionForm").serialize();

	    		$.ajax({
	    			type : "post", //데이터 전송방식
	    			url : "insertDepartAjax", //주소
	    			dataType : "json", //데이터 전송규격
	    			data : params, //보낼 데이터
	    			success : function(result) {
	    				makeAlert(2, "성공", "새로운 부서가 등록되었습니다.", null);
	    				closePopup(1);
	    				reloadList();
	    			},
	    			error : function(request, status, error) {
	    				console.log("status : " + request.status);
	    				console.log("text : " + request.responseText);
	    				console.log("error : " + error);
	    			}
	    		});
	    	}
			},"취소", function() {
				closePopup(1);
			});
		});
		$("#teamAdd").on("click", function() {
				teamPop();
				reloadList();
				makeTwoBtnPopup(1, "팀등록", teamPop() , true, 600, 350, function(){
				}, "확인", function() {
			    	if ($.trim($("#TeamName").val()) == "") {
			    		makeAlert(2, "알림", "팀명을 입력하시오.", null);
			    		$("#TeamName").focus();
			    	} 
			    	else if ($.trim($("#TeamTask").val()) == "") {
			    		makeAlert(2, "알림", "업무를 입력하시오.", null);
			    		$("#TeamTask").focus();
			    	}
			    	else if ($.trim($("#TeamCall").val()) == "") {
			    		makeAlert(2, "알림", "전호번호를 입력하시오.", null);
			    		$("#TeamCall").focus();
			    	}else {
			    		$("#departNo").val($("#searchDepart").val());
						$("#newTeamName").val($("#TeamName").val());
						$("#newTeamTask").val($("#TeamTask").val());
						$("#newTeamCall").val($("#TeamCall").val());
			    		var params = $("#actionForm").serialize();

			    		$.ajax({
			    			type : "post", //데이터 전송방식
			    			url : "insertTeamAjax", //주소
			    			dataType : "json", //데이터 전송규격
			    			data : params, //보낼 데이터
			    			success : function(result) {
			    				makeAlert(2, "성공", "새로운 팀이 등록되었습니다.", null);
			    				closePopup(1);
			    				reloadList();
			    			},
			    			error : function(request, status, error) {
			    				console.log("status : " + request.status);
			    				console.log("text : " + request.responseText);
			    				console.log("error : " + error);
			    			}
			    		});
			    	}
				},"취소", function() {
					closePopup(1);
				});
				
			});
	});
	
		function departPop(){
			var html = "";
			html += "	<form action=\"#\" id=\"saveForm\" method=\"post\">";
			html += "	<input type=\"hidden\" id=\"sAuthorNo\" name=\"sAuthorNo\" value=\""+${sAuthorNo}+"\"/>	";
			html += "	<table class=\"pop_tbl\">";
			html += "	<colgroup>";
			html += "		<col width=\"10%\" />";
			html += "		<col width=\"40%\" />";
			html += "		<col width=\"10%\" />";
			html += "		<col width=\"40%\" />";
			html += "	</colgroup>";
			html += "	<tbody>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">내/외부</td>";
			html += "		<td colspan=\"3\"><select class=\"input_short\" style=\"width: 98%;\" name=\"inAndOut\" id=\"inAndOut\">";
			html += "		<option value=\"0\">내부</option>";
			html += "		<option value=\"1\">외부</option>";
			html += "		</select></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">부서명</td>";
			html += "		<td colspan=\"3\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%;\" id=\"DepartName\" name=\"DepartName\"></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">연락처</td>";
			html += "		<td colspan=\"3\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%;\" id=\"DepartCall\" name=\"DepartCall\"></td>";
			/* html += "		<td class=\"table_list_header font_color\">부서장</td>";
			html += "		<td><input type=\"text\" class=\"input_short input_readonly\" readonly=\"readonly\" id=\"newDepartMgr\" name=\"newDepartMgr\">";
			html += "		<div class=\"btn_black btn_size_normal\" id=\"empSearchBtn\">검색</div></td>"; */
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\" rowspan=\"2\">업무</td>";
			html += "		<td colspan=\"3\" rowspan=\"2\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%; height : 85px;\" id=\"DepartTask\" name=\"DepartTask\"></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td></td>";
			html += "		<td colspan=\"3\"></td>";
			html += "		</tr>";
			html += "		</tbody>";
			html += "	</table>";
			html += "	</form>";
	return html;
		}
		function teamPop(){
			var html = "";
			html += "	<form action=\"#\" id=\"saveForm\" method=\"post\">";
			html += "	<input type=\"hidden\" id=\"sAuthorNo\" name=\"sAuthorNo\" value=\""+${sAuthorNo}+"\"/>	";
			html += "	<table class=\"pop_tbl\">";
			html += "	<colgroup>";
			html += "		<col width=\"10%\" />";
			html += "		<col width=\"40%\" />";
			html += "		<col width=\"10%\" />";
			html += "		<col width=\"40%\" />";
			html += "	</colgroup>";
			html += "	<tbody>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">부서</td>";
			html += "		<td colspan=\"3\"><select class=\"input_short\" style=\"width: 98%;\" name=\"searchDepart\" id=\"searchDepart\"></select></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">팀명</td>";
			html += "		<td colspan=\"3\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%;\" id=\"TeamName\" name=\"TeamName\"></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\">연락처</td>";
			html += "		<td colspan=\"3\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%;\" id=\"TeamCall\" name=\"TeamCall\"></td>";
			/* html += "		<td class=\"table_list_header font_color\">팀장</td>";
			html += "		<td><input type=\"text\" class=\"input_short input_readonly\" readonly=\"readonly\" id=\"newTeamMgr\">";
			html += "		<div class=\"btn_black btn_size_normal\" id=\"empSearchBtn\">검색</div></td>"; */
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td class=\"table_list_header font_color\" rowspan=\"2\">업무</td>";
			html += "		<td colspan=\"3\" rowspan=\"2\"><input type=\"text\" class=\"input_normal\" style=\"width: 98%; height : 85px;\" id=\"TeamTask\" name=\"TeamTask\"></td>";
			html += "		</tr>";
			html += "		<tr>";
			html += "		<td></td>";
			html += "		<td colspan=\"3\"></td>";
			html += "		</tr>";
			html += "		</tbody>";
			html += "	</table>";
			html += "	</form>";
	return html;
	}
	
	function reloadList() {
		var params = $("#srchForm").serialize();
		$.ajax({
			type : "post",
			url : "departMgtAjax",
			dataType : "json",
			data : params,

			success : function(result) {
				departCardList(result.Departlist, result.Teamlist);
				departList(result.departList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
 	function departCardList(Departlist, Teamlist){
		var html = "<div class=\"vertical_line\"></div>";
		
		for(var i in Departlist){
			html += "<div class=\"card_view_title_stat\" id=\"" + Departlist[i].DEPART_NO +"\" name=\"departno\">";
			html += "<div class=\"card_view_stat\" name=\"" + Departlist[i].DEPART_NO +"\">";
			html += Departlist[i].DEPART_NAME+"("+Departlist[i].PEOPLE+")";
			html += "</div>";
			html += "<div class=\"card_wrap\">";
			html += "</div>";
			html += "</div>";
			html += "<div class=\"vertical_line\"></div>";
		}
		
		$("#cardViewTitle").html(html);
		
		
		
		
		
			for(var i in Teamlist) {
				if(Teamlist[i].TEAM_NO != 0){
					html = "";
					html += "<div class=\"card\" name=\""+Teamlist[i].TEAM_NO+"\">";
					html += "<div class=\"card_area\" id=\"0\">";
					html += "	<div class=\"card_name_title\">";
					html += "		<div class=\"card_name\">" + Teamlist[i].TEAM_NAME + "</div>";
					html += "	</div>";
					if(Teamlist[i].EMP_NAME != null){
					html += "	<div class=\"card_emp\">팀장 : <b>" + Teamlist[i].EMP_NAME + "</b></div>";
					}
					else
						{
						html += "	<div class=\"card_emp\">팀장 : </div>";
						}
					html += "	<div class=\"card_people\">사원수 : " + Teamlist[i].CNT + "</div>";
					html += "</div>";
					html += "</div>";
					$("#" + Teamlist[i].DEPART_NO+">.card_wrap").append(html);
					
					
				}
			}
			$(".card_wrap").slimscroll({ 
				 width: '225px',
				 height: '650px',
				 axis: 'y'
			});
		}	
	function departList(list){
		var html = "";	
		for(i in list){
				html += "<option value = \""+ list[i].DEPART_NO +"\">"+ list[i].DEPART_NAME +"</option>";
		}
		$("#searchDepart").html(html);
	}
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">18</c:param>
	</c:import>
	<div class="title_area">부서관리</div>
	<div class="content_area">
		<div class="list_wrap">
			<!-- 검색영역 -->
			<form action="#" id="srchForm" method="post">
			<input type="hidden" id="sAuthorNo" name="sAuthorNo" value="${sAuthorNo}"/>	
			<!-- 카드영역시작 -->
				<!-- 검색영역 -->
				<div class="top_btn_area no_drag" style="width: 1200px;">
				<c:if test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
				<div class="btn_yellow btn_size_normal" id="departAdd">부서 등록</div>
				<div class="btn_yellow btn_size_normal" id="teamAdd">팀 등록</div>
				</c:if>
				</div>
			</form>
			<form action="#" id="actionForm" method="post">
			<input type="hidden" id="sAuthorNo" name="sAuthorNo" value="${sAuthorNo}"/>	
			<input type="hidden" name="depart_no" id="depart_no"/>
			<input type="hidden" name="team_no" id="team_no"/>
			<input type="hidden" name="flag" id="flag" value="false"/>
			<input type="hidden" name="departNo" id="departNo"/>
			<input type="hidden" name="newDepartNo" id="newDepartNo"/>
			<input type="hidden" name="newInAndOut" id="newInAndOut"/>
			<input type="hidden" name="newDepartName" id="newDepartName"/>
			<input type="hidden" name="newDepartCall" id="newDepartCall"/>
			<input type="hidden" name="newDepartTask" id="newDepartTask"/>
			<input type="hidden" name="newTeamName" id="newTeamName"/>
			<input type="hidden" name="newTeamCall" id="newTeamCall"/>
			<input type="hidden" name="newTeamTask" id="newTeamTask"/>
			<div id="card_area">
				<div class="div_line_yellow"></div>
				<div class="card_view_title" id="cardViewTitle">
				<!-- <div class="vertical_line"></div>
				<div class="card_view_title_stat" id="0">
				<div class="card_view_stat_plus">
					<img alt="plus" src="resources/images/bss/plus_btn.png"/>
				</div>
				</div>
				<div class="vertical_line"></div> -->
				</div>
			</div>
			</form>
			<!-- 카드영역끝 -->
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>