<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연간부서목표_목록</title>
<c:import url="/header"></c:import>
<script type="text/javascript">

var arr = new Array();

//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
$(document).ready(function() {
	departList();
	bssPpsList();
	$("#searchDepart").change(function(){
		bssPpsList();
	});
    // Button Auto Sizing
    $('button').each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (10 * leng_diff) + "px");  
        }
    })
    $('.content_btn>div').each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (10 * leng_diff) + "px");  
        }
    })
    $("#add").on("click", function(){
    	location.href = "bssPpsAdd";
    });
    
    $("#edit").on("click", function(){
    	if($(".list_contents .list_chbox:checked").length == 1){
    		$("#pps_no").val($(".list_chbox:checked").parent().attr("name"));
    		$("#actionForm").attr("action", "bssPpsEdit");
    		$("#actionForm").submit();  
    	} else if($(".list_contents .list_chbox:checked").length == 0) {
    		makeAlert(1, "알림", "항목을 선택하세요.", null);
    	} else{
    		makeAlert(1, "알림", "항목 한개만 선택하세요.", null);
    	}
    });
    
    $("#delete").on("click", function(){
    	if($(".list_contents .list_chbox:checked").length == 1){
    		if($(".list_chbox:checked").parent().attr("class") == $("#sEmpName").val() 
    				|| $("#sAuthorNo").val() == "0"
    				|| $("#sAuthorNo").val() == "1"){
    			$("#pps_no").val($(".list_chbox:checked").parent().attr("name"));
    			makeTwoBtnPopup(1, "알림", "정말 삭제하시겠습니까?", true, 500, 300, null, "삭제", function() {
    				
    				var params = $("#actionForm").serialize();
    				console.log(params);
    				$.ajax({
    					type : "post", 
    					url : "bssPpsDeleteAjax", 
    					dataType : "json",
    					data : params, 
    					success : function(result) {
    						makeAlert(2, "확인", "삭제되었습니다.", function(){
    	    					location.reload();
    	    				});
    					},
    					error : function(request, status, error) {
    						console.log("text : " + request.responseText);
    						console.log("error : " + error);
    					}
    				});
    			},"취소", function() {
    				closePopup(1);
    			});
    			}
    		else{
    			makeAlert(1, "알림", "등록자와 일치하지 않습니다.", null);
    			}
    	} else if($(".list_contents .list_chbox:checked").length == 0) {
    		makeAlert(1, "알림", "항목을 선택하세요.", null);
    	} else{
    		makeAlert(1, "알림", "항목 한개만 선택하세요.", null);
    	}
    });
    
    $("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			return false;
		}
	});
    
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		bssPpsList();
	});
	
	$(".list_paging_area").on("click","span", function(){
		//숫자가 아니면 NaN을 보여줌.
		if(($(this).attr("name") != "")) {
			$("#page").val($(this).attr("name"));
			bssPpsList();
		}
	});
	
	function bssPpsList(){
		var params = $("#actionForm").serialize();
		console.log(params);
		$.ajax({
			type : "post", 
			url : "bssPpsListAjax", 
			dataType : "json",
			data : params, 
			success : function(result) {
				redrawbssPpsList(result.list);
				redrawPaging(result.pb);
				departList(result.departList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function redrawbssPpsList(list) {
		var html = "";
		
		if(list.length == 0)
			{
		$(".list_paging_area").hide();
			html += "<tr class=\"list_contents\" style=\"height: 500px\">";
			html += "<td colspan=\"10\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			}
		else
		
			{
			for(var i in list) {
				arr[i] = i;
				$(".list_paging_area").show();
				html += "<tr name=\"" + list[i].PPS_NO + "\" class = \"list_contents\">";
				html += "<td name=\"" + list[i].PPS_NO + "\" class = \"" + list[i].EMP_NAME + "\">";
				html += "<input type=\"checkbox\" class=\"list_chbox\" id=\"chk_"+ i +"\">";
				html += "<label for=\"chk_"+ i +"\" class=\"chbox_lbl\"></label>";
				html += "</td>";
				html += "<td>" + list[i].PPS_NO + "</td>";
				html += "<td>" + list[i].PPS_NAME + "</td>";
				html += "<td>" + list[i].PPS_SALES + "</td>";
				html += "<td>" + list[i].EMP_NAME + "</td>";
				html += "<td>" + list[i].PPS_YEAR + "</td>";
				html += "<td>" + list[i].PPS_DATE + "</td>";
				html += "<td>" + list[i].MGR_NAME + "</td>";
				html += "<td>" + list[i].MGR_EMAIL + "</td>";
				html += "<td>" + list[i].DEPART_NAME + "</td>";
				html += "</tr>";
				}
			}
		$(".table_list>tbody").html(html);
	}
	function redrawPaging(pb) {
		var html = "";
		//처음
		html += "<span class=\"btn_paging\" name=\"1\"><<</span>&nbsp;";
		//이전
		if($("#page").val() == "1") {
			html += "<span class=\"btn_paging\" name=\"1\"><</span>&nbsp;";
		}
		else
			{
			html += "<span class=\"btn_paging\" name=\"" + ($("#page").val() * 1 - 1) + "\"><</span>&nbsp;";
			}
		//숫자
		for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
			if($("#page").val() == i) {
				html += "<span class=\"btn_paging_on\"><b>" + i + "</b></span>&nbsp;";
			}
			else
				{
				html += "<span class=\"btn_paging\" name=\"" + i + "\">" + i + "</span>&nbsp;";
				}	
			}
		//다음
		if($("#page").val() == pb.maxPcount) {
			html += "<span class=\"btn_paging\" name=\"" + pb.maxPcount + "\">></span>&nbsp;";
		}
		else
			{
			html += "<span class=\"btn_paging\" name=\"" + ($("#page").val() * 1 + 1) + "\">></span>&nbsp;";
			}
		//마지막
		html += "<span class=\"btn_paging\" name=\"" + pb.maxPcount + "\">>></span>";
		
		$(".list_paging_area").html(html);
	}
});
	function departList(list){
		var html = "";
		html += "<option value=\"0\">부서 전체</option>"		
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
</script>
<style type="text/css">
.mgle10 {
	margin-left: 10px;
}
</style>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">23</c:param>
	</c:import>
	<div class="title_area">목표목록</div>
	<div class="content_area">
	<!-- 여기에 내용을 구현 -->
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="sEmpName" id="sEmpName" value="${sEmpName}"/>
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}"/>
			<input type="hidden" name="sAuthorNo" id="sAuthorNo" value="${sAuthorNo}"/>
			<input type="hidden" name="page" id="page" value="1"/>
			<input type="hidden" name="pps_no" id="pps_no"/>
         <div class="list_wrap">
			<div class="list_top_area">
			</div>
				<div class="table_top_area">
               	<div class="top_title_area">
               		<select class="input_short" name="searchDepart" id="searchDepart">
                        </select>
               	</div>
               	<div class="top_btn_area" >
               	<c:if test="${sAuthorNo eq 0 or sAuthorNo eq 1 or sAuthorNo eq 2 or sAuthorNo eq 4}">
               		<div class="btn btn_yellow btn_size_normal" id="add">등록</div>
               		<div class="btn btn_yellow btn_size_normal" id="edit">수정</div>
                    <div class="btn btn_yellow btn_size_normal" id="delete">삭제</div>
                    </c:if>
               	</div>
               	<div class="top_title_area">
                	<div>
                        <!-- #개 항목중 #개 선택  -->
                	</div>
                </div>
               	<div class="top_btn_area">
					<select class="input_short" name="searchYear" id="searchYear">
                            <option selected="selected" value="0">년도 전체</option>
                            <option value="1">2020</option>
                            <option value="2">2021</option>
                            <option value="3">2022</option>
                            <option value="4">2023</option>
                        </select>
               			<select class="input_short mgle10" name="searchGbn">
                            <option value="0">적요</option>
                            <option value="1">등록자</option>
                            <option value="2">담당자</option>
                        </select>
                  		<input type="text" class="input_wfix input_search" id="searchTxt" name="searchTxt" placeholder="검색어 입력" />
                  		<div class="btn btn_black btn_size_normal" id="searchBtn">검색</div>
               	</div>
            </div>
				<table class="table_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/>
					<col width="20%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<thead>
					<tr class="table_list_header">
						<td></td>
						<td>no</td>
						<td>적요 명</td>
						<td>목표매출</td>
						<td>등록자</td>
						<td>기준년도</td>
						<td>등록일자</td>
						<td>담당자</td>
						<td>담당자 이메일</td>
						<td>부서</td>
					</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="list_paging_area">
				</div>
			</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>