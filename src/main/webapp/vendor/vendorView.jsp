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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">

</head>

<script>
function isopopup()
{window.open("./upload/${view.VENDOR_ISO_FILE}");}

function certpopup()
{window.open("./upload/${view.VENDOR_CERT_FILE}");}
</script>

<body>

	<div class="modal-body">
		<h2>Detail View</h2>
		<table class="table">
			<tr>
				<td>Vendor ID :</td>
				<td>${view.VENDOR_ID}</td>
				<td>Vendor Name :</td>
				<td>${view.VENDOR_NAME}</td>
			</tr>
			<tr>
				<td>Employees :</td>
				<td>${view.VENDOR_EMP_NO}</td>
			</tr>

			<tr>
				<td>Address :</td>
				<td>${view.VENDOR_ADDRESS}</td>
			</tr>
			<tr>

				<td>Category :</td>
				<td>${view.CATEGORY_NAME}</td>
				<td>Product :</td>
				<td>${view.PRODUCT_NAME}</td>
				</td>
			<tr>
				<td>Request Date :</td>
				<td><fmt:formatDate value="${view.VENDOR_REQ_DATE}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>Quality Incharge Name :</td>
				<td>${view.VENDOR_Q_NAME}</td>
				<td>Quality Incharge Email</td>
				<td>${view.VENDOR_Q_EMAIL}</td>
				<td>Quality Incharge Tel :</td>
				<td>${view.VENDOR_Q_TEL}</td>
			</tr>
			<tr>
				<td>Sales Incharge Name :</td>
				<td>${view.VENDOR_S_NAME}</td>
				<td>Sales Incharge Email :</td>
				<td>${view.VENDOR_S_EMAIL}</td>
				<td>Sales Incharge Tel :</td>
				<td>${view.VENDOR_Q_TEL}</td>
			</tr>
			<tr>
				<td>Certificate Of Quality :</td>
				<td><a href="#" onclick="isopopup()">${view.VENDOR_ISO_FILE}</td>	
			</tr>
			
			<tr>
				<td>Business License :</td>
				<td><a href="#" onclick="certpopup()">${view.VENDOR_CERT_FILE}</td>
				
			</tr>
		</table>

	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>

</body>
</html>