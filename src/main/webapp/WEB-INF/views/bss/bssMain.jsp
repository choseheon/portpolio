<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업</title>
<c:import url="/header"></c:import>
<style type="text/css">
table {
	width: 1200px;
	text-align: center;
	border-collapse: collapse;
	font-size: 10pt;
}

.card_area {
	width: 100%;
	height: 100%;
}

.card_view_top {
	height: 100px;
	width: 1200px;
}

.srch_table_view {
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: top;
}

.srch_table_view>img {
	width: 100%;
	height: 100%;
}

.srch_card_view {
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: top;
}

.srch_card_view>img {
	width: 100%;
	height: 100%;
}
/* 리드 카드보기 가운데부분  */
.card_view_area {
	width: 1200px;
	height: 580px;
	text-align: center;
	margin: 10px 0;
}

/* Unqualified, New, Working, Nurturing, Conversion 단계별 */
.card_view_title_stat {
	display: inline-block;
	width: calc(20% - 15px);
	height: 100%;
	vertical-align: top;
	text-align: center;
}

/*  */
.card_view_stat {
	display: inline-block;
	width: 180px;
	height: 40px;
	border-radius: 3px;
	background-color: #F2CB07;
	border: 0px solid #c5960a;
	color: #595959;
	font-size: 10pt;
	font-weight: bold;
	line-height: 40px;
	vertical-align: top;
}

/* 카드 내부 */
.card {
	display: inline-block;
	width: 180px;
	height: 100px;
	background-color: #FFFFFF;
	border: 1px solid #d0d0d0;
	border-radius: 3px;
	margin-top: 10px;
	text-align: left;
	padding: 5pt 3pt;
}

.card:hover {
	box-shadow: 1px 1px 8px #c8c8c8;
	cursor: pointer;
}

/* 카드 내부 리드 이름 */
.card_name {
	display: inline-block;
	width: calc(100% - 30px);
	height: auto;
	color: #F2B807;
	padding-left: 5px;
	font-size: 12pt;
	font-weight: bold;
	vertical-align: top;
}

/* 카드 버튼 div*/
.card_btn {
	display: inline-block;
	width: 16px;
	height: 16px;
	text-align: right;
	vertical-align: top;
	border: 0px solid #000000;
	border-radius: 3px;
	background-color: #F2B807;
	margin-top: 2px;
}

.card_btn:hover {
	background-color: #F2CB07;
	cursor: pointer;
}

/* 회사명, 전화번호 */
.card_comp, .card_emp, .card_prod {
	font-size: 10pt;
	text-indent: 5pt;
	margin-top: 3px;
}

/* 수직 구분선 */
.vertical_line {
	display: inline-block;
	width: 1px;
	height: 100%;
	background-color: #d0d0d0;
	border: 0px solid #000000;
	border-radius: 1px;
	margin-top: 40px;
}
/* 수평  컬러 구분선 */
.div_line_yellow {
	display: inline-block;
	width: 1200px;
	height: 2px;
	background-color: #F2CB07;
	border: 0px solid #000000;
	margin-bottom: 2px;
}
/* 수평 구분선 */
.div_line {
	height: 2px;
}

/* -----------테이블 영역------------ */
.table_list_td {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #cccccc;
}

.table_list_td:hover {
	background-color: #EEEEEE;
}

.table_list_td:hover input {
	background-color: #EEEEEE;
	outline: none;
	cursor: pointer;
}

.table_list_td:focus input {
	outline: none;
}

.input_normal {
	text-align: center;
	text-indent: 0px;
	border: 0px !important;
}

.input_normal:focus {
	border: 0px;
}

.table_list_header {
	color: #FFFFFF;
	font-size: 10pt;
	cursor: text;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		reloadList();
		reloadBssList();
		
		/*현재시간 가져오기*/
	    var nowDate = new Date();
	    var year = nowDate.getFullYear();
	    var month = '' + (nowDate.getMonth() + 1);
	    var day = '' + nowDate.getDate();
	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;
	    $("#endDate").val(year + "-" + month + "-" + day);
	    
	    /*---------------------------------버튼 영역--------------------------------*/
	    
	    /* 표 페이징 버튼 */
	    $("#bssTablePaging").on("click", "input", function(){
	    	if($(this).attr("name") != "") {
	    		$("#page").val($(this).attr("name"));
	        	reloadBssList();
	    	}
	    });
	    
	    /* 표 검색 버튼 */
	    $("#searchTableBtn").on("click", function() {
	    	reloadBssList();
	    });
	    
	    $("#searchTableTxt").keypress(function(event) {
	    	if(event.keyCode == 13) {
	    		reloadBssList();
	    	}
	    });
	    
	    /* 표 목록 클릭 */
		$("tbody").on("click", "tr", function() {
			$("#chnNo").val($(this).attr("name"));
			
				var params = $("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "bssNoAjax",
					dataType : "json",
					data : params,

					success : function(result) {
						$("#actionForm").attr("action", "bssDet");
						$("#actionForm").submit();
					},
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}
				});
		});
		
	    /* 표 or 카드 형식 선택버튼 */
		$("#bssCardList").hide();
	    
		//간판보기
		$(".table_img_size").on("click", function() {
			$("#bssTableArea").show();
			$("#bssCardList").hide();
			reloadBssList();
		});
		//카드 형식 보기 
		$(".grid_img_size").on("click", function() {
			$("#bssTableArea").hide();
			$("#bssCardList").show();
			reloadList();
		});
		
		/* 카드 형식 검색 버튼 */
		$("#searchBtn").on("click", function(){
			reloadList();
		});
		
		$("#searchTxt").keypress(function(event) {
	    	if(event.keyCode == 13) {
	    		reloadList();
	    	}
	    });
	});
	
	/* -------------------------------기능 영역-------------------------------- */
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "bssMainAjax",
			dataType : "json",
			data : params,

			success : function(result) {
				redrawCardList(result.bssList);
				/* 카드 목록 클릭 */
				$(".card_view_title_stat").on("click", ".card", function() {
					if($(this).parents(".card_view_bottom").attr("id") == "b0") {
						$("#lead_no").val($(this).children(".card_area").attr("id"));
						var params = $("#actionForm").serialize();
						$.ajax({
							type : "post",
							url : "bssNoAjax",
							dataType : "json",
							data : params,

							success : function(result) {
								$("#actionForm").attr("action", "leadDetail");
								$("#actionForm").submit();
							},
							error : function(request, status, error) {
								console.log("text : " + request.responseText);
								console.log("error : " + error);
							}
						});
					} else {
						$("#chnNo").val($(this).children(".card_area").attr("id"));
						var params = $("#actionForm").serialize();
						$.ajax({
							type : "post",
							url : "bssNoAjax",
							dataType : "json",
							data : params,

							success : function(result) {
								location.href = "bssDet";
							},
							error : function(request, status, error) {
								console.log("text : " + request.responseText);
								console.log("error : " + error);
							}
						});
					}
				});
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawCardList(bssList){
		var html = "";
		
		html += "<div class=\"vertical_line\"></div>";
		html += "<div class=\"card_view_title_stat\">";
		html += "	<div class=\"card_view_stat\">리드</div>";
		html += "   <div class=\"card_view_bottom\" id=\"b0\"></div>";
		html += "</div>";
		html += "<div class=\"vertical_line\"></div>";
		html += "<div class=\"card_view_title_stat\">";
		html += "	<div class=\"card_view_stat\">영업기회</div>";
		html += "   <div class=\"card_view_bottom\" id=\"b1\"></div>";
		html += "</div>";
		html += "<div class=\"vertical_line\"></div>";
		html += "<div class=\"card_view_title_stat\">";
		html += "	<div class=\"card_view_stat\">영업제안</div>";
		html += "   <div class=\"card_view_bottom\" id=\"b2\"></div>";
		html += "</div>";
		html += "<div class=\"vertical_line\"></div>";
		html += "<div class=\"card_view_title_stat\">";
		html += "	<div class=\"card_view_stat\">영업협상</div>";
		html += "   <div class=\"card_view_bottom\" id=\"b3\"></div>";
		html += "</div>";
		html += "<div class=\"vertical_line\"></div>";
		html += "<div class=\"card_view_title_stat\">";
		html += "	<div class=\"card_view_stat\">영업계약</div>";
		html += "   <div class=\"card_view_bottom\" id=\"b4\"></div>";
		html += "</div>";
		html += "<div class=\"vertical_line\"></div>";
		
		$("#cardViewArea").html(html);
		
		$(".card_view_bottom").slimScroll({
			height: "100%",
			width : "100%"
		});
		
		for(var i in bssList){
			
			html = "";
			html += "<div class=\"card\">";
			html += "<div class=\"card_area\" id=" + bssList[i].CHN_NO + ">";
			html += "	<div class=\"card_name_title\">";
			html += "		<div class=\"card_name\">" + bssList[i].CHN_NAME + "</div>";
			html += "	</div>";
			html += "	<div class=\"card_comp\">" + bssList[i].COMP_NAME + "</div>";
			html += "	<div class=\"card_emp\">" + bssList[i].EMP_NAME + "</div>";
			html += "</div>";
			html += "</div>";
			
			$("#b" + bssList[i].PROG_NO).append(html);
		}
		reloadLeadList();
	}
	
	function reloadLeadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "bssLeadAjax",
			dataType : "json",
			data : params,

			success : function(result) {
				redrawLeadCardList(result.leadList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawLeadCardList(leadList){
		var html = "";
		
		for(var i in leadList){
			
			html = "";
			html += "<div class=\"card\">";
			html += "<div class=\"card_area\" id=" + leadList[i].LEAD_NO + ">";
			html += "	<div class=\"card_name_title\">";
			html += "		<div class=\"card_name\">" + leadList[i].LEAD_NAME + "</div>";
			html += "	</div>";
			html += "	<div class=\"card_comp\">" + leadList[i].COMP_NAME + "</div>";
			html += "	<div class=\"card_emp\">" + leadList[i].EMP_NAME + "</div>";
			html += "</div>";
			html += "</div>";
			
			$("#b0").append(html);
		}
	}
	
	/* 영업 표 목록 불러오기 */
	function reloadBssList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "bssListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				if(result.bssList != null) {	
					redrawBssList(result.bssList);
				}
				redrawBssPaging(result.pb);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}

	/* 영업 표 목록 나타내기 */
	function redrawBssList(bssList) {
		var html = "";
		if (bssList.length > 0) {
			for ( var i in bssList) {
				html += "<tr class=\"table_list_td\" name=" + bssList[i].CHN_NO + ">"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_NO + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_NAME + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].COMP_NAME + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CLIENT_NAME + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_DATE + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CTRACT_DATE + " ></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].EXPECT_SALES + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].PROG_NAME + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].DEPART_NAME + " /></td>"
				html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].EMP_NAME + " /></td>"
				html += "</tr>"
				}
		} else {
				html += "<tr class=\"list_contents\" style=\"height: 500px;\">";
				html += "<td colspan=\"10\">조회된 데이터가 없습니다.</td>";
				html += "</tr>";
			}
		$("tbody").html(html);
	}

	/* 영업 표 목록 페이징 */
	function redrawBssPaging(pb) {
		var html = "";
		//처음
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"1\" value=\"<<\"/>"

		//이전
		if ($("#page").val() == "1") {
			html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"1\" value=\"<\" />";
		} else {
			html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\""
						+ ($("#page").val() * 1 - 1) + "\" value=\"<\" />";
		}

		//숫자
		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#page").val() == i) {
				html += "<input type=\"button\" class=\"bottom_btn_2\" id=\"pagingBtn\" value="+ i
						+" style=\"text-weight: bold\" />";
			} else {
				html += "<input type=\"button\" class=\"bottom_btn_2\" id=\"pagingBtn\" name=\"" + i + "\" value=" + i
				+ ">";
			}
		}

		//다음
		if ($("#page").val() == pb.maxPcount) {
			html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + pb.maxPcount + "\" value=\">\" />";
		} else {
			html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + ($("#page").val() * 1 + 1)
					+ "\" value=\">\" />";
		}

		//마지막
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + pb.maxPcount + "\" value=\">>\"/>"

		$("#bssTablePaging").html(html);
	}
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">20</c:param>
	</c:import>
	<div class="title_area">영업</div>
	<div class="content_area">
		<div class="content_top" style="text-align: right">
					<!-- 상단 테이블이미지, 간판이미지 -->
					<div class="view_area">
						<img class="table_img_size" src="resources/images/Lead/table.png" />
						<img class="grid_img_size" src="resources/images/Lead/grid.png" />
					</div>
		</div>
		<form action="#" id="actionForm" method="post">
		<input type="hidden" name="page" id="page" value="1"/>
		<input type="hidden" id="chnNo" name="chnNo" value=""/>
		<input type="hidden" id="lead_no" name="lead_no" value=""/>
		<input type="hidden" id="empNo" name="empNo" value="${sEmpNo}"/>
		<!-- 카드영역시작 -->
		<div class="list_wrap" id="bssCardList">
				<!-- 검색영역 -->
				<div class="table_top_area" style="margin: 0px">
					<div class="top_title_area" style="height: 40px"></div>
					<div class="top_btn_area" style="height: 40px">
							<select name="searchGbn2" class="input_short">
								<!-- 검색드랍다운리스트 -->
								<option class="content_srch_DD1"></option>
								<option selected="selected" value="0">선택없음</option>
								<option value="1">기회명</option>
								<option value="2">기업명</option>
								<option value="3">담당자</option>
							</select>
							<input type="text" id="searchTxt" name="searchTxt" class="input_short" style="margin-left: 10px; width: 200px;"/>
							<div id="searchBtn" class="btn_black btn_size_normal">검색</div>
					</div>
				</div>
			<div id="card_area">
				<div class="div_line_yellow"></div>
				<div class="card_view_area" id="cardViewArea">
				<!-- 카드 목록 영역 -->
				</div>
			</div>
		</div>
			<!-- 카드영역끝 -->

			<!----------- 표 영역 시작 ---------->
			<div class="list_wrap" id="bssTableArea">
					<div class="table_top_area" style="margin: 0px">
						<div class="top_title_area">
							<!-- <input type="text" class="input_normal" value="#개 항목중 #개 선택  "
							style="margin-left: 10px; text-align: left; font-weight: bold; color: #595959;"
								readonly="readonly" /> -->
						</div>
						<div class="top_btn_area">
							<input type="date" class="input_short" id="startDate" name="startDate" placeholder="From" style="width: 150px;">
							<span style="font-size: 10pt; vertical-align: middle">~</span>
							<input type="date" class="input_short" id="endDate" name="endDate" placeholder="To" style="width: 150px;">
							<select class="input_short" id="searchGbn" name="searchGbn" style="margin-left: 10px;">
								<option value="0">전체</option>
								<option value="1">진행중</option>
								<option value="2">보류</option>
								<option value="3">실패</option>
								<option value="4">완료</option>
							</select>
							<input type="text" class="input_short" id="searchTableTxt" name="searchTableTxt" placeholder="영업기회명" style="margin-left: 10px; width: 200px;"/>
							<div class="btn_black btn_size_normal" id="searchTableBtn">검색</div>
						</div>
					</div>
					<table class="table_normal" id="bssTable" style="border-top: 0px;">
						<colgroup>
							<!-- <col width="30px" /> -->
							<col width="50px" />
							<col width="200px" />
							<col width="180px" />
							<col width="120px" />
							<col width="100px" />
							<col width="100px" />
							<col width="130px" />
							<col width="100px" />
							<col width="110px" />
							<col width="110px" />
						</colgroup>
						<thead>
							<tr class="table_list_header">
								<th>no</th>
								<th>영업기회명</th>
								<th>고객사</th>
								<th>고객</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>예상매출</th>
								<th>상태</th>
								<th>부서</th>
								<th>담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr class="list_contents" style="height: 500px;">
							<td colspan="10" style="font-size: 10pt;">조회된 데이터가 없습니다.</td>
							</tr>
						</tbody>
					</table>
						<div class="list_paging_area" style="text-align: left;">
							<span class="content_bottom_1_span" id="bssTablePaging">
								<input type="button" class="bottom_btn_1" value="＜＜" />
								<input type="button" class="bottom_btn_1" value="＜" />
								<input type="button" class="bottom_btn_2" value="1" />
								<input type="button" class="bottom_btn_1" value="＞" />
								<input type="button" class="bottom_btn_1" value="＞＞" />
							</span>
						</div>
					<div class="content_bottom">
					</div>
				</div>
			<!----------- 표 영역 끝 ---------->
			</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>