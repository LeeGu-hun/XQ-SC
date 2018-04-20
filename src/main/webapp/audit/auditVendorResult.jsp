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

</head>
<body>
	<form method="POST" action="./audit/auditVendorResult" name="auditForm">
		<div class="modal-header">
			<h2>Vendor Report</h2>
		</div>
		<div class="modal-body"">
			<table>
				<tr>
					<td nowrap>Audit ID : ${auditid}</td>
					<td nowrap>Audit Type : ${auditType}</td>
					<td nowrap>Vendor Name : ${vendorname} (${vendorid})</td>
					<td nowrap>Product : ${product}</td>
				</tr>
				<tr>
					<td nowrap>Audit Date : ${date2}</td>
					<td nowrap>Insert Date : ${date1}</td>
					<td nowrap>Auditor : ${manager}</td>
				</tr>
				<tr>
					<td nowrap>Total Score : ${score}</td>
				</tr>

				<tr>
					<th nowrap>No</th>
					<th nowrap>Audit Description</th>
					<th nowrap>Score</th>
				</tr>
				<c:forEach var="c" items="${checkResult}">
					<tr>
						<td>
							<div>${c.RNUM}</div>
						</td>
						<td>
							<div>${c.CHECKLIST_DISCRIPTION}</div>
						</td>
						<td><div>${c.AUDIT_SCORE}</div></td>
					</tr>
				</c:forEach>
			</table>
			<br>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</form>

</body>
</html>