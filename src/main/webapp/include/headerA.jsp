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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div class="btn-group">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href='#'> <span
			class="creat">Vendor 등록관리</span>
		</a>
		<ul class="dropdown-menu">
			<li class='has-sub'><a href='vendor/vendorRegister'>Vendor
					Register</a></li>
			<li class='has-sub'><a href='vendor/vendorStatus'>Vendor
					Status</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href='#'><span>평가관리</span></a>
		<ul class="dropdown-menu">
			<li class='has-sub'><a href='./AuditManage'>평가계획</a></li>
			<li class='has-sub'><a href='./AuditReport'>평가결과입력</a></li>
			<li class='has-sub'><a href='./AuditResult'>평가현황</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href='#'><span>부적합관리</span></a>
		<ul class="dropdown-menu">
			<li class='has-sub'><a href='ncr/ncrRegister'>NCR Register</a></li>
			<li class='has-sub'><a href='ncr/ncrManagement'>NCR Management</a></li>
			<li class='has-sub'><a href='ncr/ncrStatus'>NCR Status</a></li>
		</ul>
		</div>
		
		<div class="btn-group">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href='#'><span>시스템 관리</span></a>
		<ul class="dropdown-menu">
			<li class='has-sub'><a href='./Setting'>System Configuration</a></li>
			<li class='has-sub'><a href='./MSet'>Member Management</a></li>
			<li class='has-sub'><a href='./CLSet'>Checklist Management</a></li>
		</ul>
		
		</div>
		

</body>
</html>


