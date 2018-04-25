<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
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
<script>

function searchNcrStatus() {
	var params = $('#formNcrStatus').serialize();
	$.ajax({
		type : "POST",
		url : "./ncrStatusSearch",
		data : params,
		success : resultNcrStatus,
	});
}

function resultNcrStatus(ncrStatusList) {
	$("#ncrStatusBox").html(ncrStatusList);
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
		url : "./ncrDetail",
		data : "ncr_id=" + ncr_id,
		success : showdetail,
	});

	function showdetail(msg2) {
		$("#ncrDetailBox").html(msg2);
	}
		$('#detailModal').modal('show');
		$('#detailModal').modal({backdrop: 'static', keyboard: false}) ;
}

</script>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NCR Status</title>
</head>

<body>
<%@ include file="/include/header.jsp"%>
	<div id=mainBox class="container">
		<div>
			[검색조건]
			<form action="./ncrStatusSearch" method="post" name="formNcrStatus"
				id="formNcrStatus">
				<table class="table">

					<tr>
					
						<td>Vendor ID</td>
						<td>
						<div class="form-group input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
						<input type="text" id="vendor_id" name="vendor_id">
							<image
								src="${pageContext.request.contextPath}/images/icon_search.gif"
								data-target="#vendorSearchModal" data-toggle="modal" style="height:auto; width:auto;"></image></td>
		
						
						<td>Issuer</td>
						<td><input type="text" id="issuer_id" name="issuer_id">
							<image
								src="${pageContext.request.contextPath}/images/icon_search.gif"
								data-target="#issuerSearchModal" data-toggle="modal" style="height:auto; width:auto;"></image></td>
								
						<td>Complete</td>
						<td>						
						<select id="comp" name="comp" style="width: 150px;">
							<option value="All">All</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="8"><input type="button" value="search"
							onclick="searchNcrStatus()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="ncrStatusBox"></div>



		<!--  vendor Search 모달 시작 -->
		<div class="modal fade" id="vendorSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">Vendor Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div>
							<form id="formSearchVendor" name="formSearchVendor" method="post">
								<table class="table">
									<tr>
										<td>Vendor Name: <input type="text" name="vendor_name"
											id="vendor_name" /></td>
										<td><input class="button" type="button" value="Search"
											id="btnsearch" onclick="searchVendorId(vendor_name)"></td>
									</tr>

								</table>
							</form>
						</div>
						<div id="vendorList"></div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div>

		<!--  모달 끝 -->

		<!--  Issuer Search모달 시작 -->
		<div class="modal fade" id="issuerSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">Issuer Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div>
							<form id="formSearchIssuer" name="formSearchIssuer" method="post">
								<table class="table">
									<tr>
										<td>Issuer Name: <input type="text" name="issuer_name"
											id="issuer_name" /></td>
										<td><input class="button" type="button" value="Search"
											id="btnsearch" onclick="searchIssuerId()"></td>
									</tr>

								</table>
							</form>
						</div>
						<div id="issuerList"></div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div>

		<!--  모달 끝 -->

		<!--  detail 모달 시작 -->
		<div class="modal fade" id="detailModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">NCR Detail</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div id="ncrDetailBox"></div>

					</div>
					<!-- Footer -->

				</div>
			</div>
		</div>

		<!--  모달 끝 -->
</body>
</html>