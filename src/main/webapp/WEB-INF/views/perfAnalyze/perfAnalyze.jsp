<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/perfAnalyze/perfAnalyze.css" />
<c:import url="/header"></c:import>
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
<script src="resources/script/highcharts/exporting.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadFeedb();
	
	$(".paging_area").on("click","span",function(){
		if($(this).attr("name") != "" ){
			$("#page").val($(this).attr("name"));
			reloadFeedb();
		}
	});
	
	function reloadFeedb() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "getFeedbListAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				redrawFeedb(result.feedb);
				redrawPaging(result.pb);
				reloadTitle();
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function reloadTitle() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "getCmpTitleAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				redrawCmpTitle(result.title);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawCmpTitle(title) {
		console.log(title.length);
		var html = "";
		if(title.length == 0) {
			html = "조회된 캠페인이 없습니다.";
		} else {
			for(var i in title) {
				html = title[i].CMP_NAME;
			}
		}
		 $("#cmp_title").html(html);
	}
	
	function redrawFeedb(feedb) {
		var html = "";
		/* var title = ""; */
		if(feedb.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i in feedb) {
				html += "<tr class=\"chat_one\" id=\"chat_one\" name=" + feedb[i].EMP_NO + ">";
				html += "<td class=\"chat_one_left\">" + feedb[i].RNUM + "</td>";
				html += "<td class=\"chat_one_right\">" + feedb[i].EMP_NAME + "</td>";
				html += "<td class=\"t_chat_one_right\">" + feedb[i].OPIN + "</td>";
				html += "<td class=\"t_chat_one_right\">" + feedb[i].ADD_DAY + "</td>";
				html += "</tr>";
			}
		}
		 $("tbody").html(html);
		 
	}
	
	function redrawPaging(pb){
		var html="";
		
		//처음
		html += "<span name=\"1\" class=\"bottom_btn_1\">&lt;&lt; </span>";
		//이전
		if($("#page").val()=="1"){
			html += "<span name=\"1\" class=\"bottom_btn_1\">&lt; </span>";
		}
		else{
			html += "<span name=\"" + ($("#page").val() * 1 -1) + "\" class=\"bottom_btn_1\">&lt;</span>";
		}
		//숫자
		for(var i = pb.startPcount; i<=pb.endPcount; i++){
			if($("#page").val()== i){
				html += "<span  name=\"" + i + "\" class=\"bottom_btn_2\"><b>"+ i + "</b></span>";
			}
			else{
				html += "<span name=\"" + i + "\"  class=\"bottom_btn_2\">"+ i +"</span>";
			}
		}
		//다음
		if($("#page").val()==pb.maxPcount){
			html += "<span name=\""+pb.maxPcount +"\" class=\"bottom_btn_1\">&gt;</span>";
		}
		else{
			html += "<span name=\"" + ($("#page").val() * 1 +1) + "\" class=\"bottom_btn_1\">&gt;</span>";
		}
		//마지막
		html += "<span name=\"" + pb.maxPcount + "\" class=\"bottom_btn_1\">&gt;&gt;</span>";
		$(".paging_area").html(html);
	}
	
	$("#review_btn").on("click", function() {
		
		if($.trim($("#review_bar").val()) == ""){
			makeAlert(1, "피드백 작성 실패", "피드백을 작성 해 주세요.", closePopup(1));
		} else {
			var params = $("#actionForm").serialize();
	
			$.ajax({
				type : "post",
				url : "insertFeedbAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					reloadFeedb();
					$("#review_bar").val("");
					makeAlert(1, "피드백 작성 성공", "피드백이 입력 되었습니다.", closePopup(1));
				},
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#graph_area").highcharts({
		chart: {
	    	type: 'column',
	        height: '300',
	    },
	    title: {
	        text: ''
	    },
	    xAxis: {
	        categories: ['SMS', 'MMS', 'E-mail']
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
	        name: '반응값',
	        data: [5, 3, 4],
	        stack: 'male'
	    }, {
	        name: '실반응값',
	        data: [3, 4, 4],
	        stack: 'male'
	    }, {
	        name: '전송량',
	        data: [2, 5, 6],
	        stack: 'female'
	    }],
	    
	    credits:{
	    	enabled: false
	    }
	});	
	

});

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">13</c:param>
	</c:import>
	<div class="title_area">성과분석</div>
	<div class="content_area">
		<div class="contents_wrap">
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="page" name="page" value="1" />
			<input type="hidden" id="cmpNo" name="cmpNo" value="${param.cmpNo}" />
			<div class="cmp_title" id="cmp_title" style="font-size:32pt; text-align:center; font-weight: bold;">[ 캠페인 명이 들어올 자리 ]</div>
			<div class="cmp_title_wrap"></div>
			<div class="graph_area" id="graph_area" name="graph_area">
				<!-- 그래프가 들어올 영역  -->
				<div class="graph"></div>
			</div>
			<div class="bottom_title_wrap">
					<div class="bottom_title">피드백 목록</div>
			</div>
			<table>
				<thead class="table_head">
					<tr>
						<td class="table_num">번호</td>
						<td class="table_name">작성자</td>
						<td class="table_content">내용</td>
						<td class="table_visit_date">작성일</td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>


			<!-- 성과분석 입력창과 버튼들이 들어올겁니다. 크기아직 안줘서 안보일듯 -->
			<div class="feedback_content_bottom">
				<div class="paging_area" id="paging_area">
				</div>
			</div>
			<div class="analyze_write_area">
				<div class="review_wrap">
					<div class="review_area">
						<div class="review_text">피드백</div>
						<textarea class="review_bar" id="review_bar" name="review_bar"></textarea>
						<div class="review_btn_area">
							<div class="review_btn" id="review_btn" name="review_btn">등록</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>