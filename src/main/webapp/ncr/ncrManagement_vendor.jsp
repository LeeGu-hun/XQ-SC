<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.3">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.3">

<script type="text/javascript"
	href="${pageContext.request.contextPath}/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/sb-admin-2.css" />" rel="stylesheet">

<script>
	function vendorReplySave_vendor(ncr_id) {
		vendorReplyForm.submit(ncr_id);
	}

	function vendorReply(ncr_id) {

		$.ajax({
			type : "POST",
			url : "./ncrVendorReply",
			data : "ncr_id=" + ncr_id,
			success : resultvendorreply,
		});
	}

	function resultvendorreply(reply) {
		$("#vendorReplyPop").html(reply);
	}

	function auditorReply(ncr_id) {

		$.ajax({
			type : "POST",
			url : "./ncrAuditorReply",
			data : "ncr_id=" + ncr_id,
			success : resultauditorreply,
		});
	}

	function resultauditorreply(replya) {
		$("#auditorReplyPop").html(replya);
	}

	function complete(ncr_id) {

		$.ajax({
			type : "POST",
			url : "./ncrComplete",
			data : "ncr_id=" + ncr_id,
			success : resultComplete,
		});
	}

	function resultComplete() {
		$('#detailModal').modal('hide');
	}

	function searchNcr() {
		var params = $('#formNcrSearch').serialize();
		$.ajax({
			type : "POST",
			url : "./ncrSearch",
			data : params,
			success : resultNcr,
		});
	}

	function resultNcr(ncrList) {
		$("#ncrListBox").html(ncrList);
	}

	function searchVendorId() {
		var vendor_name = document.getElementById("vendor_name").value;

		$.ajax({
			type : "POST",
			url : "./searchVendorId",
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

	function searchIssuerId() {
		var issuer_name = document.getElementById("issuer_name").value;
		$.ajax({
			type : "POST",
			url : "./searchIssuerId",
			data : "issuer_name=" + issuer_name,
			success : result1,
		});

	}

	function result1(msg1) {
		$("#issuerList").html(msg1);
	}

	function rowselect1(issuer_name, issuer_id) {
		$("#issuer_name").val(issuer_name);
		$("#issuer_id").val(issuer_id);
		$('#issuerSearchModal').modal('hide');

	}
	function rowselectDetail(ncr_id) {
		$.ajax({
			type : "POST",
			url : "./ncrDetail_vendor",
			data : "ncr_id=" + ncr_id,
			success : showdetail,
		});

		function showdetail(msg2) {
			$("#ncrDetailBox").html(msg2);
		}
		$('#detailModal_vendor').modal('show');
		$('#detailModal_vendor').modal({
			backdrop : 'static',
			keyboard : false
		});
	}
</script>
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
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NCR Management</title>
</head>
<body style="background-color: white">
	<%@ include file="/include/headerV.jsp"%><br>
	<div> &nbsp;</div> 
	<div id=mainBox class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">NCR Management</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive" style="max-height: 800px">

							<div>
								[검색조건]
								<form action="./ncrSearch" method="post" name="formNcrSearch"
									id="formNcrSearch">
									<table class="table ">

										<tr>
											<td>NCR No:<input type="text" id="ncr_id" name="ncr_id"
												class="form-control " /></td>
											<td>Title<input type="text" id="ncr_title"
												name="ncr_title" class="form-control "></td>
											<td>Vendor<input type="text" id="vendor_id"
												name="vendor_id" class="form-control " value=${vendor_id }
												readonly>
											<td>Complete<select id="ncr_comp" name="ncr_comp"
												class=" form-control">
													<option value="All">All</option>
													<option value="Y">Y</option>
													<option value="N">N</option>
											</select>
											</td>
											<td style="vertical-align: bottom">
												<button type="button" class="btn btn-default"
													onclick="searchNcr()">search</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
							<div id="ncrListBox" class="table-responsive" style="max-height:800px"></div>
							



							<!--  detail 모달 시작 -->
							<div class="modal fade" id="detailModal_vendor">
								<div class="modal-dialog">
									<div class="modal-content" style="max-width : 800px; ">									
										<!-- header -->
										<div class="modal-header">
											<!-- 닫기(x) 버튼 -->
											<button type="button" class="close" data-dismiss="modal">×</button>
											<!-- header title -->
											<h4 class="modal-title">NCR Detail</h4>
										</div>
										<!-- body -->
										<div class="modal-body" style="max-height:600px ; overflow:auto ;">
											<div id="ncrDetailBox" ></div>

										</div>
										<!-- Footer -->

									</div>
								</div>

					</div>
	<!--  모달 끝 -->
	
	
	
	
	
				</div>
			</div>
		</div>
	</div>
</body>
</html>