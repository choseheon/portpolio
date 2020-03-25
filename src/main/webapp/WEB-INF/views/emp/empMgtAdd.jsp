<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
<c:import url="/header"></c:import>
<!-- 주소 API -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<style type="text/css">
    .attach_image {
        display: inline-block;
        width: 80%;
        height: 130px;

        background-color: #ffffff;
        border: 1px solid #cacaca;
        background-size: 100% 100%;

        text-align: center;
    }
    
    .attachUpload {
    	display: none;
    }
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 전화번호 자동 하이푼
	$("#emp_ph").on("keyup keypress", function() {
		var num = $(this).val();
		var ph_num = num.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-");
		$(this).val(ph_num);
	});
	
	// 이메일 중복 검사
	$("#emp_email").on("focusout", function() {
		var params = $("#dataForm").serialize();

		$.ajax({
			type: "post",
			url: "checkEmailAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				$("#email_chk").val(result.cnt);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	});
	
	// 저장버튼 클릭 이벤트
	$("#saveBtn").on("click", function() {
		// 정규식 - 이메일 유효성 검사
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        // 정규식 -전화번호 유효성 검사
        var regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
        // 생일 정규식
        var regBirth = /^\d{6}$/;
		
		// 필수조건 미입력 체크
		if($.trim($("#emp_name").val()) == "" || $.trim($("#emp_birth").val()) == "" 
		|| $("#emp_posi option:selected").val() == 0 || $("#emp_depart option:selected").val() == 0 
		|| $("#emp_team option:selected").val() == 0 || $.trim($("#emp_ph").val()) == ""
		|| $.trim($("#emp_email").val()) == "" || $.trim($("#emp_jdate").val()) == "") {
			makeAlert(1, "필수조건 미입력", "필수조건을 입력해야합니다.", null);
		}
		else if($("#email_chk").val() == 0) {
			makeAlert(1, "이메일 중복", "이메일이 중복되었습니다.", null);
		}
		else if(!regPhone.exec($("#emp_ph").val())) {
			makeAlert(1, "전화번호 유효성 위반", "전화번호가 유효하지 않습니다. 다시 입력해주세요.", function() {
				$("#emp_ph").focus();
			});
		}
		else if(!regEmail.test($("#emp_email").val())) {
			makeAlert(1, "이메일 유효성 위반", "이메일이 유효하지 않습니다. 다시 입력해주세요.", function() {
				$("#emp_email").focus();
			});
		}
		else if(!regBirth.test($("#emp_birth").val())) {
			makeAlert(1, "생년월일 유효성 위반", "생년월일이 유효하지 않습니다. 다시 입력해주세요.", function() {
				$("#emp_birth").focus();
			});
		}
		else if($.trim($("#emp_zc").val()) == "" && $.trim($("#emp_det_addr").val()) != "" ) {
			makeAlert(1, "주소 입력 오류", "기본 주소가 선택되지 않았습니다.", null);
		}
		else {
			$("#emp_id").val($("#emp_email").val());
			$("#emp_pw").val($("#emp_birth").val());
			$("#emp_form").val($('input[name="emp-form"]:checked').val());
			$("#emp_author").val($('input[name="access-author"]:checked').val());
			
			var params = $("#dataForm").serialize();

			$.ajax({
				type: "post",
				url: "addEmpAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						makeAlert(1, "등록 성공", "성공적으로 등록했습니다.<br/>초기 아이디와 비밀번호는 이메일주소와 생년월일입니다.", function() {
							location.href = "empMgtList";
						});
					}
					else {
						makeAlert(1, "등록 실패", "데이터가 유효하지 않아 등록에 실패했습니다.", null);
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
	
	// 취소버튼 클릭 이벤트
	$("#cancelBtn").on("click", function() {
		history.back();
	});
	
	// 주소 검색 버튼 클릭 Event
	$("#searchAddrBtn").postcodifyPopUp();
	
	// 부서 select 변경 감지 이벤트
	$("#emp_depart").on("change", function() {
		if($("#emp_depart option:selected").val() != 0) {
			$("#emp_team").removeClass("input_readonly");
			$("#emp_team").removeAttr("disabled");
			
			var params = "&depart_no=" + $("#emp_depart option:selected").val();

			$.ajax({
				type: "post",
				url: "getTeamListAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					teamSet(result.team);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
		else {
			$("#emp_team").addClass("input_readonly");
			$("#emp_team option:selected").removeAttr("selected");
			$('#emp_team option[value="0"]').attr("selected", "selected");
			$("#emp_team").attr("disabled", "disabled");
		}
	});
	
	$("#attachBtn").on("click", function() {
		$(".attachUpload").click();
	});
	
	$(".attachUpload").on("change", function() {
		var dataForm = $("#dataForm");
		
		dataForm.ajaxForm({ //보내기전 validation check가 필요할경우 
			success: function(responseText, statusText){
				$("#attachFile").val(responseText.fileName[0]);
				
				$(".attach_image").css("background-image", "url('resources/upload/" + responseText.fileName[0] + "')")
			}, //ajax error
			error: function(){
				alert("에러발생!!"); 
			}
		});
		
		dataForm.submit();
	});
	
	// 팀 List Set
	function teamSet(team) {
		var html = "<option selected=\"selected\" value=\"0\">없음</option>";
		
		for(var i in team) {
			html += "<option value=\"" + team[i].TEAM_NO + "\">" + team[i].TEAM_NAME + "</option>";
		}
		$("#emp_team").html(html);
	}
	
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">1</c:param>
	</c:import>
	<div class="title_area no_drag">사원 등록</div>
	<div class="content_area">
		<form action="fileUploadAjax" method="post" id="dataForm" enctype="multipart/form-data">
		<input type="hidden" id="emp_id" name="emp_id"/>
		<input type="hidden" id="emp_pw" name="emp_pw"/>
		<input type="hidden" id="emp_form" name="emp_form"/>
		<input type="hidden" id="emp_author" name="emp_author"/>
		<div class="contents_wrap">
			<div class="table_top_area">
				<div class="top_title_area"></div>
				<div class="top_btn_area no_drag">
					<div class="btn btn_yellow btn_size_normal" id="saveBtn">저장</div>
					<div class="btn btn_yellow btn_size_normal" id="cancelBtn">취소</div>
				</div>
			</div>
			<table class="table_normal">
				<colgroup>   
                    <col width="10%" />
                    <col width="40%" />
                    <col width="10%" />
                    <col width="28%" />
                    <col width="12%" />
                </colgroup>
                <tr>
                    <td class="field_name first_field_name no_drag">사원명 <span class="acc_txt">*</span></td>
                    <td class="field_contents">
                        <input type="text" class="input_normal" id="emp_name" name="emp_name" />
                    </td>
                    <td class="field_name no_drag">생년월일 <span class="acc_txt">*</span></td>
                    <td class="field_contents">
                        <input type="text" class="input_normal" id="emp_birth" name="emp_birth" placeholder="ex) 081216" />
                    </td>
                    <td class="field_name last_field_name" rowspan="4">
                        <div class="attach_image"></div>
                        <div class="btn_black btn_size_w100 no_drag" id="attachBtn">첨부</div>
                        <input type="file" name="attach" class="attachUpload" accept="image/*"/>
                        <input type="hidden" name="attachFile" id="attachFile" />
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">
                    	직급 <span class="acc_txt">*</span>
                    </td>
                    <td class="field_contents">
                        <select class="input_normal" id="emp_posi" name="emp_posi">
                            <option selected="selected" value="0">- - 선택 - -</option>
                            <c:forEach var="posi" items="${posi}">
                            	<option value="${posi.POSI_NO}">${posi.POSI_NAME}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="field_name no_drag">고용형태 <span class="acc_txt">*</span></td>
                    <td class="field_contents">
                    	<c:forEach var="form" items="${form}" varStatus="status">
                    		<c:choose>
                    			<c:when test="${status.first}"><input type="radio" class="emp_form" id="form_${form.FORM_NO}" name="emp-form" checked="checked" value="${form.FORM_NO}"/></c:when>
                    			<c:otherwise><input type="radio" class="emp_form" id="form_${form.FORM_NO}" name="emp-form" value="${form.FORM_NO}"/></c:otherwise>
                    		</c:choose>
                        	<label for="form_${form.FORM_NO}" class="emp_form">${form.FORM_NAME}</label>&nbsp;&nbsp;
                    	</c:forEach>
                    </td>
                </tr>
                <tr>
                	<td class="field_name first_field_name no_drag">부서 및 팀 <span class="acc_txt">*</span></td>
                    <td class="field_contents" style="font-size: 0;">
                        <div class="td_half_area" style="padding-right: 5px;">
                            <select class="input_normal" id="emp_depart" name="emp_depart">
                                <option selected="selected" value="0">없음</option>
                                <c:forEach var="depart" items="${depart}">
                            	<option value="${depart.DEPART_NO}">${depart.DEPART_NAME}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <div class="td_half_area" style="padding-left: 5px;">
                            <select class="input_normal input_readonly" disabled="disabled" style="vertical-align: inherit;" id="emp_team" name="emp_team">
                                <option selected="selected" value="0">없음</option>
                            </select>
                        </div>
                    </td>
                    <td class="field_name no_drag">휴대폰 <span class="acc_txt">*</span></td>
                    <td class="field_contents">
                        <input type="text" class="input_normal" placeholder="'-' 포함" id="emp_ph" name="emp_ph" />
                    </td>
                    
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">이메일 <span class="acc_txt">*</span></td>
                    <td class="field_contents" colspan="3">
                        <input type="text" class="input_normal" id="emp_email" name="emp_email" />
                        <input type="hidden" id="email_chk" value="0" />
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">입사일자 <span class="acc_txt">*</span></td>
                    <td class="field_contents">
                        <input type="date" class="input_normal" id="emp_jdate" name="emp_jdate"/>
                    </td>
                    <td class="field_name no_drag">퇴사일자</td>
                    <td class="field_contents" colspan="2">
                        <input type="date" class="input_normal input_readonly" readonly="readonly" id="emp_rdate" name="emp_rdate"/>
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">권한 <span class="acc_txt">*</span></td>
                    <td class="field_contents" colspan="4">
                    	<c:forEach var="author" items="${author}" varStatus="status">
                    		<c:choose>
                    			<c:when test="${status.first}"><input type="radio" class="emp_form" id="author_${author.AUTH_NO}" name="access-author" checked="checked" value="${author.AUTH_NO}"/></c:when>
                    			<c:otherwise><input type="radio" class="emp_form" id="author_${author.AUTH_NO}" name="access-author" value="${author.AUTH_NO}"/></c:otherwise>
                    		</c:choose>
                        	<label for="author_${author.AUTH_NO}" class="emp_form">${author.AUTH_NAME}</label>&nbsp;&nbsp;
                    	</c:forEach>
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">주소</td>
                    <td class="field_contents" colspan="4">
                        <div class="address_margin">
                            <input type="text" class="input_short input_readonly postcodify_postcode5" readonly="readonly" placeholder="우편번호" id="emp_zc" name="emp_zc"/>
                            <div class="btn btn_black btn_size_normal no_drag" id="searchAddrBtn">검색</div>
                        </div>
                        <div class="address_margin">
                            <input type="text" class="input_normal input_readonly postcodify_address" readonly="readonly" placeholder="주소" id="emp_addr" name="emp_addr"/>
                        </div>
                        <div><input type="text" class="input_normal postcodify_details" placeholder="상세주소" id="emp_det_addr" name="emp_det_addr"/></div>
                    </td>
                </tr>
                <tr>
                    <td class="field_name first_field_name no_drag">메모</td>
                    <td class="field_contents" colspan="4">
                        <textarea class="textarea_normal" id="emp_memo" name="emp_memo"></textarea>
                    </td>
                </tr>
			</table>
		</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>