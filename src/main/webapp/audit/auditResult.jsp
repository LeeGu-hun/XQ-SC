<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Audit Report</title>
</head>
<style>
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	height: 600px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

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

<link rel="stylesheet" type="text/css" href="/css/style.css?ver=2">

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

	<div>
		<ul>
			<li><a href='#'><span>Vendor 등록관리</span></a></li>
			<li class='active has-sub'><a href='#'><span>평가관리</span></a>
				<ul>
					<li class='has-sub'><a href='./AuditManage'><span>평가계획</span></a></li>
					<li class='has-sub'><a href='./AuditReport'><span>평가결과입력</span></a></li>
					<li class='has-sub'><a href='./AuditResult'><span>평가현황</span></a></li>
				</ul></li>
			<li><a href='#'><span>부적합관리</span></a></li>
			<li class='last'><a href='#'><span>시스템 관리</span></a></li>
		</ul>
	</div>
	<form action="./AuditResult" method="POST">
		<p>
			<input type="radio" id="plandate" name="plandate" value="plan"
				checked="checked"> <label for="plandate">Audit Plan
				Date</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="radio" id="plandate" name="plandate" value="score"> <label
				for="scoreDate">Audit Score Input Date</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>from
				: <input id="from" name="from" type="date" />
			</label> ~ <label>to : <input id="to" name="to" type="date" /></label> <br>
			<br> <label>Vendor Search</label> <input type="text"
				id="vSearch" name="vSearch">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
				value="조회">
		</p>
	</form>
	<br>
	<br>
	<table border="1" id="auditTable">
		<tr>
			<th>No</th>
			<th>Audit ID</th>
			<th>Vendor (ID)</th>
			<th>Product (ID)</th>
			<th>Audit Plan Date</th>
			<th>Audit Compleate Date</th>
			<th>Audit Score Input Date</th>
			<th>Audit Type</th>
			<th>Auditor(ID)</th>
			<th>Vendor Address</th>
			<th>Audit Result</th>
			<th>Score</th>
			<th>Result Status</th>
		</tr>
		<c:forEach var="a" items="${arsList}">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 12pt;" height="">
					<div align="center">${a.RNUM}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_ID}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.VENDOR_NAME}(${a.VENDOR_ID})</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.PRODUCT_NAME}(${a.PRODUCT_ID})</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_PLAN_DATE}
						<c:if test="${a.AUDIT_PLAN_DATE ==null}">
							-
							</c:if>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_COMP_DATE}
						<c:if test="${a.AUDIT_COMP_DATE ==null}">
							-
							</c:if>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_RSINPUT_DATE}
						<c:if test="${a.AUDIT_RSINPUT_DATE ==null}">
							-
							</c:if>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_KIND_ID}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.MEMBER_NAME}(${a.MEMBER_ID})</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.VENDOR_ADDRESS}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_RESULT}
						<c:if test="${a.AUDIT_RESULT ==null}">
							-
							</c:if>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${a.AUDIT_SCORE}
						<c:if test="${a.AUDIT_SCORE ==null}">
							-
							</c:if>
					</div>
				</td>

					
					<td><a
								href="audit/auditVendorResult?vendorname=${a.VENDOR_NAME}
								&id=${a.AUDIT_ID}
								&type=${a.AUDIT_KIND_ID}
								&score=${a.AUDIT_SCORE}
								&prod=${a.PRODUCT_NAME}
								&vendorid=${a.VENDOR_ID}
								&auditor=${a.MEMBER_NAME}
								&auditorId=${a.MEMBER_ID}
								&result=${a.AUDIT_RESULT}"
								class="btn-btn-default" type="button" data-toggle="modal"
								data-target="#myModal">보기</a></td>
					
			</tr>
		</c:forEach>
	</table>
	</form>
	<!-- 모달 -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width: 70%">
			<div class="modal-content"></div>
		</div>
	</div>
	</div>
</body>
</html>