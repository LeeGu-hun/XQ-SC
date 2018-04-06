<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="bean.*"%>
<title>Insert title here</title>

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

<link rel="stylesheet" type="text/css" href="/css/style.css?ver=1">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>


</head>
<body>
	<form:form>
		<div id='cssmenu'>
			<ul>
				<li><a href='#'><span>Vendor 등록관리</span></a></li>
				<li class='active has-sub'><a href='#'><span>평가관리</span></a>
					<ul>
						<li class='has-sub'><a href='./AuditManage'><span>평가계획</span></a></li>
						<li class='has-sub'><a href='./AuditResult'><span>평가결과입력</span></a></li>
						<li class='has-sub'><a href='./AuditReport'><span>평가현황</span></a></li>
					</ul></li>
				<li><a href='#'><span>부적합관리</span></a></li>
				<li class='last'><a href='#'><span>시스템 관리</span></a></li>
			</ul>
		</div>

		<p>
			총 : <a href='#'><span>${auditCount}</span></a> 건
		</p>
		<p>
			확정 : <a href='#'><span>${auditCountConfirm}</span></a> 건
		</p>
		<p>
			미확정 : <a href='#'><span>${auditCountNotYet}</span></a> 건
	
		</p>

		<table border="1" id="auditTable">
			<tr>
				<th>No</th>
				<th>Audit ID</th>
				<th>회사명</th>
				<th>Audit 확정 날짜</th>
				<th>Audit 종류</th>
				<th>평가자(ID)</th>
				<th>평가자 연락처</th>
				<th>Vendor 품질 담당자</th>
				<th>Vendor 품질 담당자 연락처</th>
				<th>Vendor 소재지</th>
				<th>등록</th>
			</tr>
			<c:forEach var="auditBeans" items="${listBean}">

				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 12pt;" height="">
						<div align="center">${auditBeans.RNUM} </div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.AUDIT_ID}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.VENDOR_NAME}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.AUDIT_PLAN_DATE}
							<c:if test="${auditBeans.AUDIT_PLAN_DATE==null}">
								<input type="date">
							</c:if>

						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.AUDIT_KIND_ID}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.MEMBER_NAME}(${auditBeans.MEMBER_ID})</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.MEMBER_TEL}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.VENDOR_Q_NAME}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.VENDOR_Q_TEL}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${auditBeans.VENDOR_ADDRESS}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;"><a href='#'><span>Submit</span></a>
					</td>
				</tr>

			</c:forEach>

		</table>
	</form:form>




</body>
</html>