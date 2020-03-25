<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src=''></script>
<meta charset="UTF-8">
<title>일정 관리</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" href="resources/script/fullcalendar/fullcalendar.css">
<script src="resources/script/jquery/moment.js"></script>
<script src="resources/script/fullcalendar/fullcalendar.js"></script>
<script src="resources/script/fullcalendar/locale-all.js"></script>
<style type="text/css">
.fc-button {
	background-image: none !important;
	width: 80px !important;
	height: 30px !important;
	background-color : #595959;
	color : #f2f2f2;
	border : none;
}
.fc-button:hover {
	background-color : #f2b807;
}

.fc-sat {
	color : blue;
}

.fc-sun {
	color : red;
}

.fc-state-hover,
.fc-state-down,
.fc-state-active,
.fc-state-disabled {
  color: #333333;
  background-color: none; }

.fc-state-hover {
  color: #333333;
  text-decoration: none;
  background-position: 0 -80px !important;
  -webkit-transition: background-position 0.1s linear;
  -moz-transition: background-position 0.1s linear;
  -o-transition: background-position 0.1s linear;
  transition: background-position 0.1s linear; }
  
.fc-event {
	background-color : #f2b807;
	color : #595959;
	border : 0;
	cursor : pointer;
}

.fc-view tr {
	height: auto;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$.ajax({
		type : "post",
		url : "scheCalendarAjax",
		dataType : "json",
		success : function(res) {
			// page is now ready, initialize the calendar...
			$("#calendar").fullCalendar({
				// put your options and callbacks here
				header : { // 버튼 위치선정
					left : "title",
					right : "today, prevYear, prev, next, nextYear"
				},
				height : "auto",
				droppable : true,
				/* editable : true, */ // 이벤트 이동
				locale : "ko",
				eventLimit : true, // 스케줄 많을시 압축
				events : res.list,
				eventClick : function(calEvent, jsEvent, view) {
					$("#sche_no").val(calEvent.no);
					$("#scheDivNoM").val(calEvent.div_no);
					$("#actionForm").attr("action", "scheDet");
					$("#actionForm").submit();
					
					// change the border color just for fun
				  },
				dayClick : function(date, jsEvent, view) { // 날짜 클릭
				   alert('Clicked on: ' + date.format());
	 			},
	 			/* hiddenDays : [0, 6] */ //주말제거
	 			
			});
			
		}
	});
});
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">7</c:param>
	</c:import>
	<div class="title_area">일정 달력</div>
	<div class="content_area">
		<div class="contents_wrap">
		<form action="#" id="actionForm">
		<input type="hidden" name="sche_no" id="sche_no">
		<input type="hidden" name="scheDivNoM" id="scheDivNoM"/>
		<div id="calendar"></div>
		</form>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>