<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mango CRM</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/cmp/cmpAdd.css" />
<c:import url="/header"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#cmpType").change(function(){
		getCmptype();
	});
	// 다음 버튼 클릭 Event
	$("#next_Btn").on("click", function() {
		$("#typeNo").val($("#cmpType option:selected").val());
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post", 
			url : "cmpAddAjax", 
			dataType : "json", 
			data : params,
			
			success : function(result){
				if(result.res == "SUCCESS"){
					$("#seq").val(result.seq);
					alert("등록을 완료하였습니다.")
					$("#actionForm").attr("action","targetSelect");
					$("#actionForm").submit(); 
				}
				else{
					alert("등록에 실패하였습니다.");
				}
			},
			error : function(request,status, error){
				console.log("status : " + request.status);
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		
		
	});
});


function getCmptype() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", 
		url : "cmptypeAjax", 
		dataType : "json", 
		data : params,
		
		success : function(result){
			cmpTypeList(result.cmpTypeList);
		},
		error : function(request,status, error){
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
	
}
function cmpTypeList(list) {
	var html = "";
	var cnt = 1;
	for(i in list){
	html += "<tr class=\"sample_2\">";
	html += "<td class=\"sample_1_txt\">"+cnt+"</td>";
	html += "<td class=\"sample_2_txt\">"+list[i].CMP_NAME+"</td>";
	html += "<td class=\"sample_3_txt\">"+list[i].SDATE+"~"+list[i].EDATE+"</td>";
	html += "<td class=\"sample_4_txt\">완료</td>";
	html += "<td class=\"sample_5_txt\">"+list[i].EMP_NAME+"</td>";
	html += "</tr>";
	cnt++;
	}
	$("#cmptypeList>tbody").html(html);
} 
</script>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">9</c:param>
	</c:import>
	
	<div class="title_area">캠페인 등록</div>
	<div class="content_area">
		<div class="contents_wrap">

			<div class="btn_area">
				<div class="next_Btn" id="next_Btn">다음</div>

				<div class="circle1">1</div>
				&nbsp;&nbsp;
				<div class="circle">2</div>
				&nbsp;&nbsp;
				<div class="circle">3</div>
				&nbsp;&nbsp;
				<div class="circle">4</div>
				&nbsp;&nbsp;

			</div>
			
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="seq" name="seq"/>
			<div class="tbl">
					
					<input type="hidden" id="cmpNo" name="cmpNo" />
					<!-- 유형번호 -->
					<input type="hidden" id="typeNo" name="typeNo"/>
					<input type="hidden" id="empNm" name="empNm" value="${sEmpName}"/>
					<input type="hidden" id="empNo" name="empNo" value="${sEmpNo}"/>
					
					<table>
						<colgroup>
							<!-- 테이블열들의 너비입니다. -->
							<col width="10%" />
							<col width="40%" />
							<col width="10%" />
							<col width="40%" />
						</colgroup>
						<tr>
							<th>캠페인 명</th>
							<td><input type="text" class="table_txt" name="cmpName" id="cmpName"/></td>
							<th>담당자</th>
							<td><input type="text" class="table_txt" name="mgrName" id="mgrName" value="${sEmpName}" readonly/></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" class="table_txt" name="sDate" id="sDate"/></td>
							<th>종료일</th>
							<td><input type="date" class="table_txt" name="eDate" id="eDate"/></td>
						</tr>
						<tr>
							<th>캠페인 유형</th>
							<td colspan="3">
								<select class="content_srch_DD2" name="cmpType" id="cmpType">
								<option>유형을 고르시오.</option>
								<c:forEach var="data" items="${list}">
									<option value="${data.CMP_TYPE_NO}">${data.CMP_TYPE_NAME}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
					</table>
			</div>

			<br />
				<table id="cmptypeList">
					<thead>
					<tr class="sample_1">
	
						<td class="sample_title1">일련번호</td>
						<td class="sample_title2">캠페인명</td>
						<td class="sample_title3">진행기간</td>
						<td class="sample_title4">진행상태</td>
						<td class="sample_title5">담당자</td>
					</tr>
					</thead>
					<tbody>
					<tr class="sample_2">
	
						<td></td>
						<td><input class="sample1_txt" type="text" readonly /></td>
						<td><input class="sample2_txt" type="text" readonly/></td>
						<td><input class="sample3_txt" type="text" readonly /></td>
						<td><input class="sample4_txt" type="text" readonly /></td>
	
					</tr>
					</tbody>
				</table>
				
				
				
				<br />
				<br />
				
				
				<div class="title_area">상세 설명</div>
				<textarea rows="3" cols="3"	class="table_txt2" id ="con" name="con"></textarea>
				
				</form>		
					
				</div>
				</div>

				<c:import url="/bottom"></c:import>
</body>
</html>