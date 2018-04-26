<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>

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
	
<script language="javascript">
function searchVendorId() {
	var vendor_name = document.getElementById("vendor_name").value;

	$.ajax({
		type : "POST",
		url : "./vendor/vendorSearch",
		data : "vendor_name=" + vendor_name,
		success : result,
	});
}


function result(msg) {
	$("#vendorList").html(msg);
}


function rowselect(vendor_name, vendor_id) {
	$("#vendor_name").val(vendor_name);
	$("#vendor_id").val(vendor_id);
	$('#vendorSearchModal').modal('hide');
}

	
	function statusSearch(){
		$("#VALID option selected").val();
		statusform.submit();
	}
	
</script>
<style>

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal {
	text-align: center;
	
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		
	}
}



</style>
<body>

<%@ include file="/include/header.jsp"%>

	<div class="container" >
	<br>
		<legend style="font-family: Tahoma; font-size: 20pt;">Vendor
			Status</legend><br>
		<form action="./vendorStatus" method="post" name="statusform"
			id="statusform" >

			<table class="table table-hover">
			
				<tr>
					<td>Vendor Name:</td>
					<td><input type="text" class="form-control" style="width:200px;" id="VENDOR_NAME" name="VENDOR_NAME" ></td>

					<td>Product Name:</td>
					<td><select id="PRODUCT_ID" name="PRODUCT_ID" style="width:200px;"  class="form-control" >
							<option value="All">All</option>
							<c:forEach var="p" items="${map.prodList}">
								<option value="${p.PRODUCT_ID}">${p.PRODUCT_NAME}</option>
							</c:forEach>
					</select></td>

					<td>Valid:</td>
					<td><select id="VALID" name="VALID" style="width: 150px;" class="form-control">
							<option value="All">All</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
					</select></td>
					<td><input class="btn btn-default"  
						type="submit" value="Search" onclick="statusSearch()"></td>
				</tr>
			</table>

		</form>
	</div>
	
		<div class="container">
			<table class="table table-hover" >
				<tr align="center" valign="middle" bordercolor="#333333">
					<td>No.</td>
					<td>Vendor ID</td>
					<td>Vendor Name</td>
					<td>Category</td>
					<td>Product_Name</td>
					<td>QualityIncharge Name</td>
					<td>QualityIncharge Email</td>
					<td>Valid</td>
					<td>NCR</td>
				</tr>	
				
				<c:if test="${! empty vendors}">
				<c:forEach var="v" items="${vendors}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td>${v.RNUM}</td>
						<td>${v.VENDOR_ID}</td>
						<td>${v.VENDOR_NAME}</td>
						<td>${v.CATEGORY_NAME}</td>
						<td>${v.PRODUCT_NAME}</td>
						<td>${v.VENDOR_Q_NAME}</td>
						<td>${v.VENDOR_Q_EMAIL}</td>

						<td><c:if test="${! empty valid}">
								<c:forEach var="c" items="${valid}">
									<c:if
										test="${c.VENDOR_ID==v.VENDOR_ID && c.VALIDDATE>0 && c.AUDIT_RESULT == 'Y'}">
									Y
								</c:if>
								</c:forEach>
							</c:if></td>
						<td><c:forEach var="c" items="${count}">
								<c:if test="${c.VENDOR_ID==v.VENDOR_ID}">
								${c.comp}/${c.total}
							</c:if>
							</c:forEach></td>

					</tr>
				</c:forEach>
				</c:if>
			
	
				<c:if test="${! empty validY}">
				<c:forEach var="y" items="${validY}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td>${y.RNUM}</td>
						<td>${y.VENDOR_ID}</td>
						<td>${y.VENDOR_NAME}</td>
						<td>${y.CATEGORY_NAME}</td>
						<td>${y.PRODUCT_NAME}</td>
						<td>${y.VENDOR_Q_NAME}</td>
						<td>${y.VENDOR_Q_EMAIL}</td>
						<td>Y</td>
						<td><c:forEach var="c" items="${count}">
								<c:if test="${c.VENDOR_ID==y.VENDOR_ID}">
								${c.comp}/${c.total}
							</c:if>
							</c:forEach></td>
					</tr>
				</c:forEach>
				</c:if>
				
				<c:if test="${!empty validN}">
				<c:forEach var="n" items="${validN}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td>${n.RNUM}</td>
						<td>${n.VENDOR_ID}</td>
						<td>${n.VENDOR_NAME}</td>
						<td>${n.CATEGORY_NAME}</td>
						<td>${n.PRODUCT_NAME}</td>
						<td>${n.VENDOR_Q_NAME}</td>
						<td>${n.VENDOR_Q_EMAIL}</td>
						<td> </td>
						<td><c:forEach var="c" items="${count}">
								<c:if test="${c.VENDOR_ID==n.VENDOR_ID}">
								${c.comp}/${c.total}
							</c:if>
							</c:forEach></td>
					</tr>
				</c:forEach>
				</c:if>

			</table>
		</div>

</body>
</html>