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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 


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

	function add() {
		form.submit();
	}

	function rowselect1(AUDITOR_ID, auditor_name) {
		$("#AUDITOR_ID").val(AUDITOR_ID);
		$("#auditor_name").val(auditor_name);
		$('#issuerSearchModal').modal('hide');

	}
	
	function searchIssuerId(){	
		var auditor_name = document.getElementById("auditor_name").value;
		$.ajax({
			type : "POST",
			url : "./searchAuditorId",
			data : "auditor_name="+ auditor_name,
			success : result1,
		});
		
	}

	function result1(msg1){
		$("#issuerList").html(msg1);
	}

</script>

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

</head>
<body>
<form:form>
	<table>
		<tr>
			<th>No</th>

			<th>Vendor Name</th>
			<th>Vendor ID</th>
			<th>Audit Type</th>
			<th>Vendor Quality Manager(Tel)</th>
			<th>Vendor Sales Manager (Tel)</th>
			<th>Vendor Address</th>
			<th>Auditor</th>
			<th>Audit Plan Date</th>
			<th>Audit Outcall Date</th>
			<th>Submit</th>
		</tr>


		<c:forEach var="audit" items="${listBean}">

			<tr align="center" valign="middle" bordercolor="#333333">
				<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
					<div align="center">${audit.RNUM}</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.VENDOR_NAME}</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">
						<input type="text" value="${audit.VENDOR_ID}" readonly="readonly"
							name="VENDOR_ID">
					</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">
						<input type="text" value="RE" readonly="readonly"
							name="AUDIT_KIND_ID">
					</div>
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
							<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">
								<input type="text" name="AUDITOR_ID">
									<image src="${pageContext.request.contextPath}/images/icon_search.gif" 
									data-target="#issuerSearchModal" 
									data-toggle="modal" ></image>
							</div>
						</td>

				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">
						<input type="date" name="AUDIT_PLAN_DATE">
					</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">
						<input type="date" name="AUDIT_COMP_DATE">
					</div>
				</td>


				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><a
					href='#' onclick="add()"><span>Submit</span></a></td>
			</tr>

		</c:forEach>

	</table>
	
	<!--  모달 시작 -->
		<div class="modal fade" id="#issuerSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">Auditor Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div>
							<form id="formSearchIssuer" name="formSearchIssuer" method="post">
								<table class="table">
									<tr>
										<td>Auditor Name: <input type="text" name="auditor_name"
											id="auditor_name" /></td>
										<td><input class="button" type="button" value="dddddd"
											id="btnsearch" onclick="searchIssuerId()"></td>
									</tr>

								</table>
							</form>
						</div>
						<div id="issuerList"></div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div> <!--  모달 끝 --> 
		
		
		<!--  모달 시작 -->
		<div class="modal fade" id="issuerSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">Auditor Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div>
							<form id="formSearchIssuer" name="formSearchIssuer" method="post">
								<table class="table">
									<tr>
										<td>Auditor Name: <input type="text" name="auditor_name"
											id="auditor_name" /></td>
										<td><input class="button" type="button" value="Search"
											id="btnsearch" onclick="searchIssuerId()"></td>
									</tr>

								</table>
							</form>
						</div>
						<div id="issuerList"></div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div> <!--  모달 끝 -->
</form:form>
</body>

