<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객사</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	getCompList();
	
	// 검색 버튼 클릭 이벤트
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		getCompList();
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
			getCompList();
		}
	});
	
	// 등록 버튼 클릭 이벤트
	$("#compAddBtn").on("click", function() {
		location.href = "compAdd";
	});
	
	// 고객사 데이터 클릭 이벤트
	$("tbody").on("dblclick", ".list_contents", function() {
		$("#comp_no").val($(this).attr("name"));
		$("#dataForm").attr("action", "compDetail");
		$("#dataForm").submit();
	});
	
	// 체크 박스 전체 선택 on/off
	$("#chk_all").click(function(){
		var stat = $("#chk_all").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
	});
	
	// 체크개수 카운팅 
	$(".table_list").on("click", ".list_chbox", function() {	
		$("#chkcnt_all").html($(".table_list tbody .list_chbox").length);
		$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
	});
	
	// 삭제 버튼 클릭
	$("#deleteBtn").on("click", function() {
		if($("#chkcnt").html() == "0") {
			makeAlert(1, "비활성화 오류", "데이터가 선택되지 않았습니다.", null);
		}
		else {
			makeTwoBtnPopup(1, "비활성화 경고", "선택된 항목을 비활성화하시겠습니까?<br>비활성화된 항목은 목록에 노출되지 않습니다.", false, 400, 200, null, "확인", function() {
				closePopup(1);
				$("input[name='comp_chkbox']").each(function() {
					var del = $(this).attr("id").substring($(this).attr("id").indexOf("_") + 1);
					if($(this).is(":checked")) {
						var params = "&comp_no=" + del;
						
						$.ajax({
							type: "post",
							url: "deleteCompAjax",
							dataType: "json",
							data: params,
							success: function(result) {
								if(result.res == "FAILED") {
									makeAlert(1, "비활성화 실패", "비활성화에 실패했습니다.", null);
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
				getCompList();
			}, "취소", function() {
				closePopup(1);
			});
		}
	});
	
	// 고객사 데이터 리스트 Get
	function getCompList() {
		var params = $("#searchForm").serialize() + "&" + $("#dataForm").serialize();

		$.ajax({
			type: "post",
			url: "getCompListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.list != null) {
					drawListPaging(result.pb);
					drawCompList(result.list);			
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 고객사 리스트 Draw
	function drawCompList(list) {
		var html = "";
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].NO + "\">";
       			html += "<td>";
       			html += "<input type=\"checkbox\" class=\"list_chbox\" id=\"chk_" + list[i].NO + "\" name=\"comp_chkbox\" />";
                html += "<label for=\"chk_" + list[i].NO + "\" class=\"chbox_lbl\"></label>";
       			html += "</td>";
          		html += "<td>" + list[i].NO + "</td>";
          		html += "<td>" + list[i].COMP_NAME + "</td>";
          		html += "<td>" + list[i].SECT_NAME + "</td>";
          		html += "<td class=\"td_left_align\">";
          		html += ($.trim(list[i].ADDR) != "()")? list[i].ADDR + "</td>" : "</td>"; 
          		html += "<td>" + list[i].STAT_NAME + "</td>";
          		html += "<td>" + list[i].EMP_NAME + "</td>";
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
		$(".list_chbox").on("click", function() {
			var cnt = 0;
			$(".list_chbox").each(function() {
				cnt += (!$(this).is(":checked") && $(this).attr("id") != "chk_all")? 1 : 0;
			});
			var stat = (cnt > 0) ? false : true;
			$("#chk_all").prop("checked", stat);
		});
	}
	
	// 고객사 리스트 Paging draw
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
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">3</c:param>
	</c:import>
	<div class="title_area no_drag">고객사 목록</div>
	<div class="content_area">
		<div class="list_wrap">
            <div class="table_top_area">
               	<div class="top_title_area"></div>
               	<div class="top_btn_area no_drag">
               		<div class="btn btn_yellow btn_size_normal" id="compAddBtn">새 등록</div>
                    <div class="btn btn_yellow btn_size_normal" id="deleteBtn">선택 비활성화</div>
               	</div>
               	<div class="top_title_area no_drag">
                	<div style="font-size: 10pt; font-weight: bold; color: #595959;">
                        <span id="chkcnt_all"></span>개 항목중 <span id="chkcnt">0</span>개 선택 
                	</div>
                </div>
               	<div class="top_btn_area">
               		<form action="#" method="post" id="searchForm">
                  		<select class="input_short no_drag" name="searchGbn" id="searchGbn">
                    	 	<option selected="selected" value="0">전체</option>
                    	 	<option value="1">고객사 명</option>
                    	 	<option value="2">업종</option>
                    	 	<option value="3">주소</option>
                    	 	<option value="4">상태</option>
                    	 	<option value="5">담당자</option>
                  		</select> 
                  		<input type="text" class="input_wfix input_search" id="searchTxt" name="searchTxt" placeholder="검색어 입력" />
                  		<div class="btn btn_black btn_size_normal no_drag" id="searchBtn">검색</div>
                  	</form>
               	</div>
            </div>
            <form action="#" method="post" id="dataForm">
            	<input type="hidden" id="page" name="page" value="${page}" />
            	<input type="hidden" id="comp_no" name="comp_no" />
            	<table class="table_list">
               		<colgroup>  
	               		<col width="5%" />
                    	<col width="8%" />
                    	<col width="17%" />
                    	<col width="15%" />
                    	<col width="35%" />
                    	<col width="10%" />
                    	<col width="10%" />
	               	</colgroup>
	               	<thead>
	               		<tr class="table_list_header no_drag">
	                  		<td>
	                  			<input type="checkbox" class="list_chbox" id="chk_all"/>
	                        	<label for="chk_all" class="chbox_lbl"></label>
	                  		</td>
	                  		<td>no</td>
                    		<td>고객사 명</td>
                    		<td>업종</td>
                   			<td>주소</td>
                    		<td>상태</td>
                    		<td>담당자</td>
	               		</tr>
	               	</thead>
	               	<tbody>
	               		<tr class="list_contents no_drag" style="height: 500px;">
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