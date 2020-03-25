<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>제품 </title>
<c:import url="/header"></c:import>
<script type="text/javascript">
//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
$(document).ready(function() {
	$(".input_normal").on("keydown",function(e){
		$(".input_normal").attr("size",$(".input_normal").val().length);
	});

		
		$("#cancel").on("click", function(){
			history.back();
       	});
		
		
		$("#save").on("click", function(){
			makeTwoBtnPopup(1, "수정메시지", "수정을 저장하시겠습니까?", true, 400, 200, null, "확인", function() {
				update2()
				update1()
      		},"취소", function() {
      			makeAlert(1, "하이", "내용임", null);
    			closePopup(1);
    			
    		});			
		});
			
			//제품수정 아작스
		function update1() {
			var params = $("#actionForm").serialize();
		
			$.ajax({
				type : "post",
				url : "DetupdateAjax",
				dateType : "json",
				data : params,
				success : function(result) {
					  if(result.res == "SUCCESS") {
						  makeAlert(1, "수정창", "수정완료", null);
		            	   location.href= "prodList";

		               }
		               else {
		            	   alert("ㅈ버그")
		            	   location.href= "prodList";
		               }
		            },
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}

			})
	
		};
		
		function update2() {
			var params = $("#actionForm").serialize();
		
			$.ajax({
				type : "post",
				url : "Detupdate2Ajax",
				dateType : "json",
				data : params,
				success : function(result) {
					  if(result.res == "SUCCESS") {
		               }
		               else {
		            	   alert("ㅈ버그")
		            	   location.href= "prodList";
		               }
		            },
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}

			})
	
		};
		
			
		           	
		
		
});
</script>
<style type="text/css">
</style>
</head>

<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">21</c:param>
	</c:import>
		<div class="title_area">수정</div>
		<div class="content_area">
			<!-- 여기에 내용을 구현 -->
			<div class="contents_wrap">
			<form method="post" action="#" id="actionForm">
				<input type="hidden" id="goods_no" name="goods_no" value="${param.goods_no}"/> 
				<input type="hidden" id="service_no" name="service_no" value="${param.service_no}"/>
				<input type="hidden" id="prod" name="prod" value="${param.prod }"/>	
				<input type="hidden" id="prod_no" name="prod_no" value="${param.prod_no}"/>	
				
			
				<div class="table_top_area">
					<div class="top_title_area"></div>
					<div class="top_btn_area">
						<div class="btn_yellow btn_size_normal save" id="save">저장</div>
						<div class="btn_yellow btn_size_normal cancel" id="cancel">취소</div>
					</div>
				</div>
				
				
				
				<c:if test="${!empty param.goods_no}">
				<table class="table_normal">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<td class="field_name first_field_name">상품명
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_normal" name="prod_name1" id="prod_name1"  value="${param.PROD_NAME1}"/>
						</td>
						<td class="field_name">제품코드
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_normal" readonly="readonly"   value="${param.GOODS_CODE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">제품 단가
						</td>
						<td class="field_contents">
							<input type="text" class="input_normal" name="goods_price" id="goods_price" value="${param.GOODS_PRICE}" />
						</td>
						<td class="field_name">사이즈
						</td>
					    <td class="field_contents">
							<input type="text" class="input_normal" name="goods_size" id="goods_size" value="${param.GOODS_SIZE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">비고
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_normal" name="remarks" id="remarks" value="${param.REMARKS}"/>

					</tr>
					
					
				</table>
					</c:if>
					
					<c:if test="${!empty param.service_no}">
				<table class="table_normal">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<td class="field_name first_field_name">상품명
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_normal" id="prod_name2" name="prod_name2" value="${param.PROD_NAME2}" />
						</td>
						<td class="field_name">서비스 코드
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_normal" readonly="readonly"  value="${param.SERVICE_CODE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">기간
						</td>
						<td class="field_contents">
							<input type="text" class="input_normal" name="service_period" value="${param.SERVICE_PERIOD}" />
						</td>
						<td class="field_name">가격
						</td>
					    <td class="field_contents">
							<input type="text" class="input_normal" name="service_price" value="${param.SERVICE_PRICE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">설치비용
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_normal" name="install_price" value="${param.INSTALL_PRICE}"/>

					</tr>
					<tr>
						<td class="field_name first_field_name">비고
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_normal"name="remarks" value="${param.REMARKS}" />

					</tr>
					
					
					
				</table>
				</c:if>
				</form>
			</div>
		</div>
</body>
</html>