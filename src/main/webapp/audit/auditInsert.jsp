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
	var total = document.querySelectorAll('#total');
	var vendorId = document.querySelectorAll('#vendorId');
	var auditid = document.querySelectorAll('#auditid');

	function updateScore() {
		auditForm.submit();
	}

	function scoreCal() {
		total = 0;
		var scores = document.querySelectorAll('#score');
		var fulls = document.querySelectorAll('#full');
		for (var i = 0; i < scores.length; i++) {
			if (scores[i].value == "") {
				total = total + 0;
			} else if (scores[i].value > fulls[i].value) {
				scores[i].value = "";
				scores[i].focus();
			} else {
				total = total + parseInt(scores[i].value);
			}
		}
		document.getElementById('total').value = total;
	}
	function onlyNum() {
		var keycode = window.event.keyCode;
		if (keycode == 8 || (keycode >= 35 && keycode <= 40)
				|| (keycode >= 46 && keycode <= 57)
				|| (keycode >= 96 && keycode <= 105) || keycode == 110
				|| keycode == 190) {
			window.event.returnValue = true;
			scoreCal();
			return;
		} else {
			window.event.returnValue = false;
			return;
		}
	}
	
	
</script>
</head>
<body>
	<div class="container" style="font-family: Tahoma;">
		<form method="POST" action="./audit/auditInsert" name="auditForm">
			<div class="modal-header">
				<h1>Audit Result Report</h1>
			</div>
			<div class="modal-body">
				<table class="table">
					<br>
					<tr>
						<td>Audit ID : ${auditid}
						<input type="hidden" value="${auditid}" id="auditid" name="auditid">
						</td>
						<td><input type="hidden" value="${auditid}" name="AUDIT_ID"></td>
						<td>Audit Type : ${auditType}</td>
						<td><input type="hidden" value="${auditType}"
							name="AUDIT_KIND_ID"></td>
					</tr>
					<tr>
					<c:forEach var="g" items="${getVendorName}">
						<td>Vendor ID : ${g.VENDOR_ID}</td>
						<td><input type="hidden" value="${g.VENDOR_ID}" name="VENDOR_ID"></td>
						<td>Vendor Name : ${g.VENDOR_NAME}</td>
						<td><input type="hidden" value="${g.VENDOR_NAME}"></td>
					</tr>
						</c:forEach>
					<tr>
						<td>Insert Date :</td>
						<td><input type="date" name="AUDIT_RSINPUT_DATE"
							id="AUDIT_RSINPUT_DATE" style="height: 30px"></td>
						<td>Audit Date :</td>
						<td><input type="date" name="AUDIT_COMP_DATE"
							id="AUDIT_COMP_DATE" style="height: 30px"></td>
					</tr>
				</table>
				<br> <span id="result">
					<table class="table">
						<tr>
							<th style="width: 10%">No</th>
							<th style="width: 55%">Audit Description</th>
							<th style="width: 25%">Audit</th>
							<th style="width: 10%">Highest Score</th>
						</tr>
						</td>
						<c:if test="${auditType == 'NE'}">
							<c:forEach var="c" items="${checkListNE}">
								<tr>
									<td style="width: 20px">
										<div style="align-content: center; width: 20px">${c.RNUM}
											<input type="hidden" value="${c.CHECKLIST_ID}" name="cId">
										</div>
									</td>

									<td>
										<div>${c.CHECKLIST_DISCRIPTION}
											<input type="hidden" value="${c.CHECKLIST_DISCRIPTION}">
										</div>
									</td>
									<td><input type="text" path="id" class="score"
										maxlength="2" name="score" id="score" onKeyUp="onlyNum();"
										onKeyPress="onlyNum();" onKeyDown="onlyNum();"> <span
										style="font-size: 9pt; color: red;"> <form:errors
												path="id" /></span></td>
									<td><div style="align-content: center;">${c.CHECKLIST_FULLSCORE}
											<input type="hidden" value="${c.CHECKLIST_FULLSCORE}"
												name="full" id="full">
										</div></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${auditType == 'RE'}">
							<c:forEach var="c" items="${checkListRE}">
								<tr>
									<td>
										<div>${c.RNUM}
											<input type="hidden" value="${c.CHECKLIST_ID}" name="cId">
										</div>
									</td>

									<td>
										<div>${c.CHECKLIST_DISCRIPTION}
											<input type="hidden" value="${c.CHECKLIST_FULLSCORE}"
												name="full" id="full">
										</div>
									</td>
									<td><input type="text" class="score" maxlength="2"
										name="score" id="score" onKeyUp="onlyNum();"
										onKeyPress="onlyNum();" onKeyDown="onlyNum();"> <form:form
											commandName="ncrIssueCommand">
											<span style="font-size: 9pt; color: red;"><form:errors
													path="audit_id" /></span>
										</form:form></td>
									<td><div style="align-content: center;">${c.CHECKLIST_FULLSCORE}</div></td>
								</tr>
							</c:forEach>
						</c:if>
						<td>Total Score: <input type="text" name="total" id="total"
							name="AUDIT_SCORE" readonly="readonly">
						</td>
					</table>
				</span>
			</div>
			<div class="modal-footer">
				<input type="submit" value="Submit" class="btn btn-default" />
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>

		</form>
	</div>
	<script>
		let today = new Date().toISOString().substr(0, 10);
		document.querySelector("#AUDIT_COMP_DATE").value = today;

		document.querySelector("#AUDIT_RSINPUT_DATE").valueAsDate = new Date();
	</script>
</body>
</html>