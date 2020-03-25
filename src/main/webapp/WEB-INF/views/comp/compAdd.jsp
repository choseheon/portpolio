<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객사</title>
<c:import url="/header"></c:import>
<style type="text/css">
.input_search {
	width: 100%;
    height: 50px;
    font-size: 13pt;
    text-indent: 10px;
    border: 1px solid #cacaca;
    border-radius : 5px;
}
.input_search::placeholder {
    font-size: 13pt;
    color: #cacaca;
}
.search_icon {
	float: right;
    position: relative;
    top: -40px;
    left: -10px;
    cursor: pointer;
}
.add_icon {
	float: right;
    position: relative;
    top: -40px;
    left: -20px;
    cursor: pointer;
}
.cancel_icon {
	float: right;
    position: relative;
    top: -35px;
    left: -20px;
    cursor: pointer;
}
.pop_list {
	width: 100%;
	text-align: center;
    border-collapse: collapse;
    font-size: 10pt;
    position: relative;
    top: -20px;
}
.pop_list>tbody>tr {
	cursor: pointer;
}
.vali_area {
	font-size: 10pt;
	color: #ff0000;
	margin-top: 5px;
}
</style>
<!-- 주소 API -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 취소 버튼 클릭 Event
	$("#cancelBtn").on("click", function() {
		history.back();
	});
	
	// 등급 변경시 옆 블록 색 변경
	$("#comp_grade").on("change", function() {
		var select = $("#comp_grade option:selected").val();
		select = select.substring(select.indexOf("_") + 1);
		
		$(".color_view").css("background-color", select);
	});
	
	// 주소 검색 버튼 클릭 Event
	$("#searchAddrBtn").postcodifyPopUp();
	
	// 담당자 검색 버튼 클릭 Event
	$("#empSearchBtn").on("click", function() {
		var html = "";
		
		html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
		html += "<div>";
		html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
		html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
		html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
		html += "</div>";
		html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
		html += "</form>";
		html += "<table class=\"pop_list\">";
		html += "<colgroup><col width=\"15%\"/><col width=\"20%\"/><col width=\"15%\"/><col width=\"25%\"/><col width=\"25%\"/>";
		html += "<thead>";
		html += "<tr class = \"table_list_header\">";
		html += "<td>번호</td>";
		html += "<td>부서</td>";
		html += "<td>팀</td>";
		html += "<td>이름</td>";
		html += "<td>직급</td>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
        html += "</div>";
        
        makeNoBtnPopup(1, "담당자 검색", html, true, 600, 600, function() {
        	getEmpList();
        	setEmpEvent();
		});
	});
	// 담당자 목록 Get
	function getEmpList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "getEmpPopAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawListPaging(result.pb);
				drawEmpList(result.list);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 담당자 목록 draw
	function drawEmpList(list) {
		var html = "";
		
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].EMP_NO + "_" + list[i].EMP_NAME + "\">";
		  		html += "<td>" + list[i].EMP_NO + "</td>";
		  		html += "<td>" + list[i].DEPART_NAME + "</td>";
		  		html += "<td>" + list[i].TEAM_NAME + "</td>";
		  		html += "<td>" + list[i].EMP_NAME + "</td>";
		  		html += "<td>" + list[i].POSI_NAME + "</td>";
				html += "</tr>";
			}
		}
		else {
			html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
			html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			$(".list_paging_area").html("");
		}
		
		$(".pop_list>tbody").html(html);
	}
	// 담당자 팝업 이벤트 할당
	function setEmpEvent() {
		// 검색 버튼 클릭 Event
		$("#empSearchBtn").on("click", function() {
			$("#page").val(1);
			getEmpList();
		});
		// 검색 엔터키 입력 Event
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#empSearchBtn").click();
				return false;
			}
		});
		// 검색 초기화 버튼 클릭 Event
		$("#empCancelBtn").on("click", function() {
			$("#searchTxt").val("");
			getEmpList();
		});	
		// Paging 버튼 클릭 이벤트
		$(".list_paging_area").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page").val($(this).attr("name"));
				getEmpList();
			}
		});	
		// 담당자 값 선택 Event
		$(".pop_list>tbody").on("click", "tr", function() {
			var select = $(this).attr("name");
			$("#emp_name").val(select.substring(select.indexOf("_") + 1));
			$("#emp_no").val(select.substring(0, select.indexOf("_")));
			closePopup(1);
		});
	}
	
	// 업종 검색 버튼 클릭 Event
	$("#sectSearchBtn").on("click", function() {
		var html = "";
		
		html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
		html += "<div>";
		html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) IT\" />";
		html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"sectSearchBtn\">";
		html += "<img src =\"resources/images/button/icon_add_gray.png\" alt=\"\" width=\"30px\" class=\"add_icon\" id=\"sectAddBtn\">";
		html += "</div>";
		html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
		html += "</form>";
		html += "<table class=\"pop_list\">";
		html += "<colgroup><col width=\"15%\" /><col width=\"85%\" />";
		html += "<thead>";
		html += "<tr class = \"table_list_header\">";
		html += "<td>번호</td>";
		html += "<td>업종명</td>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
        html += "</div>";
		
		makeNoBtnPopup(1, "업종 검색", html, true, 500, 600, function() {
			getSectList();
			setSectEvent();
		});
	});
	// 업종 목록 Get
	function getSectList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "getSectListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawListPaging(result.pb);
				drawSectList(result.list);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 업종 리스트 Draw
	function drawSectList(list) {
		var html = "";
		
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].SECT_NO + "_" + list[i].SECT_NAME + "\">";
		  		html += "<td>" + list[i].SECT_NO + "</td>";
		  		html += "<td>" + list[i].SECT_NAME + "</td>";
				html += "</tr>";
			}
		}
		else {
			html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
			html += "<td colspan=\"7\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			$(".list_paging_area").html("");
		}
		
		$(".pop_list>tbody").html(html);
	}
	// 업종 팝업 버튼 Event 할당
	function setSectEvent() {
		// 검색 버튼 클릭 Event
		$("#sectSearchBtn").on("click", function() {
			getSectList();
		});
		// 검색 엔터키 입력 Event
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#sectSearchBtn").click();
				return false;
			}
		});
		// 업종 추가 버튼 Event
		$("#sectAddBtn").on("click", function() {
			var html = "";
			
			html += "<form action=\"#\" method=\"post\" id=\"addForm\">";
			html += "<div style=\"margin-top: 10px;\">";
			html += "<input type=\"text\" class=\"input_normal\" id=\"insert_sect\" name=\"insert_sect\" style=\"width: calc(100% - 90px) !important\" />";
			html += "<input type=\"hidden\" id=\"sect_chk\" value=\"0\" />";
        	html += "<div class=\"btn btn_black btn_size_normal\" id=\"sectInsertBtn\">추가</div>";
			html += "</div>";
			html += "<div class=\"vali_area\"></div>";
			html += "</form>";
			
			makeNoBtnPopup(2, "업종 추가", html, true, 500, 120, function() {
				// 업종 중복 체크
				$("#insert_sect").on("focusout", function() {
					var params = $("#addForm").serialize();

					$.ajax({
						type: "post",
						url: "checkSectNameAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							$("#sect_chk").val(result.check);
							
							if($("#sect_chk").val() == 2) {
								$(".vali_area").html("중복된 업종입니다.");
							}
							else {
								$(".vali_area").html("");
							}
						},
						error : function(request, status, error) {
							console.log("status : " + request.status);
							console.log("text : " + request.responseTest);
							console.log("error : " + error);
						}
					});
				});
				
				// 추가 버튼 클릭 Event
				$("#sectInsertBtn").on("click", function() {
					if($("#insert_sect").val().length < 2) {
						$("#insert_sect").focus();
						$(".vali_area").html("업종명은 2자 이상입니다.");
					}
					else if($("#sect_chk").val() == 0 || $("#sect_chk").val() == 2) {
						makeNoBtnPopup(3, "업종명 유효성 검사", "업종명이 유효하지 않습니다.", true, 500, 120, null);
						$("#insert_sect").focus();
					}
					else {
						var params = $("#addForm").serialize();

						$.ajax({
							type: "post",
							url: "insertSectAjax",
							dataType: "json",
							data: params,
							success: function(result) {
								console.log(result.res);
								if(result.res == "SUCCESS") {
									closePopup(2);
									getSectList();
								}
								else {
									makeNoBtnPopup(3, "업종 등록 실패", "업종 등록에 실패했습니다.", true, 500, 120, null);
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
			});
		});
		
		// Paging 버튼 클릭 이벤트
		$(".list_paging_area").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page").val($(this).attr("name"));
				getSectList();
			}
		});
		
		// 업종 값 선택 Event
		$(".pop_list>tbody").on("click", "tr", function() {
			var select = $(this).attr("name");
			$("#comp_sect").val(select.substring(select.indexOf("_") + 1));
			$("#sect_no").val(select.substring(0, select.indexOf("_")));
			closePopup(1);
		});
	}
	
	// 리스트 Paging draw
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
	
	// 전화번호 자동 하이푼
	$("#comp_ph").on("keyup keypress", function() {
		var num = $(this).val();
		var ph_num = num.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-");
		$(this).val(ph_num);
	});
	
	// 고객사 등록 버튼 클릭 Event
	$("#saveBtn").on("click", function() {
		// 정규식 -전화번호 유효성 검사
        var regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		if($.trim($("#comp_name").val()) == "" || $.trim($("#emp_name").val()) == "" 
		|| $.trim($("#comp_ph").val()) == "" || $("#comp_grade option:selected").val() == 0
		|| $.trim($("#comp_sect").val()) == "" || $("#comp_stat option:selected").val() == "-1") {
			makeAlert(1, "필수조건 미입력", "필수조건을 입력해야합니다.", null);
		}
		else if(!regPhone.test($("#comp_ph").val())) {
			makeAlert(1, "전화번호 유효성 위반", "전화번호가 유효하지 않습니다. 다시 입력해주세요.", function() {
				$("#comp_ph").focus();
			});
		}
		else if($("#comp_stat option:selected").val() == 0 && $("#alert_chk").val() == 0) {
			makeTwoBtnPopup(1, "비활성화 경고", "상태를 비활성화로 설정시 목록에 노출되지 않습니다. 계속하시겠습니까?", false, 400, 200, null, "확인", function() {
				closePopup(1);
				$("#alert_chk").val(1);
				$("#saveBtn").click();
			}, "취소", function() {
				closePopup(1);
			});
		}
		else if($.trim($("#comp_zc").val()) == "" && $.trim($("#comp_det_addr").val()) != "" ) {
			makeAlert(1, "주소 입력 오류", "기본 주소가 선택되지 않았습니다.", null);
		}
		else {
			var params = "&comp_name=" + $("#comp_name").val();

			$.ajax({
				type: "post",
				url: "checkCompNameAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					$("#comp_grade option:selected").val($("#comp_grade option:selected").val().substring(0, $("#comp_grade option:selected").val().indexOf("_")));
					if(result.cnt > 0) {
						makeTwoBtnPopup(1, "이름 중복", "중복된 이름이 있습니다. 계속 진행하시겠습니까?", true, 400, 200, null, "확인", function() {
							closePopup(1);
							addComp();
						},"취소", function() {
							closePopup(1);
						});
					}
					else {
						addComp();
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
	
	function addComp() {
		var params = $("#dataForm").serialize();

		$.ajax({
			type: "post",
			url: "addCompAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "SUCCESS") {
					makeAlert(2, "등록 성공", "성공적으로 등록했습니다.", function() {
						location.href = "compList";
					});
				}
				else {
					makeAlert(2, "등록 실패", "등록에 실패했습니다.", null);
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
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">3</c:param>
	</c:import>
	<div class="title_area no_drag">고객사 등록</div>
	<div class="content_area">
		<div class="contents_wrap">
            <div class="table_top_area">
               	<div class="top_title_area"></div>
               	<div class="top_btn_area no_drag" >
               		<div class="btn btn_yellow btn_size_normal" id="saveBtn">저장</div>
                    <div class="btn btn_yellow btn_size_normal" id="cancelBtn">취소</div>
               	</div>
            </div>
            <form action="#" method="post" id="dataForm">
            	<input type="hidden" id="page" name="page" value="${page}" />
            	<table class="table_normal">
                	<colgroup>   
                    	<col width="10%" />
                    	<col width="40%" />
                    	<col width="10%" />
                    	<col width="40%" />
                	</colgroup>
					<tbody>	
                		<tr>
                    		<td class="field_name first_field_name no_drag">고객사 명 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<input type="text" class="input_normal" id="comp_name" name="comp_name"/>
                    		</td>
                    		<td class="field_name no_drag">담당자 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<input type="text" class="input_normal input_readonly" id="emp_name" style="width: calc(100% - 100px) !important" readonly="readonly" />
                        		<div class="btn btn_black btn_size_normal no_drag" id="empSearchBtn">검색</div>
                        		<input type="hidden" id="emp_no" name="emp_no" />
                    		</td>
                		</tr>
                		<tr>
                    		<td class="field_name first_field_name no_drag">전화번호 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<input type="text" class="input_normal" id="comp_ph" name="comp_ph" placeholder="'-' 포함" />
                    		</td>
                    		<td class="field_name no_drag">등급 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<select class="input_normal no_drag" style="width: calc(100% - 35px) !important;" id="comp_grade" name="comp_grade">
                            		<option selected="selected" value="0_#ffffff">- - 선택 - -</option>
                            		<c:forEach var="grade" items="${grade}">
                            			<option value="${grade.G_NO}_${grade.G_COLOR}">${grade.G_NAME}</option>
                            		</c:forEach>
                        		</select>
                        		<div class="color_view no_drag"></div>
                    		</td>
                		</tr>
                		<tr>
                    		<td class="field_name first_field_name no_drag">업종 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<input type="text" class="input_normal input_readonly" id="comp_sect" style="width: calc(100% - 100px) !important" readonly="readonly" />
                        		<div class="btn btn_black btn_size_normal no_drag" id="sectSearchBtn">검색</div>
                        		<input type="hidden" id="sect_no" name="sect_no" />
                    		</td>
                    		<td class="field_name no_drag">상태 <span class="acc_txt">*</span></td>
                    		<td class="field_contents">
                        		<select class="input_normal no_drag" id="comp_stat" name="comp_stat">
                            		<option selected="selected" value="-1">- - 선택 - -</option>
                            		<c:forEach var="stat" items="${stat}">
                            			<option value="${stat.STAT_NO}">${stat.STAT_NAME}</option>
                            		</c:forEach>	
                        		</select>
                        		<input type="hidden" id="alert_chk" name="alert_chk" value="0" />
                    		</td>
                		</tr>
                		<tr>
                    		<td class="field_name first_field_name no_drag">웹사이트</td>
                    		<td class="field_contents" colspan="3">
                        		<input type="text" class="input_normal" id="comp_web" name="comp_web"/>
                    		</td>
                		</tr>
                		<tr>
                    		<td class="field_name first_field_name no_drag">주소</td>
                    		<td class="field_contents" colspan="3">
                        		<div class="address_margin">
                            		<input type="text" class="input_short input_readonly postcodify_postcode5" readonly="readonly" placeholder="우편번호" id="comp_zc" name="comp_zc"/>
                            		<div class="btn btn_black btn_size_normal no_drag" id="searchAddrBtn">검색</div>
                        		</div>
                        		<div class="address_margin">
                            		<input type="text" class="input_normal input_readonly postcodify_address" readonly="readonly" placeholder="주소" id="comp_addr" name="comp_addr"/>
                        		</div>
                        		<div><input type="text" class="input_normal postcodify_details" placeholder="상세주소" id="comp_det_addr" name="comp_det_addr" /></div>
                    		</td>
                		</tr>
                		<tr>
                    		<td class="field_name first_field_name no_drag">상세정보</td>
                    		<td class="field_contents" colspan="3">
                        		<textarea type="text" class="textarea_normal" id="comp_det_info" name="comp_det_info"></textarea>
                    		</td>
                		</tr>
					</tbody>
            	</table>
            </form>
      	</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>