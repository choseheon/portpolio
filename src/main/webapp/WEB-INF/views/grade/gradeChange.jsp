<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 변경</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/grade/grade.css" />
<script type="text/javascript">
var grade = new Array();
var gradeChangeArr = new Array();
var updateFlag = true;
$(document).ready(function() {
	reloadGrade();
	reloadGradeList();
	
	$(".list_paging_area").on("click", ".btn_paging", function() {
		$("#page").val($(this).attr("name"));
		reloadGrade();
		reloadGradeList();
	});
	
	$("#grade_srch_align").change(function() {
		$("#srchVal").val($(this).val());
			
		reloadGradeList();
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
	
	$("#changeBtn").on("click", function() {
		var flag = true;
		var cnt = 0;
		
		$(".list_chbox").each(function() {
			if(!$(this).is("#chk_all")){
				if($(this).is(":checked")){
					if($(this).parents("tr").find(".grade_edit").val() != 9){
						gradeChangeArr[cnt] = {
							compNo: $(this).parents("tr").attr("name"),
							gradeNo: $(this).parents("tr").find(".grade_edit").val()
						}
						cnt++;
					}else {
						flag = false;
					}
				}
			}
		});
		
		if(flag == false){
			makeAlert(1, "등급 미지정", "선택된 회사의 등급을 지정하지 않았습니다.", null);
		}else {
			if(gradeChangeArr.length == 0){
				makeAlert(1, "변경 오류", "변경할 회사를 선택하지 않았습니다.", null);
			}else{
				updateGrade();				
			}
		}
	});
	
	$("#grade_srch_txt").on("keypress",function() {
		if(event.keyCode == 13){
			$("#grade_srch_btn").click();
			return false;
		}
	});
	
	$("#cancleBtn").on("click", function() {
		history.back();
	});
	
	$(".table_list").on("click", ".list_chbox", function() {
		$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
	});
});


function reloadGrade() {
	$.ajax({
		type: "post",
		url: "getGradeAjax",
		dataType: "json",
		success: function(result) {
			grade = result.grade;
		}
	});
}

function reloadGradeList() {
	var params = $("#actionForm").serialize() + "&" + $("#srchForm").serialize();;
	
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

function updateGrade() {
	for(var i = 0; i < gradeChangeArr.length; i++){
		
		$.ajax({
			type: "post",
			url: "updateGradeAjax",
			dataType: "json",
			data: gradeChangeArr[i],
			error : function() {
				updateFlag = false;
			}
		});
	}
	if(updateFlag = true){
		makeAlert(1, "변경 성공", "등급이 변경 되었습니다.", null);
		reloadGradeList();
	}else {
		makeAlert(1, "변경 실패", "등급변경에 실패 하였습니다.", null);
	}
}

function redrawGradeList(list){
	var html = "";
	
	if(list.length == 0){
		html += "<tr class=\"list_contents\">";
		html += "<td colspan=\"8\">조회된 데이터가 없습니다.</td>";
		html += "<tr/>";
		
		$("#chkcnt").html(0);
	}else{
		for(var i in list){
			html += " <tr class=\"list_contents\" name=\"" + list[i].COMP_NO + "\">";
	        html += " <td><input type=\"checkbox\" class=\"list_chbox\" id=\"chk_" + list[i].COMP_NO + "\"/> ";
	        html += " <label for=\"chk_" + list[i].COMP_NO + "\" class=\"chbox_lbl\"></label></td>";
	        html += " <td>" + list[i].COMP_NO + "</td>";
	        html += " <td>" + list[i].CC_GRADE_NAME + "</td>";
	        html += " <td><select class=\"grade_edit\">";
	        html += " 		<option class=\"content_srch_DD1\" value=\"9\">변경등급</option>";
	        for(var j in grade){
		        html += "<option value=\"" + grade[j].CC_GRADE_NO + "\">" + grade[j].CC_GRADE_NAME + "</option>";
	        }
	        html += " </select> </td>";
	        html += " <td>" + list[i].COMP_NAME + "</td>";
	        html += " <td>" + list[i].COMP_SECT_NAME+ "</td>";
	        html += " <td>" + list[i].COMP_STAT_NAME + "</td>";
	        html += " <td>" + list[i].EMP_NAME+ "</td> </tr>";
		}
	}
	
	$("tbody").html(html);
	$("#chkcnt_all").html(list.length);
	
	// 체크 on/off에 따른 전체 선택 체크 박스 on/off
	$(".list_chbox").on("click", function() {
		var cnt = 0;
		$(".list_chbox").each(function() {
			cnt += (!$(this).is(":checked") && $(this).attr("id") != "chk_all")? 1 : 0;
		});
		var stat = (cnt > 0) ? false : true;
		$("#chk_all").prop("checked", stat);
	});
	
	$(".grade_edit").change(function() {
		$(this).parents("tr").find(".list_chbox").prop("checked", true);
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
		<input type="hidden" name="srchVal" id="srchVal" value="전체" />
		<input type="hidden" name="compNo" id="compNo" />
		<input type="hidden" name="addr" value="change" />
	</form>
	
	<c:import url="/topLeft">
		<c:param name="menuNo">4</c:param>
	</c:import>
	<div class="title_area">등급변경</div>
	<div class="content_area">
        <div class="list_wrap">
        	<div class="table_top_area">
        		<div class="top_title_area"></div>
        		<div class="top_btn_area">
        			<div class="btn btn_yellow btn_size_normal no_drag" id="changeBtn">변경</div>
        			<div class="btn btn_yellow btn_size_normal no_drag" id="cancleBtn">취소</div>
        		</div>
        		<div class="top_title_area">
        			<div>
        				<span id="chkcnt_all"></span>개 항목중 <span id="chkcnt">0</span>개 선택
        			</div>
        		</div>
        		<div class="top_btn_area no_drag">
        			<form action="#" method="post" id="srchForm">
			            <select class="input_short" id="grade_srch_align">
			                <option >전체</option>
			                <option>등급</option>
			                <option>회사명</option>
			                <option>업종</option>
			                <option>상태</option>
			                <option>담당자</option>
			            </select>
			            <input type="text" class="input_wfix input_search" id="grade_srch_txt" name="grade_srch_txt" placeholder="현재목록 내 검색"/>
	        			<div class="btn btn_black btn_size_normal" id="grade_srch_btn">검색</div>
        			</form>
        		</div>
        	</div>
         	<table class="table_list">
         		<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="30%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
		            <tr class="table_list_header">
		               <td>
		               		<input type="checkbox" class="list_chbox" id="chk_all"/>
		               		<label for="chk_all" class="chbox_lbl"></label>
		               </td>
		               <td>no</td>
		               <td>현재 등급</td>
		               <td>변경 등급</td>
		               <td>회사명</td>
		               <td>업종</td>
		               <td>상태</td>
		               <td>당담자</td>
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