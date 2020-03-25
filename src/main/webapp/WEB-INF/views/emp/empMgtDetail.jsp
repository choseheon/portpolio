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
    
    .team_member_cnt {
    	font-size: 10pt;
    	color: #555555;
    }
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 전역 변수
	var view = 3;	// 초기 보여주는 값의 수	
	
	getTeamEmp(view);
	
	// 목록 버튼 클릭 Event
	$("#backBtn").on("click", function() {
		location.href = "empMgtList";
	});
	
	// 수정 버튼 클릭 Event
	$("#updateBtn").on("click", function() {
		$("#dataForm").attr("action", "empMgtEdit");
		$("#dataForm").submit();
	});
	
	// 삭제 버튼 클릭 Event
	$("#deleteBtn").on("click", function() {
		makeTwoBtnPopup(1, "삭제 경고", "정말 삭제 하시겠습니까?", false, 400, 200, null, "확인", function() {
			closePopup(1);
			var params = "&emp_no=" + $("#view_no").val();
						
			$.ajax({
				type: "post",
				url: "deleteEmpAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						makeAlert(1, "삭제 성공", "삭제에 성공했습니다.", null);
						location.href = "empMgtList";
					}
					else {
						makeAlert(1, "삭제 실패", "삭제에 실패했습니다.", null);
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
	});
	
	// 팀 소속 사원 펼치기/접기
	$("#viewAllBtn").on("click", function() {
		var flag = $("#all_flag").val();
		if(flag == 0) {
			var params = "&team_no=" + $("#team_no").val();

			$.ajax({
				type: "post",
				url: "getTeamCntAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					getTeamEmp(result.cnt);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
			$("#all_flag").val(1);
			$("#viewAllBtn>img").css("transform", "scaleY(-1)");
		}
		else {
			getTeamEmp(3);
			$("#all_flag").val(0);
			$("#viewAllBtn>img").css("transform", "scaleY(1)");
		}
	});
	
	// 팀 소속 사원 tr 클릭 Event
	$("#emp_list").on("click", "tr", function() {
		$("#emp_no").val($(this).attr("name"));
		$("#dataForm").attr("action", "empMgtDetail");
		$("#dataForm").submit();
	});
	
	// 팀 소속 사원 Get
	function getTeamEmp(view) {
		var params = "&team_no=" + $("#team_no").val() + "&view_cnt=" + view;

		$.ajax({
			type: "post",
			url: "getTeamEmpAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.list != null) {
					$(".team_member_cnt").html("(" + result.cnt + ")");
					drawTeamEmp(result.list);
					
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
	function drawTeamEmp(list) {
		var html = "";
		if(list.length > 0) {
			$("#team_member").show();
			$("#team_member_table").show();
			
			for(var i in list) {
				html += "<tr class=\"list_contents\" name=\"" + list[i].EMP_NO + "\">";
				html += "<td class=\"field_contents\">";
				html += "<div class=\"contents_pointer\">" + list[i].EMP_NAME + " | " + list[i].POSI_NAME + " | " + list[i].EMP_PHONE + " | " + list[i].EMP_EMAIL + "</div>";
				html += "</td>";
				html += "</tr>";
			}
		}
		else {
			$("#team_member").hide();
			$("#team_member_table").hide();
		}
		
		$("#emp_list").html(html);
	}
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">1</c:param>
	</c:import>
	<div class="title_area no_drag">사원정보</div>
	<div class="content_area">
		<form action="#" method="post" id="dataForm">
		<input type="hidden" id="emp_no" name="emp_no" />
		<input type="hidden" id="view_no" name="view_no" value="${data.EMP_NO}" />
		<div class="contents_wrap">
			<div class="table_top_area">
				<div class="top_title_area"></div>
				<div class="top_btn_area no_drag">
					<c:if test="${(sAuthorNo ne 3 and sAuthorNo ne 5) or data.EMP_NO eq sEmpNo}">
					<div class="btn btn_yellow btn_size_normal" id="updateBtn">수정</div>
					</c:if>
					<c:if test="${sAuthorNo ne 3 and sAuthorNo ne 5}">
					<div class="btn btn_yellow btn_size_normal" id="deleteBtn">삭제</div>
					</c:if>
					<div class="btn btn_yellow btn_size_normal" id="backBtn">목록</div>
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
				<tbody>
					<tr>
						<td class="field_name first_field_name no_drag">사원아이디</td>
						<td class="field_contents">
							<div>${data.EMP_ID}</div>
                        </td>
						<td class="field_name no_drag">사원명</td>
						<td class="field_contents">
                            <div>${data.EMP_NAME}</div>
                        </td>
						<td class="field_name last_field_name no_drag" rowspan="4">
							<div class="attach_image" style="background-image: url('resources/upload/${data.EMP_IMAGE}')"></div>
						</td>
					</tr>
					
					<tr>
						<td class="field_name first_field_name no_drag">생년월일</td>
						<td class="field_contents">
							<div>${data.EMP_BIRTH}</div>
						</td>
						<td class="field_name no_drag">이메일</td>
						<td class="field_contents">
							<div>${data.EMP_EMAIL}</div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">부서 및 팀</td>
						<td class="field_contents">
							<div>${data.DEPART_NAME}</div>
						</td>
						<td class="field_name no_drag">직급</td>
						<td class="field_contents">
							<div>${data.POSI_NAME}</div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">고용형태</td>
						<td class="field_contents">
                            <div>${data.FORM_NAME}</div>
                        </td>
                        <td class="field_name no_drag">휴대폰</td>
						<td class="field_contents">
                            <div>${data.EMP_PHONE}</div>
                        </td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">입사일자</td>
						<td class="field_contents">
                            <div>${data.JOIN_DATE}</div>
                        </td>
						<td class="field_name no_drag">퇴사일자</td>
						<td class="field_contents" colspan="2">
                            <div>
                   				<c:choose>
                   					<c:when test="${empty data.RESIGN_DATE}"> - </c:when>
                   					<c:otherwise>${data.RESIGN_DATE}</c:otherwise>
                   				</c:choose>
                            </div>
                        </td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">주소</td>
						<td class="field_contents" colspan="4">
							<div>
								<c:choose>
                   					<c:when test="${empty data.EMP_ZC}"></c:when>
                   					<c:otherwise>(${data.EMP_ZC}) ${data.EMP_ADDR} ${data.EMP_DETAIL_ADDR}</c:otherwise>
                   				</c:choose>
							</div>
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name no_drag">메모</td>
						<td class="field_contents" colspan="4">
                            <div><pre>${data.MEMO_CON}</pre></div>
                        </td>
					</tr>
				</tbody>
			</table>
			<div class="blank_space"></div>
			<div class="table_top_area no_drag" id="team_member">
				<div class="top_title_area">팀 소속 사원 <span class="team_member_cnt"></span></div>
				<input type="hidden" id="team_no" name="team_no" value="${data.TEAM_NO}" />
				<div class="top_btn_area">
					<div class="btn_opac-z btn_size_normal" id="viewAllBtn">
						<img src="resources/images/button/icon_align_yellow.png" alt="" />
					</div>
					<input type="hidden" id="all_flag" value="0" /> 
				</div>
			</div>
			<table class="table_normal no_drag" id="team_member_table">
				<colgroup>   
					<col width="100%" />
				</colgroup>
				<tbody id="emp_list"><tr><td style="font-size: 10pt;">조회된 데이터가 없습니다.</td></tr></tbody>
			</table>
		</div>
		</form>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>