<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급목록</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/grade/grade.css" />
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
<script type="text/javascript">
var gradeLeng;
var chart = new Array();
$(document).ready(function() {
	reloadGrade();
	reloadGradeList();
	
	$("#gradeChangeBtn").on("click", function() {
		location.href = "gradeChange";
	});
	
	$("#gradeEditBtn").on("click", function() {
		location.href = "gradeEdit";
	});
	
	$(".list_paging_area").on("click", ".btn_paging", function() {
		$("#page").val($(this).attr("name"));
		reloadGrade();
		reloadGradeList();
	});
	
	$("#grade_srch_align").on("click", function() {
		if($("#srchVal").val() != $(this).val()){
			$("#page").val(1);
			$("#srchVal").val($(this).val());
			reloadGradeList();
		}
	});
	
	$("#grade_srch_btn").on("click", function() {
		$("#page").val(1);
		
		reloadGradeList();
	});
	
	// 체크 박스 전체 선택 on/off
	$("#chk_all").click(function(){
		var stat = $("#chk_all").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
	});
	
	$("#grade_srch_txt").on("keypress",function() {
		if(event.keyCode == 13){
			$("#grade_srch_btn").click();
			return false;
		}
	});
});

function reloadGrade() {
	$.ajax({
		type: "post",
		url: "getGradeAjax",
		dataType: "json",
		success: function(result) {
			redrawGrade(result.grade);
			redrawChart(result.grade);
		},error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawChart(grade) {
	for(var i=0; i < grade.length; i++){
		chart[i] = {
			name : grade[i].CC_GRADE_NAME,
			y : grade[i].CNT,
			color : grade[i].CC_GRADE_COLOR
		}
	}
	
	$("#grade_chart").highcharts({
	    chart: {
	        type: 'pie',
	        height: '300',
	    },
	    title: {
	        text: ''
	    },
	    tooltip: {
	        pointFormat: '<b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: false
	            },
	            showInLegend: false
	        },
	    },
	    series: [{
	        data: chart
	    }],
	    
	    credits:{
	    	enabled: false
	    }
	});
	
	$("g").each(function(){
		if($(this).attr("class") == "highcharts-button") {
			$(this).remove();
		}
	});
	
	/* $(".highcharts-series").on("mouseenter", "path", function() {
		$("path").attr("style", "opacity: 0.4");
		$(this).attr("style", "opacity: 1");
	});
	
	$(".highcharts-series").on("mouseleave", "path", function() {
		$("path").attr("style", "opacity: 1");
	}); */
}

function redrawGrade(grade) {
	var html = "";
	var sum = 0;
	gradeLeng = grade.length;
	
	for(var i in grade){
		sum += grade[i].CNT;
	}
	
	for(var i in grade){
		html += "<div class=\"grade\">";
		html += "<div class=\"grade_color\" style=\"background-color:" + grade[i].CC_GRADE_COLOR + "\"></div>";
		html += "<div class=\"grade_name\">" + grade[i].CC_GRADE_NAME + "</div>";
		html += "<div class=\"grade_per\">" + (grade[i].CNT / sum * 100).toFixed(1) + "%</div>";
		html += "<span class=\"grade_count\">(" + grade[i].CNT  + " 개)</span>";
		html += "</div>";		
	}
	
	$(".grade_chart_list").html(html);
	
	$(".grade_name").each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (18 * leng_diff) + "px");
        }
    });
}

function reloadGradeList() {
	var params = $("#actionForm").serialize() + "&" + $("#srchForm").serialize();
	
	$.ajax({
		type: "post",
		url: "getGradeListAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			redrawGradeList(result.list);
			redrawPaging(result.pb);
		}
	});
}

function redrawGradeList(list){
	var html = "";
	
	if(list.length == 0){
		html += "<tr class=\"list_contents\">";
		html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
		html += "<tr/>";
	}else{
		for(var i in list){
			html += " <tr class=\"list_contents\" name=\"" + list[i].COMP_NO + "\"> ";
		    html += " <td>" + list[i].COMP_NO + "</td>";
		    html += " <td>" + list[i].CC_GRADE_NAME + "</td> ";
		    html += " <td>" + list[i].COMP_NAME + "</td> ";
		    html += " <td>" + list[i].COMP_SECT_NAME + "</td> ";
		    html += " <td>" + list[i].COMP_STAT_NAME + "</td> ";
		    html += " <td>" + list[i].EMP_NAME + "</td> ";
		  	html += " </tr>";
		}
	}
	
	$("tbody").html(html);
	
	// 체크 on/off에 따른 전체 선택 체크 박스 on/off
	$(".list_chbox").on("click", function() {
		var cnt = 0;
		$(".list_chbox").each(function() {
			cnt += (!$(this).is(":checked") && $(this).attr("id") != "chk_all")? 1 : 0;
		});
		var stat = (cnt > 0) ? false : true;
		$("#chk_all").prop("checked", stat);
	});
	
	$(".list_contents").on("dblclick", function() {
		if($(this).attr("name") != null){
			$("#comp_no").val($(this).attr("name"));
			$("#actionForm").attr("action", "compDetail");
			$("#actionForm").submit();			
		}
	});
}

function redrawPaging(pb) {
	/* var html = "";
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
	
	$(".list_paging_area").html(html); */
	
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
</script>
</head>
<body>
	<form action="#" method="post" id="actionForm">
		<input type="hidden" name="page" id="page" value="1" />
		<input type="hidden" name="srchVal" id="srchVal" value="전체"/>
		<input type="hidden" name="comp_no" id="comp_no" />
	</form>
	<c:import url="/topLeft">
		<c:param name="menuNo">4</c:param>
	</c:import>
	<div class="title_area">등급목록</div>
	<div class="content_area">
   		<div class="grade_chart_area">
			<div class="grade_chart  no_drag">
				<div id="grade_chart"></div>
   			</div>
			<div class="grade_chart_right">
				<div class="grade_chart_title">전체등급</div>
				<div class="grade_chart_list">
					<div class="grade">
					</div>
				</div>
			</div>
		</div>
    <div class="list_wrap">
    	<div class="table_top_area">
    		<div class="top_title_area"></div>
	        <div class="top_btn_area no_drag">
	        	<c:if test="${sAuthorNo ne 3 and sAuthorNo ne 5}">
		            <div class="btn btn_yellow btn_size_normal" id="gradeChangeBtn">등급 변경</div>
		            <div class="btn btn_yellow btn_size_normal" id="gradeEditBtn">등급 편집</div>
	        	</c:if>
	        </div>
	        <div class="top_title_area">
	        </div>
	        <div class="top_btn_area">
	            <form action="#" method="post" id="srchForm">
		            <select class="input_short" id="grade_srch_align">
		                <option>전체</option>
		                <option>등급</option>
		                <option>회사명</option>
		                <option>업종</option>
		                <option>상태</option>
		                <option>담당자</option>
		            </select>
			        <input class="input_wfix input_search no_drag" id="grade_srch_txt" name="grade_srch_txt" type="text" placeholder="현재목록 내 검색"/>	            
		            <div class="btn btn_black btn_size_normal no_drag" id="grade_srch_btn">검색</div>
	            </form>
	        </div>
        </div>
	         <table class="table_list">
	         	<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="40%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
		            <tr class="table_list_header">
		               <td>no</td>
		               <td>등급</td>
		               <td>회사명</td>
		               <td>업종</td>
		               <td>상태</td>
		               <td>담당자</td>
		            </tr>
	            </thead>
	            <tbody>
	            </tbody>
	         </table>
	         <div class="list_paging_area no_drag">
	     	 </div>
    	</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>