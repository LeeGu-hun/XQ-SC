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


QQQQQQQQQQQQQQQQQQQ
<div class="container" style="font-family: Tahoma;">
	<form method="POST" action="./audit/auditPlan" name="auditForm">
		<div class="modal-header">
			<h1>Audit Plan Insert</h1>
		</div>
		<div class="modal-body">
			<table class="table">
			<br>
				<c:forEach var="v" items="${vendorInfo}">
				<br>
				<tr>
					<td nowrap>Vendor Name : ${v.VENDOR_NAME}</td>
				
				</tr>
				<tr>
					<td nowrap>Vendor ID : ${v.VENDOR_ID}</td>
					
					
					<td nowrap>Audit Date :</td>
					<td><input type="date" name="AUDIT_COMP_DATE"
					id="AUDIT_COMP_DATE" style="height: 30px"></td>
				</tr>
			
	</table>
	</c:forEach>
	</form>
</div>
<script>

let today = new Date().toISOString().substr(0, 10);
document.querySelector("#AUDIT_COMP_DATE").value = today;

document.querySelector("#AUDIT_RSINPUT_DATE").valueAsDate = new Date();

</script>
</body>
</html>