<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리_정보</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
	var cnt = 0;
	var team = 0;
	var depart = 0;
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	$(document).ready(function() {
			getDepartInfo();
		$("#searchDepart").change(function(){
			$("#depart_no").val($("#searchDepart").val());
			getDepartInfo();
			getTeamInfo();
			$("#searchTeam").val(0);
			$("#TEMP_NAME").val("");
			$("#TEAM_TASK").val("");
			$("#TCNT").val("");
		});
		$("#searchTeam").change(function(){
			$("#team_no").val($("#searchTeam").val());
			if($("#searchTeam").val() == '0')
				{
				$("#TEMP_NAME").val("");
				$("#TEAM_TASK").val("");
				$("#TCNT").val("");
				}
			getTeamInfo();
		});
		// Button Auto Sizing
		$('button').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		})
		$('.content_btn>div').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		})
		$("#cancel").on("click", function(){
			location.href = "departMgt";
		});
		
		$("#departEdit").on("click", function(){
			var params = $("#actionForm").serialize();

			$.ajax({
				type: "post",
				url: "departEditAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					makeAlert(1, "성공", "부서정보가 수정되었습니다.", function(){
						location.href = "departMgt";
					});
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		});
		$("#teamEdit").on("click", function(){
			var params = $("#actionForm").serialize();

			$.ajax({
				type: "post",
				url: "teamEditAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					makeAlert(1, "성공", "팀정보가 수정되었습니다.", function(){
						location.href = "departMgt";
					});
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		});
		
		// 담당자 검색 버튼 클릭 Event
		$("#select").on("click", function() {
			var html = "";
			
			html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
			html += "<div>";
			html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
			html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
			html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
			html += "</div>";
			html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
			if($("#depart_no").val() != $("#searchDepart").val()){
			html += "<input type=\"hidden\" id=\"depart_no\" name=\"depart_no\" value=\""+${param.depart_no}+"\"/>	";
			}
			else{
			html += "<input type=\"hidden\" id=\"depart_no\" name=\"depart_no\" value=\""+$("#searchDepart").val()+"\"/>	";				
			}
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
	        
	        makeNoBtnPopup(1, "사원 조회", html, true, 600, 650, function() {
	        	getEmpList();
	        	setEmpEvent();
			});
		});
	
	//부서담당자 검색
		$("#departEmp_select").on("click", function() {
			var html = "";
			depart = 1;
			html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
			html += "<div>";
			html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
			html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
			html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
			html += "</div>";
			html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
			if($("#depart_no").val() != $("#searchDepart").val()){
			html += "<input type=\"hidden\" id=\"depart_no\" name=\"depart_no\" value=\""+${param.depart_no}+"\"/>	";
			}
			else{
			html += "<input type=\"hidden\" id=\"depart_no\" name=\"depart_no\" value=\""+$("#searchDepart").val()+"\"/>	";				
			}
			html += "</form>";
			html += "<table class=\"pop_list\" id=\"pop_list\">";
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
	        
	        makeNoBtnPopup(1, "사원 조회", html, true, 600, 650, function() {
	        	getEmpList();
	        	setEmpEvent();
			});
		});
		
	//팀담당자 검색
		$("#teamEmp_select").on("click", function() {
			$("#team_no").val($("#searchTeam").val());
			var html = "";
			team = 1;
			html += "<form action=\"#\" method=\"post\" id=\"searchForm\">";
			html += "<div>";
			html += "<input type=\"text\" class=\"input_search\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"Ex) 홍길동\" />";
			html += "<img src =\"resources/images/button/icon_search_gray.png\" alt=\"\" width=\"30px\" class=\"search_icon\" id=\"empSearchBtn\">";
			html += "<img src =\"resources/images/button/icon_cancel_gray.png\" alt=\"\" width=\"20px\" class=\"cancel_icon\" id=\"empCancelBtn\">";
			html += "</div>";
			html += "<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />";
			html += "<input type=\"hidden\" id=\"team_no\" name=\"team_no\" value=\""+$("#searchTeam").val()+"\"/>	";				
			html += "</form>";
			html += "<table class=\"pop_list\" id=\"pop_list\">";
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
	        
	        makeNoBtnPopup(1, "사원 조회", html, true, 600, 650, function() {
	        	getEmpList();
	        	setEmpEvent();
			});
		});
	});
	
	/* 조회팝업 */
	// 담당자 목록 Get
	function getEmpList() {
		var params = $("#searchForm").serialize();

		$.ajax({
			type: "post",
			url: "departPopAjax",
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
		  		if(list[i].DEPART_NO == $("#depart_no").val()){
				html += "<tr class=\"list_contents\" name=\"" + list[i].NO + "~" + list[i].NAME + "~" + list[i].EMAIL + "~" + list[i].DEPART_NAME + "~" + list[i].DEPART_NO + "~" + list[i].PHONE + "~" + list[i].TEAM_NO +"\">";
		  		html += "<td>" + list[i].NO + "</td>";
		  		html += "<td>" + list[i].DEPART_NAME + "</td>";
		  		html += "<td>" + list[i].TEAM_NAME + "</td>";
		  		html += "<td>" + list[i].NAME + "</td>";
		  		html += "<td>" + list[i].POSI_NAME + "</td>";
				html += "</tr>";
				cnt++;
		  		}
				$("#cnt").val(cnt);
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
			$("#page").val("1");
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
		$("#pop_list>tbody").on("click", "tr", function() {
			if(depart == 1){
			var select = $(this).attr("name");
			var array = select.split("~");
			$("#DEMP_NO").val(array[0]);
			$("#DEMP_NAME").val(array[1]);
			$("#EMP_EMAIL").val(array[2]);
			$("#EMP_PHONE").val(array[5]);
			$("#depart_no").val(array[4]);
			closePopup(1);
			}
			else {
				var select = $(this).attr("name");
				var array = select.split("~");
				$("#TEMP_NO").val(array[0]);
				$("#TEMP_NAME").val(array[1]);
				$("#team_no").val(array[6]);
				closePopup(1);
			}
			depart = 0;
			team = 0;
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
	
	/*  */
	
	function getDepartInfo(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post", 
			url : "getDepartInfoAjax", 
			dataType : "json",
			data : params, 
			success : function(result) {
				$("#DEPART_TASK").val(result.getDepartInfo.DEPART_TASK);
				$("#DEMP_NAME").val(result.getDepartInfo.EMP_NAME);
				$("#EMP_EMAIL").val(result.getDepartInfo.EMP_EMAIL);
				$("#DEPART_CALL").val(result.getDepartInfo.DEPART_CALL);
				$("#CNT").val(result.getDepartInfo.CNT);
				$("#EMP_PHONE").val(result.getDepartInfo.EMP_PHONE);
				$("#DEMP_NO").val(result.getDepartInfo.EMP_NO);
				departList(result.departList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function getTeamInfo(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post", 
			url : "getTeamInfoAjax", 
			dataType : "json",
			data : params, 
			success : function(result) {
				if(result.getTeamInfo != null){
				$("#TEAM_TASK").val(result.getTeamInfo.TEAM_TASK);
				$("#TEMP_NAME").val(result.getTeamInfo.EMP_NAME);
				$("#TCNT").val(result.getTeamInfo.CNT);
				}
				teamList(result.Teamlist);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	function departList(list){
		var html = "";		
			html = "<option selected=\"selected\" style=\"display : none;\">"+$("#DEPART_NAME").val()+"</option>";
		for(i in list){
			if(list[i].DEPART_NO == $("#searchDepart").val()){
		html += "<option selected=\"selected\" value = \""+ list[i].DEPART_NO +"\">"+ list[i].DEPART_NAME +"</option>";
			}
			else
				{
				html += "<option value = \""+ list[i].DEPART_NO +"\">"+ list[i].DEPART_NAME +"</option>";
				}
		}
		$("#searchDepart").html(html);
	}
	function teamList(list){
		var html = "";
			html += "<option value=\"0\">없음</option>";	
		for(i in list){
			if(list[i].TEAM_NO == $("#searchTeam").val()){
		html += "<option selected=\"selected\" value = \""+ list[i].TEAM_NO +"\">"+ list[i].TEAM_NAME +"</option>";
			}
			else
				{
				html += "<option value = \""+ list[i].TEAM_NO +"\">"+ list[i].TEAM_NAME +"</option>";
				}
		}
		$("#searchTeam").html(html);
	}
</script>
<style type="text/css">
table {
	margin-bottom: 30px;
}
.profile_image {
    display: inline-block;
    width: 80%;
    height: 130px;
    background-color: #ffffff;
    border: 1px solid #cacaca;
    background-size: 100% 100%;
    text-align: center;
}
/* 팝업 */
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
</head>
<body>
<c:import url="/topLeft">
		<c:param name="menuNo">18</c:param>
	</c:import>
		<div class="title_area">부서 정보</div>
		<div class="content_area">
			<!-- 여기에 내용을 구현 -->
			<form action="#" id="actionForm" method="post">
	<input type="hidden" id="depart_no" name="depart_no" value="${param.depart_no}"/>	
	<input type="hidden" id="team_no" name="team_no"/>	
	<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}"/>	
	<input type="hidden" id="sAuthorNo" name="sAuthorNo" value="${sAuthorNo}"/>	
	<input type="hidden" id="DEPART_NAME" name="DEPART_NAME" value="${getDepartInfo.DEPART_NAME}"/>	
	<input type="hidden" id="DEMP_NO" name="DEMP_NO" value="${getDepartInfo.EMP_NO}"/>	
	<input type="hidden" id="TEMP_NO" name="TEMP_NO"/>
	<input type="hidden" name="flag" id="flag" value="${param.flag}"/>	
	<div class="contents_wrap">
		<div class="table_top_area">
			<div class="top_title_area">
			</div>
			<div class="top_btn_area">
			<c:if test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
				<div class="btn_yellow btn_size_normal" id="departEdit">부서수정</div>
				<div class="btn_yellow btn_size_normal" id="teamEdit">팀수정</div>
			</c:if>
				<div class="btn_yellow btn_size_normal" id="select">사원 조회</div>
				<div class="btn_yellow btn_size_normal" id="cancel">취소</div>
			</div>
		</div>
			<table class="table_normal">
				<colgroup>	
					<col width="10%" />
					<col width="35%" />
					<col width="10%" />
					<col width="30%" />
					<col width="15%" />
				</colgroup>                
                <tr>
                 	<td class="field_name first_field_name">
                    	부서
                    </td>
                    <td class="field_contents">
                        <select class="input_normal" id="searchDepart" name="searchDepart">
                        </select>
                    </td>
					<td class="field_name">
                    	이메일
                    </td>
					<td class="field_contents">
						<input type="text" class="input_normal input_readonly" readonly="readonly" id="EMP_EMAIL" name="EMP_EMAIL" value="${getDepartInfo.EMP_EMAIL}"/>
					</td>
					<td class="field_name" rowspan="3">
						<div class="profile_image"></div>
					</td>
                </tr>
                <tr>
                	 <td class="field_name first_field_name">
                 	       부서장
                    </td>
                   <td class="field_contents">
                   <c:choose>
                        <c:when test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
                        <input type="text" class="input_normal input_readonly" style="width: calc(100% - 100px) !important" 
                        readonly="readonly" id="DEMP_NAME" name="DEMP_NAME" value="${getDepartInfo.EMP_NAME}"/>
                        <div class="btn_black btn_size_normal" id="departEmp_select">검색</div>
                        </c:when>
                        <c:otherwise>
                        <input type="text" class="input_normal input_readonly" readonly="readonly" id="DEMP_NAME" name="DEMP_NAME" value="${getDepartInfo.EMP_NAME}"/>
                        </c:otherwise>
                   </c:choose>
                    </td>
                    <td class="field_name">
                    	휴대폰
                    </td>
					<td class="field_contents">
						<input type="text" class="input_normal input_readonly" readonly="readonly" id="EMP_PHONE" name="EMP_PHONE" value="${getDepartInfo.EMP_PHONE}"/>
					</td>
                </tr>
                <tr>
                <td class="field_name first_field_name">
                    	사원수
                    </td>
                    <td class="field_contents">
                  <input type="text" class="input_normal" readonly="readonly" id="CNT" name="CNT" value="${getDepartInfo.CNT}"/>
                    </td>
                    <td class="field_name">
                    	전화번호
                    </td>
					<td class="field_contents">
					<c:choose>
                <c:when test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
						<input type="text" class="input_normal" id="DEPART_CALL" name="DEPART_CALL" value="${getDepartInfo.DEPART_CALL}"/>
					   </c:when>
               <c:otherwise>
						<input type="text" class="input_normal" readonly="readonly" id="DEPART_CALL" name="DEPART_CALL" value="${getDepartInfo.DEPART_CALL}"/>
               </c:otherwise>
               </c:choose>
					</td>
                </tr>
                <tr>
               
                    <td class="field_name  first_field_name" id="depart">
                   		업무
                    </td>
                    <td class="field_contents" id="depart_contents" colspan="3">
                     <c:choose>
                <c:when test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
                    <input type="text" class="input_normal" id="DEPART_TASK" name="DEPART_TASK" value="${getDepartInfo.DEPART_TASK}"/>
                     </c:when>
               <c:otherwise>
                    <input type="text" class="input_normal" readonly="readonly" id="DEPART_TASK" name="DEPART_TASK" value="${getDepartInfo.DEPART_TASK}"/>
               </c:otherwise>
               </c:choose>
                    </td>
                    <td class="field_name">
						프로필
					</td>
                </tr>
			</table>
			<b>팀 정보</b>
			<table class="table_normal">
				<colgroup>	
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>   
				<tr>
					<td class="field_name first_field_name">
                    	팀
                    </td>
                    <td class="field_contents" colspan="3">
                        <select class="input_normal" id="searchTeam" name="searchTeam">
                        <option value="0">없음</option>
                        <c:forEach var="data" items="${Teamlist}">
                        <option value="${data.TEAM_NO}">${data.TEAM_NAME}</option>
                        </c:forEach>
                        </select>
                    </td>
				</tr>  
				<tr>
					<td class="field_name first_field_name">
                 	    팀장
                    </td>
                   <td class="field_contents">
					<c:choose>
                        <c:when test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
                        <input type="text" class="input_normal input_readonly" style="width: calc(100% - 100px) !important" 
                        readonly="readonly" id="TEMP_NAME" name="TEMP_NAME" value="${getTeamInfo.EMP_NAME}"/>
                        <div class="btn_black btn_size_normal" id="teamEmp_select">검색</div>
                        </c:when>
                        <c:otherwise>
                        <input type="text" class="input_normal input_readonly" readonly="readonly" id="TEMP_NAME" name="TEMP_NAME" value="${getTeamInfo.EMP_NAME}"/>
                        </c:otherwise>
                    </c:choose>
                    </td>
                    <td class="field_name">
                 	       사원수
                    </td>
                   <td class="field_contents">
         			<input type="text" class="input_normal" readonly="readonly" id="TCNT" name="TCNT" value="${getTeamInfo.CNT}"/>
                    </td>
				</tr>
				<tr>
                    <td class="field_name  first_field_name">
                   		업무
                    </td>
                    <td class="field_contents" id="depart_contents" colspan="3">
                    <c:choose>
                        <c:when test="${sAuthorNo eq 0 or sAuthorNo eq 1}">
                    <input type="text" class="input_normal" id="TEAM_TASK" name="TEAM_TASK" value="${getTeamInfo.TEAM_TASK}"/>
                    </c:when>
                    <c:otherwise>
                    <input type="text" class="input_normal" readonly="readonly" id="TEAM_TASK" name="TEAM_TASK" value="${getTeamInfo.TEAM_TASK}"/>
                    </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
				</table> 
	</div>
	</form>
		</div>
	<c:import url="/bottom"></c:import>
</body>
</html>