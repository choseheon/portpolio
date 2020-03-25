<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mango CRM</title>
<link rel="stylesheet" type="text/css" href="resources/css/cmp/target.css" />
<c:import url="/header"></c:import>
</head>
<script type="text/javascript">
$(document).ready(function(){
	clientListdraw();
	targetSelect();
	
	function targetSelect(){
		var param= $("#searchForm").serialize();
		
		$.ajax({
			type : "post",
			url : "checkCboxAjax", 
			dataType : "json", 
			data : param, 
			success : function(res){
				check(res.list);
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		}); 
		
	}
	
	function check(list) {
		for(var i in list){
			$(".list_chbox").each(function() {
				if(list[i].DET_NO == $(this).attr("id")){
					$(this).prop("checked",true);
				}
			});
		}
		
	}
	
	
	
	
	$(".paging_area").on("click","span",function(){
		if($(this).attr("name") != "" ){
			$("#page").val($(this).attr("name"));
			clientListdraw();
		}
	});
	
	$("#back_Btn").on("click",function(){
		location.href="cmpAdd";
	});
	
	$("#save_Btn").on("click",function(){
		$(".list_chbox").each(function() {
			if($(this).is(":checked")){
				$("#detNo").val($(this).attr("id"));
				
				var param= $("#searchForm").serialize();
				
				$.ajax({
					type : "post",
					url : "insertTargetAjax", 
					dataType : "json", 
					data : param, 
					success : function(res){
						
						$("#searchForm").attr("action","cmpList");
						$("#searchForm").submit();
					},
					error : function(request,status, error){
						console.log("text : " + request.responseText);
						console.log("error : " + error);
					}
				}); 
			}
		});
	});
	
	$(".next_Btn").on("click", function() {
		//ajax 태워서 update 
		var str=$("#searchForm").serialize();
			
		$.ajax({
			type : "post",
			url : "updatestatAjax", 
			dataType : "json", 
			data : str, 
			success : function(res){
				
				$("#searchForm").attr("action","channelSelect");
				$("#searchForm").submit();
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
		var params = $('input:checkbox[name="boxx"]:checked').serialize();
		var ch = $('input:checkbox[name="chh"]:checked').serialize();
		var a = new Array();
		
		$('input:checkbox[name="chh"]:checked').each(function() {
			if($(this).val() == "6_1"){
				a[0] = $(this).val();
				if(a[1] == null && a[2] == null){
					a[1]= "0_0";
					a[2]= "0_0";					
				}
			}else if($(this).val() == "6_2"){
				a[1] = $(this).val();
				if(a[0] == null && a[2] == null){
					a[0]= "0_0";
					a[2]= "0_0";
				}
			}else if($(this).val() == "6_3"){
				a[2] = $(this).val();
				if(a[0] == null && a[1] == null){
					a[0]= "0_0";
					a[1]= "0_0";
				}
			}
		});
		
		$("#chboxx").val(params);
		$("#ch").val(a);
		
	});
	/* $(".target_g" ).on("click","input:checkbox",function(){
		var str ="";
		$('input:checkbox[name="boxx"]:checked').each(function(){
			str +=  $(this).val()+" ";
		});
		$("#boxV").val(str);
		console.log(str);
		console.log($("#boxV").val());
 		//console.log($("#gender_men:checked").val());
		//console.log($("#gender_women:checked").val());
		//console.log($("input:checkbox:checked").val());
	}) */
	
	$("#searchBtn").on("click", function() {
		clientListdraw();
	});
});	
	/* 고객목록그리기 */
	function clientListdraw(){
		var params=$("#searchForm").serialize();
		$.ajax({
			type : "post",
			url : "targetAjax", 
			dataType : "json", 
			data : params, 
			success : function(res){
				clientList(res.list);
				drawPaging(res.pb);
				
			},
			error : function(request,status, error){
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	/* 고객목록그리기 */
	function clientList(list){
		var html = "";
		
		for(var i in list){
			html += "<tr class =\"sample_2\" name=\""+list[i].CLIENT_NO+ "\">";
			
			html += "<td>"+list[i].CLIENT_NO +"</td>";
			html += "<td>"+list[i].CLIENT_NAME +"</td>";
			if(list[i].GENDER==1){
				html += "<td>남자</td>";
			}
			else{
				html += "<td>여자</td>";
			}
			html += "<td>"+list[i].PH_NO+"</td>";
			html += "<td>"+list[i].EMAIL+ "</td>";
			html += "</tr>";
		}
			
		$("tbody").html(html);
	}
 	/* 페이징 */

	function drawPaging(pb){
		var html="";
		
		//처음
		html += "<span name=\"1\" class=\"bottom_btn_1\">&lt;&lt; </span>";
		//이전
		if($("#page").val()=="1"){
			html += "<span name=\"1\" class=\"bottom_btn_1\">&lt; </span>";
		}
		else{
			html += "<span name=\"" + ($("#page").val() * 1 -1) + "\" class=\"bottom_btn_1\">&lt;</span>";
		}
		//숫자
		for(var i = pb.startPcount; i<=pb.endPcount; i++){
			if($("#page").val()== i){
				html += "<span  name=\"" + i + "\" class=\"bottom_btn_2\"><b>"+ i + "</b></span>";
			}
			else{
				html += "<span name=\"" + i + "\"  class=\"bottom_btn_2\">"+ i +"</span>";
			}
		}
		//다음
		if($("#page").val()==pb.maxPcount){
			html += "<span name=\""+pb.maxPcount +"\" class=\"bottom_btn_1\">&gt;</span>";
		}
		else{
			html += "<span name=\"" + ($("#page").val() * 1 +1) + "\" class=\"bottom_btn_1\">&gt;</span>";
		}
		//마지막
		html += "<span name=\"" + pb.maxPcount + "\" class=\"bottom_btn_1\">&gt;&gt;</span>";
		$(".paging_area").html(html);
	}
</script>

<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">9</c:param>
	</c:import>
	
	<div class="title_area">대상선정</div>
	<div class="content_area">
		<div class="btn_area">
			<div class="circle" >1</div> &nbsp;&nbsp;
			<div class="circle1">2</div> &nbsp;&nbsp;
			<div class="circle" >3</div> &nbsp;&nbsp;
			<div class="circle" >4</div> &nbsp;&nbsp;
			
			
			<div class="next_Btn">다음</div>
			<div class="back_Btn" id="back_Btn">이전</div>
			<div class="back_Btn" id="save_Btn">저장</div>
		</div>
		<div class="contents_wrap">
		<!--내용  -->
		
		<div class="tbl_area">
				<div class="select_header"></div>
				<div class="select_main">
					<form id="searchForm" action="#" method="post">
						<input type="hidden" id="seq" name="seq" value="${param.seq}"/>
						<input type="hidden" id="empNo" name="empNo" value="${sEmpNo}"/>					
						<input type="hidden" name="page" id="page" value="1"/>
						<input type="hidden" name="chboxx" id="chboxx" />
						<input type="hidden" name="ch" id="ch" />
						<input type="hidden" name="detNo" id="detNo" />
						
						<fieldset class="box_area" id="gender_box" name="1">
							<legend><b>성별</b></legend>
							<div class="target_g">
	                        <input type="checkbox" id="1" class="list_chbox" name="boxx" value="1_1"/>
	                        <label for="1" class="chbox_lbl"></label>
	                        <label for="1" class="chk_txt margin_right">남자 </label>&nbsp;
	                        
	                        <input type="checkbox" id="2" class="list_chbox" name="boxx" value="1_2"/>
	                        <label for="2" class="chbox_lbl"></label>
	                        <label for="2" class="chk_txt margin_right">여자</label>
	                    	</div>
							
						</fieldset>
					
						<fieldset class="box_area" id="box_age">
							<legend><b>연령대</b></legend>
							
							<div class="target_g">
	                        <input type="checkbox"  id="16" class="list_chbox" value="4_10 AND 19" name="boxx"/>
	                        <label for="16" class="chbox_lbl"></label>
	                        <label for="16" class="chk_txt margin_right">10대 </label>&nbsp;
	                        
	                        <input type="checkbox"  id="17" class="list_chbox" value="4_20 AND 29" name="boxx"/>
	                        <label for="17" class="chbox_lbl"></label>
	                        <label for="17" class="chk_txt margin_right">20대 </label>&nbsp;
	                        
	                        <input type="checkbox"  id="18" class="list_chbox" value="4_30 AND 39" name="boxx"/>
	                        <label for="18" class="chbox_lbl"></label>
	                        <label for="18" class="chk_txt margin_right">30대 </label>&nbsp;
	                        
	                        <input type="checkbox"  id="19" class="list_chbox" value="4_40 AND 49" name="boxx"/>
	                        <label for="19" class="chbox_lbl"></label>
	                        <label for="19" class="chk_txt margin_right">40대 </label>
	                        <br />
	                        <input type="checkbox"  id="20" class="list_chbox" value="4_50 AND 59" name="boxx"/>
	                        <label for="20" class="chbox_lbl"></label>
	                        <label for="20" class="chk_txt margin_right">50대 </label>&nbsp;
	                        
	                        <input type="checkbox"  id="21" class="list_chbox" value="4_60 AND 69" name="boxx"/>
	                        <label for="21" class="chbox_lbl"></label>
	                        <label for="21" class="chk_txt margin_right">60대 </label>
	                        
	                        
	                    	</div>
	                    	
						</fieldset>
						<br />
						<br />
						<br />
						<fieldset class="box_area" id="box_city">
							<legend><b>지역</b></legend>
							
							<div class="target_g">
	                        <input type="checkbox" name="boxx" id="3" class="list_chbox" value="2_'서울'"/>
	                        <label for="3" class="chbox_lbl"></label>
	                        <label for="3" class="chk_txt margin_right">서울 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="4" class="list_chbox" value="2_'경기'"/>
	                        <label for="4" class="chbox_lbl"></label>
	                        <label for="4" class="chk_txt margin_right">경기 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="5" class="list_chbox" value="2_'인천'"/>
	                        <label for="5" class="chbox_lbl"></label>
	                        <label for="5" class="chk_txt margin_right">인천 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="6" class="list_chbox" value="2_'강원'"/>
	                        <label for="6" class="chbox_lbl"></label>
	                        <label for="6" class="chk_txt margin_right">강원 </label>
	                        <br />
	                        <input type="checkbox" name="boxx" id="7" class="list_chbox" value="2_'충청'"/>
	                        <label for="7" class="chbox_lbl"></label>
	                        <label for="7" class="chk_txt margin_right">충청 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="8" class="list_chbox" value="2_'경상'"/>
	                        <label for="8" class="chbox_lbl"></label>
	                        <label for="8" class="chk_txt margin_right">경상 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="9" class="list_chbox" value="2_'전라'"/>
	                        <label for="9" class="chbox_lbl"></label>
	                        <label for="9" class="chk_txt margin_right">전라 </label>&nbsp;
	                        
	                        <input type="checkbox" name="boxx" id="10" class="list_chbox" value="2_'제주'"/>
	                        <label for="10" class="chbox_lbl"></label>
	                        <label for="10" class="chk_txt margin_right">제주 </label>
	                        
	                    	</div>
							
						</fieldset>
						
						<fieldset class="box_area">
							<legend><b>가입 기간</b></legend>
							
							<div class="target_g">
	                        <input type="checkbox" id="22" class="list_chbox" name="boxx" value="5_=0"/>
	                        <label for="22" class="chbox_lbl"></label>
	                        <label for="22" class="chk_txt margin_right">1년 미만 </label>&nbsp;
	                        
	                        <input type="checkbox" id="23" class="list_chbox" name="boxx" value="5_BETWEEN 1 AND 2.9"/>
	                        <label for="23" class="chbox_lbl"></label>
	                        <label for="23" class="chk_txt margin_right">1년 이상 </label>&nbsp;
	                        
	                        <input type="checkbox" id="24" class="list_chbox" name="boxx" value="5_BETWEEN 3 AND 4.9"/>
	                        <label for="24" class="chbox_lbl"></label>
	                        <label for="24" class="chk_txt margin_right">3년 이상 </label>&nbsp;
							<br />                        
	                        <input type="checkbox" id="25" class="list_chbox" name="boxx" value="5_BETWEEN 5 AND 999999999999"/>
	                        <label for="25" class="chbox_lbl"></label>
	                        <label for="25" class="chk_txt margin_right">5년이상 </label>
							
	                    	</div>
						</fieldset>
						<br />
						<br />
						<br />
						<fieldset class="box_area">
							<legend><b>월 통신비</b></legend>
							
							<div class="target_g">
	                        <input type="checkbox" id="11" class="list_chbox" name="boxx" value="3_0 AND 29999 "/>
	                        <label for="11" class="chbox_lbl"></label>
	                        <label for="11" class="chk_txt margin_right">3만원 미만 </label>&nbsp;
	                        
	                        <input type="checkbox" id="12" class="list_chbox" name="boxx" value="3_30000 AND 49999"/>
	                        <label for="12" class="chbox_lbl"></label>
	                        <label for="12" class="chk_txt margin_right">3만원 이상 </label>&nbsp;
	                        
	                        <input type="checkbox" id="13" class="list_chbox" name="boxx" value="3_50000 AND 69999"/>
	                        <label for="13" class="chbox_lbl"></label>
	                        <label for="13" class="chk_txt margin_right">5만원 이상 </label>
	                        <br />
	                        <input type="checkbox" id="14" class="list_chbox" name="boxx" value="3_70000 AND 99999"/>
	                        <label for="14" class="chbox_lbl"></label>
	                        <label for="14" class="chk_txt margin_right">7만원 이상 </label>&nbsp;
	                        
	                        <input type="checkbox" id="15" class="list_chbox" name="boxx" value="3_100000 AND 99999999999"/>
	                        <label for="15" class="chbox_lbl"></label>
	                        <label for="15" class="chk_txt margin_right">10만원 이상 </label>&nbsp;
	                        
	                        </div>
							
							
						</fieldset>
						
						
						<fieldset class="box_area">
							<legend><b>채널</b></legend>
							
							<div class="target_g">
	                        <input type="checkbox" id="26" class="list_chbox" name="chh" value="6_1"/>
	                        <label for="26" class="chbox_lbl"></label>
	                        <label for="26" class="chk_txt margin_right">SMS </label>&nbsp;
	                        
	                        <input type="checkbox" id="27" class="list_chbox" name="chh" value="6_2"/>
	                        <label for="27" class="chbox_lbl"></label>
	                        <label for="27" class="chk_txt margin_right">MMS </label>&nbsp;
	                        
	                        <input type="checkbox" id="28" class="list_chbox" name="chh" value="6_3"/>
	                        <label for="28" class="chbox_lbl"></label>
	                        <label for="28" class="chk_txt margin_right">e-Mail </label>
	                        
	                        </div>
							
						</fieldset>
					</form>
					
				</div>
				<div class="select_footer">
					<div id="searchBtn">검색</div>
				</div>
				<div class="line"><h2>고객목록</h2></div>
				
			
				<table>
				<thead>
		            <tr class="sample_1">
		               <td class="sample_title1">No</td>
		               <td class="sample_title3">이름</td>
		               <td class="sample_title4">성별</td>
		               <td class="sample_title5">전화번호</td>
		               <td class="sample_title6">e-mail</td>
		            </tr>
	            </thead>
	            <tbody>
		            <tr>
		            	<td>1</td>
		            	<td>2</td>
		            	<td>3</td>
		            	<td>4</td>
		            	<td>5</td>
		            </tr>
	            </tbody>
				</table>
			
			<div class="paging_area"></div>
			
		</div>
				
		</div>
			
		
		</div>
	<c:import url="/bottom"></c:import>
</body>
</html>