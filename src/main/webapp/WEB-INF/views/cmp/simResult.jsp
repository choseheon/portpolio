<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents Test</title>
<c:import url="/header"></c:import>
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	$("#save_btn").on("click", function() {			
		save();
	});
	
	
	function reloadList() {
		var params = $("#saveForm").serialize();

		$.ajax({
			type : "post",
			url : "Sim_resultAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				redrawList(result.list);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function save(){
	var params = $("#saveForm").serialize();
	$.ajax({
		type : "post",
		url : "updatestatAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			if (result.res == "SUCCESS") {
				$("#saveForm").attr("action", "approval");
				$("#saveForm").submit();
			} else {
				alert("등록 실패");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	
	});
	}; 
		function redrawList(list) {
		var html = "";
		
		if (list.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for ( var i in list) {
				html += "<tr name=\"" + list[i].SIM_NO + "\"id=\""+ list[i].CMP_NO +"\" >";
				html += "<td>" + list[i].CMP_NAME + "</td>";
				html += "<td>" + list[i].CHANNEL_NAME + "</td>";
				html += "<td>" + list[i].SEND_SIZE + "</td>";
				html += "<td>" + list[i].RECEIVE_SIZE + "</td>";
				html += "<td>" + list[i].RESPONSE_SIZE + "</td>";
				html += "<td>" + list[i].ACTUAL_RESPONSE_SIZE + "</td>";
				html += "<td>" + list[i].EMP_NAME + "</td>";
				html += "</tr>";
				
				$("#chNo"+i).val(list[i].CMP_NO);
				$("#chName"+i).val(list[i].CMP_NAME);
				$("#sendSize"+i).val(list[i].SEND_SIZE);
				$("#responseSize"+i).val(list[i].RESPONSE_SIZE);
				$("#actualSize"+i).val(list[i].ACTUAL_RESPONSE_SIZE);
				
			} 
		}
		$("tbody").html(html);
		
		makeChart(list);
	}
	
	function makeChart(list) {
		var cate = new Array();
		
		for(var i = 0 ; i < list.length ; i++) {
			cate.push(list[i].CHANNEL_NAME);
		}
		
		var send = new Array();
		var res = new Array();
		var actualResponse = new Array();
		
		
		
		for(var i = 0 ; i < list.length ; i++) {
			send.push(list[i].SEND_SIZE);
			res.push(list[i].RESPONSE_SIZE);
			actualResponse.push(list[i].ACTUAL_RESPONSE_SIZE);
		}
		
		var data = [{
			type: 'column',
			name: '전송량',
	        data: send,
	        tooltip: {
		    	pointFormat: '{series.name} : <b>{point.y}건</b>'
		    }
		},{
			type: 'column',
			name: '반응값',
	        data: res,
	        tooltip: {
		    	pointFormat: '{series.name} : <b>{point.y}건</b>'
		    }
		}, {
	        type: 'spline',
	        name: '실반응값',
	        data: actualResponse,
	        marker: {
	            lineWidth: 2,
	            lineColor: '#FB558A',
	            fillColor: '#FFFFFF'
	        },
	        tooltip: {
		    	pointFormat: '{series.name} : <b>{point.y}%</b>'
		    }
	    }];
		
		$("#chart").highcharts({
		    chart: {
		    	type: 'column',
		        height: '300',
		    },
		    colors: ['#FBB917', '#00B3A2', '#FB558A', '#2870E3', '#FF8F00', '#B5BF07', '#3F9D00', '#CE3C92','#5CB3FF', '#D462FF'],
		    title: {
		        text: ''
		    },
		    xAxis: {
		        categories: cate
		    },
		    yAxis: {
	            title: {
	                text: null
	            }
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
		    series: data,
		    
		    credits:{
		    	enabled: false
		    }
		});
	}
		
	function drawChart() {
		alert("a");
		/* $('#chart').highcharts({
	        chart: {
	            type: column,
	            zoomType: 'x'
	        },
	        colors: ['#5CB3FF', '#D462FF', '#FBB917', '#00B3A2', '#FB558A', 
	                 '#2870E3', '#FF8F00', '#B5BF07', '#3F9D00', '#CE3C92'],
	        title: {
	            text: 'SampleChart'
	        },
	        subtitle: {
	            text: '- Sample -'
	        },
	        xAxis: {
	            labels: {
	                formatter: function() {
	                    return this.value; // clean, unformatted number for year
	                }
	            }
	        },
	        yAxis: {
	            title: {
	                text: 'yPos'
	            },
	            labels: {
	                formatter: function() {
	                    return this.value +'k';
	                }
	            }
	        },
	        tooltip: {
	            pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>in {point.x}'
	        },
	        plotOptions: {
	            area: {
	                pointStart: 1,
	                marker: {
	                    enabled: false,
	                    symbol: 'circle',
	                    radius: 2,
	                    states: {
	                        hover: {
	                            enabled: true
	                        }
	                    }
	                }
	            }
	        },
	        series: [{
	            name: 'Brands',
	            colorByPoint: true,
	            data: [{
	                name: 'Chrome',
	                y: 61.41,
	                sliced: true,
	                selected: true
	            }, {
	                name: 'Internet Explorer',
	                y: 11.84
	            }, {
	                name: 'Firefox',
	                y: 10.85
	            }, {
	                name: 'Edge',
	                y: 4.67
	            }, {
	                name: 'Safari',
	                y: 4.18
	            }, {
	                name: 'Other',
	                y: 7.05
	            }]
	        }]
	    }); */
	}
});
</script>
<style type="text/css">
html, body {
	margin: 0;
	font-size: 0pt;
	width: 100%;
	height: 100%;
}

table {
	border-collapse:collapse;
	text-align: center;
	border-bottom: 1px solid #9E9E9E;
	height: 100px;
	margin: 0 auto;
	font-size:10pt;
}

/*버튼을 div로 만들었습니다.

  버튼 속성입니다.

  버튼은 float:right을 썼기때문에 반대로 적어주세요.

*/
* {
	box-sizing: border-box;
}

.content_area {
	width: 100% !important;
	font-size: 14pt;
}

.otbox {
	width: 1200px;
	margin-top: 30px;
}

.fbox {
	background-color: white;
	width: 500px;
	height: 200px;
}

/* .ibox {
	width: 1400px;
	height: 450px;
} */0

.ttr {
	color: white;
	background-color: gray;
}

.ftb {
	background-color: white;
	color: black;
	font-size: 40pt;
	width: 150px;
	height: 60px;
}

.kwc {
	display: block;
	height: 50px;
	margin-top: 40px;
}

.kwc>div {
	vertical-align: top;
}

.file_txt {
	width: 150px;
	height: 30px;
	display: inline-block;
}

.content_srch_btn>div {
	display: table;
	width: 80px;
	height: 30px;
	font-size: 10pt;
	font-weight: bold;
	color: white;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #595959;
	padding-top: 5px;
	margin-top: 10px;
	margin-left: 10px;
}

.content_srch {
	width: 1200px;
	height: 50px;
}

.content_srch_txt {
	display: inline-block;
	width: 200px;
	height: 25px;
	font-size: 10pt;
	margin-top: 10px;
	margin-left: 10px;
	border: 1px solid #ccc;
	float: right;
	border-radius: 5px;
}

.content_srch_btn {
	display: inline-block;
	width: 300px;
	height: 50px;
	min-width: 220px;

	/* margin-left: 895px; */
}

.content_srch_DD {
	display: inline-block;
	width: 100px;
	height: 30px;
	font-size: 10pt;
	margin-top: 10px;
	margin-left: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	float: right;
}

.content_srch_DD1 {
	display: none;
}

.content {
	width: 100px;
	height: 30px;
	display: inline-block;
	margin-left: 1000px;
}

.test1 {
	width: 150px;
	height: 50px;
	margin-left: 600px;
}

/* 두표꺼 */
.select_btn_area {
	display: inline-block;
	width: 62%;
	height: 160px;
}

.select_area {
	margin-left: 419px;
	display: inline-block;
	width: 210px;
	height: 30px;
	vertical-align: bottom;
	margin-bottom: -37px;
	margin-top: 7px;
}

.full_area {
	height: 150px;
	width: 400px;
}

.select_area>select {
	display: inline-block;
	font-size: 14pt;
	width: 100px;
	height: 30px;
	text-align: center;
	vertical-align: top;
	border-radius: 5px;
}

.year_select {
	display: inline-block;

	/*margin-left: calc(100% - 450px);*/
}

.month_select {
	display: inline-block;
}

.btn_area {
	display: inline-block;
	width: 350px;
	height: 100px;
	min-width: 220px;
	margin-left: 920px;
}

.first_btn_area {
	display: inline-block;
	width: 275px;
	height: 40px;
	text-align: center;
}

.first_btn_area>div {
	display: table;
	width: 80px;
	height: 30px;
	font-size: 10pt;
	color: #595959;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #F2B807;
	padding-top: 5px;
	margin-top: 10px;
	margin-left: 10px;
}

/*버튼의 hover입니다.*/
.first_btn_area>div:hover {
	background-color: #F2CB07;
	cursor: pointer;
}

* /

.second_vertical_btn_space {
	display: block;
	width: 250px;
	height: 10px;
}

.second_btn_area {
	display: inline-block;
	width: 275px;
	height: 50px;
	text-align: center;
}

.second_btn_area>div {
	display: table;
	width: 80px;
	height: 30px;
	font-size: 10pt;
	color: #595959;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #F2B807;
	padding-top: 5px;
	margin-top: 10px;
	margin-left: 10px;
}

/*버튼의 hover입니다.*/
.second_btn_area>div:hover {
	background-color: #F2CB07;
	cursor: pointer;
}

.third_btn_area {
	display: block;
}

.circle {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #595959;
	font-size: 16px;
	color: white;
	text-align: center;
	line-height: 30px;
	font-weight: bold;
}

.circle1 {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #F2CB07;
	font-size: 16px;
	color: black;
	text-align: center;
	line-height: 30px;
	font-weight: bold;
}



.btn_size_normal {
	width: 80px;
	height: 30px;
	line-height: 30px;
}

.btn_yellow {
	width: 80px;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	margin-left: 10px;
	text-align: center;
	vertical-align: middle;
	border-radius: 3px;
	background-color: #F2B807;
	border: 1px solid #c5960a;
	color: #272727;
	font-size: 10pt;
	font-weight: bold;
	cursor: pointer;
	float: right;
}

.btn_yellow:hover {
	background-color: #F2CB07;
}

.enroll_btn {
	width: 1200px;
}
/*버튼을 div로 만들었습니다.
  버튼 속성입니다.
  버튼은 float:right을 썼기때문에 반대로 적어주세요.
*/
.enroll_btn>div {
	display: table;
	width: 80px;
	height: 30px;
	font-size: 10pt;
	color: #595959;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #F2B807;
	padding-top: 7px;
	margin-top: 20px;
	margin-left: 10px;
}
/*버튼의 hover입니다.*/
.enroll_btn>div:hover {
	background-color: #F2CB07;
	cursor: pointer;
}
 .content_btn {
   width : 1200px;
   height : 50px;
   /* text-align : center; */
   vertical-align:top;
} 

.content_btn > div {
	display: inline-block;
	width : 400px;
	height: 50px;
	font-size: 10pt;
	text-align:center;
	color: black;
	border-radius : 5px;
	background-color : white;
	padding-top : 10px;
	border : 2px solid #595959;
	margin-right:400px;
}

.react{
	color: red;
	font-weight: bold;
}
.real_react{
	color : green;
	font-weight: bold;
}
.send{
	color : blue;
	font-weight: bold;
}

.sample_1 {
   width: 100%;
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
.sample_2 {
   width: 100%;
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
.sample_2 input{
outline: none;
}

.sample_title1{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 75px;
}
.sample_title2 {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;
}
.sample1_txt {
border : 0;
width: 150px;
text-align:center;

}
.sample_title3 {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;

}
.sample2_txt {
border : 0;
width: 150px;
text-align:center;
}
.sample_title4{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;

}
.sample3_txt {
border : 0;
width: 150px;
text-align:center;
}
.sample_title5{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;
}
.sample4_txt {
border : 0;
width: 150px;
text-align:center;
}


</style>
</head>
<body>

	<c:import url="/topLeft">
		<c:param name="menuNo">9</c:param>
	</c:import>
	<div class="title_area">시뮬레이션 결과</div>
	<div class="content_area">
		<div class="contents_wrap">
			<!-- 내용쓰기 -->
			<form action="#" method="post" id="actionForm">
			<input type="hidden" id="cmpNo" name="cmpNo" value="${param.cmpNo}" />
			
			<input type="hidden" id="chNo1" name="chNo1" />
			<input type="hidden" id="chName1" name="chName1" />
			<input type="hidden" id="sendSize1" name="sendSize1" />
			<input type="hidden" id="receiveSize1" name="receiveSize1" />
			<input type="hidden" id="responseSize1" name="responseSize1" />
			
			<input type="hidden" id="chNo2" name="chNo2" />
			<input type="hidden" id="chName2" name="chName2" />
			<input type="hidden" id="sendSize2" name="sendSize2" />
			<input type="hidden" id="receiveSize2" name="receiveSize2" />
			<input type="hidden" id="responseSize2" name="responseSize2" />
			
			<input type="hidden" id="chNo3" name="chNo3" />
			<input type="hidden" id="chName3" name="chName3" />
			<input type="hidden" id="sendSize3" name="sendSize3" />
			<input type="hidden" id="receiveSize3" name="receiveSize3" />
			<input type="hidden" id="responseSize3" name="responseSize3" />
			<input type="hidden" id="seq" name="seq" value="${param.seq}"/>	
			</form>
			<!-- 
			채널이름
			전송량
			반응값
			실반응값
			html += "<td>" + list[i].CHANNEL_NAME + "</td>";
			html += "<td>" + list[i].SEND_SIZE + "</td>";
				html += "<td>" + list[i].RECEIVE_SIZE + "</td>";
				html += "<td>" + list[i].RESPONSE_SIZE + "</td>";
				html += "<td>" + list[i].ACTUAL_RESPONSE_SIZE + "</td>"; -->
			
			<div class="circle">1</div>
			&nbsp;&nbsp;
			<div class="circle">2</div>
			&nbsp;&nbsp;
			<div class="circle">3</div>
			&nbsp;&nbsp;
			<div class="circle1">4</div>
			&nbsp;&nbsp; <br />

			<!-- 첨부파일  -->

			<br />
			<!--  두표꺼 끝aaaaaaaaaaaaaaaa -->

			<!-- 그래프 영역  -->
			<form action="#" id="saveForm" method="post">
			<input type="hidden" id="seq" name="seq" value="${param.seq}"/>	
			<input type="hidden" id="empNo" name="empNo" value="${sEmpNo}"/>	
			
			
			
			
			</form>
				<div id="chart" style=" width: 1200px; height: 450px;">
					<a href="#"
				onClick="saveNDrive('https://cafeattach.naver.net/07921ba8bde5e33f10f294a5987b0375dd8f719356/20190822_59_cafefile/28933132_1566465844559_PhHh5W_rtf/%EC%A0%95%EB%A6%AC.rtf?type=attachment', '%EC%A0%95%EB%A6%AC.rtf', '4318');return false"></a>
				
						
						
						
											
				</div>

				
				<table style="width: 1200px;">
				<thead>
					<tr class="sample_1">

						<td class="sample_title1" style="width:150px;">캠페인 명</td>
						<td class="sample_title2">채널</td>
						<td class="sample_title3">전송량</td>
						<td class="sample_title4">반응값</td>
						<td class="sample_title5">반응률(%)</td>
						<td class="sample_title6"style="width:150px;">실반응값</td>
						<td class="sample_title7"style="width:150px;">담당자</td>
						
					</tr>
					</thead>
					
					<tbody>
						<tr class="sample_2">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>	
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="enroll_btn">
				<div id="save_btn">결재 올리기</div>
			</div>
		</div>

			


	
	<c:import url="/bottom"></c:import>
</body>
</html>