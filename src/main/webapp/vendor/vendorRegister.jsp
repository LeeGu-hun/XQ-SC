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
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="bean.*" %>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
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

<body>
<div  class="container">
<legend style="font-family:Tahoma;font-size:20pt;">Vendor 등록</legend>
	<p align="right" magin:><font size=2 >신규등록 요청 : ${cnts} 건</font></p>
	<table class="table" >
	<tr align="center" valign="middle">
		<td>
			<div>회사ID</div>
		</td>
		<td>
			<div >회사명</div>
		</td>
		<td>
			<div>품목</div>
		</td>
		<td >
			<div>요청일</div>
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
	</tr>
	
	<c:forEach var="li" items="${list}">
				<tr align="center" valign="middle" bordercolor="#333333">
					<td>${li.VENDOR_ID}</td>
					<td>${li.VENDOR_NAME}</td>
					<td>${li.PRODUCT_NAME}</td>
					<td><fmt:formatDate value="${li.VENDOR_REQ_DATE}"
							pattern="yyyy-MM-dd" /></td>
					<td>${li.VENDOR_S_NAME}</td>
					<td>${li.VENDOR_S_TEL}</td>
					<td><input type="button" class="btn btn-default" href="/vendor/vendorView/${li.VENDOR_ID}" data-toggle="modal" data-target="#viewModal" value="보기"></td>
					<!-- 모달 -->
		<div id="viewModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 60%;">
				<div class="modal-content"></div>
				
			</div>
		</div>
					<td><input type="button" class="btn btn-default" value="등록"></td>
				</tr>
			</c:forEach>
	</table>
</div>
</body>
</html>