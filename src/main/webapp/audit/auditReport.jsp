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


<script language="javascript">
	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "audit/prodList",
			data : "selCate=" + selCate,
			success : result
		});

	}

	function result(msg) {
		("#spProd").html(msg);
	}

	function selectId() {
		var auditId = document.getElementById("auditId").value;

		$.ajax({
			type : "GET",
			url : "audit/auditInsert",
			data : "selId=" + selId,
			success : result
		});

	}

	function result(msg) {
		$("#spProd").html(msg);

	}
</script>

</head>
<body>
	<div>

		<form>
			<div id=''>
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
			<table>
				<tr>
					<td colspan="2" align="right"><input type="Text"
						value="Audit ID" name="search" onfocus="this.value=''"> <input
						type="button" value="Search"></td>
				</tr>
			</table>
			<br> <br>
			<table border="1" id="auditTable">
				<tr>
					<th>No</th>
					<th>Audit ID</th>
					<th>Date</th>
					<th>Vendor(ID)</th>
					<th>Category</th>
					<th>Product(ID)</th>
					<th>Audit Type</th>
					<th>Manager(ID)</th>
					<th>Vendor Address</th>
					<th>Submit Result</th>
				</tr>
				<c:forEach var="auditBeans" items="${auditBeans}">
					<c:if test="${auditBeans.AUDIT_PLAN_DATE!=null}">
						<tr align="center" valign="middle" bordercolor="#333333">
							<td style="font-family: Tahoma; font-size: 12pt;" height="">
								<div align="center">${auditBeans.RNUM}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;" height="">
								<div align="center">${auditBeans.AUDIT_ID}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.AUDIT_PLAN_DATE}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.VENDOR_NAME}(${auditBeans.VENDOR_ID})</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.CATEGORY_NAME}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.PRODUCT_NAME}(${auditBeans.PRODUCT_ID})</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.AUDIT_KIND_ID}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.MEMBER_NAME}(${auditBeans.MEMBER_ID})</div>
							</td>

							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.VENDOR_ADDRESS}</div>
							</td>
							<td><a
								href="audit/auditInsert?vendorname=${auditBeans.VENDOR_NAME}
								&vendorid=${auditBeans.VENDOR_ID}
								&date=${auditBeans.AUDIT_PLAN_DATE}
								&manager=${auditBeans.MEMBER_NAME}
								&category=${auditBeans.CATEGORY_NAME}
								&product=${auditBeans.PRODUCT_NAME}
								&auditid=${auditBeans.AUDIT_ID}
								&auditType=${auditBeans.AUDIT_KIND_ID}"
								class="btn-btn-default" type="button" data-toggle="modal"
								data-target="#myModal">Register</a></td>
						</tr>
					</c:if>
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