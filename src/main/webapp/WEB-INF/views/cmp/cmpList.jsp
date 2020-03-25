<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mango CRM</title>
<link rel="stylesheet" type="text/css" href="resources/css/cmp/cmpList.css" />

<c:import url="/header"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function() {
	cmpList();
	
	$(".paging_area").on("click","span",function(){
		if($(this).attr("name") != "" ){
			$("#page").val($(this).attr("name"));
			cmpList();
		}
	});
	
	$("#write_Btn").on("click",function(){
		location.href="cmpAdd";
	});
	
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		cmpList();
	});
});

function cmpList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",     
		url : "cmpListAjax",
		dataType : "json",
		data : params,
		success : function(result){
			redrawCmpList(result.list);
			 drawPaging(result.pb);
			
		},
		error : function(request, status, error){
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
	
}
function redrawCmpList(list){
	var html = "";
	
	if(list.length == 0){
		html += "<tr>";
		html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	}
	else{
		/* 
		CMP_NO
		CMP_NAME
		SDATE
		EDATE
		PROG_STAT
		RNUM
		EMP_NAME *
		*/
		for(var i in list){
			html += "<tr name=\"" + list[i].CMP_NO + "\">";
			html += "<td>" + list[i].RNUM + "</td>";
			html += "<td>"+ list[i].CMP_NAME + "</td>";
			html += "<td>"+ list[i].SDATE + " ~ " + list[i].EDATE +"</td>";
			if(list[i].PROG_STAT == 1){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">2단계</td>"
			}
			else if(list[i].PROG_STAT == 2){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">3단계</td>"
			}
			else if(list[i].PROG_STAT == 3){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">4단계</td>"
			}
			else if(list[i].PROG_STAT == 0){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">종료</td>"
			}
			else if(list[i].PROG_STAT == 4){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">결재대기</td>"
			}
			else if(list[i].PROG_STAT == 5){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">수행대기</td>"
			}
			else if(list[i].PROG_STAT == 6){
				html +="<td class=\"grade\" name=\"" + list[i].PROG_STAT + "\">완료</td>"
			}
			html += "<td>"+ list[i].EMP_NAME+"</td>";
			html += "</tr>";
		}
		
		$("tbody").on("dblclick", "tr", function(){
			$("#seq").val($(this).attr("name"));
			if($(this).find(".grade").attr("name") == 1){
				$("#actionForm").attr("action", "targetSelect");
				$("#actionForm").submit();
				
			}else if($(this).find(".grade").attr("name") == 2){
				$("#actionForm").attr("action", "channelSelect");
				$("#actionForm").submit();
			}else if($(this).find(".grade").attr("name") == 3){
				$("#actionForm").attr("action", "simResult");
				$("#cmpNo").val($(this).attr("name"));
				$("#actionForm").submit();
			}else if($(this).find(".grade").attr("name") == 0){
				$("#actionForm").attr("action", "cmpAdd");
				$("#actionForm").submit();
			} else if($(this).find(".grade").attr("name") == 6) {
				$("#actionForm").attr("action", "perfAnalyze");
				$("#cmpNo").val($(this).attr("name"));
				$("#actionForm").submit();
			} 
		});
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
		<c:param name="menuNo">9</c:param>
	</c:import>
	
	<div class="title_area">캠페인 목록</div>
	<div class="content_area">
		<div class="contents_wrap">
		<form action="#" method="post" id="actionForm" >
			<input type="hidden" id="page" name="page" value="1"/>
			<input type="hidden" id="seq" name="seq" />
			<input type="hidden" id="cmpNo" name="cmpNo" />
		<div class="write_btn">
            <c:choose>
					<c:when test="${!empty sEmpNo}">
			            <div class="write_Btn" id="write_Btn">등록</div>
					</c:when>
			</c:choose>
            
         </div>
         
	         <div class="search_srch">
	            <div class="search_srch_btn">
						<div id="searchBtn">검색</div>
						<input type="text" class="textbox_srch_txt" name="textbox_srch_txt" id="textbox_srch_txt" />
							<select	class="content_srch_DD" id ="content_srch_DD" name="content_srch_DD">
								<option class="content_srch_DD1">선택</option>
								<option value="0">캠페인 명</option>
								<option value="1">진행상태</option>
								<option value="2">담당자</option>
							</select> 
	             </div>
	        </div>

		 <table>
		 	<thead>
	            <tr class="title_1">
	               <td class="table_title1">일련번호</td>
	               <td class="table_title2">캠페인명</td>
	               <td class="table_title3">진행기간</td>
	               <td class="table_title4">진행상태</td>
	               <td class="table_title5">담당자</td>
            </tr>
            </thead>
            <tbody>
	            <tr class="title_2">
	              <td></td>
	              <td></td>
	              <td></td>
	              <td></td>
	              <td></td>
	            </tr>
         	</tbody>
            
         </table>
		</form>
		</div>
					<div class="paging_area"></div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>