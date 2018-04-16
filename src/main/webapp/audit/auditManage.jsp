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
	function auditConfirm() {
		$.ajax({
			type : "GET",
			url : "audit/auditConfirm",
			success : result
		});

	}

	function newVendorAudit() {
		$.ajax({
			type : "GET",
			url : "audit/newVendorAudit",
			success : result
		});

	}

	function regularVendorAudit() {
		$.ajax({
			type : "GET",
			url : "audit/regularVendorAudit",
			success : result
		});

	}

	function result(msg) {
		$("#result").html(msg);

	}
</script>

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>

</head>
<body>
	<form:form>
		<div id='cssmenu'>
			<ul>
				<li><a href='#'><span>Vendor 등록관리</span></a></li>
				<li class='active has-sub'><a href='#'><span>평가관리</span></a>
					<ul>
						<li class='has-sub'><a href='./AuditManage'><span>평가계획조회</span></a></li>
						<li class='has-sub'><a href='./AuditPlanInsert'><span>평가계획입력</span></a></li>
						<li class='has-sub'><a href='./AuditReport'><span>평가결과입력</span></a></li>
						<li class='has-sub'><a href='./AuditResult'><span>평가현황</span></a></li>
					</ul></li>
				<li><a href='#'><span>부적합관리</span></a></li>
				<li class='last'><a href='#'><span>시스템 관리</span></a></li>
			</ul>
		</div>

		<p>
			Total : <a href='./AuditManage'><span>${allCount}</span></a>
		</p>
		<p>
			Regular Vendor Audit : <a href='#'
				onclick="javascript:regularVendorAudit()">${regularVencorCount}</a>
		</p>
		<p>
			New Vendor Audit : <a href='#' onclick="javascript:newVendorAudit()">${newVendorCount}</a>
		</p>
		<p>
			Complete Audit Case: <a href='#' onclick="javascript:auditConfirm()">${completeCount}</a>
		</p>
		<span id="result">
			<table border="1" id="auditTable">
				<tr>

					<th>No</th>
					<th>Audit ID</th>
					<th>Vendor Name(ID)</th>
					<th>Audit Type</th>
					<th>Audit Plan Date</th>
					<th>Audit Outcall Date</th>
					<th>Auditor(ID)</th>
					<th>Auditor Tel</th>
					<th>Vendor Quality Manager(Tel)</th>
					<th>Vendor Sales Manager (Tel)</th>
					<th>Vendor Address</th>
					<th>Submit</th>
				</tr>

				</span>
				<c:forEach var="audit" items="${listBean}">

					<tr align="center" valign="middle" bordercolor="#333333">
						<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
							<div align="center">${audit.RNUM}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
							<div align="center">${audit.AUDIT_ID}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_NAME}(${audit.VENDOR_ID})</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.AUDIT_KIND_ID}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.AUDIT_PLAN_DATE}
								<c:if test="${audit.AUDIT_PLAN_DATE==null}">
									<input type="date">
								</c:if>
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.AUDIT_COMP_DATE}
								<c:if test="${audit.AUDIT_COMP_DATE==null}">
									<input type="date">
								</c:if>
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
								<input type="text">
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.MEMBER_TEL}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_Q_NAME}(${audit.VENDOR_Q_TEL})</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_S_NAME}(${audit.VENDOR_S_TEL})</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_ADDRESS}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;"><a
							href='#'><span>Submit</span></a></td>
					</tr>

				</c:forEach>

			</table>
	</form:form>
</body>
</html>