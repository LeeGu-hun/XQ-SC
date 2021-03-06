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
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<title>Vendor Register</title>

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
		height: 100%
	}
}
</style>

<script>
	function updateRegister(id) {
		//	document.getElementById('updateform').submit();
		//updateform.submit(id);
		location.href = "./vendor/vendorUpdate/" + id;
	}

	function deleteRegister(id) {
		//	document.getElementById('updateform').submit();
		//updateform.submit();
		location.href = "./vendor/vendorDelete/" + id;
	}
</script>

<body>
	<%@ include file="/include/header.jsp"%>
	<div>&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-15">
				<div class="panel panel-default">
					<div class="panel-heading">Vendor Register</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<p>
						<div class="container" style="font-family: Tahomsa;">
							<font style="font-family: Tahoma; font-size: 10pt;">New Registration : ${cnts} </font>
							</p>
							<form action="./vendor/vendorUpdate" method="POST"
								enctype="multipart/form-data" name="updateform"
								commandName="cmd">
								
								<div class="table-responsive" style="max-height: 700px;">
								<table class="table">
									<tr align="center" valign="middle">
										<td>
											<div>Vendor ID</div>
										</td>
										<td>
											<div>Vendor Name</div>
										</td>
										<td>
											<div>Product Name</div>
										</td>
										<td>
											<div>Sales Incharge Name</div>
										</td>
										<td>
											<div>Sales Incharge Tel</div>
										</td>
										<td colspan="3"></td>

									</tr>

									<c:forEach var="li" items="${list}">
										<tr align="center" valign="middle" bordercolor="#333333">
											<td>${li.VENDOR_ID}</td>
											<input type="hidden" id="VENDOR_ID" name="VENDOR_ID"
												value="${li.VENDOR_ID}"/ >
											<td>${li.VENDOR_NAME}</td>
											<input type="hidden" id="VENDOR_NAME" name="VENDOR_NAME"
												value="${li.VENDOR_NAME}"/ >
											<td>${li.PRODUCT_NAME}</td>
											<td>${li.VENDOR_S_NAME}</td>
											<input type="hidden" id="VENDOR_S_NAME" name="VENDOR_S_NAME"
												value="${li.VENDOR_S_NAME}"/ >
											<td>${li.VENDOR_S_TEL}</td>
											<input type="hidden" id="VENDOR_S_TEL" name="VENDOR_S_TEL"
												value="${li.VENDOR_S_TEL}"/ >
											<input type="hidden" id="VENDOR_S_EMAIL"
												name="VENDOR_S_EMAIL" value="${li.VENDOR_S_EMAIL}"/ >
											<td><input type="button" class="btn btn-default"
												href="./vendor/vendorView/${li.VENDOR_ID}"
												data-toggle="modal" data-target="#viewModal" data-backdrop="static"
												data-keyboard="false" value="View"></td>

											<!-- 모달 -->
											<div id="viewModal" class="modal fade" role="dialog">
												<div class="modal-dialog" style="width: 60%;">
													<div class="modal-content">
													</div>
												</div>
											</div>
											<td><input type="button" class="btn btn-default"
												onclick="updateRegister('${li.VENDOR_ID}')" value="Register"></td>
											<td><input type="button" class="btn btn-default"
												onclick="deleteRegister('${li.VENDOR_ID}')" value="Cancel"></td>
										</tr>

									</c:forEach>


								</table>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>