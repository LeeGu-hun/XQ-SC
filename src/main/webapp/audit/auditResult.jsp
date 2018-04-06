<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#menuBottom li').on('click', function() {
			$(location).attr('href', $(this).attr('struri'));
		});
		$('#menuList li').on('click', function() {
			$(location).attr('href', $(this).attr('struri'));
		});
		autoResizeDiv();
		$("#saleDate").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
		getDate();
	});
	
	function getDate() {
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth() + 1;
		if (mm < 10) {
			mm = "0" + mm;
		}
		var dd = newDate.getDate();
		if (dd < 10) {
			dd = "0" + dd;
		}
		var toDay = yyyy + "-" + mm + "-" + dd;
		document.getElementById("saleDate").value = toDay;
	}
	
</script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="">
		<form id="" name="" method="" action="">
			<table>
				<tr>
				<td colspan="2">입고 일자 <input class="txtSty" type="text"
					name="saleDate" id="saleDate" readonly> <input
					type="hidden" id="seq" value="0"> <input type="hidden"
					id="frh" value="300">
				</td>
					<td colspan="2">No<input class="" type="text" name="" id=""></td>
					<td colspan="2">회사 ID<input class="" type="text" name="" id=""></td>
					<td colspan="2">회사명 <input class="" type="text" name="" id=""></td>
					<td colspan="2">품목 <input class="" type="text" name="" id=""></td>
				</tr>
				<tr>
					<td colspan="2">Audit 실시일<input class="" type="text" name=""
						id=""></td>
					<td colspan="2">Audit 종류<input class="" type="text" name=""
						id=""></td>
					<td colspan="2">담당자 ID<input class="" type="text" name="" id=""></td>
					<td colspan="2">Audit 담당자<input class="" type="text" name="" id=""></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>