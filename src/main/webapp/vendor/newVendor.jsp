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
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script language="javascript">

	
	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "vendor/prodList",
			data : "selCate=" + selCate,
			success : result
		});
	}

	function result(msg){
		$("#spProd").html(msg);
	}


function addvendor() {
	vendorform.submit();
}
</script>

</head>
<body><div class="modal-header">
	<h2>New Registration</h2>
	</div>
	<div class="modal-body">
	<form action="./vendor/newVendor" method="POST" enctype="multipart/form-data"  name="vendorform" >
		<table class="table">
			<tr>
				<td>Vendor ID :</td>
				<td><input type="text" name="VENDOR_ID" value="${cnt}" readonly></td>
				<td>Vendor Name :</td>
				<td><input type="text" name="VENDOR_NAME"></td>
			</tr>
			<tr>
				<td >Employees :</td>
				<td><input type="text" name="VENDOR_EMP_NO"></td>
			</tr>
			
			<tr>
				<td>Address :</td>
				<td><input type="text" name="VENDOR_ADDRESS"></td>
			</tr>
			<tr>

				<td>Category :</td>
				<td><select name="selCate" id="selCate" onchange="prodList();">
						<option value="cate">Category</option>
						<c:forEach var="c" items="${map.cateList}">
							<option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</option>
						</c:forEach>
				</select>
				<td>Product :</td>
				<td><span id="spProd"><select name="PRODUCT_ID" id="PRODUCT_ID">
				<option value="" >Product</option>
					   </select>
					   </span>
					   </td>
				</td>
			
			<tr>
				<td>Quality Incharge Name :</td>
				<td><input type="text" name="VENDOR_Q_NAME"></td>
				<td>Quality Incharge Email :</td>
				<td><input type="text" name="VENDOR_Q_EMAIL"></td>
				<td>Quality Incharge Tel :</td>
				<td><input type="text" name="VENDOR_Q_TEL"></td>
			</tr>
			
			<tr>
				<td >Sales Incharge Name :</td>
				<td><input type="text" name="VENDOR_S_NAME"></td>
				<td >Sales Incharge Email :</td>
				<td><input type="text" name="VENDOR_S_EMAIL"></td>
				<td >Sales Incharge Tel :</td>
				<td><input type="text" name="VENDOR_S_TEL"></td>
			</tr>
			
			<tr>
				<td>Certificate Of Quality :</td>
				<td><input type="file" name="VENDOR_ISO_FILE"></td>
			</tr>
			
			<tr>
				<td >Business License :</td>
				<td><input type="file" name="VENDOR_CERT_FILE"></td>
			</tr>

		</table>
		</div>
		</form>
		<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="addvendor()">Register</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
	
</body>
</html>