<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	$(document).ready(function() {
		$("#Service").hide();
		$("#service_gbn").hide();
		$(".pservice").hide();
		$("#schbtn2").hide();
		
		
		reloadServiceList()
 		reloadGoodsList() 
 		
 		
 		
 		$("#prod").change(function(){
 			if($("#prod").val() == 2){
 			$("#Goods").hide();
 			$("#goods_gbn").hide();
 			$(".pgoods").hide();
 			$("#schbtn1").hide();
 			
 			
 			$("#Service").show();
 			$("#service_gbn").show();
 			$(".pservice").show();
 			$("#schbtn2").show();
 
 			
 			
 			
  			}
 			else{
 				$("#Goods").show();
 	 			$("#goods_gbn").show();
 	 			$(".pgoods").show();
 	 			$("#schbtn1").show();
 	 			
 	 			
 	 			$("#Service").hide();
 	 			$("#service_gbn").hide();
 	 			$(".pservice").hide();
 	 			$("#schbtn2").hide();
 	 			
 			}
 			
  		});
		
		$("#Goods>tbody").on("dblclick","tr",function(){
			$("#goods_no").val($(this).attr("name"));
			$("#prod_no").val($(this).attr("id"));
			$("#actionForm").attr("action", "goodsDet")
			$("#actionForm").submit();
			
		});
		$("#Service>tbody").on("dblclick","tr",function(){
			$("#service_no").val($(this).attr("name"));
			$("#prod_no").val($(this).attr("id"));
			$("#actionForm").attr("action", "goodsDet")
			$("#actionForm").submit();
			
		});
		//검색
		$("#schbtn1").on("click", function() {
			$("#page").val("1")
			reloadGoodsList()
		});
		$("#schbtn2").on("click", function() {
			$("#page").val("1")
			reloadServiceList()
		});

		//페이지
		$(".list_paging_area").on("click", "span", function() {
			if (!isNaN($(this).val() * 1)) {
				$("#page1").val($(this).attr("name"));
				reloadGoodsList()

			}
		});
		$(".list_paging_area").on("click", "span", function() {
			if (!isNaN($(this).val() * 1)) {
				$("#page2").val($(this).attr("name"));
				reloadServiceList()

			}
		});
		
		$(".asd").on("click",function(){
			alert("데이터가 없습니다.")
		});
		
		
		
/*  		$("#goods_gbn").change(function() {
			if ($("#goods_gbn").val() == 1) {
				$("#goods_gbn").val(1) 
			}
			if ($("#goods_gbn").val()==2){
					$("#goods_gbn").val(2)
				}else{
					$("#goods_gbn").val(0)
				}

		});  */
		
		

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
		
		//체크박스
		$("#chk_all1").click(function(){
		var stat = $("#chk_all1").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
		});
		
		$(".table_list").on("click", ".list_chbox", function() {	
			$("#chkcnt_all").html($(".table_list tbody .list_chbox").length);
			$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
		});
		
		
		
		$("#chk_all2").click(function(){
		var stat = $("#chk_all2").is(":checked")? true : false;
		$(".list_chbox").prop("checked", stat);
		});
		
		$(".table_list").on("click", ".list_chbox", function() {	
			$("#chkcnt_all").html($(".table_list tbody .list_chbox").length);
			$("#chkcnt").html($(".table_list tbody .list_chbox:checked").length);
		});
		
		
		
		
		
		//리스트 아작스 서비스
		function reloadServiceList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "ServicelistAjax",
			dateType : "json",
			data : params,
			success : function(result) {
				redrawServiceList(result.Service);
				servicePaging(result.pb2);

			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}

		})

	}
		//리스트 테이블 서비스
		function redrawServiceList(Service) {
			var html = "";
			if (Service.length == 0) {
				html += "<tr>";
				html += "<td colspan=\"9\" class=\"asd\">조회된 데이터가 없습니다.</td>";
				html += "<tr>";
			
			} else {
				for ( var i in Service) {
					html += "<tr class=\"list_contents\" name=\" "+ Service[i].SERVICE_NO +" \" id=\" "+Service[i].PROD_NO+"\" >"
					html += "<td>" + Service[i].SERVICE_NO + "</td>"
					html += "<td>" + Service[i].SERVICE_CODE + "</td>"
					html += "<td>" + Service[i].PROD_NAME + "</td>"
					html += "<td>" + Service[i].SERVICE_PERIOD + "</td>"					
					html += "<td>" + Service[i].SERVICE_PRICE + "</td>"
					html += "<td>" + Service[i].INSTALL_PRICE + "</td>"
					if(Service[i].REMARKS == " "){
						html += "<td> </td>"
					}else
						{
					html += "<td>" + Service[i].REMARKS + "</td>"
						}
					html += "</tr>"

				}

			}

			$("#Service>tbody").html(html);
		}
		
		
		function reloadGoodsList() {
			var params = $("#actionForm").serialize();		
		
		$.ajax({
			type : "post",
			url : "GoodslistAjax",
			dateType : "json",
			data : params,
			success : function(result) {
				redrawGoodsList(result.Goods);
				goodsPaging(result.pb1);

			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}

		})

	}
		 //리스트 테이블 서비스
		function redrawGoodsList(Goods) {
			var html = "";
			if (Goods.length == 0) {
				html += "<tr>";
				html += "<td colspan=\"10\">조회된 데이터가 없습니다.</td>";
				html += "<tr>";
			} else {
				for ( var i in Goods) {
					html += "<tr class=\"list_contents\" name=\" "+ Goods[i].GOODS_NO  + "\" id=\" "+Goods[i].PROD_NO+" \" >"
					html += "<td>" + Goods[i].GOODS_NO + "</td>"
					html += "<td>" + Goods[i].GOODS_CODE + "</td>"
					html += "<td>" + Goods[i].PROD_NAME + "</td>"//ss
					html += "<td>" + Goods[i].GOODS_PRICE + "</td>"
					html += "<td><div class=\"11\">"  + Goods[i].GOODS_SIZE + "</div></td>"
					if(Goods[i].REMARKS == "undefined"){
						html += "<td> </td>"
					}else
						{
					html += "<td>" + Goods[i].REMARKS + "</td>"
						}
					html += "</tr>"

				}

			}

			$("#Goods>tbody").html(html);
		}
		 
		 
		 //페이징
		function goodsPaging(pb1) {
			var html = "";
			//처음
			html += "<span name=\"1\" class=\"btn_paging\"><<</span>&nbsp;";
			//이전
			if ($("#page1").val() == "1") {
				html += "<span name=\"1\" class=\"btn_paging\"><</span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + ($("#page1").val() * 1 - 1)
						+ "\"><</span>&nbsp;";
			}
			//숫자
			for (var i = pb1.startPcount; i <= pb1.endPcount; i++) {
				if ($("#page1").val() == i) {
					html += "<span class=\"btn_paging\">  <b>" + i + "</b></span>&nbsp;";
				} else {
					html += "<span class=\"btn_paging\" name=\"" + i + "\">" + i + "</span>&nbsp;";
				}
			}
			//다음
			if ($("#page1").val() == pb1.maxPcount) {
				html += "<span class=\"btn_paging\" name=\"" + pb1.maxPcount + "\">></span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + ($("#page1").val() * 1 + 1)
						+ "\">></span>&nbsp;";
			}
			//마지막
			html += "<span class=\"btn_paging\" name=\"" + pb1.maxPcount + "\">>></span>";
			$(".list_paging_area>.pgoods").html(html);

		}
		function servicePaging(pb2) {
			var html = "";
			//처음
			html += "<span name=\"1\" class=\"btn_paging\"><<</span>&nbsp;";
			//이전
			if ($("#page2").val() == "1") {
				html += "<span name=\"1\" class=\"btn_paging\"><</span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + ($("#page2").val() * 1 - 1)
						+ "\"><</span>&nbsp;";
			}
			//숫자
			for (var i = pb2.startPcount; i <= pb2.endPcount; i++) {
				if ($("#page2").val() == i) {
					html += "<span class=\"btn_paging\">  <b>" + i + "</b></span>&nbsp;";
				} else {
					html += "<span class=\"btn_paging\" name=\"" + i + "\">" + i + "</span>&nbsp;";
				}
			}
			//다음
			if ($("#page2").val() == pb2.maxPcount) {
				html += "<span class=\"btn_paging\" name=\"" + pb2.maxPcount + "\">></span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + ($("#page2").val() * 1 + 1)
						+ "\">></span>&nbsp;";
			}
			//마지막
			html += "<span class=\"btn_paging\" name=\"" + pb2.maxPcount + "\">>></span>";
			$(".list_paging_area>.pservice").html(html);

		}
		 
		
		
		
		$("#add").on("click", function(){
			location.href =  "goodsAdd"
		});
		$("#goods").on("click", function(){
			

		});
		$("#service").on("click", function(){

		});
		
		
		
		
		
	});
</script>
<style type="text/css">
.table_top_area1{
    width: 1200px;
    margin-top: 10px;
    font-size: 0;
    color: #000000;
}
</style>
</head>
<body>


	<c:import url="/topLeft">
		<c:param name="menuNo">21</c:param>
	</c:import>
	
		<div class="title_area">상품
		</div>
		<div class="content_area">
				<!-- 여기에 내용을 구현 -->
				<div class="contents_wrap">
<form action="#" method="post" id="actionForm">
<input type="hidden" id="list" name="list" value="1"/>
<input type="hidden" id="goods_no" name="goods_no" value=""/>
<input type="hidden" id="service_no" name="service_no" value=""/>
<input type="hidden" id="prod_no" name="prod_no" value=""/>
<input type="hidden" id="page1" name="page1" value="1"/>
<input type="hidden" id="page2" name="page2" value="1"/>
					<div class="table_top_area1">
					<div class="top_title_area">

							 <select class="input_short" id="prod" name="prod">
								<option selected="selected" value="1" id="goods">제품</option>
								<option value="2" id="service">서비스</option>
							</select>
					</div>

						<div class="top_btn_area">
							<div class="btn btn_yellow btn_size_normal" id="add">등록</div>
						</div>
					</div>
					
					
					<div id = "" class="content_srch_btn" >
					<div id="schbtn1">검색</div>
					<div id="schbtn2">검색</div>
					
					
					<input type="text" name = "searchTxt" class="content_srch_txt" /> 
					
					
					<select name = "service_gbn" class="content_srch_DD" id="service_gbn">
						<!-- 검색드랍다운리스트 -->
						<option class="content_srch_DD1"></option> 
						<option selected="selected" value = "0">코드</option>
						<option value = "1">기간</option>
						<option value = "2">가격</option>
						<option value = "3">설치비용</option> 
					</select> 
					
					
					<select name = "goods_gbn" class="content_srch_DD" id="goods_gbn">
						<!-- 검색드랍다운리스트 -->
						<option class="content_srch_DD1"></option>
						<option selected="selected" value = "0">코드</option>
						<option value = "1">단가</option>
						<option value = "2">사이즈</option>
					</select> 
					
					
					
					
<!-- 					<span id="chkcnt_all1"  >10</span>
					"개 항목중"
					<span id="chkcnt1" >0</span>
					"개 선택"
				
					
					<span id="chkcnt_all2"  >10</span>
					"개 항목중"
					<span id="chkcnt2" >0</span>
					"개 선택" -->
					
				</div>
					<table class="table_list" id="Service">
						<colgroup>
							<col width="5%" />
							<col width="5%" />
							<col width="15%" />
							<col width="15%" />
							<col width="8%" />
							<col width="8%" />
							<col width="14%" />

						</colgroup>
						<thead>
						<tr class="table_list_header">
<!-- 							<td><input type="checkbox" class="list_chbox" id="chk_all2"/>
								<label class="chbox_lbl" for="chk_all2"></label>
								</td> -->
							<td>no</td>
							<td> 코드</td>
							<td> 상품명</td>
							<td> 기간</td>
							<td> 가격</td>
							<td> 설치비용</td>
							<td>비고</td>
						</tr>
						</thead>
						<tbody>
<!-- 						<tr class="list_contents" id="list_contents" name="list_contents">

						</tr> -->
							</tbody>

					</table>
					
					<table class="table_list" id="Goods">
						<colgroup>
							<col width="5%" />
							<col width="5%" />
							<col width="15%" />
							<col width="15%" />
							<col width="8%" />
							<col width="8%" />

						</colgroup>
						<thead>
						<tr class="table_list_header">
<!-- 							<td class="check">
							<input type="checkbox" class="list_chbox" id="chk_all1"/>
								<label class="chbox_lbl" for="chk_all1"></label>
							</td> -->
							<td>no</td>
							<td> 코드</td>
							<td> 상품명</td>
							<td> 단가</td>
							<td> 사이즈</td>
							<td> 비고</td>
						</tr>
						</thead>
						<tbody>
						<!-- <tr class="list_contents2" id="list_contents2" name="list_contents2">
						</tr> -->
						</tbody>
					</table>
					

					
					
					
					
					
					<div class="list_paging_area">
					<div class="pgoods">
					</div>
					<div class="pservice">
					</div>
	<!-- 					<span class="btn_paging"><<</span> <span class="btn_paging"><</span>
						<span class="btn_paging">1</span> <span class="btn_paging">></span>
						<span class="btn_paging">>></span> -->
					</div>
					</form>
				</div>
			</div>
			
</body>
</html>


















