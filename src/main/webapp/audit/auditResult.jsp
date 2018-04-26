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
<title>Audit Result</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
</head>
<body>
	<%@ include file="/include/header.jsp"%><br>
	<div class="container" style="font-family: Tahoma;">
		<legend style="font-family: Tahoma; font-size: 20pt;">Audit
			Result</legend>
		<br>
		<form action="./AuditResult" method="POST">
			<p>
				<input type="radio" id="plandate" name="plandate" value="plan" checked="checked"> 
				<label>Audit Plan Date</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" id="plandate" name="plandate" value="score"> 
				<label>Audit Score Input Date</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" id="plandate" name="plandate" value="incomplete" > 
				<label>Incomplete</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" id="plandate" name="plandate" value="compelete" > 
				<label>Passed Vendor</label> 
				<br><br>
				<label>from : <input id="from" name="from" type="date" style="height: 30px"/></label> 
				~ 
				<label>to : <input id="to" name="to" type="date" style="height: 30px" /></label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" id="vSearch" name="vSearch" placeholder="Vendor Search..."
				style="height: 30px">
				<input type="submit" value="Search" class="btn btn-default" style="height: 30px">
			</p>
		
		</form>
		<br> <br>
		<table class="table table-hover" style="width: 200%">
			<div align="center" style="text-align: center;">
			<tr align="center" valign="middle" bordercolor="#333333" style="text-align: center;">
				<th style="text-align: center;">No</th>
				<th style="text-align: center;">ID</th>
				<th style="text-align: center;">Vendor</th>
				<th style="text-align: center;">Product</th>
				<th style="text-align: center;">Plan Date</th>
				<th style="text-align: center;">Comp Date</th>
				<th style="text-align: center;">Score Date</th>
				<th style="text-align: center;">Type</th>
				<th style="text-align: center;">Auditor</th>
				<th style="text-align: center;">Address</th>
				<th style="text-align: center;">Result</th>
				<th style="text-align: center;">Score</th>
				<th style="text-align: center;">Result</th>
				</tr>
			</div>
			
			<c:forEach var="a" items="${arsList}">
				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 12pt;" height="">
						<div align="center">${a.RNUM}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_ID}
						<input type="hidden" value="${a.AUDIT_ID}" id="AUDIT_ID" name="AUDIT_ID">
						</div>
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
					<td><a href="audit/auditVendorResult?vendorname=${a.VENDOR_NAME}
								&id=${a.AUDIT_ID}
								&type=${a.AUDIT_KIND_ID}
								&score=${a.AUDIT_SCORE}
								&prod=${a.PRODUCT_NAME}
								&vendorid=${a.VENDOR_ID}
								&auditor=${a.MEMBER_NAME}
								&auditorId=${a.MEMBER_ID}
								&result=${a.AUDIT_RESULT}"
								data-toggle="modal"
								data-target="#myModal"
								style="text-decoration: underline;"
								>View</a></td>
							

				</tr>
			</c:forEach>
		</table>
		</form>
		<div id="auditorList"></div>
		
		<!-- 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content"></div>
			</div>
		</div>
		<div id="myModal2" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<script>

let today = new Date().toISOString().substr(0, 10);
document.querySelector("#from").value = today;

document.querySelector("#to").valueAsDate = new Date();

</script>
</body>
</html>