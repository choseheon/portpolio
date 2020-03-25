<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	filterCheck();
	getEmpList();
	
	// 검색 버튼 클릭 이벤트
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		getEmpList();
	});
	// 검색 엔터키 입력 이벤트
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			return false;
		}
	});
	
	// Paging 버튼 클릭 이벤트
	$(".list_paging_area").on("click", "div", function() {
		if(!isNaN($(this).attr("name") * 1)) {
			$("#page").val($(this).attr("name"));
			getEmpList();
		}
	});
	
	// 등록 버튼 클릭 이벤트
	$("#empAddBtn").on("click", function() {
		location.href = "empMgtAdd";
	});
	
	// 사원 데이터 클릭 이벤트
	$("tbody").on("dblclick", ".list_contents", function() {
		$("#emp_no").val($(this).attr("name"));
		$("#dataForm").attr("action", "empMgtDetail");
		$("#dataForm").submit();
	});
	
	// 체크 박스 전체 선택 on/off
	$("#chk_all").click(function(){
		var stat = $("#chk_all").is(":checked")? true : false;
		$(".empList_chbox").prop("checked", stat);
	});
	
	// 체크개수 카운팅 
	$(".table_list").on("click", ".list_chbox", function() {	
		$("#chkcnt_all").html($(".table_list tbody .list_chbox").length);
		$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
	});
	
	// 삭제 버튼 클릭
	$("#deleteBtn").on("click", function() {
		if($("#chkcnt").html() == "0") {
			makeAlert(1, "삭제 오류", "데이터가 선택되지 않았습니다.", null);
		}
		else {
			makeTwoBtnPopup(1, "삭제 경고", "선택된 항목을 삭제 하시겠습니까?", false, 400, 200, null, "확인", function() {
				closePopup(1);
				$("input[name='emp_chkbox']").each(function() {
					var del = $(this).attr("id").substring($(this).attr("id").indexOf("_") + 1);
					if($(this).is(":checked")) {
						var params = "&emp_no=" + del;
						
						$.ajax({
							type: "post",
							url: "deleteEmpAjax",
							dataType: "json",
							data: params,
							success: function(result) {
								if(result.res == "FAILED") {
									makeAlert(1, "삭제 실패", "삭제에 실패했습니다.", null);
								}
							},
							error : function(request, status, error) {
								console.log("status : " + request.status);
								console.log("text : " + request.responseTest);
								console.log("error : " + error);
							}
						});
					}
				});
				getEmpList();
			}, "취소", function() {
				closePopup(1);
			});
		}
	});
	
	// 사원 데이터 리스트 Get
	function getEmpList() {
		$("#chk_all").prop("checked", false);
		var params = $("#searchForm").serialize() + "&" 
			+ $("#dataForm").serialize() + "&filter=" + $("#auth_filter").val();

		$.ajax({
			type: "post",
			url: "getEmpListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.list != null) {
					drawListPaging(result.pb);
					drawEmpList(result.list);
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 사원 리스트 Draw
	function drawEmpList(list) {
		var html = "";
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].NO + "\">";
       			html += "<td>";
       			html += "<input type=\"checkbox\" class=\"list_chbox empList_chbox\" id=\"chk_" + list[i].NO + "\" name=\"emp_chkbox\"/>";
                html += "<label for=\"chk_" + list[i].NO + "\" class=\"chbox_lbl\"></label>";
       			html += "</td>";
          		html += "<td>" + list[i].NO + "</td>";
          		html += "<td>" + list[i].NAME + "</td>";
          		html += "<td>" + list[i].EMAIL + "</td>";
          		html += "<td>" + list[i].DEPART_NAME + "</td>";
          		html += "<td>" + list[i].POSI_NAME + "</td>";
          		html += "<td>" + list[i].FORM + "</td>";
          		html += "<td>" + list[i].PHONE + "</td>";
          		html += "<td>" + list[i].JDATE + "</td>";
          		html += "<td class=\"td_left_align\" style=\"max-width: 220px; white-space: nowrap;\">" + list[i].ADDR + "</td>";
       			html += "</tr>";
			}
			var cnt_leng = list.length;
			$("#chkcnt").html(0);
			$("#chkcnt_all").html(cnt_leng);
		}
		else {
			html += "<tr class=\"no_drag\" style=\"height: 500px; font-size: 10pt\">";
   			html += "<td colspan=\"10\">조회된 데이터가 없습니다.</td>";
   			html += "</tr>";
   			$(".list_paging_area").html("");
   			$("#chkcnt").html(0);
			$("#chkcnt_all").html(0);
		}
		$("tbody").html(html);
		
		// 체크 on/off에 따른 전체 선택 체크 박스 on/off
		$(".empList_chbox").on("click", function() {
			var cnt = 0;
			$(".empList_chbox").each(function() {
				cnt += (!$(this).is(":checked") && $(this).attr("id") != "chk_all")? 1 : 0;
			});
			var stat = (cnt > 0) ? false : true;
			$("#chk_all").prop("checked", stat);
		});
	}
	
	// 사원 리스트 Paging draw
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
	
	// 내, 외부 구분 전체 선택 on/off
	$("#allEmp").click(function(){
		var stat = $("#allEmp").is(":checked")? true : false;
		$(".auth_chbox").prop("checked", stat);
	});
	
	$(".auth_chbox").on("click", function() {
		var cnt = 0;
		$("#auth_filter").val(4);
		$(".auth_chbox").each(function() {
			cnt += (!$(this).is(":checked") && $(this).attr("id") != "allEmp")? 1 : 0;
		});
		var stat = (cnt > 0) ? false : true;
		$("#allEmp").prop("checked", stat);
		filterCheck();
		getEmpList();
	});
	
	// 내, 외부 구분 조회 필터체크
	function filterCheck() {
		var val = 0;
		var last_val = 0;
		var cnt = 0;
		
		$(".auth_chbox").each(function() {
			cnt ++; 
			if($(this).is(":checked") && $(this).attr("id") == "allEmp") {
				val = $("#allEmp").val();
			}
			else if($(this).is(":checked") && $(this).attr("id") == "insideEmp") {
				val = $("#insideEmp").val();
			}
			else if($(this).is(":checked") && $(this).attr("id") == "outsideEmp"){
				val = $("#outsideEmp").val();
			}
			else {
				val = 3;
			}
			
			last_val = val;
			val = (val < $("#auth_filter").val())? val : $("#auth_filter").val();
			$("#auth_filter").val(val);
		});
		
		if(cnt == 2 && $("#auth_filter").val() == 0) {
			$("#auth_filter").val(last_val); 
		}
		
	}
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">1</c:param>
	</c:import>
	<div class="title_area no_drag">사원 목록</div>
	<div class="content_area">
		<div class="list_wrap">
            <div class="table_top_area">
               	<div class="top_title_area no_drag">
               		<input type="hidden" id="auth_filter" value="0" />
					<div class="chk_grp">
						<input type="checkbox" id="allEmp" class="list_chbox auth_chbox" checked="checked" value="0" />
						<label for="allEmp" class="chbox_lbl"></label> 
						<label for="allEmp" class="chk_txt margin_right">전체</label>
					</div>
					<c:if test="${sAuthorNo ne 4 and sAuthorNo ne 5}">
					<div class="chk_grp">
						<input type="checkbox" id="insideEmp" class="list_chbox auth_chbox" checked="checked" value="1" /> 
						<label for="insideEmp" class="chbox_lbl"></label> 
						<label for="insideEmp" class="chk_txt margin_right">내부</label>
					</div>
					</c:if>
					<c:if test="${sAuthorNo ne 2 and sAuthorNo ne 3}">
					<div class="chk_grp">
						<input type="checkbox" id="outsideEmp" class="list_chbox auth_chbox" checked="checked" value="2" /> 
						<label for="outsideEmp" class="chbox_lbl"></label> 
						<label for="outsideEmp" class="chk_txt">외부</label>
					</div>
					</c:if>
               	</div>
               	<div class="top_btn_area no_drag">
               		<c:if test="${sAuthorNo ne 3 and sAuthorNo ne 5}">
               		<div class="btn btn_yellow btn_size_normal" id="empAddBtn">새 등록</div>
                    <div class="btn btn_yellow btn_size_normal" id="deleteBtn">삭제</div>
                    </c:if>
               	</div>
               	<div class="top_title_area no_drag">
                	<div style="">
		            	<span id="chkcnt_all"></span>개 항목중 <span id="chkcnt">0</span>개 선택 
                	</div>
                </div>
               	<div class="top_btn_area">
               		<form action="#" method="post" id="searchForm">
                  		<select class="input_short no_drag" name="searchGbn" id="searchGbn">
                    	 	<option selected="selected" value="0">전체</option>
                    	 	<option value="1">사원번호</option>
                    	 	<option value="2">사원명</option>
                    	 	<option value="3">이메일</option>
                    	 	<option value="4">부서</option>
                    	 	<option value="5">직급</option>
                    	 	<option value="6">고용형태</option>
                    	 	<option value="7">휴대폰</option>
                    	 	<option value="8">주소</option>
                  		</select> 
                  		<input type="text" class="input_wfix input_search" id="searchTxt" name="searchTxt" placeholder="검색어 입력" />
                  		<div class="btn btn_black btn_size_normal no_drag" id="searchBtn">검색</div>
                  	</form>
               	</div>
            </div>
            <form action="#" method="post" id="dataForm">
            	<input type="hidden" id="page" name="page" value="${page}" />
            	<input type="hidden" id="emp_no" name="emp_no" />
            	<table class="table_list">
               		<colgroup>  
	               		<col width="50px" />
	                  	<col width="70px" />
	                  	<col width="100px" />
	                  	<col width="180px" />
	                  	<col width="100px" />
	                  	<col width="100px" />
	                  	<col width="100px" />
	                  	<col width="160px" />
	                  	<col width="120px" />
	                  	<col width="220px" />
	               	</colgroup>
	               	<thead>
	               		<tr class="table_list_header no_drag">
	                  		<td>
	                  			<input type="checkbox" class="list_chbox" id="chk_all"/>
	                        	<label for="chk_all" class="chbox_lbl"></label>
	                  		</td>
	                  		<td>no</td>
	                  		<td>사원명</td>
	                  		<td>이메일</td>
	                  		<td>부서</td>
	                  		<td>직급</td>
	                  		<td>고용형태</td>
	                  		<td>휴대폰</td>
	                  		<td>입사일자</td>
	                  		<td>주소</td>
	               		</tr>
	               	</thead>
	               	<tbody>
	               		<tr class="list_contents" style="height: 500px;">
	               			<td colspan="10">조회된 데이터가 없습니다.</td>
	               		</tr>
	               	</tbody>
				</table>
				<div class="list_paging_area no_drag">
	            </div>
            </form>
      	</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>