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
	$(".input_border_0").on("keydown",function(e){
		$(".input_border_0").attr("size",$(".input_border_0").val().length);
	});

		$("#list").on("click", function(){
			location.href = "prodList"
		});
		
		$("#del").on("click", function(){
			makeTwoBtnPopup(1, "삭제메시지", "정보를 삭제하시겠습니까?", true, 400, 200, null, "확인", function() {
    			delete1();
    			delete2();
    			closePopup(1);
      		},"취소", function() {
    			closePopup(1);
    			
    		});	
       	});
			
			
		
		$("#edit").on("click", function(){
			$("#actionForm").attr("action", "goodsUpdate");
			$("#actionForm").submit();
		});
			//제품상제 아작스
		function delete1() {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "DetdeleteAjax",
				dateType : "json",
				data : params,
				success : function(result) {
						   location.href = "prodList"

		            },
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}

			})
	
		};
		function delete2() {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "Detdelete2Ajax",
				dateType : "json",
				data : params,
				success : function(result) {
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
.input_border_0{
	border: 0px;
}
</style>
</head>

<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">21</c:param>
	</c:import>
		<div class="title_area">상세보기
		</div>
		<div class="content_area">
			<!-- 여기에 내용을 구현 -->
			<div class="contents_wrap">
			<form method="post" action="#" id="actionForm">
				 <input type="hidden" id="goods_no" name="goods_no" value="${param.goods_no}"/>
				<input type="hidden" id="service_no" name="service_no" value="${param.service_no}"/>	
				<input type="hidden" id="prod" name="prod" value="${param.prod}"/>	
				<input type="hidden" id="prod_no" name="prod_no" value="${param.prod_no}"/>	
				
			
				<div class="table_top_area">
					<div class="top_title_area"></div>
					<div class="top_btn_area">
						<div class="btn_yellow btn_size_normal edit" id="edit">수정</div>
						<div class="btn_yellow btn_size_normal del" id="del">삭제</div>
						<div class="btn_yellow btn_size_normal list" id="list">목록</div>
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
							<input type="text" class="input_border_0" readonly="readonly" id="PROD_NAME1" name="PROD_NAME1" value="${data.PROD_NAME}"/>
						</td>
						<td class="field_name">제품코드
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_border_0" readonly="readonly"id="GOODS_CODE" name="GOODS_CODE" value="${data.GOODS_CODE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">제품 단가
						</td>
						<td class="field_contents">
							<input type="text" class="input_border_0" readonly="readonly"id="GOODS_PRICE" name ="GOODS_PRICE" value="${data.GOODS_PRICE}" />
						</td>
						<td class="field_name">사이즈
						</td>
					    <td class="field_contents">
							<input type="text" class="input_border_0" readonly="readonly"id="GOODS_SIZE" name="GOODS_SIZE" value="${data.GOODS_SIZE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">비고
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_border_0" readonly="readonly"id="REMARKS" name="REMARKS" value="${data.REMARKS}"/>

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
							<input type="text" class="input_border_0" readonly="readonly" id="PROD_NAME2" name="PROD_NAME2" value="${data.PROD_NAME}" />
						</td>
						<td class="field_name">서비스 코드
						<span class="acc_txt"></span>
						</td>
						<td class="field_contents" colspan="">
							<input type="text" class="input_border_0" readonly="readonly" id="SERVICE_CODE" name="SERVICE_CODE" value="${data.SERVICE_CODE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">기간
						</td>
						<td class="field_contents">
							<input type="text" class="input_border_0" readonly="readonly"id="SERVICE_PERIOD" name="SERVICE_PERIOD" value="${data.SERVICE_PERIOD}" />
						</td>
						<td class="field_name">가격
						</td>
					    <td class="field_contents">
							<input type="text" class="input_border_0" readonly="readonly"id="SERVICE_PRICE" name="SERVICE_PRICE" value="${data.SERVICE_PRICE}" />
						</td>
					</tr>
					<tr>
						<td class="field_name first_field_name">설치비용
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_border_0" readonly="readonly" id="INSTALL_PRICE" name="INSTALL_PRICE" value="${data.INSTALL_PRICE}"/>

					</tr>
					<tr>
						<td class="field_name first_field_name">비고
						</td>
						<td class="field_contents"colspan="3">
							<input type="text" class="input_border_0" readonly="readonly" id="REMARKS" name="REMARKS" value="${data.REMARKS}" />

					</tr>
					
					
					
				</table>
				</c:if>
				</form>
			</div>
		</div>
</body>
</html>