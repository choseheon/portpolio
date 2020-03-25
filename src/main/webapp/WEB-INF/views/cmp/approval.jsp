<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재목록</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
	$(document).ready(function(){
		reloadList();
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
			if($("#searchTxt").val()== "승인"){
				$("#searchTxt").val(5);				
				$("#searchTxt").val("");
				
			} else if($("#searchTxt").val()== "미승인"){
						$("#searchTxt").val(4);
						$("#page").val("1");
						reloadList();
						$("#searchTxt").val("");
			}
		});
	
		
		$("tbody").on("dblclick", "tr", function() {
			$("#appno").val($(this).attr("name"));			
			$("#appstat").val($(this).attr("id"));
			$("#actionForm").attr("action", "app");
			$("#actionForm").submit();
			
		});
		
		$(".paging_area").on("click", "span", function() {
			if ($(this).attr("name") != "") {
				$("#page").val($(this).attr("name"));
				reloadList();
			}
		});
	});
			function reloadList(){
			var params = $("#actionForm").serialize();
			console.log(params);
			$.ajax({
				type : "post",
				url : "approvalAjax",
				dataType : "json",
				data : params,
				success : function(result){
					redrawList(result.list);
					redrawPaging(result.pb);
				},
				error  : function(request, status, error){
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
		function redrawList(list) {
			var html = "";			
				if(list.length == 0){					
					html += "<tr>";
					html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
					html += "</tr>";
				}else {
					for ( var i in list) {
						html += "<tr name=\"" + list[i].CMP_NO+ "\" id=\"" + list[i].PROG_STAT + "\">";
						html += "<td>" + list[i].RNUM + "</td>";
						html += "<td>"+ list[i].SDATE + " ~ " + list[i].EDATE +"</td>";
						html += "<td>" + list[i].CMP_NAME + "</td>";
						
						if(list[i].PROG_STAT ==4){
							html +="<td> </td>"							
						}else{
							
							html += "<td>" + list[i].APP_DAY+ "</td>";
						}
						
						if(list[i].PROG_STAT ==4){
							html +="<td> </td>"							
						}else{
							
							html +="<td>" + list[i].EMP_NAME + "</td>"
						}

						if(list[i].PROG_STAT == 4){
							  	
		                        html += "<td> 미승인  </td>" ; 
		                    }else
		                        {
		                    html += "<td> 승인 </td>";
		                        }						
						html += "</tr>";
					}
				}
						$("tbody").html(html);
		} 
		function redrawPaging(pb) {
			var html = "";
			//처음
			html += "<span name=\"1\"> << </span>&nbsp;";

			//이전
			if ($("#page").val() == "1") {
				html += "<span name=\"1\"> < </span>&nbsp;";
			} else {
				html += "<span name=\"" + ($("#page").val() * 1 - 1)
						+ "\"> < </span>&nbsp;";
			}
			//숫자
			for (var i = pb.startPcount; i <= pb.endPcount; i++) {
				if ($("#page").val() == i) {
					html += "<span><b>" + i + "</b></span>&nbsp";
				} else {
					html += "<span name=\"" + i +"\">" + i + "</span>&nbsp;";
				}
			}

			//다음
			if ($("#page").val() == pb.maxPcount) {
				html += "<span name=\"" + pb.maxPcount +"\"> > </span>&nbsp;";

			} else {
				html += "<span name=\"" + ($("#page").val() * 1 + 1)
						+ "\"> > </span>&nbsp;";
			}
			//마지막
			html += "<span name=\"" + pb.maxPcount +"\"> >> </span>";
			$(".paging_area").html(html);
		}
		

</script>
<style type="text/css">
table {
	text-align: center;
	border-bottom: 1px solid #9E9E9E;
	height: 20px;
}

    
.ttr {
	color: white;
	background-color: gray;
}

.ttb {
	background-color: white;
	width: 1040px;
	height: 550px;
}

.c:hover {
	cursor: pointer; /*마우스를 갖다대면 포인트모양이 바뀐다  */
	text-decoration: underline;
}

.t:hover {
	background-color: #F2CB07;
}

.trr {
	background-color: #FF6347;
	font-size: 20px;
	font-weight: bold;
}

.trb {
	background-color: #87CEFA;
	font-size: 20px;
	font-weight: bold;
}

.search {
height: 40px;
    width: 0px;
    /* border: 1px solid #595959; */
    background: white;
    /* margin-left: 650px;*/
}

.sch {
	font-size: 16px;
	width: 300px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.schb {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #595959;
	outline: none;
	float: right;
	color: white;
}
/* 버튼  */
.btn_list {
	display: block;
	margin-left: 330px;
	width: 385px;
	height: 24px;
}

/* 샘플 */
      table {
   width: 1200px;  
   text-align: center;
   border-collapse: collapse;
   font-size : 10pt;
font-weight: bold;
}

/*버튼영역*/
.content_btn {
   width : 1200px;
   height : 50px;
}
/*버튼을 div로 만들었습니다.
  버튼 속성입니다.
  버튼은 float:right을 썼기때문에 반대로 적어주세요.
*/
.content_btn > div {
   display: table;
   width : 80px;
   height: 25px;
   font-size: 10pt;
   color: #595959;
   text-align : center;
   border-radius : 5px;
   float : right;
   background-color : #F2B807;
   padding-top : 5px;
   margin-top : 20px;
   margin-left : 10px;
}
/*버튼의 hover입니다.*/
.content_btn > div:hover {
   background-color : #F2CB07;
   cursor : pointer;
}
/*버튼을 div로 만들었습니다.
  버튼 속성입니다.
  버튼은 float:right을 썼기때문에 반대로 적어주세요.
*/
.content_srch{
   width : 1200px;
   height : 50px;
}
.content_srch_btn > div {
    display: table;
    width: 80px;
    height: 25px;
    font-size: 10pt;
    font-weight: bold;
    color: white;
    text-align: center;
    border-radius: 5px;
    float: right;
    background-color: #595959;
    /* padding-top: 0px; */
    margin-top: 10px;
    margin-left: 10px;
}
/*버튼의 hover입니다.*/
.content_srch_btn > div:hover {
   background-color : #292929;
   cursor : pointer;
}
.content_srch_txt{
   display : inline-block;
   width: 200px;
   height: 25px;
   font-size: 10pt;
   margin-top : 10px;
   margin-left : 10px;
   border : 1px solid #ccc;
   float : right;
   border-radius : 5px;
}

.content_srch_btn {
   display : inline-block;
   width : 1200px;
   height : 50px;
   margin: -12px 0px;
}
.content_srch_DD{
   display : inline-block;
   width: 100px;
   height: 30px;
   font-size: 10pt;
   margin-top : 10px;
   margin-left : 10px;
   border : 1px solid #ccc;
   border-radius : 5px;
   float : right;

}
.content_srch_DD1{
   display : none;
}

.sample_1 {
   width: 100%;
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
.sample_2 {
   width: 100%;
   height: 50px;
   border-bottom: 1px solid #cccccc;   
}

.sample_2:hover{
background-color: #EEEEEE;
outline: none;
cursor: pointer;
}


.sample_2 > td{
text-align:center;
}
.sample_2 input{
outline: none;
}

.check {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 75px;
}
.sample_title1{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 75px;
}
.sample_title2 {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;
}



.sample_title3 {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;
text-align:center;

}

.sample_title4{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;

}

.sample_title5{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 150px;
}

.sample_title6 {
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 100px;
}

.sample_title7{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 100px;

}

.sample_title8{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 200px;

}

.sample_title9{
background-color : #595959;
font-size : 10pt;
font-weight: bold;
color : #ffffff;
width: 200px;
}
.sample8_btn{
   float: right;
   display: inline-block;
   height: 20px;
   border : 1px solid #cccccc;
   background-color: #ffffff;
   border-radius: 3px;
   cursor: pointer;
   width: 50px;
   height: 20px;
   font-size: 10pt;
   font-weight: bold;
   color: #595959;
   padding: 2px;
   margin-right: 27px;
}

.departments_btn:hover {
   background-color: #F2CB07;
}

.content_bottom{
   display: block;
   height : 40px;
   padding : 0px;
   width: 1200px;
   font-size : 0px;
   margin-top: 30px;
}
.paging_area {
	display: inline-flex;
    /* position: relative; */
    margin: 70px 524px;
}
.paging_area > span{
display: inline-block;
    width: 40px;
    height: 40px;
    border: 0px;
    margin-left: 2px;
    background-color: #595959;
    color: #F2F2F2;
    padding: 10px 14px;
}

.paging_area > span:hover {
   background-color: #F2CB07;
   color: #595959;
   cursor : pointer;
}

</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">14</c:param>
	</c:import>
	<div class="title_area">결재목록</div>
		<div class="content_area">
			<!-- 여기에 내용을 구현 -->
			<div class="content_btn">
           
            
         </div>
         <form action="#" id="actionForm" class="search" method="post">         	
			<input type="hidden" name="page" id="page" value="1" />				 
			<input type="hidden" name="appno" id="appno" value="" />
			<input type="hidden" name="empno" id="empno" value="" />        
			<input type="hidden" name="appstat" id ="appstat" value=""/>
			<input type="hidden" id="seq" name="seq" value="${param.seq}"/>	
         <div class="content_srch">
            <div class="content_srch_btn">            
                  <div id="searchBtn">검색</div>
                  <input type="text" class="content_srch_txt" id="searchTxt" name="searchTxt" style="height:30px"/>
                  <select class="content_srch_DD" name="searchGbn" id="searchGbn">                                        
                     <option  value="0">캠페인</option>
                     <option  value="1">승인자</option>
                     <option  value="2">승인여부</option>                     
                  </select>              
               </div>
      </div>
   </form>
      <table>
      		<thead>
				<tr class="sample_1">
					<th class="sample_title2">no</th>
					<th class="sample_title2">기간</th>
					<th class="sample_title4">캠페인</th>
					<th class="sample_title5">처리날짜</th>
					<th class="sample_title6">승인자</th>
					<th class="sample_title7">승인여부</th>
				</tr>
			</thead>
			<tbody>
				<tr class="sample_2">
					<td colspan="6">조회된 데이터가 없습니다.</td>
				</tr>
			</tbody>
      </table>   
            <span class="paging_area">
                <span> << </span>
               <span> < </span>
               <span> 1 </span>              
               <span> > </span>
               <span> >> </span> 
            </span>
      </div>   
	<c:import url="/bottom"></c:import>
</body>
</html>