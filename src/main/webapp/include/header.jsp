<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.2">

<script type="text/javascript">
	$(document).ready(function() {
		$('#nav li').hover(function() {
			$('ul', this).slideDown(200);
			$(this).children('a:first').addClass("hov");
		}, function() {
			$('ul', this).slideUp(100);
			$(this).children('a:first').removeClass("hov");
		});
	});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="head">
		<div class="wrap">
			<h1>
				<img alt="XQ-SC" />	
			</h1>
		</div>
	</div>
	
	<div class="wrap">
		<ul id="nav">
			<li><a href="#"> HOME</a></li>
			<li><a href='#'>Vendor 등록관리</a>
				<ul>
					<li><a href='vendor/vendorRegister'>Vendor Register</a></li>
					<li><a href='vendor/vendorStatus'>Vendor Status</a></li>
				</ul></li>

			<li><a href='#'>평가관리</a>
				<ul>
					<li><a href='./AuditManage'>평가계획</a></li>
					<li><a href='./AuditReport'>평가결과입력</a></li>
					<li><a href='./AuditResult'>평가현황</a></li>
				</ul></li>

			<li><a href='#'>부적합관리</a>
				<ul>
					<li><a href='ncr/ncrRegister'>NCR Register</a></li>
					<li><a href='ncr/ncrManagement'>NCR Management</a></li>
					<li><a href='ncr/ncrStatus'>NCR Status</a></li>
				</ul></li>
		</ul>
	</div>

</body>
</html>


