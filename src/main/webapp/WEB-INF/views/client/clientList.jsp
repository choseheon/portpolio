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
.mgle10 {
	margin-left : 10px;
}
.table_list_header :hover{
	cursor : auto;
}
.chbox_lbl:hover{
	cursor : pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	getclientList();
	/* 고객 등록 */
	
	$("#client_del").on("click", function() {
		
		if($(".table_list tbody .list_chbox:checked").length > 0){
			makeTwoBtnPopup(1, "고객 삭제 경고", "정말로 고객을 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
				getclientdel();
				makeAlert(1, "삭제 성공", "삭제 성공", null);	
				closePopup(1);
			}, "취소", function() {
				closePopup(1);
			});
					
		} else{
			makeAlert(1, "삭제 오류", "1개이상 체크를 해주세요", null);
		}
	});
	
	$("#client_add").on("click", function() {
		$("#actionForm").attr("action","clientAdd");
		$("#actionForm").submit();
	});
	$("#chk_all").click(function(){
    	if($("#chk_all").prop("checked")){
    		$("input[name=client_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		$("input[name=client_check]").prop("checked",false);
    	}
    });
	// 검색 버튼 클릭 Event
	$("#client_Search_btn").on("click", function() {
		getclientList();
	});
	
	/* 체크개수 카운팅  */
	$(".table_list").on("click", ".list_chbox", function() {
		
		$("#client_all").html($(".table_list tbody .list_chbox").length);
		$("#client_cnt").html($(".table_list tbody .list_chbox:checked").length);
	});
	
	
	
	/* 체크박스 영역 제외하고 나머지tr부분 이벤트 적용 */
	$(".table_list tbody").on("click","tr", function(e) {
		if(!$(e.target).is('.chk_td , .chbox_lbl , .list_chbox')) {
			$("#client_no").val($(this).attr("name"));
			$("#actionForm").attr("action","clientDetail");
			$("#actionForm").submit();
		}
	});

	// 검색 엔터키 입력 Event
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#client_Search_btn").click();
			return false;
		}
	});
	// Paging 버튼 클릭 이벤트
	$(".list_paging_area").on("click", "div", function() {
		if(!isNaN($(this).attr("name") * 1)) {
			$("#page").val($(this).attr("name"));
			getclientList();
		}
	});	
});
//고객 삭제
function getclientdel() {
	var params = $("#dataForm").serialize();

	$.ajax({
		type: "post",
		url: "clientdelAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			getclientList();
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
//고객 데이터 리스트 Get
function getclientList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type: "post",
		url: "getclientAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			drawListPaging(result.pb);
			drawclientList(result.list);
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
// 고객 리스트 Draw
function drawclientList(list) {
	var html = "";
	if(list.length > 0) {
		for(var i in list) {
			html += "<tr class=\"list_contents\" name=\"" + list[i].CLIENT_NO+ "\">";
			html +=	"<td class=\"chk_td\"><input type=\"checkbox\" class=\"list_chbox\" name=\"client_check\" value=\""+list[i].CLIENT_NO+"\" id=\"chk_"+list[i].CLIENT_NO+"\"/>";
           	html += "<label for=\"chk_"+list[i].CLIENT_NO+"\" value=\""+list[i].CLIENT_NO+"\" class=\"chbox_lbl\"></label></td>";
			html += "<td>" + list[i].CLIENT_NO + "</td>";
	  		html += "<td>" + list[i].CLIENT_NAME + "</td>";
	  		html += "<td>" + list[i].COMP_NAME + "</td>";
	  		html += "<td>" + list[i].CLIENT_PH + "</td>";
	  		html += "<td>" + list[i].CLIENT_EMAIL + "</td>";
	  		html += "<td>" + list[i].EMP_NAME + "</td>";
	  		html += "<td>" + list[i].PROGCNT + "</td>";
	  		html += "<td>" + list[i].ENDCNT + "</td>";
			html += "</tr>";
		}
		
		var client_allcnt = list.length;
		$("#client_cnt").html(0);
		$("#client_all").html(client_allcnt);
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"9\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		$(".list_paging_area").html("");
	}
	$(".table_list>tbody").html(html);
}
//Paging draw
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
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">2</c:param>
	</c:import>
	<div class="title_area">고객 목록</div>
	<div class="content_area">
		<div class="contents_wrap">
			<!-- 여기에 내용을 구현 -->
			<div class="list_wrap">
            <!-- Top Button Area -->
	            <div class="table_top_area">
	               <div class="top_title_area"></div>
	               <div class="top_btn_area" >
	                    <div class="btn btn_yellow btn_size_normal" id="client_add">새 등록</div>
	                    <div class="btn btn_yellow btn_size_normal" id="client_del">삭제</div>
	               </div>
	               <form action="#" id="actionForm" method="post">
	               	   <input type="hidden" id="page" name="page" value="${page}">
	               	   <input type="hidden" id="client_no" name="client_no" value="${param.no}">
		               <div class="top_title_area">
		                    <div>
		                        <span id="client_all"></span>개 항목중 <span id="client_cnt">0</span>개 선택 
		                    </div>
		               </div>
		               <div class="top_btn_area">
		                    <select	class="input_short mgle10" name="searchGbn" id="searchGbn">
								<option value="0">전체</option>
								<option value="1">이름</option>
								<option value="2">회사명</option>
								<option value="3">휴대전화</option>
								<option value="4">이메일</option>
								<option value="5">담당자</option>
							</select> 
		                    <input type="text" class="input_wfix input_search " style="width:150px;" placeholder="휴대번호/고객/고객사" name="searchTxt" id="searchTxt" /> 
		                  <div class="btn btn_black btn_size_normal" id="client_Search_btn">검색</div>
		               </div>
	               </form>
	            </div>
	            <!-- Main Table Area -->
	            <form id="dataForm" method="post" action="#">
	            <table class="table_list">
	            	<!-- table colgroup -->
	               	<colgroup>  
	            		<col width="40px" />
						<col width="120px" />
						<col width="110px" />
						<col width="130px" />
						<col width="130px" />
						<col width="200px" />
						<col width="120px" />
						<col width="120px" />
						<col width="90px" />
	               	</colgroup>
	               	<thead>
	               		<tr class="table_list_header">
	                  		<td>
	                  			<input type="checkbox" class="list_chbox" id="chk_all"/>
	                        	<label for="chk_all" class="chbox_lbl"></label>
	                  		</td>
	                  		<td>no</td>
							<td>이름</td>
							<td>회사명</td>
							<td>휴대전화</td>
							<td>이메일</td>
							<td>담당자</td>
							<td>진행중인 건수</td>
							<td>완료된 건수</td>
	               		</tr>
	               	</thead>
	               	<tbody>
	               		<tr class="list_contents">
	               		</tr>
	               	</tbody>
				</table>
				</form>
				<div class="list_paging_area">
	            </div>
	      	</div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>