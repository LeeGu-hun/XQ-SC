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
				<br>
				<tr>
					<td nowrap>Audit ID : ${auditid}</td>
					<td><input type="hidden" value="${auditid}" name="AUDIT_ID"></td>
					<td nowrap>Audit Type : ${auditType}</td>
					<td><input type="hidden" value="${auditType}"
						name="AUDIT_KIND_ID"></td>
				</tr>
				<tr>
					<td nowrap>Vendor ID : ${vendorid}</td>
					<td><input type="hidden" value="${vendorid}" name="VENDOR_ID"></td>
					<td nowrap>Vendor Name : ${vendorname}</td>
					<td><input type="hidden" value="${vendorname}"></td>
					
				</tr>
				<tr>
					<td nowrap>Insert Date :</td>
					<td><input type="date" name="AUDIT_RSINPUT_DATE"
					id="AUDIT_RSINPUT_DATE" style="height: 30px"></td>
					<td nowrap>Audit Date :</td>
					<td><input type="date" name="AUDIT_COMP_DATE"
					id="AUDIT_COMP_DATE" style="height: 30px"></td>
				</tr>
	</table>
			<br> <span id="result">
				<table class="table">
					<tr>
						<th nowrap>No</th>
						<th nowrap>Audit Description</th>
						<th nowrap>Audit</th>
						<th nowrap>Score</th>
					</tr>
					</td>
					<c:if test="${auditType == 'NE'}">
						<c:forEach var="c" items="${checkListNE}">
							<tr>
								<td>
									<div>${c.RNUM}
										<input type="hidden" value="${c.CHECKLIST_ID}" name="cId">
									</div>
								</td>

								<td>
									<div>${c.CHECKLIST_DISCRIPTION}
										<input type="hidden" value="${c.CHECKLIST_DISCRIPTION}"
											name="" />
									</div>
								</td>
								<td><input type="text" class="score" maxlength="2"
									name="score" id="score" onKeyUp="onlyNum();"
									onKeyPress="onlyNum();" onKeyDown="onlyNum();"></td>
								<td><div>${c.CHECKLIST_FULLSCORE}
								<input type="hidden" value="${c.CHECKLIST_FULLSCORE}" name="full" id="full">
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
										<input type="hidden" value="${c.CHECKLIST_FULLSCORE}" name="full" id="full">
									</div>
								</td>
								<td><input type="text" class="score" maxlength="2"
									name="score" id="score" onKeyUp="onlyNum();"
									onKeyPress="onlyNum();" onKeyDown="onlyNum();"></td>
								<td><div>${c.CHECKLIST_FULLSCORE}</div></td>
							</tr>
						</c:forEach>
					</c:if>
					<td nowrap>Total Score: <input type="text" name="total" id="total"
						name="AUDIT_SCORE" readonly="readonly">
					</td>
				</table>
			</span>
		</div>
		<div class="modal-footer">
			<input type="submit" value="Submit" class="btn btn-default"/>
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