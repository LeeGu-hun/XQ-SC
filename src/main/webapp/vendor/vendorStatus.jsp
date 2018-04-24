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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

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
<body>

<%@ include file="/include/header.jsp"%>
<br>

	<div class="container" style="font-family: Tahoma; font-size: 10pt;">
		<legend style="font-family: Tahoma; font-size: 20pt;">Vendor
			Status</legend><br>
		<form action="./vendorStatus" method="post" name="statusform"
			id="statusform" >

			<table class="table" style="font-family: Tahoma; font-size: 10pt;">
				<tr>
					<td>회사명:</td>
					<td><input type="text" id="vendor_id" name="vendor_id"
							data-target="#vendorSearchModal" data-toggle="modal"></td>

					<td>품명</td>
					<td><select id="PRODUCT_ID" name="PRODUCT_ID" >
							<option value="All">All</option>
							<c:forEach var="p" items="${map.prodList}">
								<option value="${p.PRODUCT_ID}">${p.PRODUCT_NAME}</option>
							</c:forEach>
					</select></td>

					<td>유효성:</td>
					<td><select id="VALID" name="VALID" style="width: 150px;">
							<option value="All">All</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
					</select></td>
					<td><input class="btn btn-secondary my-2 my-sm-0"
						type="submit" value="조회" onclick="statusSearch()"></td>
				</tr>
			</table>

		</form>
	</div>
	
					
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

	
		<div class="container">
			<table class="table table-striped">
				<tr align="center" valign="middle" bordercolor="#333333">
					<td>No.</td>
					<td>회사ID</td>
					<td>회사명</td>
					<td>카테고리</td>
					<td>품목</td>
					<td>담당자</td>
					<td>담당자 이메일</td>
					<td>유효성</td>
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