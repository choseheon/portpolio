<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리드</title>
<style type="text/css">
table {
	width: 1200px;
	text-align: center;
	border-collapse: collapse;
	font-size: 10pt;
}

.lead_card_view_top{
	height: 100px;	
	width: 1200px;
}

.srch_table_view{
	display: inline-block;
	width: 30px;
	height: 30px;	
	vertical-align: top;
}

.srch_table_view > img {
	width: 100%;
	height: 100%;	
}

.srch_card_view {
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: top;
}

.srch_card_view > img{
	width: 100%;
	height: 100%;
}
/* 리드 카드보기 가운데부분  */
.card_view_area{
	width: 1200px;
	height: 580px;	
	text-align: center;
	margin: 10px 0;
}

/* Unqualified, New, Working, Nurturing, Conversion 단계별 */

.card_view_title_stat{
	display: inline-block;
	width: calc(20% - 15px);
	height: 100%;	
	vertical-align: top;
	text-align: center;
}

/*  */
.card_view_stat{
	display: inline-block;
	width: 180px;
	height: 40px;
	border-radius: 3px;
    background-color: #F2CB07;
    border: 0px solid #c5960a;
    color: #272727;	
    font-size: 10pt;
    font-weight: bold;
    line-height: 40px;
    vertical-align: middle;
}

/* 카드 내부 */
.card_area{
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

.card_area:hover{
	box-shadow : 1px 1px 8px #c8c8c8;
	cursor : pointer;
}

/* 카드 내부 리드 이름 */
.card_name{
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
.card_btn{
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

.card_btn:hover{
	background-color: #F2CB07;
	cursor: pointer;
}


/* 회사명, 전화번호 */
.card_con{
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
.div_line_yellow{
	display: inline-block;
	width: 1200px;
	height: 2px;
	background-color: #F2CB07;
	border: 0px solid #000000;
	margin-bottom: 2px;		
}

.btn_menu {
	display: inline-block;
	width: 70px;
	height: 70px;
	border-radius: 3px; 
	border: 1px solid #d0d0d0;
	position : absolute;
	background-color: white;
	line-height: 72px;
	padding: 5px 0;
}

.btn_menu_nm{
	height: 30px;
	color: #F2CB07;
	font-size : 9pt;
	line-height: 30px;
	text-align: left;
	text-indent: 10px;
	font-weight: bold;
	position : relative;
	background-color: white;
}

.btn_menu > .btn_menu_nm:hover{
	cursor: pointer;
	background-color: #f5f5f5;
}

.card_view_bottom {
	height: 100%;
	overflow-y : auto;
}

.card_view_bottom::-webkit-scrollbar{
	display: none;
}
</style>
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	
	$(".table_img_size").on("click", function(){
		$("#Lead_list_area").show();
		//간판보기
		$("#lead_card_area").hide();
		$(".cntPick").show();
	});
	
	$(".grid_img_size").on("click", function(){
		reloadCard();
		$("#Lead_list_area").hide();
		//카드 형식 보기 
		$("#lead_card_area").show();
		$(".cntPick").hide();
	});
	
	
	$("#lead_reg_Btn").on("click", function(){
		location.href = "leadReg";
	});
	
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		reloadList();
	});
	
	
	$("#searchGbn1").on("change", function() {
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			return false;
		}
	});
	
	$(".list_paging_area").on("click", "div", function(){
		if(($(this).attr("name") != "")){
			$("#page").val($(this).attr("name"));
			reloadList();
		}
	});
	
	
	$("#tbody1").on("dblclick", ".list_contents", function(){
		$("#lead_no").val($(this).attr("name"));
		$("#tableForm").attr("action", "leadDetail");
		$("#tableForm").submit();
	});
	
	$("#chk_all").click(function(){
		if($("#chk_all").is(":checked")) {
			$(".list_chbox").prop("checked", true);
		}
		else {
			$(".list_chbox").prop("checked", false);
		}
	});
	
	// 체크개수 카운팅 
	$(".table_list").on("click", ".list_chbox", function() {	
		$("#chkcnt_all").html($(".table_list tbody .list_chbox").length);
		$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
	});
	
	// 삭제 버튼 클릭
	$("#lead_del_Btn").on("click", function() {
		if($("#chkcnt").html() == "0") {
			makeAlert(1, "삭제 오류", "데이터가 선택되지 않았습니다.", null);
		}
		else {
			makeTwoBtnPopup(1, "삭제 경고", "선택된 항목을 삭제 하시겠습니까?", false, 400, 200, null, "확인", function() {
				closePopup(1);
				$("input[name='lead_chkbox']").each(function() {
					var del = $(this).attr("id").substring($(this).attr("id").indexOf("_") + 1);
					if($(this).is(":checked")) {
						var params = "&lead_no=" + del;
						
						$.ajax({
							type: "post",
							url: "leadDelAjax",
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
				reloadList();
			}, "취소", function() {
				closePopup(1);
			});
		}
	});
});
function reloadList() {
	var params = $("#srchForm").serialize() + "&" + $("#tableForm").serialize();
	$.ajax({
		type : "post",
		url : "leadListAjax",
		dataType : "json",
		data : params,

		success : function(result) {
			redrawList(result.list);
			drawListPaging(result.pb);
			leadCardList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function reloadCard(){
	var params = $("#srchForm").serialize() + "&" + $("#tableForm").serialize();
	$.ajax({
		type : "post",
		url : "leadCardAjax",
		dataType : "json",
		data : params,

		success : function(result) {
			leadCardList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function redrawList(list) {
	var html = "";
	if (list.length == 0) {
		html += "<tr  style=\"height: 500px; font-size : 10pt;\">";
		html += "<td colspan=\"9\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		$(".list_paging_area").html("");
		$("#chkcnt").html(0);
		$("#chkcnt_all").html(0);
	} else {
		for ( var i in list) {
			html += "<tr class = \"list_contents\" name=\"" + list[i].L_NO + "\">";
			html += "<td><input type=\"checkbox\" class=\"list_chbox\" id=\"chk_" + list[i].L_NO + "\" name=\"lead_chkbox\"/>";
            html += "<label for=\"chk_" + list[i].L_NO + "\" class=\"chbox_lbl\"></label></td>";
			html += "<td>" + list[i].L_NO + "</td>";
			html += "<td>" + list[i].L_NM + "</td>";
			html += "<td>" + list[i].C1_NM + "</td>";
			html += "<td>" + list[i].C2_NM + "</td>";
			html += "<td>" + list[i].PH + "</td>";
			html += "<td>" + list[i].LS_NM + "</td>";
			html += "<td>" + list[i].E_NM + "</td>";
			html += "<td>" + list[i].L_DT + "</td>";
			html += "</tr>";
		}
		var cnt_leng = list.length;
		$("#chkcnt").html(0);
		$("#chkcnt_all").html(cnt_leng);
	}
	$("#tbody1").html(html);
	
	$(".list_chbox").on("click", function() {
		var cnt = 0;
		$(".list_chbox").each(function() {
			if(!$(this).is(":checked") && $(this).attr("id") != "chk_all") {
				cnt ++;
			}
		});
		
		var stat = (cnt > 0) ? false : true;
		$("#chk_all").prop("checked", stat);
		
	});
	$(".list_chbox").on("click", function() {
		var select = $(this).attr("id");
		$("#lead_no").val(select.substring(select.indexOf("_") + 1));
	});
	
	$("#client_all").html($(".table_list tbody .list_chbox").length);
	$("#client_cnt").html($(".table_list tbody .list_chbox:checked").length);
}


function deleteList(){
	var params = $("#tableForm").serialize();
	$.ajax({
		type : "post",
		url : "leadDelAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			if (result.res == "SUCCESS") {	
				reloadCard();
			} else {
				alert("안됩니다");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
			
		}
	});
}

function leadCardList(list){
	var html = "";
	
	html += "<div class=\"vertical_line\"></div>";
	html += "<div class=\"card_view_title_stat\">"; //Unqualified
	html += "	<div class=\"card_view_stat\">Unqualified</div>";
	html += "   <div class=\"card_view_bottom\" id=\"Unqualified\"></div>";
	html += "</div>";
	html += "<div class=\"vertical_line\"></div>";
	html += "<div class=\"card_view_title_stat\" >"; //New
	html += "	<div class=\"card_view_stat\">New</div>";
	html += "   <div class=\"card_view_bottom\" id=\"New\"></div>";
	html += "</div>";
	html += "<div class=\"vertical_line\"></div>";
	html += "<div class=\"card_view_title_stat\" >"; //Working
	html += "	<div class=\"card_view_stat\">Working</div>";
	html += "   <div class=\"card_view_bottom\" id=\"Working\"></div>";
	html += "</div>";
	html += "<div class=\"vertical_line\"></div>";
	html += "<div class=\"card_view_title_stat\" >"; //Nurturing
	html += "	<div class=\"card_view_stat\">Nurturing</div>";
	html += "   <div class=\"card_view_bottom\" id=\"Nurturing\"></div>";
	html += "</div>";
	html += "<div class=\"vertical_line\"></div>";
	html += "<div class=\"card_view_title_stat\" >"; //Conversion
	html += "	<div class=\"card_view_stat\">Conversion</div>";
	html += "   <div class=\"card_view_bottom\" id=\"Conversion\"></div>";
	html += "</div>";
	html += "<div class=\"vertical_line\"></div>";

	$(".card_view_area").html(html);
	
// 	$(".card_view_bottom").slimScroll({
// 		height: "100%",
// 		width : "100%"
// 	});
	
	for(var i in list){
		
		html = "";
		
		html += "<div class=\"card_area\" id=\"" + list[i].L_NO + "\">";
		html += "	<div class=\"card_title\" id=\"" + list[i].E_NO + "\">";
		html += "		<div class=\"card_name\">" + list[i].L_NM + "</div>";
		html += "		<div class=\"card_btn\" id=\"btn_card\"></div>";
		html += "	</div>";
		html += "	<div class=\"card_con\">" + list[i].C1_NM + "</div>";
		html += "	<div class=\"card_con\">" + list[i].C2_NM + "</div>";
		html += "	<div class=\"card_con\">" + list[i].PH + "</div>";
		html += "</div>"
		
		$("#" + list[i].LS_NM ).append(html);
	}
	
	
	// 드래그앤 드랍 함수
	$(".card_view_bottom").sortable({      // start : 드래그 했을 때 함수                         // diactivate : 드래그 끝났을 때 발생 함수 
		connectWith: ".card_view_bottom",  // stop : 드랍했을 때 함수
		items: '.card_area',			   // change : 영역이 옮겨 질때 마다 발생하는 함수
		//드래그 처음 시작 함수
		start : function(event, ui){
			$("#lNo").val(ui.item.attr("id"));
		},
		//드랍 함수
		stop : function(event, ui){
			$("#lsNo").val($(ui.item).parent("div").attr("id"));
			if($(ui.item).parent("div").attr("id") == "Conversion"){
				makeTwoBtnPopup(1, "컨버젼 경고", "정말로 기회로 전환시키겠습니까?", false, 400, 200, null, "확인", function() {
					closePopup(1);
					$("#lead_no").val(ui.item.attr("id"));
					var params = $("#tableForm").serialize() + "&lead_nm=" + $(ui.item).children(".card_title").children(".card_name").html()
								+ "&empNo=" + $(ui.item).children(".card_title").attr("id");
					$.ajax({
						type: "post",
						url: "insertChnAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							if (result.res == "SUCCESS") {
								editLs();
								makeOneBtnPopup(2, "컨버젼 성공", "기회로 전환되었습니다.", false, 400, 200, null, "확인", function() {
									closePopup(2);
									location.href = "bssMain";
								});
							} else {
								makeOneBtnPopup(3, "컨버젼 실패", "이미 기회로 전환된 리드입니다.", false, 400, 200, null, "확인", function() {
									closePopup(3);
									reloadCard();
								});
							}
						},
						error : function(request, status, error) {
							console.log("status : " + request.status);
							console.log("text : " + request.responseTest);
							console.log("error : " + error);
						}
					});
				}, "취소", function() {
					closePopup(1);
					reloadCard();
				});
			} else {
				editLs();
			}
		},
	});
	
	$(".card_area").on("click",function(e){
		if($(e.target).is(".card_btn")){ 
			//버튼 클릭
			var html = "";
			
			html += "<div class=\"btn_menu\">";
			html += "	<div class=\"btn_menu_nm\" id=\"btn_modify\">수정</div>";
			html += "	<div class=\"btn_menu_nm\" id=\"btn_delete\">삭제</div>";
			html += "</div>";
			
			$(e.target).html(html);
			$("#btn_delete").on("click",function(a){
				a.stopPropagation();  // event.stopPropagation() 이벤트 버블링 방지
				makeTwoBtnPopup(1, "리드 삭제 경고", "정말로 리드를 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
					closePopup(1);
					$("#lead_no").val($(e.target).parent().parent().attr("id"));
					deleteList();
				}, "취소", function() {
					closePopup(1);
				});
			});
			$("#btn_modify").on("click",function(b){
				//수정 이벤트
				b.stopPropagation();
				$("#lead_no").val($(e.target).parent().parent().attr("id"));
				$("#tableForm").attr("action", "leadupdate");
				$("#tableForm").submit();
			});
		} 
		else {
			//카드 클릭
			$("#lead_no").val($(this).attr("id"));
			$("#tableForm").attr("action","leadDetail");
			$("#tableForm").submit();
		}
	});
	$(document).on("click",function(e){
		if(!$(e.target).is(".card_btn")){
			$(".btn_menu").fadeOut("fast");
		}
	});
}
//리스트 Paging draw
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
function editLs() {
	var params = $("#srchForm").serialize() + "&" + $("#editForm").serialize();
	$.ajax({
		type : "post",
		url : "editAjax",
		dataType : "json",
		data : params,
		success : function(result) {
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">5</c:param>
	</c:import>
	<div class="title_area">리드</div>
	<div class="content_area">
		<div class="list_wrap">
	<!-- 검색영역 -->
	<form action="#" id = "srchForm" method = "post">
			<div class="content_top">
			<!-- 목록드랍리스트 -->
				<div class="drop_area">
					<div class="drop_list">
						<select name = "searchGbn1" id = "searchGbn1" class="drop_list">
							<option selected="selected" value = "0">모든 진행중인 리드</option>
							<option value = "1">오늘의 리드</option>
							<option value = "2">최근 조회 항목</option>
						</select>
					</div>
				</div>
				<!-- 상단 등록, 삭제 -->
				<div class="content_btn">
					<div id = "lead_del_Btn" class="btn btn_yellow btn_size_normal" style="color: #272727;">삭제</div>
					<div id = "lead_reg_Btn" class="btn btn_yellow btn_size_normal" style="color: #272727;">등록</div>
				</div>
				<!-- 상단 테이블이미지, 간판이미지 -->
				<div class="view_area">
					<img class="table_img_size" src= "resources/images/Lead/table.png"/> 
					<img class="grid_img_size" src="resources/images/Lead/grid.png" />
				</div>
			</div>
	
			<!-- 검색영역 -->
			<div class="content_srch">
				<div class="content_srch_btn">
					<div id = "searchBtn">검색</div>
					<input type="text" name = "searchTxt" id="searchTxt" class="content_srch_txt" /> 
					<select name = "searchGbn2" class="content_srch_DD">
						<!-- 검색드랍다운리스트 -->
						<option class="content_srch_DD1"></option>
						<option value = "0">고객명</option>
						<option value = "1">기업명</option>
						<option value = "2">담당자</option>
						<option value = "3">리드 상태</option>
						<option selected="selected" value = "4">전체</option>
						<option value = "5">리드명</option>
					</select> 
					<span class="cntPick">
						<span id="chkcnt_all"></span>개 항목중 <span id="chkcnt">0</span>개 선택
					</span> 
				</div>
			</div>
	</form>
		
			<!-- 테이블영역 -->
			<form action="#" id = "tableForm" method = "post">
			<input type = "hidden" id = "page" name = "page" value = "1"/>
			<input type = "hidden" id = "lead_no" name = "lead_no"/>
		<div id = "Lead_list_area">
			<table class="table_list">
			<!-- 테이블 행마다 너비 -->
			<colgroup>
				<col width="4%"/>
				<col width="5%"/>
				<col width="10%"/>
				<col width="11%"/>
				<col width="16%"/>
				<col width="16%"/>
				<col width="16%"/>
				<col width="10%"/>
				<col width="12%"/>	
			</colgroup>
				<!-- 1행 -->
				<thead>
				<tr class="sample_1">
					<td class="check"><input type="checkbox" class="list_chbox" id="chk_all"/>
	                        	<label for="chk_all" class="chbox_lbl"></label></td>
					<td class="sample_title1">no</td>
					<td class="sample_title2">리드명</td>
					<td class="sample_title3">고객명</td>
					<td class="sample_title4">기업명</td>
					<td class="sample_title5">연락처</td>
					<td class="sample_title6">리드상태</td>
					<td class="sample_title7">담당자</td>
					<td class="sample_title8">작성일자</td>
				</tr>
				</thead>
				<tbody id = "tbody1">
				<!-- 2행 -->
				<!-- <tr class="sample_2">
					<td><input type="checkbox" /></td>
					<td><input class="sample1_txt" type="text" readonly="readonly" value = "1"/></td>
					<td><input class="sample1_txt" type="text" readonly="readonly" value = "김태호"/></td>
					<td><input class="sample2_txt" type="text" readonly="readonly" value = "구디아카데미"/></td>
					<td><input class="sample3_txt" type="text" readonly="readonly" value = "010-0000-0000"/></td>
					<td><input class="sample4_txt" type="text" readonly="readonly" value = "kth5865@naver.com"/></td>
					<td><input class="sample5_txt" type="text" readonly="readonly" value = "New"/></td>
					<td><input class="sample6_txt" type="text" readonly="readonly" value = "김태호"/></td>
					<td><input class="sample7_txt" type="text" readonly="readonly" value = "2019-11-07"/></td>
				</tr>
				 -->
				 </tbody>
			</table>
				<div class="list_paging_area"></div>
			</div>
		</form>
			<div id="lead_card_area" style="display: none;">
				<form action="#" id="editForm" method="post">
					<input type="hidden" id="lsNo" name="lsNm"/>
					<input type="hidden" id="lNo" name="lNo"/>
					<div class="div_line_yellow"></div>
					<div class="card_view_area"> <!-- card_view_area 시작 -->											 
	<!-- 					<div class="card_area"> -->
	<!-- 						<div class="card_title"> -->
	<!-- 							<div class="card_name">리드 이름</div> -->
	<!-- 							<div class="card_btn"></div> -->
	<!-- 						</div> -->
	<!-- 						<div class="card_con">회사명</div> -->
	<!-- 						<div class="card_con">전화번호</div> -->
	<!-- 						<div class="card_con">전화번호</div> -->
	<!-- 					</div> -->
					</div> <!-- card_view_area 끝 -->
				</form>
			</div>	
      	</div>
      </div>
	<c:import url="/bottom"></c:import>
</body>
</html>