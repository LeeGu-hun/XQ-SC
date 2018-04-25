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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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

<script>
	function updateRegister() {
		//	document.getElementById('updateform').submit();
		updateform.submit();
	}

	function deleteRegister(id) {
		//	document.getElementById('updateform').submit();
		//updateform.submit();
		location.href = "./vendorDelete/" + id;
	}
</script>

<body>


<%@ include file="/include/header.jsp"%>
<br>
	<div class="container" style="font-family: Tahoma;">
		<legend style="font-family: Tahoma; font-size: 20pt;">Vendor Register</legend><br>
		<p>
			<font style="font-family: Tahoma; font-size: 10pt;">신규등록 요청 : ${cnts} 건</font>
		</p><br>
		<form action="./vendor/vendorUpdate" method="POST"
			enctype="multipart/form-data" name="updateform" commandName="cmd">
			<table class="table">
				<tr align="center" valign="middle">
					<td>
						<div>회사ID</div>
					</td>
					<td>
						<div>회사명</div>
					</td>
					<td>
						<div>품목</div>
					</td>
					<td>
						<div>영업담당자이름</div>
					</td>
					<td>
						<div>영업담당자연락처</div>
					</td>
					<td>
						<div>상세보기</div>
					</td>
					<td>
						<div>등록하기</div>
					</td>
					<td>
						<div>취소하기</div>
					</td>
				</tr>

				<c:forEach var="li" items="${list}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td>${li.VENDOR_ID}</td>
						<input type="hidden" id="VENDOR_ID" name="VENDOR_ID" value="${li.VENDOR_ID}"/ >
						<td>${li.VENDOR_NAME}</td>
						<input type="hidden" id="VENDOR_NAME" name="VENDOR_NAME" value="${li.VENDOR_NAME}"/ >
						<td>${li.PRODUCT_NAME}</td>
						<td>${li.VENDOR_S_NAME}</td>
						<input type="hidden" id="VENDOR_S_NAME" name="VENDOR_S_NAME" value="${li.VENDOR_S_NAME}"/ >
						<td>${li.VENDOR_S_TEL}</td>
						<input type="hidden" id="VENDOR_S_TEL" name="VENDOR_S_TEL" value="${li.VENDOR_S_TEL}"/ >
						<input type="hidden" id="VENDOR_S_EMAIL" name="VENDOR_S_EMAIL" value="${li.VENDOR_S_EMAIL}"/ >
						<td><input type="button" class="btn btn-default"
							href="./vendorView/${li.VENDOR_ID}" data-toggle="modal"
							data-target="#viewModal" value="보기"></td>

						<!-- 모달 -->
						<div id="viewModal" class="modal fade" role="dialog">
							<div class="modal-dialog" style="width: 60%;">
								<div class="modal-content"></div>
							</div>
						</div>
						<td><input type="button" class="btn btn-default"
							onclick="updateRegister()" value="등록"></td>
						<td><input type="button" class="btn btn-default"
							onclick="deleteRegister('${li.VENDOR_ID}')" value="취소"></td>
					</tr>

				</c:forEach>


			</table>
		</form>

	</div>
</body>
</html>