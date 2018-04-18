<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>
<title>Audit Insert</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	function checkList() {
		var typeList = document.getElementById("typeList").value;

		$.ajax({
			type : "GET",
			url : "audit/check",
			data : "typeList=" + typeList,
			success : result
		});

	}

	function result(msg) {
		$("#result").html(msg);

	}

	function updateScore() {
		auditForm.submit();
	}
</script>

</head>
<body>
	<div class="modal-header">
		<h2>Audit Result Report</h2>
	</div>
	<div class="modal-body"">
		<form method="POST" action="./audit/auditInsert"
			enctype="multipart/form-data" name="auditForm" data-target="#myModal">
			<table>
				<label>${manager}님 환영합니다</label>
				<c:forEach var="selectID" items="${vendorid}">
					<tr>
						<td nowrap>Audit ID :</td>
						<td><input type="text" value="${auditid}"  name ="AUDIT_ID"></td>
						<td nowrap><select name="typeList" id="typeList"
							onchange="checkList();">
								<option value="check">Type Select</option>
								<c:forEach var="type" items="${map.typeList}">
									<option value="${type.AUDIT_KIND_ID}">${type.AUDIT_KIND}</option>
								</c:forEach>
						</select></td>


						</span>
					</tr>
					<tr>
						<td nowrap>Vendor ID :</td>
						<td><input type="text" value="${vendorid}" readonly></td>
						<td nowrap>Vendor Name :</td>
						<td><input type="text" value="${vendorname}"></td>
						<td nowrap>Audit Date :</td>
						<td><input type="text" value="${date}"></td>
					</tr>
					<tr>
						<td nowrap>Category :</td>
						<td><input type="text" value="${category}" readonly></td>
						<td nowrap>Product :</td>
						<td><input type="text" value="${product}"></td>
						<td nowrap>Insert Date :</td>
						<td><input type="date"></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<td nowrap>총 합계: <input type='text' name='total' id='total'
				name="AUDIT_SCORE"> <span id="result">
					<table>
						<tr>
							<th nowrap>No</th>
							<th nowrap>Audit Description</th>
							<th nowrap>Audit</th>
							<th nowrap>Score</th>
						</tr>
						</td>

					</table>
			</span>
	</div>
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="updateScore()">등록</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</form>

</body>
</html>