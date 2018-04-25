<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.3">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	href="${pageContext.request.contextPath}/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function searchAudit() {
		var vendorName = document.getElementById("vendorName").value;
		$.ajax({
			type : "POST",
			url : "./searchAudit",
			data : "vendorName=" + vendorName,
			success : result,
		});
	}

	function result(msg) {
		$("#auditListbody").html(msg);
	}

	function rowselect(audit_id, vendor_name, audit_comp_date, audit_kind,
			audit_result, member_name) {
		$("#audit_id").val(audit_id);
		$("#vendor_name").val(vendor_name);
		$("#audit_date").val(audit_comp_date);
		$("#audit_kind").val(audit_kind);
		$("#audit_result").val(audit_result);
		$("#auditor_name").val(member_name);
		$('#layerpop').modal('hide');

	}

	function ncrIssue() {
		formNcrIssue.submit();
	}
</script>

<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NCR Register</title>
</head>
<body style="background-color: white">

	<%@ include file="/include/header.jsp"%>
	<div>&nbsp;</div>
	<div id=mainBox class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">NCR Management</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div>
							<form action="./ncrIssue" method="post" name="formNcrIssue"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Audit No.</td>
										<td><input type="text" id="audit_id" name="audit_id"
											data-target="#layerpop" data-toggle="modal"
											class="form-control"> <form:form
												commandName="ncrIssueCommand">
												<span style="font-size: 9pt; color: red;"><form:errors
														path="audit_id" /></span>
											</form:form></td>
										<td>Vendor Name</td>
										<td><input type="text" id="vendor_name"
											name="vendor_name" class="form-control" readonly></td>
										<td>Audit date</td>
										<td><input type="text" id="audit_date" name="audit_date"
											class="form-control" readonly></td>
									<tr>
									<tr>
										<td>Kind of Audit</td>
										<td><input type="text" class="form-control"
											id="audit_kind" readonly></td>
										<td>Audit Result</td>
										<td><input type="text" class="form-control"
											id="audit_result" readonly></td>
										<td>Auditor</td>
										<td><input type="text" class="form-control"
											id="auditor_name" readonly></td>
									<tr>
									<tr>
										<td>Subject</td>
										<td><input type="text" class="form-control"
											name="ncr_title"> <form:form
												commandName="ncrIssueCommand">
												<span style="font-size: 9pt; color: red;"><form:errors
														path="ncr_title" /></span>
											</form:form></td>
										<td>Issuer</td>
										<td><input type="text" class="form-control"
											value="${issuer_name }"></td>
										<td>Grade</td>
										<td><select id="ncr_grade_id" name="ncr_grade_id"
											class="form-control">
												<option value="N">N</option>
												<option value="M">M</option>
										</select></td>
									</tr>
									<tr>
										<td>Description <form:form commandName="ncrIssueCommand">
												<span style="font-size: 9pt; color: red;"><form:errors
														path="ncr_description" /></span>
											</form:form></td>
										<td colspan="7"><textarea class="form-control"
												style="width: 100%; height: 500px;" id="ncr_description"
												name="ncr_description"></textarea></td>
									</tr>
									<tr>
										<td>file_upload</td>
										<td colspan="5"><input type="file" multiple id="ncr_file"
											name="ncr_file"></input></td>
										<td><button type="button" class="btn btn-default"
												onclick="ncrIssue()">Issue</button></td>
								</table>
							</form>
						</div>

						<!--  모달 시작 -->

						<div class="modal fade" id="layerpop">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px">
									<!-- header -->
									<div class="modal-header">
										<!-- 닫기(x) 버튼 -->
										<button type="button" class="close" data-dismiss="modal">×</button>
										<!-- header title -->
										<h4 class="modal-title">Audit Search</h4>
									</div>
									<!-- body -->
									<div class="modal-body">
										<div>
											<form id="formSearchAudit" name="formSearchAudit"
												method="post">
												<table class="table">
													<tr>
														<td style="width: 650px"><label>Vendor Name:</label><input
															type="text" class="form-control" name="vendorName"
															id="vendorName"/ ></td>
														<td style="vertical-align: bottom">
															<button type="button" class="btn btn-default"
																id="btnsearch" onclick="searchAudit()">Search</button>
														</td>

													</tr>

												</table>
											</form>
										</div>
										<div id="auditListbody"></div>
									</div>
									<!-- Footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">close</button>
									</div>
								</div>
							</div>
						</div>

						<!--  모달 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>