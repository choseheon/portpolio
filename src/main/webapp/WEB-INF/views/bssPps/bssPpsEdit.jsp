<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연간부서목표_수정</title>
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
<script type="text/javascript">
//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
$(document).ready(function() {
	
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
    $("#cancel").on("click", function(){
    	location.href = "bssPpsList";
    });
    $("#edit").on("click", function() {
    	if ($.trim($("#pps_name").val()) == "") {
    		makeAlert(1, "알림", "적요 명을 입력하세오.", null);
    		$("#pps_name").focus();
    	} 
    	else if ($.trim($("#pps_sales").val()) == "") {
    		makeAlert(1, "알림", "예상매출을 입력하세오.", null);
    		$("#pps_sales").focus();
    	}
    	else if ($.trim($("#pps_year").val()) == "년도선택") {
    		makeAlert(1, "알림", "년도를 선택하세오.", null);
    		$("#pps_year").focus();
    	}
    	else if ($.trim($("#mgr_name").val()) == "") {
    		makeAlert(1, "알림", "담당자를 선택하세오.", null);
    		$("#mgr_name").focus();
    	}else {
    		var params = $("#actionForm").serialize();

    		$.ajax({
    			type : "post", //데이터 전송방식
    			url : "bssPpsEditAjax", //주소
    			dataType : "json", //데이터 전송규격
    			data : params, //보낼 데이터
    			success : function(result) {
    				
    					makeAlert(1, "성공", "수정이 완료되었습니다.", function(){
    						
    					location.href = "bssPpsList";

    					});
    					
    			},
    			error : function(request, status, error) {
    				console.log("status : " + request.status);
    				console.log("text : " + request.responseText);
    				console.log("error : " + error);
    			}
    		});
    	}
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
			url: "EmpPopAjax",
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
				html += "<tr class=\"list_contents\" name=\"" + list[i].EMP_NO + "~" + list[i].EMP_NAME + "~" + list[i].EMP_EMAIL + "~" + list[i].DEPART_NAME + "~" + list[i].DEPART_NO + "\">";
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
		$(".pop_list>tbody").on("click", "tr", function() {
			var select = $(this).attr("name");
			var array = select.split("~");
			$("#mgr_name").val(array[1]);
			$("#depart_name").val(array[3]);
			$("#mgr_email").val(array[2]);
			$("#mgr_no").val(array[0]);
			$("#depart_no").val(array[4]);
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
	/* 어려움.. */
	//금액입력자동콤마 num_only2 : 숫자입력시 3자리단위로 콤마입력
    $(document).on('keyup', 'input#pps_sales', function(e){
        if( $(this).val() != null && $(this).val() != '' ) {
            //var tmps = $(this).val().replace(/[^0-9]/g, '');
            var tmps = parseInt($(this).val().replace(/[^0-9]/g, '')) || 0;
            var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            $(this).val(tmps2);
        }
    });
	
    var date = new Date(); 
    var year = date.getFullYear(); 
    var month = new String(date.getMonth()+1); 
    var day = new String(date.getDate()); 

    // 한자리수일 경우 0을 채워준다. 
    if(month.length == 1){ 
      month = "0" + month; 
    } 
    if(day.length == 1){ 
      day = "0" + day; 
    } 

    $("#pps_date").val(year + "-" + month + "-" + day);
    
    $("#pps_name").on("keyup", function(){
    	if($(this).val().length > 20) {
    		$(this).val($(this).val().substring(0,20));
    	}
    });
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">23</c:param>
	</c:import>
	<div class="title_area">목표 수정</div>
	<div class="content_area">
	<!-- 여기에 내용을 구현 -->
	<form action="#" id="actionForm" method="post">
	<input type="hidden" id="mgr_no" name="mgr_no"/>
	<input type="hidden" id="depart_no" name="depart_no"/>	
	<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}"/>	
	<input type="hidden" id="pps_no" name="pps_no" value="${param.pps_no}"/>	
	<div class="contents_wrap">
		<div class="table_top_area">
			<div class="top_title_area">
			</div>
			<div class="top_btn_area">
				<div class="btn_yellow btn_size_normal" id="edit">수정</div>
				<div class="btn_yellow btn_size_normal" id="cancel">취소</div>
			</div>
		</div>
			<table class="table_normal">
				<colgroup>	
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>
				<tr>
                <td class="field_name first_field_name">
                    	적요 명<span class="acc_txt">*</span>
                    </td>
                    <td class="field_contents" colspan="3">
                        <input type="text" class=input_normal placeholder="최대 20자 이내" id="pps_name" name="pps_name" value="${data.PPS_NAME}"/>
                    </td>
                </tr> 
                <tr>
                	 <td class="field_name first_field_name">
                 	       목표매출 <span class="acc_txt">*</span>
                    </td>
                   <td class="field_contents" colspan="3">
                        <input type="text" class="input_normal" id="pps_sales" name="pps_sales" value="${data.PPS_SALES}"/>
                    </td>
                </tr>               
                <tr>
                <td class="field_name first_field_name">
                    	기준년도<span class="acc_txt">*</span>
                    </td>
                    <td class="field_contents">
                    <select class="input_normal" id="pps_year" name="pps_year">
                            <option selected="selected">년도선택</option>
                            <option >2020</option>
                            <option >2021</option>
                            <option >2022</option>
                            <option >2023</option>
                        </select>
                    </td>
                 	<td class="field_name">
                    	수정일자
                    </td>
                    <td class="field_contents">
                        <input type="text" class="input_normal input_readonly" readonly="readonly" id="pps_date" name="pps_date"/>
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name">
                    	등록자<span class="acc_txt">*</span>
                    </td>
                    <td class="field_contents">
                        <input type="text" class="input_normal" readonly="readonly" id="emp_name" name="emp_name" value="${sEmpName}"/>
                    </td>
                    <td class="field_name">
                 	       부서담당자 <span class="acc_txt">*</span>
                    </td>
                    <td class="field_contents">
                        <input type="text" class="input_normal input_readonly" style="width: calc(100% - 100px) !important" 
                        readonly="readonly" id="mgr_name" name="mgr_name" value="${data.MGR_NAME}"/><div class="btn_black btn_size_normal" id="select">검색</div>
                    </td>
                </tr>
                <tr>
                <td class="field_name first_field_name">
                 	       부서
                    </td>
                    <td class="field_contents">
                    	<input type="text" class="input_normal input_readonly" readonly="readonly" id="depart_name" name="depart_name" value="${data.DEPART_NAME}"/>
                    </td>
                <td class="field_name">
                 	   	담당자 이메일
                    </td>
                    <td class="field_contents">
                    	<input type="text" class="input_normal input_readonly" readonly="readonly" id="mgr_email" name="mgr_email" value="${data.MGR_EMAIL}"/>
                    </td>
                </tr>
			</table>
	</div>
	</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>