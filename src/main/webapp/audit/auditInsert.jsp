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
		for (var i = 0; i < scores.length; i++) {
			if (scores[i].value == "") {
				total = total + 0;
			} else if (scores[i].value > 20) {
				scores[i].value = 0;
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
	<form method="POST" action="./audit/auditInsert" name="auditForm">
		<div class="modal-header">
			<h2>Audit Result Report</h2>
		</div>
		<div class="modal-body"">
			<table>
				<label>${manager}님 환영합니다</label>

				<tr>
					<td nowrap>Audit ID :</td>
					<td><input type="text" value="${auditid}" name="AUDIT_ID"></td>
					<td><input type="text" value="${auditType}"
						name="AUDIT_KIND_ID"></td>

				</tr>
				<tr>
					<td nowrap>Vendor ID :</td>
					<td><input type="text" value="${vendorid}" name = "VENDOR_ID"></td>
					<td nowrap>Vendor Name :</td>
					<td><input type="text" value="${vendorname}"></td>
					<td nowrap>Audit Date :</td>
					<td><input type="date" name = "AUDIT_COMP_DATE"></td>
				</tr>
				<tr>
					<td nowrap>Category :</td>
					<td><input type="text" value="${category}" readonly></td>
					<td nowrap>Product :</td>
					<td><input type="text" value="${product}"></td>
					<td nowrap>Insert Date :</td>
					<td><input type="date" name="AUDIT_RSINPUT_DATE"></td>
				</tr>

			</table>
			<br> <span id="result">
				<table>
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
								<input type="hidden" value="${c.CHECKLIST_ID}" name = "cId"></div>
							</td>
							
							<td>
								<div>${c.CHECKLIST_DISCRIPTION}
									<input type="hidden" value="${c.CHECKLIST_DISCRIPTION}"
										name="" />
								</div>
							</td>
							<td>
								<input type="text" class="score" maxlength="2"
								name="score" id="score" onKeyUp="onlyNum();"
								onKeyPress="onlyNum();" onKeyDown="onlyNum();">
							</td>
							<td><div>${c.CHECKLIST_FULLSCORE}</div></td>
						</tr>
						</c:forEach>
				</c:if>
				<c:if test="${auditType == 'RE'}"> 
					<c:forEach var="c" items="${checkListRE}">
						<tr>
							<td>
								<div>${c.RNUM}
								<input type="hidden" value="${c.CHECKLIST_ID}" name = "cId"></div>
							</td>
							
							<td>
								<div>${c.CHECKLIST_DISCRIPTION}
									<input type="hidden" value="${c.CHECKLIST_DISCRIPTION}"
										name="" />
								</div>
							</td>
							<td>
								<input type="text" class="score" maxlength="2"
								name="score" id="score" onKeyUp="onlyNum();"
								onKeyPress="onlyNum();" onKeyDown="onlyNum();">
							</td>
							<td><div>${c.CHECKLIST_FULLSCORE}</div></td>
						</tr>
						</c:forEach>
				</c:if>
					<td nowrap>총 합계: <input type="text" name="total" id="total"
						name="AUDIT_SCORE">
					</td>
				</table>
			</span>
		</div>
		<div class="modal-footer">
			<input type="submit" value="서브밋" />
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</form>

</body>
</html>