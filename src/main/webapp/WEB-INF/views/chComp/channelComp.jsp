<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mango CRM</title>
<link rel="stylesheet" type="text/css" href="resources/css/channelComp/channel_comp.css" />
<c:import url="/header"></c:import>
</head>
<script type="text/javascript">

$(document).ready(function() {
compListdraw();

	/* 페이징버튼 */
	$(".paging_area").on("click","span",function(){
		if($(this).attr("name") != "" ){
			$("#page").val($(this).attr("name"));
			compListdraw();
		}
	});
	
	/* 검색버튼 */
	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		console.log($("#content_srch_DD option:selected").val());
		compListdraw();
	});
	
	/* 기간으로 검색할때 날짜 input 나오게하기 */
	$("#content_srch_DD").on("click",function(){
		if($("#content_srch_DD option:selected").val() == 3){
			$("#content_srch_txt").hide();
			$("#content_srch_date1").show();
			$("#content_srch_date2").show();
		}
		else {
			$("#content_srch_txt").show();
			$("#content_srch_date1").hide();
			$("#content_srch_date2").hide();
		}
	});

	$("#content_srch_date1").hide();
	$("#content_srch_date2").hide();
	
	/* 팝업 */
	$("#twoBtn").on("click", function() {
		
		var html = "";
		html +="<form action=\"#\" id=\"popupForm\"  method=\"post\">";
		html +="<div class=\"content_table\">";
		html +="<table class=\"pop_tbl\">";
		html +="<colgroup>";
		html +="<col width=\"10%\" />";
		html +="<col width=\"40%\" />";
		html +="</colgroup>";
		html +="<tr>";
		html +="<th class=\"td_font1\">채널</th>";
		html +="<td>";
		html +="<select name=\"channel1\" class=\"channel1\" id=\"channel1\">";
		html +="</select>";
		html +="</td>";
		html +="</tr>";
		html +="<tr>";
		html +="<th class=\"td_font1\">업체명</th>";
		html +="<td>";
		html +="<input type=\"text\" class=\"table_txt\" id=\"compNM\" name=\"compNM\" />";
		html +="</td>";
		html +="</tr>";
		html +="<tr>";
		html +="<th class=\"td_font1\">기간</th>";
		html +="<td>";
		html +=" <input type=\"date\" class=\"sdate\"/ id=\"sdate\" name=\"sdate\"><span class=\"wave\">~</span>";
		html +=" <input type=\"date\" class=\"edate\"  id=\"edate\" name=\"edate\"/>";
		html +="</td>";
		html +="</tr>";
		html +="<tr>";
		html +="<th class=\"td_font1\">금액</th>";
		html +="<td>";
		html +="<input type=\"text\" class=\"table_txt\" id=\"money\" name=\"money\"/>";
		html +="</td>";
		html +="</tr>";
		html +="</table>";
		html +="</div>";
		chList();
		html +="</form>";
		
		//$("히든아이디").val($("셀렉트아이디값 option:selected").val());
		makeTwoBtnPopup(1, "업체등록", html, true, 600, 400, null, "등록", function() {
				
						$("#chNo").val($("#channel1 option:selected").val());
						
						var params = $("#popupForm").serialize();
						console.log(params);
						console.log($("#channel1 option:selected").val());
						console.log($("#chNo").val());
						console.log($("#compNM").val());
						console.log($("#sdate").val());
						console.log($("#edate").val());
						console.log($("#money").val());
						$.ajax({
							type : "post", 
							url : "chcompsaveAjax", 
							dataType : "json", 
							data : params,
							
							success : function(result){
								if(result.res == "SUCCESS"){
									alert("등록을 완료하였습니다.")
									closePopup(1);
									compListdraw();
								}
								else{
									alert("등록에 실패하였습니다.");
									closePopup(1);
								}
							},
							error : function(request,status, error){
								console.log("status : " + request.status);
								console.log("text : " + request.responseText);
								console.log("error : " + error);
							}
						});
		},"취소", function() {
			closePopup(1);
		});
});
});
/* 채널목록 */
function chList(){
	var params=$("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "chListAjax", 
		dataType : "json", 
		data : params, 
		success : function(result){
			chdrawList(result.list);
		},
		error : function(request,status, error){
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function chdrawList(list){
	var html = "";
			html +="<option >선택</option>";
		for(var i in list){
			html +="<option value=\""+list[i].CHANNEL_NO+"\"id=\"chh\">"+list[i].CHANNEL_NAME+"</option>";
		}
	$("#channel1").html(html);
}
/* 업체목록그리기 */
function compListdraw(){
	
	var params=$("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "chcompListAjax", 
		dataType : "json", 
		data : params, 
		success : function(result){
			compList(result.list);
			drawPaging(result.pb);
		},
		error : function(request,status, error){
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
/* 업체목록그리기 */
function compList(list){
	var html = "";
	if(list.length == 0){
		html += "<tr>";
		html += "<td colspan=\"5\">등록된 업체가 없습니다.</td>";
		html += "</tr>";
	}
	else{
		for(var i in list){
		html += "<tr class =\"td_font\" name=\""+list[i].CHANNEL_COMP_NO+ "\">";
		html += "<td>"+list[i].CHANNEL_COMP_NO +"</td>";
		html += "<td>"+list[i].COMPANY_NAME+"</td>";
		html += "<td>"+list[i].CHANNEL_NAME+"</td>";
		html += "<td>"+list[i].SDATE +  " ~ "  + list[i].EDATE + "</td>";
		html += "<td>"+list[i].MONEY+"</td>";
		html += "</tr>";
		}
	}
	
	$("tbody").html(html);
}
/* 페이징 */
function drawPaging(pb){
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

</script>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">12</c:param>
	</c:import>
	<div class="title_area">채널업체</div>
	<div class="content_area">
	
		<div class="contents_wrap">
		<!--내용  -->
		<div class="content_btn1">
				<div class="enroll_Btn" id="twoBtn">등록</div>
				
		</div>
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="page" id="page" value="1"/>
			<input type="hidden" name="chNo" id="chNo" />
			<div class="content_srch">
				<div class="content_srch_btn">
					<div id="searchBtn">검색</div>
					<input type="date" class="content_srch_txt"  name="content_srch_date1" id="content_srch_date1" placeholder ="시작일"/> 
					<input type="date" class="content_srch_txt"  name="content_srch_date2" id="content_srch_date2" placeholder ="종료일"/> 
					<input type="text" class="content_srch_txt"  name="content_srch_txt" id="content_srch_txt"/> 
					<select	class="content_srch_DD" id ="content_srch_DD" name="content_srch_DD">
						<option class="content_srch_DD1">선택</option>
						<option value="0">선택</option>
						<option value="1">채널</option>
						<option value="2">업체</option>
						<option value="3">기간</option>
					</select>
				</div>
			</div>
		</form>
			<table>
				<thead>
					<tr class="sample_1">
						<td class="sample_title1">No</td>
						<td class="sample_title3">업체</td>
						<td class="sample_title4">채널</td>
						<td class="sample_title5">기간</td>
						<td class="sample_title6">금액</td>
					</tr>
				</thead>
				<tbody>
				<tr class="td_font">
					<td colspan="5">등록된 업체가 없습니다.</td>
				</tr>
				</tbody>
			</table>
			</div>
			<div class="paging_area"></div>
		</div>
		

	<c:import url="/bottom"></c:import>
</body>
</html>