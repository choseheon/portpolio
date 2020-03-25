<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리드</title>
<c:import url="/header"></c:import>
<style type="text/css">
.lead_all {
	width: 1080px;
	height: auto;
}

/* 기본양식 css */
.content_table {
	width: 1080px;
	border: 0px;
	vertical-align: top;
}

/*버튼영역*/
.content_btn {
	width: 1080px;
	height: 50px;
}
/*버튼을 div로 만들었습니다.
  버튼 속성입니다.
  버튼은 float:right을 썼기때문에 반대로 적어주세요.
*/
.content_btn>div {
	display: table;
	width: 80px;
	height: 25px;
	font-size: 10pt;
	color: #595959;
	text-align: center;
	border-radius: 5px;
	float: right;
	background-color: #F2B807;
	padding-top: 5px;
	margin-top: 10px;
	margin-left: 10px;
}
/*버튼의 hover입니다.*/
.content_btn>div:hover {
	background-color: #F2CB07;
	cursor: pointer;
}

.btn {
	margin-right: 10px;
}
/*테이블 속성입니다.*/
table {
	width: 1080px;
	border-collapse: collapse;
	padding: 0px;
	margin: 0px;
	border-spacing: 0px;
	border-top: 2px solid #F2CB07;
}

tr {
	border-bottom: 1px solid #CCC;
}
/*주제열입니다.
*/
th {
	background-color: #EEEEEE;
	border-right: 1px solid #CCC;
	height: 45px;
	padding: 0px;
	font-size: 10pt;
}
/*내용열입니다.*/
td {
	padding: 10px 15px;
	font-size: 10pt;
}
/*내용열에 들어가는 텍스트 박스의 속성입니다.
  기본적으로 내용열에 텍스트박스만 있을때 쓰는 속성입니다.
*/
.table_txt {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/*내용열에 텍스트박스와 버튼이 같이 들어갈 경우 사용하는 속성입니다.*/
.table_txt1 {
	display: inline-block;
	vertical-align: top;
	/*버튼과 같이해서 width를 조절해주세요.*/
	width: 80%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}
/*여러열이 변동이 되면  txt1, txt2같이 표시해주세요.*/
.table_txt2 {
	display: inline-block;
	vertical-align: top;
	width: 100%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}

.table_txt3 {
	display: inline-block;
	vertical-align: top;
	width: 50%;
	height: 35px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}

.table_txt4 {
	display: inline-block;
	vertical-align: top;
	width: 100%;
	height: 105px;
	background: #fff;
	border: 1px solid #eee;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
	outline: none;
}

.tr_address {
	height: auto;
}

.input_size_normal {
	width: 100%;
	height: 30px;
}

.input_style_normal {
	font-size: 10pt;
	text-indent: 5px;
	border: 1px solid #cacaca;
	padding: 0px;
}

.tr_address>td>input {
	margin-bottom: 10px;
}

.is_read_only {
	background-color: white;
	border: 0px solid #000000;
}

/*내용열에 들어가는 버튼의 속성입니다.*/
.bottom_btn_2 {
	display: inline-block;
	width: 60px;
	height: 35px;
	margin-left: 2px;
	border: 0px;
	background-color: #595959;
	color: #F2F2F2;
	float: center;
	border-radius: 5px;
}

.bottom_btn_2:hover {
	background-color: #F2CB07;
	color: #595959;
	cursor: pointer;
}
/* 기본양식 끝 */
.lead_detail_view {
	height: auto;
	user-select: none;
}

.lead_detail_view_table {
	font-size: 10px;
	width: 100%;
}

.lead_detail_view_table tr {
	height: 32px;
}

.td_head {
	font-weight: bold;
	font-size: 13px;
	border: 0px solid #000000;
	border-radius: 3px;
	background-color: gray;
	text-align: center;
	color: white;
	width: 170px;
}

.td_body {
	width: calc(100% - 174px);
	padding-left: 20px;
}

.lead_detail_btn {
	text-align: right;
	margin: 10px 0;
	height: 30px;
}

.lead_stat {
	height: 90px;
	padding-left: 30px;
}

.lead_btn {
	height: 90px;
	text-align: center;
	padding: 30px 0;
}

.lead_btn>div {
	display: inline-block;
	background-color: #f9ea9f;
	border: 0px solid #000000;
	border-radius: 3px;
	color: #595959;
	width: 150px;
	height: 30px;
	vertical-align: middle;
	margin: 0 20px;
	font-size: 10pt;
	line-height: 30px;
	font-weight: bold;
}

.lead_btn>div:hover {
	background-color: #F2CB07;
	cursor: pointer
}

.lead_btn>.lead_btn_on {
	background-color: #F2CB07;
}

.lead_save {
	height: 30px;
	text-align: right;
}

.lead_detail_view_title {
	font-weight: bold;
	font-size: 17px;
	margin-bottom : 10px;
}

.lead_cldr {
	display: inline-block;
	width: 50%;
	height: 100%;
	vertical-align: bottom;
}

.lead_intend_cldr {
	height: auto;
}

.cldr_title {
	height: 30px;
}

.cldr_content {
	height: auto;
	padding-left: 20px;
}

.cldr_content div {
	height: 23px;
}

.cldr_date {
	display: inline-block;
	width: 150px;
}

.cldr_time {
	display: inline-block;
	width: 200px;
}

.cldr_name {
	display: inline-block;
	width: calc(100% - 520px);
}

.cldr_btn {
	display: inline-block;
	width: 50px;
}

.cldr_btn input {
	background-color: #F2CB07;
	width: 20px;
	height: 20px;
	border-radius: 3px;
	border: 0px solid #000000;
}

/* 의견 파트 */
.lead_opinion{
	height: auto;
}
.opin_contents {
	margin-bottom: 5px;
}

.opin_add_data {
	color: #a0a0a0;
}
/* 의견 파트 끝*/

.lead_contact {
	height: auto;
}

.lead_contact_box {
	padding: 5px 50px;
}

.lead_contact_box_1, .lead_contact_box_2 {
	height: 30px;
}

.lead_contact_box_img {
	display: inline-block;
	width: 50px;
	height: 100%;
}

.lead_contact_box_img img {
	width: 40px;
	height: 100%;
}

.lead_contact_client_name, .lead_contact_client_contact {
	display: inline-block;
	width: 300px;
	height: 100%;
	vertical-align: top;
}

.lead_contact_box_2 {
	padding-left: 56px;
}

.lead_contact_company_name, .lead_contact_company_contact {
	display: inline-block;
	width: 300px;
	height: 100%;
	vertical-align: top;
}

.div_line {
	height: 20px;
}

.div_line_color {
	height: 2px;
	background-color: #F2CB07;
	border: 0px solid #000000;
	border-radius: 10px;
}

.div_line_color_line {
	height: 2px;
	background-color: #EAEAEA;
	border: 0px solid #000000;
	border-radius: 10px;
}

.yellow_btn {
	display: inline-block;
	background-color: #F2B807;
	border-radius: 3px;
	color: #272727;
	width: 80px;
	height: 30px;
	vertical-align: top;
	font-size: 10pt;
	text-align: center;
	font-weight: bold;
	line-height: 30px;
	padding: 0;
	outline: none;
	border: 0;
}

.yellow_btn:hover {
	background-color: #F2B807;
	cursor: pointer;
}

.black_btn {
	display: inline-block;
	background-color: #595959;
	border-radius: 3px;
	color: white;
	width: 80px;
	height: 30px;
	vertical-align: top;
	font-size: 10pt;
	text-align: center;
	line-height: 30px;
	padding: 0;
	outline: none;
	border: 0;
}

.black_btn:hover {
	background-color: #555555;
	cursor: pointer;
}

.b_text {
	font-weight: bold;
	font-size: 15pt;
}

.text {
	font-size: 10pt;
}
/* 일정확인 공간 */
.lead_cldr{
	margin-bottom: 10px;
}
/* 버튼이 있는 공간 - 텍스트와 함께 있어서 width가 다름 */
.btn_area {
	display: inline-block;
	width: calc(50% - 10px);
	height: 50px;
	line-height: 50px;
	text-align: right;
	vertical-align: top;
}
/* 일정확인 select 박스 */
.input_short {
    width: 100px;
    height: 30px;
    border: 1px solid #eeeeee;
    border-radius: 3px;

    font-size: 10pt;
    text-indent: 5px;

    vertical-align: middle;
}
/* 활동 일정 파트 */
/* 활동 row - tr */
.activity_row {
    height: 139px;
    border-bottom: 0;
}
/* 활동 일정 왼쪽 cell */
.activity_left {
    text-align: center;
    vertical-align: middle;

    border-right: 1px solid #cacaca;
}
/* 활동 일정 오른쪽 cell */
.activity_right {
    height: 139px;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 25px;
}
.activity_result {
    height: 139px;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}
/* 활동 구분 아이콘 영역 */
.activity_cg_icon {
    display: inline-block;
    width: 35px;
    height: 35px;

    border-radius: 3px;
    background-color: #f2b807;

    text-align: center;
    vertical-align: middle;

    position: relative;
    top: -30px;
    left: 43px;
}
/* 활동 구분 아이콘 이미지 */
.activity_cg_icon>img {
    margin-top: 7px;
}
/* 활동 일정 말풍선 배경 */
.activity_bg {
    position: relative;
    border: 1px solid #cacaca;
    background: #ffffff;
    margin-left: 10px;

    height: 100%;
    font-size: 0;

    padding: 10px 15px;
    cursor:pointer;
}
.activity_bg:before {
    content: '';
    position: absolute;
    left: 0;
    top: 25%;
    width: 0;
    height: 0;
    border-left: 11px solid transparent;
    border-right: 11px solid #cacaca;
    border-top: 11px solid transparent;
    border-bottom: 11px solid transparent;
    margin-top: -11px;
    margin-left: -22px;
}
.activity_bg:after {
    content: '';
    position: absolute;
    left: 0;
    top: 25%;
    width: 0;
    height: 0;
    border-left: 11px solid transparent;
    border-right: 11px solid #ffffff;
    border-top: 11px solid transparent;
    border-bottom: 11px solid transparent;
    margin-top: -11px;
    margin-left: -21px;
}
/* 활동 분류 */
.activity_cg {
    display: inline-block;
    width: 50%;
    
    font-size: 12pt;
    font-weight: 700;
    text-indent: 10px;
    
    text-align:left;
}
/* 활동 등록시간 */
.activity_uploadtime {
    display: inline-block;
    width: 50%;
    
    font-size: 12pt;
    font-weight: 700;
    
    text-align:right;
}
/* 활동 내용 */
.activity_contents {
    margin-top: 8px;

    font-size: 10pt;
    font-weight: 300;
    text-indent: 30px;
    
    text-align: left;
}
/* 날짜 정렬 */
.activity_arrow {
    cursor: pointer;
}

/* 활동 일정 내용 오른쪽 영역 */
.activity_bg_right {
    border: 1px solid #cacaca;

    height: 100%;
    font-size: 0;

    padding: 10px 15px;
    cursor:pointer;
}

.contents_align_center{
	text-align: center;
}

/* Textarea 기본 스타일 - 가로 크기 고정 */
.textarea_normal {
    width: 100%;
    height: 100px;
    min-height: 100px;
    border: 1px solid #eeeeee;
    border-radius: 3px;
    resize: vertical;

    font-size: 10pt;
}
/* Textarea 크기고정 스타일 */
.textarea_noresize {
    width: 100%;
    height: 60px;
    min-height: 60px;
    border: 1px solid #eeeeee;
    border-radius: 3px;
    resize: none;

    font-size: 10pt;
}

.client_cnt, .opin_cnt{
	font-size: 10pt;
    color: #555555;
}
.att_img {
	background-image: url("resources/images/Lead/uploadimg.png");
	display: inline-block;
	vertical-align: middle;
	width: 40px;
	height: 40px;
	cursor: pointer;
	border : 0px;
}
/* 첨부파일 제목 */
.attach_title_txt {
	display: inline-block;
	padding: 5px;
	color: #272727;
	font-weight: bold;
	font-size: 15pt;
	line-height: 40px;
	vertical-align : middle;
}
.field_icon_contents {
	padding: 10px 15px;
	text-align: center;
	vertical-align: middle;
}
.trash_img {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 관련 고객 초기 뷰 개수 
	getOpinList();
	getClient(3);
	getSche();
	
	/* 첨부파일 리스트 */
	fileUpload();
	
	// 리드상태 진행도 나타내기 버튼 이벤트 
	$(".lead_btn").on("click","div", function(){
		$("#lead_nm").val($(this).attr("name"));
		$(".lead_btn").children("div").attr("class","");
		var length = $(".lead_btn").children("div").length;;
		var index = $(this).index();
		for(var i = 0 ; i < length; i++){
			if(i < index){
				$("#lead_stat" + i).attr("class", "lead_btn_on");
				$("#lead_stat" + i).html(">>");
			} else {
				$("#lead_stat" + i).html($("#lead_stat" + i).attr("name"));
			}
		}
		$("#lead_stat" + index).attr("class", "lead_btn_on");
	});
	
	// 초기 리드 상태 나타내기 
	$("[name = ${data.LEAD_STAT_NAME}]").click();
	
	$(".is_read_only").focus(function(){
		$(this).blur();
	});
	
	// 관련 고객 펼치기/접기
	$("#viewClientBtn").on("click", function() {
		var flag = $("#all_flag").val();
		if(flag == 0) {
			var params = "&lead_no=" + $("#lead_no").val();

			$.ajax({
				type: "post",
				url: "getClientListCntAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					getClient(result.cnt);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
			$("#all_flag").val(1);
			$("#viewClientBtn>img").css("transform", "scaleY(-1)");
		}
		else {
			getClient(3);
			$("#all_flag").val(0);
			$("#viewClientBtn>img").css("transform", "scaleY(1)");
		}
	});
	
	// 팀 소속 사원 tr 클릭 Event
	$("#client_table").on("click", "tr", function() {
		$("#client_no").val($(this).attr("name"));
		$("#clientForm").attr("action", "clientDetail"); // 고객 리스트로 이동
		$("#clientForm").submit();
	});
	
	// 삭제 버튼 클릭 이벤트
	$("#btn_lead_delete").on("click",function(){
		makeTwoBtnPopup(1, "리드 삭제 경고", "정말로 리드를 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
			closePopup(1);
			delLead();
		}, "취소", function() {
			closePopup(1);
		});
		
	});
	
	$("#btn_opin_write").on("click",function(){
		addOpin();
	})
	
	$("#btn_ls_save").on("click",function(){
		
		if($("#lead_stat4").attr("class") == "lead_btn_on") {
			
			makeTwoBtnPopup(1, "컨버젼 경고", "정말로 기회로 전환시키겠습니까?", false, 400, 200, null, "확인", function() {
					closePopup(1);
					$("#lead_nm").val($("#leadNm").val());
					var params = $("#actionForm").serialize();
	
					$.ajax({
						type: "post",
						url: "insertChnAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							if (result.res == "SUCCESS") {
								makeOneBtnPopup(2, "컨버젼 성공", "기회로 전환되었습니다.", false, 400, 200, null, "확인", function() {
									closePopup(2);
									location.href = "bssMain";
								});
							} else {
								makeOneBtnPopup(3, "컨버젼 실패", "이미 기회로 전환된 리드입니다.", false, 400, 200, null, "확인", function() {
									closePopup(3);
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
				});
			}else {
				modifyLeadStat();
			}
	});
	
	$("#btn_lead_list").on("click",function(){
		location.href = "leadList";
	})
	
	// 관련 작업 체크박스  전체 선택 on/off
	$("#allActi").click(function(){
		var stat = $("#allActi").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
	});
	
	$(".list_chbox").on("click", function() {
		var cnt = 0;
		
		$(".acti_chbox").each(function() {
			cnt += $(this).is(":checked") ? 1 : 0;
		});
		var stat = (cnt < 4 && cnt >= 0)? false : true;
		$("#allActi").prop("checked", stat);
		
		getSche();
	});
	
	$("#btn_acti").on("click",function(){
		$("#actiForm").attr("action", "scheAdd");
		$("#actiForm").submit();
	})
	
	$("#btn_lead_modify").on("click", function(){
		$("#actionForm").attr("action", "leadupdate");
		$("#actionForm").submit();
	});
});
//리드 상태 변경
function modifyLeadStat(){
	var params = $("#actionForm").serialize();

	$.ajax({
		type: "post",
		url: "modLeadStatAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if (result.res == "SUCCESS") {	
				location.reload();
			} else {
				alert("안됩니다");
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}


// 리드 삭제
function delLead() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type: "post",
		url: "leadDelAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if (result.res == "SUCCESS") {	
				location.href = "leadList";
			} else {
				alert("안됩니다");
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}

//관련 고객
function getClient(client_view) {
	var params = "&view_cnt=" + client_view + "&" + $("#actionForm").serialize();
	$.ajax({
		type: "post",
		url: "getClientListAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if(result.list != null) {
				$(".client_cnt").html("(" + result.cnt + ")");
				drawClient(result.list);
				
				var dp = (result.cnt < 4) ? "none" : "inline-block";
				$("#viewAllBtn").css("display", dp);
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
// 관련 연락처
function drawClient(list) {
	var html = "";
	if(list.length > 0) {
		$(".client").css("display", "block");
		$(".client_table").css("display", "table");
		
		for(var i in list) {
			html += "<tr class=\"list_contents\" name=\"" + list[i].CLIENT_NO + "\">";
			html += "<td class=\"field_contents\">";
			html += "<div class=\"contents_pointer\">" + list[i].CLIENT_NAME 
			if(typeof list[i].CLIENT_DEPART_NAME != "undefined"){
				html += " | "+ list[i].CLIENT_DEPART_NAME;
			}
			if(typeof list[i].CLIENT_POSI_NAME != "undefined"){
				html += " | " + list[i].CLIENT_POSI_NAME;
			}
			if(typeof list[i].CLIENT_EMAIL != "undefined"){
				html += " | " + list[i].CLIENT_EMAIL; 
			}
			if(typeof list[i].CLIENT_PH != "undefined"){
				html += " | " + list[i].CLIENT_PH; 
			}
			html += "</div>";
			html += "</td>";
			html += "</tr>";
		}
	}
	else {
		$(".client").css("display", "none !important");
		$(".client_table").css("display", "none !important");
	}
	
	$("#client_table").html(html);
	$("")
}

//의견 리스트 Get
function getOpinList() {
	var params = $("#actionForm").serialize();
	$.ajax({
		type: "post",
		url: "getLeadOpinAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if(result.opinList != null) {
				drawOpinList(result.opinList);
				$(".opin_cnt").html("(" + result.cnt + ")");
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
// 의견 리스트 Set
function drawOpinList(list) {
	var html = "";
	
	if(list.length > 0) {
		for(var i in list) {
			html += "<tr>";
			html += "<td class=\"field_contents\">";
			html += "<div class=\"opin_contents\"><pre>" + list[i].LEAD_OPIN_CON + "</pre></div>";
			html += "<div class=\"opin_add_data\">" + list[i].EMP_NAME;
			if(typeof list[i].EMP_POSI_NAME != "undefined") {
				html += " " + list[i].EMP_POSI_NAME;
			}
			html += " | " + list[i].LEAD_OPIN_DATE + "</div>";
			html += "</td>";
			html += "<td class=\"field_contents\">";
			html += "<div class=\"contents_align_center\">";
			if('${sEmpNo}' == list[i].EMP_NO) {
				html += "<div class=\"btn_red btn_size_sqr del_btn\" id=\"" + list[i].LEAD_OPIN_NO + "\">";
				html += "<img src=\"resources/images/button/icon_del_white.png\" alt=\"\" width=\"10px\" />";
				html += "</div>";
			}
			html += "</div>";
			html += "</td>";
			html += "</tr>";
		}
	}
	$("#lead_opin_area").html(html);
	
	$(".del_btn").off();
	$(".del_btn").on("click", function() {
		var target = $(this).attr("id");
		
		makeTwoBtnPopup(1, "의견 삭제 경고", "정말로 의견을 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
			closePopup(1);
			delOpin(target);
		}, "취소", function() {
			closePopup(1);
		});
		
	});
	/* 파일첨부 */
	$("#attImgBtn").on("click", function() {
		$("#upload").click();
	});
	$("#upload").on("change", function() {
		var dataForm = $("#uploadForm");
		
		dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
			success: function(responseText, statusText){
				$("#upload_file").val(responseText.fileName[0]);
				uploadEvent();
			}, //ajax error
			error: function(){
				alert("에러발생!!"); 
			}
		});
		
		dataForm.submit();
		
	});
	
	
	function uploadEvent() {
		var params = $("#uploadForm").serialize() + "&lead_no=" + $("#lead_no").val();

		$.ajax({
			type : "post",
			url : "uploadAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if (result.res == "SUCCESS") {
					makeAlert(7, "망고CRM관리자", "성공적으로 업로드 되었습니다.", function(){
						location.reload();
					});
					
				} else {
					alert("저장이 안됩니다");
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
}
function fileUpload() {
	var params = $("#uploadForm").serialize() + "&lead_no=" + $("#lead_no").val();
	
	$.ajax({
		type : "post",
		url : "uploadListAjax",
		dataType : "json",
		data : params,

		success : function(result) {
			uploadList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function uploadList(list) {
	var html = "";
	console.log(list);
	if (list.length == 0) {
			html += "<tr style=\"text-align: center;\">";
			html += "	<td>";
			html += "		<div> 조회된 데이터가 없습니다. </div>";
			html += "	</td>";
			html += "</tr>";
	} else {
		for ( var i in list) {
			html += "<tr class=\"list_contents\" id = \"lead_attach_no\"name = \"" + list[i].LEAD_ATTACH_NO + "\">"
			html += "<td>첨부자료</td>";
			html += "<td>";
			html += "<a href= \"resources/upload/"+ list[i].LEAD_ATTACH_NAME +"\" download>"+ list[i].LEAD_ATTACH_NAME +"</a>";
			html += "</td>";
			html += "<td class = \"field_icon_contents\">";
			html += "<img class=\"trash_img\" src=\"resources/images/Lead/icon_del_white.png\" alt=\"\" />"
			html += "</td>"
			html += "</tr>";
		}
	}
	
	$(".uploadtbody").html(html);
	
	$(".trash_img").on("click", function(){
		$("#lead_att_no").val($(this).closest("tr").attr("name"));
		makeTwoBtnPopup(7, "삭제 확인 팝업", "정말로 삭제하시겠어요?", true, 400, 200, null, "삭제", function(){
			
				var params = $("#uploadForm").serialize() + "&lead_no=" + $("#lead_no").val();
	
				$.ajax({
					type : "post",
					url : "deleteAjax",
					dataType : "json",
					data : params,
					success : function(result) {
						if (result.res == "SUCCESS") {
							closePopup(7);
							location.reload();
						} else {
							alert("실패");
							closePopup(7);	
						}
					},
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}
				});
			}
				
				
				
				
				
				, "취소", function(){
					closePopup(7);	
				});
		
	});
}

function deleteEvent() {
	var params = $("#uploadForm").serialize() + "&lead_no=" + $("#lead_no").val();

	$.ajax({
		type : "post",
		url : "deleteAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			if (result.res == "SUCCESS") {
				makeAlert(7, "망고CRM관리자", "삭제가 완료되었습니다.", null)
			} else {
				alert("저장이 안됩니다");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
//의견 등록
function addOpin(){
	var params = $("#actionForm").serialize() + "&" + $("#opinForm").serialize();
	$.ajax({
		type: "post",
		url: "addLeadOpinAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if(result.res == "SUCCESS") {
				$("#opin_con").val("");
				getOpinList();
			}
			else {
				makeAlert(1, "의견 등록 실패", "의견 등록에 실패했습니다.", null);
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
// 의견 삭제
function delOpin(opin_no) {
	var params = "&opin_no=" + opin_no;
	
	$.ajax({
		type: "post",
		url: "delLeadOpinAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			if(result.res == "SUCCESS") {
				getOpinList();
			}
			else {
				makeAlert(1, "의견 삭제 실패", "의견 삭제에 실패했습니다.", null);
			}
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}

function getSche() {
	var params = $("#actionForm").serialize() + "&" + $("#actiForm").serialize();
	$.ajax({
		type: "post",
		url: "getLeadScheAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			drawSche(result.scheList);
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}

function drawSche(sche) {
	var html = "";
	
	if(sche == ""){
		html += "<tr>"
		html += "	<td>"
		html += "		<div> 조회된 데이터가 없습니다. </div>"
		html += "	</td>"
		html += "</tr>"
	} else {
		for(var i in sche){
			var icon = ""; 
			// 활동 분류 
			switch(sche[i].CODE_S_CATE){
			// 전화
			case 0:	
				icon = "call";
				break;
			// 상담
			case 1:
				icon = "headphone";
				break;
			// 메일
			case 2:
				icon = "email";
				break;
			// 방문
			case 3:
				icon = "visit"
				break;
			}
			html += "<tr class=\"activity_row\" id=\"" + sche[i].SCHE_NO +"\">";
			html += "    <td class=\"activity_left\">";
			html += "        <div class=\"activity_cg_icon\">";
			html += "            <img src=\"resources/images/activity/" + icon + "_icon.png\" alt=\"\" />";
			html += "        </div>";
			html += "    </td>";
			html += "    <td class=\"activity_right\" colspan=\"" + ((sche[i].SCHE_RES == null) ? "2": "1") +"\">";
			html += "        <div class=\"activity_bg\">";
			html += "            <div>";
			html += "                <div class=\"activity_cg\">" + sche[i].CODE_NAME +"</div>";
			html += "                <div class=\"activity_uploadtime\">" + sche[i].SDATE + "</div>";
			html += "            </div>";
			html += "            <div class=\"activity_contents\">" + sche[i].LEAD_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
			html += "            <div class=\"activity_contents\">" + sche[i].SCHE_CON +"</div>";
			html += "            <div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
			html += "        </div>";
			html += "    </td>";
			if(sche[i].SCHE_RES != null){
				html += "<td class=\"activity_result\">";
	            html += "    <div class=\"activity_bg_right\">";
	            html += "        <div>";
	            html += "            <div class=\"activity_cg\">결과</div>";
	            html += "            <div class=\"activity_uploadtime\">" + sche[i].EDATE + "</div>";
	            html += "        </div>";
	            html += "        <div class=\"activity_contents\">" + sche[i].LEAD_NAME + " | " + sche[i].CLIENT_PNM +"</div>";
	            html += "        <div class=\"activity_contents\">" + ((typeof sche[i].SCHE_RES == "undefined") ? "<br/>" : sche[i].SCHE_RES)  +"</div>";
	            html += "        <div class=\"activity_contents\">" + sche[i].EMP_NAME + " " + sche[i].EMP_PNM +" 담당</div>";
	            html += "    </div>";
	            html += "</td>";
			}
			html += "</tr>";
			// 일정 결과가 있을 때 
		}
	}
	$("#acti_area").html(html);
	$("tr").on("click",".activity_right, .activity_result",function(){
		$("#sche_no").val($(this).parent().attr("id"));
		$("#actionForm").attr("action","scheDet");
		$("#actionForm").submit();
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
		<div class="content_wrap">
			<form action="#" method="post" id="actionForm">
				<input type="hidden" id="lead_no" name="lead_no" value="${param.lead_no}"/>
				<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}"/>
				<input type="hidden" id="lead_nm" name="lead_nm" />
				<input type="hidden" id="empNo" name="empNo" value="${data.EMP_NO}"/>
				<input type="hidden" id="scheDivNoM" name="scheDivNoM" value="1"/>
				<input type="hidden" id="sche_no" name="sche_no"/>
			</form>
			<div class="lead_all">
				<div class="table_title">
					<div class="lead_cldr b_text"></div>
					<div class="btn_area">
						<div>
							<div class="btn btn_yellow btn_size_normal" id="btn_lead_modify">수정</div>
							<div class="btn btn_yellow btn_size_normal" id="btn_lead_list">목록</div>
							<div class="btn_black btn_size_normal" id="btn_lead_delete">삭제</div>
						</div>
					</div>
				</div>
				<div class="lead_detail_view">
					<table>
						<colgroup>
							<!-- 테이블열들의 너비입니다. -->
							<col width="10%" />
							<col width="40%" />
							<col width="10%" />
							<col width="40%" />
						</colgroup>
						<tr>
							<th>리드명</th>
							<td><input type="text" class="table_txt is_read_only" id="leadNm" name="leadNm" value="${data.LEAD_NAME}"/></td>
							<th>리드상태</th>
							<td><input class="table_txt is_read_only" value="${data.LEAD_STAT_NAME}"/></td>
						</tr>
						<tr>
							<th>고객사</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.COMP_NAME}" /></td>
							<th>고객사 연락처</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.COMP_PH}" /></td>
						</tr>
						<tr>
							<th>고객명</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CLIENT_NAME}" /></td>
							<th>고객 연락처</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CLIENT_PH}" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CLIENT_EMAIL}" /></td>
							<th>웹사이트</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CLIENT_WEBSITE}" /></td>
						</tr>
						<tr>
							<th>팩스</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CLIENT_FAX}" /></td>
							<th>인지경로</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.CONG_PATH_NAME}" /></td>
						</tr>
						<tr>
							<th>담당팀</th>
							<td><input class="table_txt is_read_only" value="${data.TEAM_NAME}" /></td>
							<th>담당팀 연락처</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.TEAM_CALL}" /></td>
						</tr>
						<tr>
							<th>담당자</th>
							<td><input
								class="table_txt is_read_only" value="${data.EMP_NAME}"/></td>
							<th>담당자 연락처</th>
							<td><input type="text" class="table_txt is_read_only" value="${data.EMP_PHONE}" /></td>
						</tr>
						<tr class="tr_address">
							<th>주소</th>
							<td colspan="3">
								<input type="text" class="table_txt is_read_only" value="${data.COMP_ADDR}" />
							</td>
						</tr>
					</table>
				</div>
				<div class="div_line"></div>
				<div class="div_line"></div>
				<div class="table_title">
					<div class="lead_cldr b_text">리드 상태</div>
					<div class="btn_area">
						<div>
							<div class="btn btn_yellow btn_size_normal" id="btn_ls_save">저장</div>
						</div>
					</div>
				</div>
				<div class="div_line_color"></div>
				<div class="lead_stat">
					<div class="lead_btn">
						<div class="lead_btn_on" id="lead_stat0" name="Unqualified">Unqualified</div>
						<div id="lead_stat1" name="New">New</div>
						<div id="lead_stat2" name="Working">Working</div>
						<div id="lead_stat3" name="Nurturing">Nurturing</div>
						<div id="lead_stat4" name="Conversion">Conversion</div>
					</div>
				</div>
				<div class="div_line"></div>
				<div class="div_line"></div>
				<!-- 활동 일정 시작 -->
				<form action="#" method="post" id="actiForm">
					<input type="hidden" name="scheDivNoM" id="scheDivNoM" value="1"/>
					<input type="hidden" name="lead_no" id="lead_no" value="${param.lead_no}"/>
					<div class="table_title" style="font-size:0;">
						<div class="top_title_area">
							활동 일정&nbsp;&nbsp;
						</div>
						<div class="top_btn_area">
							<div class="chk_grp">
								<input type="checkbox" id="allActi" class="list_chbox" checked="checked"/>
								<label for="allActi" class="chbox_lbl"></label> 
								<label for="allActi" class="chk_txt margin_right">전체</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiCall" class="list_chbox acti_chbox" value="0" checked="checked" name="acti0"/> 
								<label for="actiCall" class="chbox_lbl"></label> 
								<label for="actiCall" class="chk_txt margin_right">전화</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiCounsel" class="list_chbox acti_chbox" value="1" checked="checked" name="acti1" /> 
								<label for="actiCounsel" class="chbox_lbl"></label> 
								<label for="actiCounsel" class="chk_txt margin_right">상담</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiVisit" class="list_chbox acti_chbox" value="3" checked="checked" name="acti3" /> 
								<label for="actiVisit" class="chbox_lbl"></label>
								<label for="actiVisit" class="chk_txt margin_right">방문</label>
							</div>
							<div class="chk_grp">
								<input type="checkbox" id="actiEmail" class="list_chbox acti_chbox" value="2" checked="checked" name="acti2" />
								<label for="actiEmail" class="chbox_lbl"></label>
								<label for="actiEmail" class="chk_txt margin_right">이메일</label>
							</div>
							<div class="btn btn_yellow btn_size_normal" id="btn_acti">등록</div>
						</div>
					</div>
				</form>
				<table class="table_normal">
	                <colgroup>   
	                    <col width="8%" />
	                    <col width="46%" />
	                    <col width="46%" />
	                </colgroup>
	                <tbody id="acti_area">
	                </tbody>
	            </table>
	            <div class="div_line"></div>
				<!-- 활동 일정 끝 -->
				<div class="div_line"></div>
				<div class="div_line"></div>
				
				<div class="table_title">
					<div class="lead_cldr b_text">의견<span class="opin_cnt"></span></div>
				</div>
				<div class="lead_opinion">
					<form action="#" method="post" id="opinForm">	
						<table class="table_normal">
							<colgroup>
								<col width="90%" />
								<col width="10%" />
							</colgroup>
							<tbody id="lead_opin_area">
							</tbody>
								<tr class="tr_no_uline">
									<td class="field_contents">
										<textarea class="textarea_noresize" id="opin_con" name="opinCon"></textarea>
									</td>
									<td class="field_contents">
										<div class="btn_black btn_size_wfull" id="btn_opin_write">작성</div>
									</td>
								</tr>
						</table>
					</form>
				</div>
				<div class="div_line"></div>
				<div class="div_line"></div>
				<form action="#" method="post" id="clientForm">
					<input type="hidden" id="client_no" name="client_no" />
				</form>
				<div class="table_top_area client">
					<div class="lead_cldr b_text">관련 고객<span class="client_cnt"></span></div>
					<div class="btn_area">
						<div>
							<div class="btn_opac-z btn_size_normal" id="viewClientBtn">
								<img src="resources/images/button/icon_align_yellow.png" alt=""/>
							</div>
							<input type="hidden" id="all_flag" value="0" /> 
						</div>
					</div>
					<div class="lead_contact">
						<table class="table_normal client_table" id="client_table">
						</table>
					</div>
				</div>
				<div class="div_line"></div>
				<div class="div_line"></div>
				<!-- 첨부파일 영역 -->
				<form action="fileUploadAjax" id="uploadForm" method="post" enctype="multipart/form-data">
							<input type = "hidden" id = "lead_att_no" name = "lead_att_no"/>
					<div class="attach_area">
						<div>
							<input type = "file" style="display:none;" id = "upload" name = "attach" accept = "image/*, .pdf, .hwp, .docx, .xlsx"/>
							<span class = "attach_title_txt">첨부파일</span><div class="att_img" id="attImgBtn"></div>
							<input type = "hidden" name = "upload_file" id = "upload_file"/>
						</div>
						<table>
							<colgroup>
								<!--  테이블열들의 너비입니다. -->
								<col width="15%" />
								<col width="75%" />
								<col width="10%" />
							</colgroup>
						<tbody class = "uploadtbody">
						</tbody>
						</table>
					</div>
				</form>
			</div>
      	</div>
    </div>
	<c:import url="/bottom"></c:import>
</body>
</html>