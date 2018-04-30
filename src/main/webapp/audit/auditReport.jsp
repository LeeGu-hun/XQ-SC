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
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
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

<%@ include file="/include/header.jsp"%><br>
	<div>&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-15">
				<div class="panel panel-default">
					<div class="panel-heading">Audit Result Input</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<p>
						<div class="container" style="font-family: Tahomsa;">
		<form action="./AuditReport" method="POST">
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for="scoreDate">Date Search</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label>from : <input id="from" name="from" type="date" style="height: 30px"/> </label> ~ 
			<label>to : <input id="to" name="to" type="date" style="height: 30px"/></label> 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<label for = "vSearch">Vendor Search    </label> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" id="vSearch" name="vSearch" placeholder="Vendor Search..." 
			style="height: 30px">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="submit" value="Search" class="btn btn-default"	style="height: 30px">
		</p>

	</form>
			<br> 
			<div class="table-responsive" style="max-height: 700px;">
			<table class="table table-hover" style="max-width: 1000px; margin: auto;">
				<tr align="center" bordercolor="#333333">
					<th style="text-align: center;">No</th>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Plan Date</th>
					<th style="text-align: center;">Vendor</th>
					<th style="text-align: center;">Category</th>
					<th style="text-align: center;">Product</th>
					<th style="text-align: center;">Audit Type</th>
					<th style="text-align: center;">Manager</th>
					<th style="text-align: center;">Vendor Address</th>
					<th style="text-align: center;">Submit Result</th>
				</tr>
					<c:forEach var="a" items="${auditBeans}">
					<c:if test="${a.AUDIT_PLAN_DATE!=null}">
						<tr align="center" valign="middle" bordercolor="#333333">
							<td style="font-family: Tahoma; font-size: 12pt;" height="">
								<div align="center">${a.RNUM}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;" height="">
								<div align="center">${a.AUDIT_ID}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${a.AUDIT_PLAN_DATE}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${a.VENDOR_NAME}(${a.VENDOR_ID})</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${a.CATEGORY_NAME}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${a.PRODUCT_NAME}(${a.PRODUCT_ID})</div>
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
							<td><a
								href="audit/auditInsert?vendorname=${a.VENDOR_NAME}
								&vendorid=${a.VENDOR_ID}
								&auditid=${a.AUDIT_ID}
								&auditType=${a.AUDIT_KIND_ID}"
								data-toggle="modal"
								data-target="#myModal"  
								style="text-decoration: underline;"
								>Register</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			</div>
	
		<!-- 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content" style="height:700px; overflow-y: scroll;"></div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

<script>

let today = new Date().toISOString().substr(0, 10);
document.querySelector("#from").value = today;

document.querySelector("#to").valueAsDate = new Date();

</script>
</body>
</html>