<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 편집</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/grade/grade.css" />
<script type="text/javascript">
var cnt = 0;
var no;
var flag = true;
var gradeNo;
var gradeNm = new Array();
$(document).ready(function() {
	reloadGrade();
	
	$(".edit_table").on("click", ".grade_color_btn", function() {
		if($(".palette").css("top") == ($(this).offset().top - 103 + "px") && $(".palette").css("display") == "block"){
			$(".palette").css("display", "none");
		}else if($(".palette").css("top") != ($(this).offset().top - 103 + "px") || $(".palette").css("display") == "none"){
			no = $(this).parents("tr").attr("id");
			$(".palette").css("display", "block");
			$(".palette").css("top", $(this).offset().top - 103);
		}
	});
	
	$("html").on("click", function(e) {
		if($(e.target).attr("class") != "grade_color_btn") {
			$(".palette").css("display", "none");
		}
	});
	
	$(".palette").on("click", "div", function(e) {
		$("#"+ no).find(".grade_color_btn").css("background-color", $(this).css("background-color"));
	});
	
	$("#editBtn").on("click", function() {
		flag = true;
		
		for(var i = 6; i >= (gradeNo + cnt); i--){
			if($("#" + i).find(".grade_name_edit").val() != ''){
				gradeNm[i] = $("#" + i).find(".grade_name_edit").val();				
			}else{
				gradeNm[i] = $("#" + i).find(".grade_name_now").html();
			}
		}
		
		for(var i = 6; i >= (gradeNo + cnt); i--){
			for(var j = i-1; j >= (gradeNo + cnt); j--){
				if($("#" + i).find(".grade_color_btn").css("background-color") == $("#" + j).find(".grade_color_btn").css("background-color")){
					makeAlert(1, "수정 실패", "등급색상이 중복 되었습니다", null);
					flag = false;
				}else if(gradeNm[i] == gradeNm[j]){
					makeAlert(1, "수정 실패", "등급이름이 중복 되었습니다", null);
					flag = false;
				}
			}
		}
		
		
		if(flag == true) {
			if((gradeNo + cnt) == gradeNo){
				editGrade();
			}else if((gradeNo + cnt) < gradeNo && gradeNo > 2){
				delGrade();
			}else if((gradeNo + cnt) > gradeNo){
				for(var i = 6; i >= gradeNo; i--){
					if($("#" + i).find(".grade_name_edit").val() != ''){
						editGrade();
					}
				}
				insertGrade();
			}
			makeAlert(1, "수정 성공", "등급이 수정 되었습니다", null);
			cnt = 0;
		}
	});
	
	$("#grade_add_btn").on("click", function() {
		if(gradeNo + cnt > 0){
			cnt--;
			var html = $(".edit_table").children("tbody").html();
	
			html += "<tr class=\"list_contents\" id=\"" + (gradeNo + cnt) + "\">";
			html += "<td class=\"grade_rank\">" + (gradeRnk - cnt) + "</td>";
			html += "<td></td>";
			html += "<td><input class=\"grade_name_edit\" type=\"text\" maxlength=\"20\" value=\"NEW\"/></td>";
			html += "<td><div class=\"grade_color_btn\"></div></td>";
			html += "</tr>";
	
			$(".edit_table").children("tbody").html(html);			
		}else {
			makeAlert(1, "추가 오류", "더 이상 등급을 추가할 수 없습니다.", null);
		}
	});
	
	$("#grade_del_btn").on("click", function() {
		if(gradeNo + cnt < 4){
			var html = $(".edit_table").children("tbody").html();
			
			$("#" + (gradeNo + cnt)).remove();
			cnt++;
		}else {
			makeAlert(1, "삭제 오류", "더 이상 등급을 삭제할 수 없습니다.", null);
		}
	});
	
	$("#cancleBtn").on("click", function() {
		history.back();
	});
});

function editGrade() {
	for(var i = 6; i >= gradeNo; i--){
		$("#gradeNo").val(i);
		$("#gradeColor").val($("#" + i).find(".grade_color_btn").css("background-color"));
		$("#gradeNm").val($("#" + i).find(".grade_name_edit").val());
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type: "post",
			url: "editGradeAjax",
			datatype: "json",
			data: params,
			success: function(result) {
				reloadGrade();
			},error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
}

function delGrade() {
	for(var i = gradeNo; i < (gradeNo + cnt); i++){
		$("#gradeNo").val(i);
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type: "post",
			url: "delGradeAjax",
			datatype: "json",
			data: params,
			success: function(result) {
				reloadGrade();
			},error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		
	}
}

function insertGrade() {
	for(var i = gradeNo - 1; i >= (gradeNo + cnt); i--){
		$("#gradeNo").val(i);
		$("#gradeColor").val($("#" + i).find(".grade_color_btn").css("background-color"));
		$("#gradeNm").val($("#" + i).find(".grade_name_edit").val());
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type: "post",
			url: "insertGradeAjax",
			datatype: "json",
			data: params,
			success: function(result) {
				reloadGrade();
			},error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
}

function reloadGrade() {
	$.ajax({
		type: "post",
		url: "getGradeAjax",
		datatype: "json",
		success: function(result) {
			redrawGrade(result.grade);
		},error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function redrawGrade(grade) {
	var html = "";
	
	gradeNo = grade[grade.length - 1].CC_GRADE_NO;
	gradeRnk = grade[grade.length - 1].RNK;
	
	for(var i in grade){
		
		html += "<tr class=\"list_contents\" id=\"" + grade[i].CC_GRADE_NO + "\">";
		html += "<td class=\"grade_rank\">" + grade[i].RNK + "</td>";
		html += "<td class=\"grade_name_now\">" + grade[i].CC_GRADE_NAME + "</td>";
		html += "<td><input class=\"grade_name_edit\" type=\"text\" maxlength=\"5\"/ placeholder=\"최대 5글자까지 입력 가능\"></td>";
		html += "<td><div class=\"grade_color_btn\" style=\"background-color:" + grade[i].CC_GRADE_COLOR + "\"></div></td>";
		html += "</tr>";
	}
	
	$("tbody").html(html);
	
	$(".grade_name_edit").on("keypress", function() {
		if(event.keyCode == 13) {
			$("#editBtn").click();
		}
	});
}
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="gradeNo" name="gradeNo" />
	<input type="hidden" id="gradeColor" name="gradeColor" />
	<input type="hidden" id="gradeNm" name="gradeNm" />
</form>
	<c:import url="/topLeft">
		<c:param name="menuNo">4</c:param>
	</c:import>
	<div class="title_area">등급편집</div>
	<div class="content_area">
		<div class="edit_btn_area no_drag">
	        <div class="btn btn_black btn_size_normal" id="grade_add_btn">추가</div>
	        <div class="btn btn_black btn_size_normal" id="grade_del_btn">삭제</div>
	        <div class="btn btn_yellow btn_size_normal" id="editBtn">수정</div>
	        <div class="btn btn_yellow btn_size_normal" id="cancleBtn">취소</div>
		</div>
		<table class="edit_table">
			<colgroup>
				<col width="100">
				<col width="300">
				<col width="500">
				<col width="200">
			</colgroup>
			<thead>
				<tr class="table_list_header">
	               <td class="title">순위</td>
	               <td class="title">현재 등급명</td>
	               <td class="title">수정할 등급명</td>
	               <td class="title">등급색</td>
	            </tr>
            </thead>
			<tbody>
			</tbody>
		</table>
		<div class="palette no_drag">
			<div class="color1"></div>
			<div class="color2"></div>
			<div class="color3"></div>
			<div class="color4"></div>
			<div class="color5"></div>
			<div class="color6"></div>
			<div class="color7"></div>
			<div class="color8"></div>
			<div class="color9"></div>
			<div class="color10"></div>
			<div class="color11"></div>
			<div class="color12"></div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>