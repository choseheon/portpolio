<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 관리</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/sche/scheList.css"/>
<style type="text/css">
thead > tr {
	cursor : context-menu !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {	
	reloadSche();
	
	$("#scheAddBtn").on("click",function(){
		location.href = "scheAdd"
	});
	
	$("#scheSrchBtn").on("click",function(){
		$("#page").val("1");
		$("#date").val($("#srchDate").val().replace(/-/gi,""));
		console.log($("#srchDate").val());
		console.log($("#date").val());
		reloadSche();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#sche_no").val($(this).attr("name"));
		var divNo = $(this).children("#scheDivNo").attr("name");
		$("#scheDivNoM").val((divNo == "일정")? 0 : ((divNo == "리드")? 1 : 2));
		$("#actionForm").attr("action", "scheDet");
		$("#actionForm").submit();
	});
	
	$(".srch_text").on("keypress",function() {
		if(event.keyCode == 13){
			$("#scheSrchBtn").click();
			return false;
		}
	});
	
	$(".list_paging_area").on("click", ".btn_paging", function() {
		$("#page").val($(this).attr("name"));
		reloadSche();
	});
	
	$(".sche>input").on("click", function() {
		$("#page").val("1");
		reloadSche();
	})
	
	$(".task_div>input").on("click", function() {
		$("#page").val("1");
		reloadSche();
	});
	
	
function reloadSche() {
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "scheListAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			redrawSche(result.list);
			redrawPaging(result.pb);
		},
		error : function(request,status,error) {
			console.log("status : "+request.status);
			console.log("text : "+request.responseText);
			console.log("error : "+error);
		}
	});
}
	
function redrawSche(list) {
	var html = "";
	var list1 = new Array();	
	for(var i in list) {
		switch(list[i].SCHE) {
		case "일정" :
			if($("#sche0").prop("checked")) {
				checked(list1, list[i]);
			}
			break;
		case "리드" :
			if($("#sche1").prop("checked")) {
				checked(list1, list[i]);
			}
			break;
		case "영업" :
			if($("#sche2").prop("checked")) {
				checked(list1, list[i]);
			}
			break;
		}
	}
	
	if(list1.length != 0) {
		for(var i in list1) {
			html += "<tr class=\"list_contents\" name=\"" + list1[i].SCHE_NO + "\">";
			html += "<td>" + list1[i].SDATE + " ~ " + list1[i].EDATE + "</td>";
			html += "<td id=\"scheDivNo\" name=\"" + list1[i].SCHE + "\">" + list1[i].SCHE + "</td>";
			html += "<td>" + list1[i].TASKDIV + "</td>";
			html += "<td>" + list1[i].COMP_NAME + "</td>";
			html += "<td>" + list1[i].CLIENT_NAME + "</td>";
			html += "</tr>";
		}
	} else {
		html += "<tr>"
		html += "<td colspan=\"5\">조회된 데이터가 없습니다</td>";
		html += "</tr>";
	}
	
	$("tbody").html(html);
}
	
function redrawPaging(pb) {
	var html = "";
	if(pb.startPcount > "1") {
		//처음
		html += "<div class=\"btn_paging\" name=\"1\"><<</div>";	
		
		//이전 페이지
		html += "<div class=\"btn_paging\" name=\"" + (pb.startPcount * 1 - 1) + "\"><</div>";
	}
	
	//숫자
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"btn_paging_on\">" + i + "</div>";
		} else {
			html += "<div class=\"btn_paging\" name=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if(pb.endPcount != pb.maxPcount) {
		//다음
		html += "<div class=\"btn_paging\" name=\"" + (pb.startPcount * 1 + 10) + "\">></div>";
		
		//마지막
		html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">>></div>";
	}
	
	$(".list_paging_area").html(html);
}

// 체크리스트 
function checked(a, b) {
	if($("#taskDiv0").prop("checked") && b.TASKDIV == "전화") {
			a.push(b);
	} else if($("#taskDiv1").prop("checked") && b.TASKDIV == "상담") {
			a.push(b);
	} else if($("#taskDiv2").prop("checked") && b.TASKDIV == "메일") {
			a.push(b);
	} else if($("#taskDiv3").prop("checked") && b.TASKDIV == "방문") {
			a.push(b);
	} else if($("#taskDiv4").prop("checked") && b.TASKDIV == "견적") {
			a.push(b);
	} else if($("#taskDiv5").prop("checked") && b.TASKDIV == "제안") {
			a.push(b);
	} else if($("#taskDiv6").prop("checked") && b.TASKDIV == "계약") {
			a.push(b);
	} else if($("#taskDiv7").prop("checked") && b.TASKDIV == "매출") {
			a.push(b);
	} else if($("#taskDiv8").prop("checked") && b.TASKDIV == "기타") {
			a.push(b);
	}	
}

});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">8</c:param>
	</c:import>
	<div class="title_area">일정 조회</div>
	<div class="content_area">
		<div class="contents_wrap">
			<div>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="page" id="page" value="1">
				<input type="hidden" name="sche_no" id="sche_no">
				<input type="hidden" name="scheDivNoM" id="scheDivNoM">
				<input type="hidden" name="date" id="date">
				<div class="checkbox_area">
					<div>
						<div class="sche_text">일정 구분</div>
						<div class="sche">
							<input type="checkbox" id="sche0" name="sche0" value="0" checked />일정
							<input type="checkbox" id="sche1" name="sche1" value="1" checked />리드 
							<input type="checkbox" id="sche2" name="sche2" value="2" checked />영업 
						</div>
					</div>
					<div>
						<div class="task_div_text">활동 분류</div>
						<div class="task_div">
							<input type="checkbox" id="taskDiv0" name="taskDiv0" value="0" checked />전화
							<input type="checkbox" id="taskDiv1" name="taskDiv1" value="1" checked />상담
							<input type="checkbox" id="taskDiv2" name="taskDiv2" value="2" checked />메일
							<input type="checkbox" id="taskDiv3" name="taskDiv3" value="3" checked />방문
							<input type="checkbox" id="taskDiv4" name="taskDiv4" value="4" checked />견적
							<input type="checkbox" id="taskDiv5" name="taskDiv5" value="5" checked />제안
							<input type="checkbox" id="taskDiv6" name="taskDiv6" value="6" checked />계약
							<input type="checkbox" id="taskDiv7" name="taskDiv7" value="7" checked />매출
							<input type="checkbox" id="taskDiv8" name="taskDiv8" value="8" checked />기타
						</div>
					</div>
				</div>
					<div id="scheAddBtn" class="add_btn">추가</div>
				<!-- 코드 -->
	         <div class="srch_area">
	            <div class="srch_btn">
	                  <div id="scheSrchBtn">검색</div>
	                  <input type="text" class="srch_text" name="srchText"/>
	                  <select class="srch_select" name="srchSelect">
	                     <option value="0">고객사 명</option>
	                     <option value="1">고객 명</option>
	                     <option value="2">고객사 명 + 고객 명</option>                     
	                  </select>   
	                  <input type="date" class = "srch_date" id="srchDate">
	               </div>
	      	</div>
	      <!-- 코드 -->
				<table class="table_list">
					<!-- 리스트 테이블 -->
					<colgroup>
						<col style="width: 30%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<thead>
						<tr class="table_list_header">
							<td>기간</td>
							<td>일정 구분</td>
							<td>활동 분류</td>
							<td>고객사 명</td>
							<td>고객 명</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="list_paging_area">
				</div>
			</form>
			</div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>