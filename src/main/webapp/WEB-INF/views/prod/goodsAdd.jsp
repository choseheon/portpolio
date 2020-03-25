<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품/서비스 등록</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	$(document).ready(function() {
		$("#Service").hide();
		$("#service_add").hide();
		$("#prod").change(function() {
			if ($("#prod").val() == 2) {
				$("#Goods").hide();
				$("#Service").show();
				$("#service_add").show();
				$("#goods_add").hide();
			} else {
				
				$("#Goods").show();
				$("#Service").hide();
				$("#service_add").hide();
				$("#goods_add").show();
			}

		});
		$("#first_prod").change(function() {
			if ($("#first_prod").val() == 2) {
			$("#type_no").val(2) 
			
			}else{
				$("#type_no").val(1)
			}
		});
		$("#prod").change(function() {
			if ($("#prod").val() == 2) {
			$("#div_no").val(2) 
			
			}else{
				$("#div_no").val(1)
			}
		});

		// Button Auto Sizinga
		$('button').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});
		$('.content_btn>div').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$("#cancel").on("click", function() {
			history.back();
		});
		
			$("#goods_add").on("click", function() {
				var params = $("#saveForm").serialize();
				
				$.ajax({
					type : "post",
					url : "AddProdAjax",
					dateType : "json",
					data : params,
					success : function(result) {
						  if(result.res == "SUCCESS") {
							  console.log(result.data.PROD_NO);
			                  $("#prodNo").val(result.data.PROD_NO);
			                  if ($.trim($("#g_code").val()) == "") {
			  					alert("제품코드를 입력하세요.");
			  					$("#g_code").focus();

			  				} else if ($.trim($("#g_price").val()) == "") {
			  					alert("제품단가를 입력하세요.");
			  					$("#g_price").focus();

			  				} else if ($.trim($("#g_size").val()) == "") {
			  					alert("제품사이즈를 입력하세요.");
			  					$("#g_size").focus();

			  				} else{
			  					var params = $("#saveForm").serialize();
			  					console.log(params);
			  					$.ajax({
			  						type : "post",
			  						url : "AddGoodsAjax",
			  						dateType : "json",
			  						data : params,
			  						success : function(result) {
			  							  if(result.res == "SUCCESS") {
			  				                  location.href = "prodList";
			  				               }
			  				               else {
			  				                  alert("등록 실패");
			  				               }
			  				            },
			  						error : function(request, status, error) {
			  							console.log("text : " + request.responseText);
			  							console.log("error : " + error);
			  						}

			  					}) 
			  					
			  					
			  					
			  					
			  				}
			               }
			               else {
			                  alert("등록 실패");
			               }
			            },
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}

				})

			});



 			$("#service_add").on("click", function() {
			var params = $("#saveForm").serialize();
				$.ajax({
					type : "post",
					url : "AddProdAjax",
					dateType : "json",
					data : params,
					success : function(result) {
						  if(result.res == "SUCCESS") {
			                  $("#prodNo").val(result.data.PROD_NO);
			                  if  ($.trim($("#s_code").val()) == "") {
			  					alert("서비스코드를 입력하세요.");
			  					$("#s_code").focus();

			  				} else if ($.trim($("#s_price").val()) == "") {
			  					alert("서비스가격을 입력하세요.");
			  					$("#s_price").focus();

			  				} else if ($.trim($("#s_period").val()) == "") {
			  					alert("서비스기간을 입력하세요.");
			  					$("#s_period").focus();

			  				} else if ($.trim($("#s_install").val()) == "") {
			  					alert("설치비용을 입력하세요.");
			  					$("#s_install").focus();

			  				} else{
			  					var params = $("#saveForm").serialize();
			  					
			  					$.ajax({
			  						type : "post",
			  						url : "AddServiceAjax",
			  						dateType : "json",
			  						data : params,
			  						success : function(result) {
			  							  if(result.res == "SUCCESS") {
			  				                  location.href = "prodList";
			  				               }
			  				               else {
			  				                  alert("등록 실패1111");
			  				               }
			  				            },
			  						error : function(request, status, error) {
			  							console.log("text : " + request.responseText);
			  							console.log("error : " + error);
			  						}

			  					})
			  				}
			               }
			               else {
			                  alert("등록 실패222");
			               }
			            },
					error : function(request, status, error) {
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}

				})
 
			}); 
 			
		

	});
</script>

</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">21</c:param>
	</c:import>
	

	<div class="title_area">제품/서비스 등록</div>
	<div class="content_area">
		<!-- 여기에 내용을 구현 -->
		<div class="contents_wrap">
			<form action="#" method="post" id="saveForm">
			<input type="hidden" id="prodNo" name="prodNo" />
			<input type="hidden" name="type_no" value="1" id="type_no"/>
			<input type="hidden" name="div_no" value="1" id="div_no"/>
			<div class="table_top_area">
				<div class="top_title_area">
					<select class="input_short" id="first_prod" name="first_prod">
						<option value="1">보안</option>
						<option value="2">인터넷</option>
					</select> <select class="input_short" id="prod">
						<option value="1">제품</option>
						<option value="2">서비스</option>
					</select>
				</div>
				<div class="top_btn_area">
					<div class="btn_yellow btn_size_normal add" id="service_add">등록</div>
					<div class="btn_yellow btn_size_normal add" id="goods_add">등록</div>
					<div class="btn_yellow btn_size_normal cancel" id="cancel">취소</div>
				</div>
			</div>


			<table class="table_normal" id="Goods">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>
				<tr>
					<td class="field_name first_field_name">제품코드 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="g_code" id="g_code" /></td>
					<td class="field_name first_field_name">상품명 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="p_name" id="p_name" /></td>
				</tr>
				<tr>
					<td class="field_name first_field_name">제품단가 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="g_price" id="g_price" /></td>
					<td class="field_name first_field_name">사이즈 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="g_size" id="g_size" /></td>
				</tr>
				<tr>
					<td class="field_name first_field_name">비고</td>
					<td class="field_contents" id="" colspan=3><input type="text"
						class="input_normal" name="g_remarks" id="g_remarks" value="  " /></td>
				</tr>
			</table>

			<table class="table_normal" id="Service">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>
				<tr>
					<td class="field_name first_field_name">서비스코드 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="s_code" id="s_code" /></td>
					<td class="field_name first_field_name">상품명 <span
						class="acc_txt" >*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="p2_name" id="p2_name" /></td>
				</tr>
				<tr>
					<td class="field_name first_field_name">서비스기간 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="s_period" id="s_period" /></td>
					<td class="field_name first_field_name">서비스가격 <span
						class="acc_txt">*</span>
					</td>
					<td class="field_contents"><input type="text"
						class="input_normal" name="s_price" id="s_price" /></td>
				<tr>
					<td class="field_name first_field_name">설치료<span
						class="acc_txt">*</span></td>
					<td class="field_contents" colspan=3><input type="text"
						class="input_normal" name="s_install" id="s_install" /></td>
				</tr>
				<tr>
					<td class="field_name first_field_name" id="">비고</td>
					<td class="field_contents" colspan=3><input type="text"
						class="input_normal" name="s_remarks" id="s_remarks" value=" " /></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>