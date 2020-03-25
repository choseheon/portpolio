<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/cmp/channelSelect.css" />
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	chSelect();
	var a = new Array();
	a = $("#ch").val();
	
	$("#back_Btn").on("click",function(){
		location.href="targetSelect";
	});
	
	if(a[2] != 0 && a[2]!=undefined){
		//sms를 보여줘야해
		smsListdraw();
	}
	
	if(a[6] != 0 && a[6]!=undefined){
		//mms를 보여줘야해
		mmsListdraw();
	}
	if(a[10] !=0 && a[10]!=undefined){
		emailListdraw();
	}
	
	function chSelect(){
		
		var param= $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "selectChAjax",
			dataType : "json", 
			data : param, 
			success : function(res){
				drawCh(res.list);
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		}); 
	}
	function drawCh(list){
		for(var i in list){
			if(list[i].CHANNEL_NO == 1){
				$("#content").val(list[i].CONTENTS);
				$("#compNo").val(list[i].CHANNEL_COMP_NO);
				smsListdraw();
				
			}
			else if(list[i].CHANNEL_NO == 2){
				$("#content").val(list[i].CONTENTS);
				mmsListdraw();
			}
			else{
				$("#content").val(list[i].CONTENTS);
				emailListdraw();
			}
		}
	}
	
	$("#back_Btn").on("click",function(){
		location.href="targetSelect";		
	});
	
	$("#save_Btn").on("click",function(){
		if(a[2] != 0 && a[2] != undefined){
			$("#chNo").val(1);
			if($.trim($("#smsArea").val()) ==""){
				$("#smsArea").focus();
			}
			else{
				$("#content").val($("#smsArea").val());
				$('input:radio[name="sms"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				saveChannel();
			}
		}
		
		if (a[6] != 0 && a[6]!=undefined){
			$("#chNo").val("2");
			if($.trim($("#mmsArea").val()) ==""){
				$("#mmsArea").focus();
			}
			else {
				$("#content").val($("#mmsArea").val());
				$('input:radio[name="mms"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				saveChannel();
			}
		}
		
		if(a[10] != 0 && a[10] != undefined){
				$("#chNo").val(3);
			if($.trim($("#emailArea").val()) ==""){
				$("#emailArea").focus();
			}
			else{
				$("#content").val($("#emailArea").val());
				$('input:radio[name="email"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				saveChannel();
			}
		}
	});

	$(".next_Btn").on("click", function(){
		if(a[2] != 0){
			$("#chNo").val(1);
			if($.trim($("#smsArea").val()) ==""){
				alert("sms내용을 입력하세요.");
				$("#smsArea").focus();
			}
			else{
				$("#content").val($("#smsArea").val());
				$('input:radio[name="sms"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				simul();
			}
		}
		
		if (a[6] != 0){
			$("#chNo").val("2");
			if($.trim($("#mmsArea").val()) ==""){
				alert("MMS내용을 입력하세요.");
				$("#mmsArea").focus();
			}
			else {
				$("#content").val($("#mmsArea").val());
				$('input:radio[name="mms"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				simul();
			}
		}
		
		if(a[10] != 0){
				$("#chNo").val(3);
			if($.trim($("#emailArea").val()) ==""){
				alert("내용을 입력하세요.");
				$("#emailArea").focus();
			}
			else{
				$("#content").val($("#emailArea").val());
				$('input:radio[name="email"]:checked').each(function(){
					$("#compNo").val($(this).val());
				});
				simul();
			}
		}
	});
	
	function saveChannel(){
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "SaveAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS"){
					
					alert("저장에 성공하였습니다.");
					location.href="cmpList";
				}else{
					alert("작성에 실패하였습니다.");
					}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	function simul() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "SaveAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS"){
					
					$.ajax({
						type : "post",
						url : "updatestatAjax", 
						dataType : "json", 
						data : params, 
						success : function(res){
							$("#actionForm").attr("action","simResult");
							$("#actionForm").submit();
						},
						error : function(request,status, error){
							console.log("text : " + request.responseText);
							console.log("error : " + error);
						}
					});
					alert("저장에 성공하였습니다.");
					
				}else{
					alert("작성에 실패하였습니다.");
					}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	/* sms */
	function smsListdraw(){
		var params=$("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "chcpListAjax", 
			dataType : "json", 
			data : params, 
			success : function(result){
				smsList(result.list);
				
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	/* 1SMS */
	function smsList(list){
		var html = "";
		if(list.length == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">등록된 업체가 없습니다.</td>";
			html += "</tr>";
		}
		else{
			html += "	<table class=\"sms_table\" style=\"display:inline-block; vertical-align:top;\">";
			html += "	<thead>";
			html += "		<tr class=\"sample_1\">";
			html += "			<td class=\"sample_title1\"></td>";
			html += "			<td class=\"sample_title3\">업체</td>";
			html += "			<td class=\"sample_title5\">기간</td>";
			html += "			<td class=\"sample_title6\">금액</td>";
			html += "		</tr>";
			html += "	</thead>";
			html += "	<tbody>";
		for(var i in list){
			html += "<tr class =\"td_font\" name=\""+list[i].CHANNEL_COMP_NO+ "\">";
			if(list[i].CHANNEL_COMP_NO == $("#compNo").val()){
				html += "<td><input type=\"radio\" name=\"sms\" value=\"" + list[i].CHANNEL_COMP_NO + "\" checked=\"true\"></td>";				
			}else{
				html += "<td><input type=\"radio\" name=\"sms\" value=\"" + list[i].CHANNEL_COMP_NO + "\"></td>";				
			}
			html += "<td>"+list[i].COMPANY_NAME+"</td>";
			html += "<td>"+list[i].SDATE +  " ~ "  + list[i].EDATE + "</td>";
			html += "<td>"+list[i].MONEY+"</td>";
			html += "</tr>"; 
		}
			html += "	</tbody>                                                                                                                       ";
			html += "	                                                                                                                               ";
			html += "</table>                                                                                                                          ";
			html += "<div class=\"sms_area\" style=\"display:inline-block;\">                                                                          ";
			html += " 	<div class=\"sms_title\"><b>SMS 작성란</b></div><br/>                                                                          ";
			html += "	<textarea class=\"sms_content\" id=\"smsArea\" name=\"smsArea\" col=\"10\" rows=\"8\" style=\"resize: none;\">" + $("#content").val() + "</textarea><br>  ";
			html += "</div>";
		}
		
		$(".channel_table").html(html);
	}
	
	/*2MMs*/
	function mmsListdraw(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "mmsListAjax", 
			dataType : "json", 
			data : params, 
			success : function(result){
				mmsList(result.mms);
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	
	/* 2MMs */
	function mmsList(mms){
		var html = "";
		if(mms.length == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">등록된 업체가 없습니다.</td>";
			html += "</tr>";
		}
		else{
			html += "	<table class=\"mms_table\" style=\"display:inline-block; vertical-align:top;\">                                                ";
			html += "	<thead>                                                                                                                        ";
			html += "		<tr class=\"sample_1\">                                                                                                    ";
			html += "			<td class=\"sample_title1\"></td>                                                                                    ";
			html += "			<td class=\"sample_title3\">업체</td>                                                                                  ";
			html += "			<td class=\"sample_title5\">기간</td>                                                                                  ";
			html += "			<td class=\"sample_title6\">금액</td>                                                                                  ";
			html += "		</tr>                                                                                                                      ";
			html += "	</thead>                                                                                                                       ";
			html += "	<tbody>                                                                                                                        ";
			for(var i in mms){
				html += "<tr class =\"td_font\" name=\""+mms[i].CHANNEL_COMP_NO+ "\">";
				html += "<td><input type=\"radio\" name=\"mms\" value=\"" + mms[i].CHANNEL_COMP_NO + "\"></td>";
				html += "<td>"+mms[i].COMPANY_NAME+"</td>";
				html += "<td>"+mms[i].SDATE +  " ~ "  + mms[i].EDATE + "</td>";
				html += "<td>"+mms[i].MONEY+"</td>";
				html += "</tr>"; 
			}
			html += "	</tbody>                                                                                                                       ";
			html += "	                                                                                                                               ";
			html += "</table>                                                                                                                          ";
			html += "<div class=\"mms_area\" style=\"display:inline-block;\">                                                                          ";
			html += " 	<div class=\"sms_title\"><b>MMS 작성란</b></div><br/>                                                                          ";
			html += "	<textarea class=\"mms_content\" id=\"mmsArea\" name=\"mmsArea\" col=\"10\" rows=\"8\" style=\"resize: none;\"></textarea><br>  ";
			
			html += "<div class=\"mms_number\">";
			html += "<input type=\"text\" class =\"file_add_input\" id=\"file_name\" placeholder=\"첨부파일\"/>";
			html += "<div class=\"mms_btn\" id=\"uploadBtn\" name=\"uploadBtn\"><div>첨부</div></div>";
			html += "</div>";
			
			html += "</div>";
		}
		
		$(".channel_table2").html(html);
		
		
		$("#uploadBtn").on("click", function() {
			$(".attachUpload").click();
		});
		
		$(".attachUpload").on("change", function() {
			var dataForm = $("#actionForm");
			
			dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
				success: function(responseText, statusText){
					if(typeof responseText.fileName != "undefined") {
						$("#attachFile").val(responseText.fileName[0]);
						
						/* $(".attach_image").css("background-image", "url('resources/upload/" + responseText.fileName[0] + "')") */
						$("#file_name").val(responseText.fileName[0]);
					}
				}, //ajax error
				error: function(){
					alert("에러발생!!"); 
				}
			});
			
			dataForm.submit();
		});
	}
	
	/*3email*/
	function emailListdraw(){
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "emailListAjax", 
			dataType : "json", 
			data : params, 
			success : function(result){
				emailList(result.email);
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	/* 3email */
	function emailList(email){
		var html = "";
		if(email.length == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">등록된 업체가 없습니다.</td>";
			html += "</tr>";
		}
		else{
			html += "	<table class=\"email_table\" style=\"display:inline-block; vertical-align:top;\">                                                ";
			html += "	<thead>                                                                                                                        ";
			html += "		<tr class=\"sample_1\">                                                                                                    ";
			html += "			<td class=\"sample_title1\"></td>                                                                                    ";
			html += "			<td class=\"sample_title3\">업체</td>                                                                                  ";
			html += "			<td class=\"sample_title5\">기간</td>                                                                                  ";
			html += "			<td class=\"sample_title6\">금액</td>                                                                                  ";
			html += "		</tr>                                                                                                                      ";
			html += "	</thead>                                                                                                                       ";
			html += "	<tbody>                                                                                                                        ";
			for(var i in email){
				html += "<tr class =\"td_font\" name=\""+email[i].CHANNEL_COMP_NO+ "\">";
				html += "<td><input type=\"radio\" name=\"email\" value=\"" + email[i].CHANNEL_COMP_NO + "\"></td>";
				html += "<td>"+email[i].COMPANY_NAME+"</td>";
				html += "<td>"+email[i].SDATE +  " ~ "  + email[i].EDATE + "</td>";
				html += "<td>"+email[i].MONEY+"</td>";
				html += "</tr>"; 
			}
			html += "	</tbody>                                                                                                                       ";
			html += "	                                                                                                                               ";
			html += "</table>                                                                                                                          ";
			html += "<div class=\"email_area\" style=\"display:inline-block;\">";
			html += "<div class=\"email_title\"><b>e-Mail 작성란</b></div><br/>";
			html += "<textarea class=\"sms_content\" id=\"emailArea\" name=\"emailArea\" col=\"10\" rows=\"8\" style=\"resize: none;\"></textarea><br>";
			html += "</div>"; 
		}
		
		$(".channel_table3").html(html);
	}
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">9</c:param>
	</c:import>
	<div class="title_area">채널선정</div>
	<div class="content_area" style="width:3000px;">
		<div class="contents_wrap">
			<div class="btn_area">
				<div class="circle">1</div> &nbsp;&nbsp;
				<div class="circle">2</div> &nbsp;&nbsp;
				<div class="circle1">3</div> &nbsp;&nbsp;
				<div class="circle">4</div> &nbsp;&nbsp;
				
				<div class="save_Btn" id="save_Btn">저장</div>
				<div class="next_Btn" id="next_Btn">시뮬레이션</div>
				<div class="back_Btn" id="back_Btn">이전</div>
			</div>
			<div class="fieldset_area">
				<fieldset class="reserv_area">
					<legend>예약어 안내</legend>
						<div class="reserv_txt_area">
							<div class="reserv_txt_title">#이름#</div>
							<div class="reserv_txt_exp">고객의 이름 자동적으로 입력</div>
						</div>
						<div class="reserv_txt_area">
							<div class="reserv_txt_title">#전화번호#</div>
							<div class="reserv_txt_exp">고객의 전화번호 자동적으로 입력</div>
						</div>
						<div class="reserv_txt_area">
							<div class="reserv_txt_title">#수신거부#</div>
							<div class="reserv_txt_exp">수신거부 방법 안내</div>
							<div class="reserv_txt_exp"> ex) 수신거부 : 114</div>
						</div>
				</fieldset>
			</div>
			<br />
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="empNo" name="empNo" value="${sEmpNo}"/>
				<input type="hidden" id="seq" name="seq" value="${param.seq}"/>
				<input type="hidden" id="chboxx" name="chboxx" value="${param.chboxx}"/>
				<input type="hidden" id="ch" name="ch" value="${param.ch}"/>
				<input type="hidden" id="compNo" name="compNo"/>
				<input type="hidden" id="chNo" name="chNo"/>
				<input type="hidden" id="cmpNo" name="cmpNo" value="180" />
				<input type="hidden" id="content" name="content"/>

				<!--sms  -->
				<div class="channel_table"></div>
				<!--mms  -->
				<div class="channel_table2"></div>
				<!--email  -->
				<div class="channel_table3"></div>
			</form>
		</div> <!-- content wrap -->
	</div>
		
	<c:import url="/bottom"></c:import>

</body>
</html>