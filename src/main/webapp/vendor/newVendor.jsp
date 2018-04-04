<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script language="javascript">
	$(function() {
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
		<c:if test="${requestScope.date1 == null }">
		document.getElementById("saleDate").value = toDay;
		</c:if>

	}
	
	function addvendor() {
		vendorform.submit();
	}
</script>

</head>
<body>
	<h2>신규등록</h2>
	<form:form  method="POST"
			commandName="vendorCommand" enctype="multipart/form-data"
			name="Vendorform">
		<table>

			<tr>
				<td>회사ID :</td>
				<td><input type="text"></td>
				<td>회사명 :</td>
				<td><input type="text"></td>
			</tr>
			<tr>
			<td>사원수 : </td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>회사주소 :</td>
				<td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>카테고리 :</td>
				<td><input type="text"></td>
				<td>품목 :</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>요청일자 :</td>
				<td><input type="text" name="saleDate" id="saleDate"
					value="${requestScope.date1}" readonly>
			</tr>
			<tr>
				<td>품질담당자이름 :</td>
				<td><input type="text"></td>
				<td>품질 담당자 전화번호 :</td>
				<td><input type="text"></td>
				<td>품질담당자연락처 :</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>구매담당자이름 :</td>
				<td><input type="text"></td>
				<td>구매담당자전화번호 :</td>
				<td><input type="text"></td>
				<td>구매담당자연락처 :</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>품질보증서 :</td>
				<td><input type="file"></td>
			</tr>
			<tr>
				<td>사업자등록증 :</td>
				<td><input type="file"></td>
			</tr>

		</table>
		<a href="javascript:addvendor()">[등록]</a>

	</form:form>
</body>
</html>