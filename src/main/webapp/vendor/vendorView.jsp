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

<body>

	<div class="modal-body">
		<h2>상세보기</h2>
		<table class="table">
			<tr>
				<td>회사ID :</td>
				<td>${view.VENDOR_ID}</td>
				<td>회사명 :</td>
				<td>${view.VENDOR_NAME}</td>
			</tr>
			<tr>
				<td>사원수 :</td>
				<td>${view.VENDOR_EMP_NO}</td>
			</tr>

			<tr>
				<td>회사주소 :</td>
				<td>${view.VENDOR_ADDRESS}</td>
			</tr>
			<tr>

				<td>카테고리 :</td>
				<td>${view.CATEGORY_NAME}</td>
				<td>품목:</td>
				<td>${view.PRODUCT_NAME}</td>
				</td>
			<tr>
				<td>요청일자 :</td>
				<td><fmt:formatDate value="${view.VENDOR_REQ_DATE}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>품질담당자이름 :</td>
				<td>${view.VENDOR_Q_NAME}</td>
				<td>품질 담당자 이메일 :</td>
				<td>${view.VENDOR_Q_EMAIL}</td>
				<td>품질담당자연락처 :</td>
				<td>${view.VENDOR_Q_TEL}</td>
			</tr>
			<tr>
				<td>영업담당자이름 :</td>
				<td>${view.VENDOR_S_NAME}</td>
				<td>영업담당자이메일 :</td>
				<td>${view.VENDOR_S_EMAIL}</td>
				<td>영업담당자연락처 :</td>
				<td>${view.VENDOR_Q_TEL}</td>
			</tr>
			<tr>
				<td>품질보증서 :</td>
				<td><a data-toggle="modal" data-target="#isoModal">${view.VENDOR_ISO_FILE}</td>
				
				<!-- 모달 -->
				<div id="isoModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<img width="200" height="200"
									src="../upload/${view.VENDOR_ISO_FILE}">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</tr>
			<tr>
				<td>사업자등록증 :</td>
				<td><a data-toggle="modal" data-target="#certModal">${view.VENDOR_CERT_FILE}</td>
				<!-- 모달 -->
				<div id="certModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<img width="300" height="200"
									src="../upload/${view.VENDOR_CERT_FILE}">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</tr>
		</table>

	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>

</body>
</html>