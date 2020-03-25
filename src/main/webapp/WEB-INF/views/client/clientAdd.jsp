<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents Test</title>
<c:import url="/header"></c:import>
<style type="text/css">
/* 기본 입력 폼 % 사이즈 */
/* 10% */
.size10{
	width:10%;
}
/* 15% */
.size15{
	width:15%;
}
/* 20% */
.size20{
	width:20% !important;
}
/* 25% */
.size25{
	width:25%;
}
/* 30% */
.size30{
	width:30% !important;
}
/* 35% */
.size35{
	width:35%;
}
/* 40% */
.size40{
	width:40%;
}
/* 48% */
.size48{
	width:48%;
}
/* 60% */
.size60{
	width:60%;
}
/* 70% */
.size70{
	width:70% !important;
}
/* 75% */
.size75{
	width:75%;
}
/* 80% */
.size80{
	width:80% !important;
}
/* 90% */
.size90{
	width:90%;
}
/* 100% */
.size100{
	width:100%;
}
/* 기본 입력 폼 px 사이즈 */
/* 10px */
.pxsize10{
	width:10px;
}
/* 20px */
.pxsize20{
	width:20px;
}
/* 25px */
.pxsize25{
	width:25px;
}
/* 30px */
.pxsize30{
	width:30px;
}
/* 35px */
.pxsize35{
	width:35px;
}
/* 40px */
.pxsize40{
	width:40px;
}
/* 50px */
.pxsize50{
	width:50px;
}
/* 60px */
.pxsize60{
	width:60px;
}
/* 70px */
.pxsize70{
	width:70px;
}
/* 75px */
.pxsize75{
	width:75px;
}
/* 80px */
.pxsize80{
	width:80px;
}
/* 100px */
.pxsize100{
	width:100px;
}
/* 120px */
.pxsize120{
	width:120px;
}
/* 150px */
.pxsize150{
	width:150px;
}
/* 180px */
.pxsize180{
	width:180px;
}
/* 190px */
.pxsize190{
	width:190px;
}
/* 195px */
.pxsize195{
	width:195px;
}
/* 200px */
.pxsize200{
	width:200px;
}
/* 마진 left */
.mgle10 {
	margin-left : 10px;
}

/* LAYOUT 끝 */


/* 사이즈 설정 입력폼 스타일 */
.input_size {
    height: 30px;
    border: 1px solid #eeeeee;
    border-radius: 3px;
	vertical-align: middle;
    font-size: 10pt;
    text-indent: 5px;

}

/* 등록 체크박스 */
.cp_chbox {
    background-color: initial;
    cursor: default;
    -webkit-appearance: checkbox;
    box-sizing: border-box;
    margin: 8px 3px 3px 4px;
    padding: initial;
    border: initial;
    width: 20px;
    height: 20px;
}

/* INPUT */


/* 
    밑 CSS는 고객사 검색과 관련된 팝업입니다.
*/
/* 고객사 검색 입력창 */
.pop_company_search {
    display: inline-block;
    width: 70%;
    height: 50px;
}
/* 고객사 체크박스 영역 */
.input_company_chbox_area {
    width: 30%;
    display: inline-block;
}
/* 고객사 체크박스 크기 */
.input_company_chbox {
    width : 20px;
    height: 20px;
    display: inline-block;
    vertical-align: middle;
}   
/* 고객사 체크박스 호버 */
.input_company_chbox:hover{
    cursor: pointer;
}


/* 하단 페이징 영역 끝 */


/* 담당자검색 */
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
/* POPUP */
</style>
<script type="text/javascript">
$(document).ready(function() {
	ClientSet();
	
	$("#btn_client_cancel").on("click", function() {
		history.back();
	});
	
	/* 체크박스 값 넣기 */
	$("input[type=checkbox]").on("click", function() {
		if ($(this).is(":checked") == true) {
			$(this).val(1);
			$("#page").val(1);
			
		}
		else if ($(this).is(":checked") == false) {
			$(this).val(0);
			$("#page").val(1);
		}

	});
	/* 고객 등록 */
	$("#btn_client_save").on("click",function() {
		var phoneRule = /^\d{3}-\d{3,4}-\d{4}$/;
		var linephoneRule = /^\d{2,4}-\d{4}-\d{4}$/;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


		if($.trim($("#txt_client_name").val()) == "") {
			makeAlert(1, "입력오류", "이름을 입력하세요.", null);
			$("#txt_client_name").focus();
		} else if($.trim($("#txt__client_company_name").val()) == "") {
			makeAlert(1, "입력오류", "고객사를 입력하세요.", null);
		} else if($.trim($("#txt_client_ph").val()) == "") {
			makeAlert(1, "입력오류", "휴대번호를 입력하세요.", null);
			$("#txt_client_ph").focus();
		} else if($.trim($("#txt_client_email").val()) == "") {
			makeAlert(1, "입력오류", "이메일을 입력하세요.", null);
			$("#txt_client_email").focus();
		} else if($.trim($("#txt_client_empname").val()) == "") {
			makeAlert(1, "입력오류", "담당자를 입력하세요.", null);
		} else if(!emailRule.test($("#txt_client_email").val())) {            
			makeAlert(1, "입력오류", "이메일을 입력형식이 다릅니다.", null);
			$("#txt_client_email").focus();
		}	else if(!phoneRule.test($("#txt_client_ph").val())) {            
			makeAlert(1, "입력오류", "휴대번호 입력형식이 다릅니다.", null);
			$("#txt_client_ph").focus();
		}	else if(!linephoneRule.test($("#txt_client_ln").val()) && ($("#txt_client_ln").val() != "")) {            
			makeAlert(1, "입력오류", "유선번호 입력형식이 다릅니다.", null);
			$("#txt_client_ln").focus();
		}	else if(!linephoneRule.test($("#txt_client_fax").val()) && ($("#txt_client_fax").val() != "")) {            
			makeAlert(1, "입력오류", "팩스번호 입력형식이 다릅니다.", null);
			$("#txt_client_fax").focus();
		}		
		else {
			var html = "고객 정보를 저장하시겠습니까?";
			
			makeTwoBtnPopup(1, "고객 등록", html, true, 300, 200, null, "확인", function() {
				//jQuery 활용
				var params = $("#addForm").serialize(); //serialize폼안에 값 전달()
				$.ajax({
					type : "post", //데이터 전송방식
					url : "clientWriteAjax", //주소
					dataType :"json", //데이터 전송규격
					data : params ,  //보낼 데이터
					//{키 : 값, 키 : 값,...} -> json
					success : function(result) {
						if(result.res=="SUCCESS") {
							alert("등록에 성공하였습니다");
							$("#addForm").attr("action","clientList");
	 						$("#addForm").submit();
							
						} else {
							makeAlert(1, "등록오류", "등록에 실패하였습니다", null);
						}
					},
					error : function(request , status, error) {
						console.log("status :" + request.status); //상태코드
						console.log("text :" + request.responceText); //request영역 반환텍스트
						console.log("error :" + request.error); //에러메세지
					}
				});
				
				//확인 동작
			},"취소", function() {
				closePopup(1);
			});
			
			
		}
	});
	// 전화번호 텍스트 포맷팅
	 $("#txt_client_ph, #txt_client_ln, #txt_client_fax").on("keyup", function() {
		 inputNumberFormat(this);
	 });
	/* 고객사 검색 버튼 */
	 $("#btn_comp_search").on("click", function() {
		var html = "";
		html +="<form action=\"#\" method=\"post\" id=\"searchForm\">";
		html +="<div style=\"font-size :0; margin-bottom : 30px;\">";
		html +="	<div class=\"pop_company_search\">                                                                      ";
		html +="		<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 업종/기업명\" />";
		html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
		html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"compSearchBtn\">";
		html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"compCancelBtn\">";
		html +="	</div>                                                                                                    ";
		html +="	<div class=\"input_company_chbox_area\">                                                                  ";
		html +="		<div class=\"field_contents\">                                                                        ";
		html +="			<input class=\"input_company_chbox\" type=\"checkbox\" name=\"client_empty\" id=\"client_empty\" value=\"\"/>                     ";
		html +="			<label class=\"emp_form\" for=\"client_empty\">고객없음</label>                                   ";
		html +="			<input class=\"input_company_chbox\" type=\"checkbox\" name=\"client_my\" id=\"client_my\" value=\"\"/>                        ";
		html +="			<label class=\"emp_form\" for=\"client_my\">내고객</label>                                        ";
		html +="		</div>                                                                                                ";
		html +="	</div>                                                                                                    ";
		html +="</div>";
		html += "</form>";
		html +="	<table class=\"pop_list\">                                                                   ";
		html +="		<colgroup>                                                                                        ";
		html +="			<!-- 테이블열들의 너비입니다. -->                                                             ";
		html +="			<col width=\"20%\" />                                                                         ";
		html +="			<col width=\"25%\" />                                                                         ";
		html +="			<col width=\"55%\" />                                                                         ";
		html +="		</colgroup>                                                                                       ";
		html += "<thead>";
		html +="		<tr class=\"table_list_header\">                                                                    ";
		html +="			<td>번호</td>                                                                             ";
		html +="			<td>업종</td>                                                                               ";
		html +="			<td>기업명</td>                                                                                 ";
		html +="		</tr>                                                                                             ";
		html += "</thead>";
		html += "<tbody>";
		html +="		<tr class=\"pop_content_style\" name=\"pop_comp1\">                                               ";
		html +="			<td>유한법인</td>                                                                             ";
		html +="			<td>삼성전자</td>                                                                             ";
		html +="			<td>서울특별시 강남구 테헤란로 1234</td>                                                      ";
		html +="		</tr>                                                                                             ";
		html +="</tbody>";
		html +="</table>                                                                                              ";
		html +="<div class=\"list_paging_area\" style=\"margin-top: 0px;\">";
        html +="</div>";
		makeNoBtnPopup(1, "고객사 검색", html, true, 630, 800,function() {
			getcompList();
			setcompEvent();
		});
	});
	// 담당자 데이터 리스트 Get
	function getcompList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "getcompListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawListPaging(result.pb);
				drawcompList(result.list);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 고객사 리스트 Draw
	function drawcompList(list) {
		var html = "";
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\"  name=\"" + list[i].COMP_NO+","+list[i].COMP_NAME + "\">";
          		html += "<td>" + list[i].COMP_NO + "</td>";
          		html += "<td>" + list[i].SECT_NAME + "</td>";
          		html += "<td>" + list[i].COMP_NAME + "</td>";
       			html += "</tr>";
			}
		}
		else {
			html += "<tr class=\"pop_column\" \">";
   			html += "<td colspan=\"3\">조회된 데이터가 없습니다.</td>";
   			html += "</tr>";
   			$(".list_paging_area").html("");
		}
		$(".pop_list>tbody").html(html);
	}
	/* 고객사 이벤트 */
	function setcompEvent() {
		/* 체크박스 값 넣기 */
		$("input[type=checkbox]").on("click", function() {
			if ($(this).is(":checked") == true) {
				$(this).val(1);
				$("#page").val(1);
			}
			else if ($(this).is(":checked") == false) {
				$(this).val('');
				$("#page").val(1);
			}

		});
		// 검색 버튼 클릭 Event
		$("#compSearchBtn").on("click", function() {
			getcompList();
		});
		// 검색 엔터키 입력 Event
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#compSearchBtn").click();
				return false;
			}
		});
		// 검색 초기화 버튼 클릭 Event
		$("#compCancelBtn").on("click", function() {
			$("#searchTxt").val("");
			getcompList();
		});	
		// Paging 버튼 클릭 이벤트
		$(".list_paging_area").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page").val($(this).attr("name"));
				getcompList();
			}
		});	
		// 회사 값 선택 Event
		$(".pop_list>tbody").on("click", "tr", function() {
			var arr = [] ;
			arr = $(this).attr("name").split(",");
			$("#txt__client_company").val(arr[0]);
			$("#txt__client_company_name").val(arr[1]);
			closePopup(1);
		});
			
	}
	
	/* 담당자 검색 버튼클릭 */
	$("#btn_mgr_search").on("click", function() {
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
	
	// 담당자 데이터 리스트 Get
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
	// 담당자 리스트 Draw
	function drawEmpList(list) {
		var html = "";
		
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].EMP_NO+","+list[i].EMP_NAME + "\">";
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
	function setEmpEvent() {
		// 검색 버튼 클릭 Event
		$("#empSearchBtn").on("click", function() {
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
			var arr = [] ;
			arr = $(this).attr("name").split(",");
			$("#txt_client_empno").val(arr[0]);
			$("#txt_client_empname").val(arr[1]);
			closePopup(1);
		});
			
	}
	// Paging draw
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

//고객 등록 셋팅
function ClientSet() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "clientAddSetAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			ClientGradeSet(result.grade);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}
// 등급가져오기
function ClientGradeSet(grade) {
// 	var html = "<option selected=\"selected\" value=\"0\">없음</option>";
	var html = "";
	for(var i in grade) {
		html += "<option value=\"" + grade[i].CC_GRADE_NO + "\">" + grade[i].CC_GRADE_NAME + "</option>";
	}
	$("#dd_client_grade").html(html);
}

function numberFormat(inputNumber) {
		
	   return inputNumber.toString().replace(/\B(?=(\d{3}-\d{3,4}-\d{4})+(?!\d))/g, ",");
	}

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{4})+(?!\d))/g, '$1-');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">2</c:param>
	</c:import>
	<div class="title_area">고객 등록</div>
	<div class="content_area">
		<div class="contents_wrap">
			<!-- 여기에 내용을 구현 -->
			<!-- 버튼영역 -->
			<div class="table_top_area">
				<div class="top_title_area"></div>
				<div class="top_btn_area">
					<div class="btn btn_yellow btn_size_normal" id="btn_client_save">저장</div>
					<div class="btn btn_yellow btn_size_normal" id="btn_client_cancel">취소</div>
				</div>
			</div>
			<form action="#" id="action" method="post">
			</form>
			<form action="#" id="addForm" method="post">
			<!-- 테이블 영역입니다. -->
				<table class="table_normal">
					<colgroup>
						<!-- 테이블열들의 너비입니다. -->
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<td class="field_name first_field_name">
							이름 <span class="acc_txt">*</span>
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_name" name="txt_client_name" class="input_normal" />
						</td>
						<td class="field_name">
							고객사 <span class="acc_txt">*</span>
						</td>
					    <td class="field_contents">
							<input type="hidden" name="txt__client_company" id="txt__client_company" value="">
							<input type="text" id="txt__client_company_name" readonly="readonly" name="txt__client_company_name" class="input_size size75" />
							<div class="btn btn_black btn_size_normal" id="btn_comp_search">검색</div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">부서</td>
						<td class="field_contents">
							<input type="text" id="txt_client_depart" name="txt_client_depart" class="input_normal" />
						</td>
						<td class="field_name">
							직책
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_position" name="txt_client_position" class="input_normal" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">휴대번호 <span
							class="acc_txt">*</span>
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_ph" name="txt_client_ph" maxlength="14" class="input_normal" />
						</td>
						<td class="field_name">
							유선번호
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_ln" name="txt_client_ln" maxlength="14" class="input_normal" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">
							팩스
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_fax" name="txt_client_fax" maxlength="14" class="input_normal" />
						</td>
						<td class="field_name">
							웹사이트
						</td>
						<td class="field_contents">
							<input type="text" id="txt_client_web" name="txt_client_web" class="input_normal" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">이메일 <span
							class="acc_txt">*</span>
						</td>
						<td class="field_contents"> 
							<input type="text" id="txt_client_email" name="txt_client_email" class="input_normal" />
						</td>
						<td class="field_name">
							등급 <span class="acc_txt">*</span>
						</td>
						<td class="field_contents">
							<select class="input_normal" id="dd_client_grade" name="dd_client_grade">
								<option selected="selected" value="0">없음</option>
								<option >Bronze</option>
								<option value="Silver">Silver</option>
								<option value="Gold">Gold</option>
								<option value="Platinum">Platinum</option>
								<option value="Diamond">Diamond</option>
								<!-- <option value="Master">Master</option> -->
								<option value="Challenger">Challenger</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">
							중요인물
						</td>
						<td class="field_contents">
							<input class="cp_chbox" id="chk_client_cp" name="chk_client_cp" type="checkbox" value="0"/>
						</td>
						<td class="field_name">
							담당자 <span class="acc_txt">*</span>
						</td>
						<td class="field_contents">
							<input type="hidden" name="txt_client_empno" id="txt_client_empno" value="">
							<input type="text" id="txt_client_empname" name="txt_client_empname" readonly="readonly" class="input_size size75" />
							<div class="btn btn_black btn_size_normal" id="btn_mgr_search">검색</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>