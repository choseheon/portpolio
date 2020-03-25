$(document).ready(function() {
    reloadBssList();
    
    /*현재시간 가져오기*/
    var nowDate = new Date();
    var year = nowDate.getFullYear();
    var month = '' + (nowDate.getMonth() + 1);
    var day = '' + nowDate.getDate();
    if (month.length < 2) 
        month = '0' + month;
    	console.log(month);
    if (day.length < 2) 
        day = '0' + day;
    $("#endDate").val(year + "-" + month + "-" + day);
    
    /*---------------------------------버튼 영역--------------------------------*/
    $("#bssTablePaging").on("click", "input", function(){
    	if($(this).attr("name") != "") {
    		$("#page").val($(this).attr("name"));
        	reloadBssList();
    	}
    });
    
    $("#searchTableBtn").on("click", function() {
    	reloadBssList();
    });
    
});

/* 영업 표 목록 불러오기 */
function reloadBssList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터 전송방식
		url : "bssListAjax", //주소
		dataType : "json", //데이터 전송 규칙
		data : params, //보낼 데이터
		// {키:값, 키:값,...} -> json
		success : function(result) {
			if(result.bssList != null) {	
				redrawBssList(result.bssList);
			}
			redrawBssPaging(result.pb);
		},
		error : function(request, status, error) {
			console.log("text : " + request.reponseText);
			console.log("error : " + error);
		}
	});
}

/* 영업 표 목록 나타내기 */
function redrawBssList(bssList) {
	var html = "";
	if (bssList.length > 0) {
		for ( var i in bssList) {
			html += "<tr class=\"table_list_td\">"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_NO + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_NAME + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].COMP_NAME + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CLIENT_NAME + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CHN_DATE + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].CTRACT_DATE + " ></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].EXPECT_SALSE + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].PROG_NAME + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].DEPART_NAME + " /></td>"
			html += "<td><input class=\"input_normal\" type=\"text\" readonly=\"readonly\" value=" + bssList[i].EMP_NAME + " /></td>"
			html += "</tr>"
			}
	} else {
			html += "<tr class=\"list_contents\" style=\"height: 500px;\">";
			html += "<td colspan=\"10\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		}
	$("tbody").html(html);
}

/* 영업 표 목록 페이징 */
function redrawBssPaging(pb) {
	var html = "";
	//처음
	html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"1\" value=\"<<\"/>"

	//이전
	if ($("#page").val() == "1") {
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"1\" value=\"<\" />";
	} else {
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\""
					+ ($("#page").val() * 1 - 1) + "\" value=\"<\" />";
	}

	//숫자
	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<input type=\"button\" class=\"bottom_btn_2\" id=\"pagingBtn\" value="+ i
					+" style=\"text-weight: bold\" />";
		} else {
			html += "<input type=\"button\" class=\"bottom_btn_2\" id=\"pagingBtn\" name=\"" + i + "\" value=" + i
			+ ">";
		}
	}

	//다음
	if ($("#page").val() == pb.maxPcount) {
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + pb.maxPcount + "\" value=\">\" />";
	} else {
		html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + ($("#page").val() * 1 + 1)
				+ "\" value=\">\" />";
	}

	//마지막
	html += "<input type=\"button\" class=\"bottom_btn_1\" id=\"pagingBtn\" name=\"" + pb.maxPcount + "\" value=\">>\"/>"

	$("#bssTablePaging").html(html);
}

