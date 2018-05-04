<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">

<script type="text/javascript"
	href="${pageContext.request.contextPath}/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

			
		
	<div class="w3-bar w3-black w3-right">
	<a href="#" class="w3-bar-item w3-gray w3-wide w3-padding-large "><b>MJ</b>Company</a>&nbsp;&nbsp;&nbsp;
		<a href="./main" class="w3-bar-item w3-button w3-padding-large">Home</a>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-padding-large">Vendor</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="./vendorRegister" class="w3-bar-item w3-button ">Vendor
					Register</a> <a href="./vendorStatus" class="w3-bar-item w3-button">Vendor
					Status</a>
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-padding-large">Audit</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="./AuditManage" class="w3-bar-item w3-button ">Audit
					Plan</a> <a href="./AuditReport" class="w3-bar-item w3-button">Audit
					ResultInput</a> <a href="./AuditResult" class="w3-bar-item w3-button">Audit
					Status</a>
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-padding-large">NCR</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="./ncrRegister" class="w3-bar-item w3-button">NCR
					Register</a> <a href="./ncrManagement" class="w3-bar-item w3-button">NCR
					Management</a> 			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-padding-large">System</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="./Setting" class="w3-bar-item w3-button">System
					Configuration</a> <a href="./MSet" class="w3-bar-item w3-button">Member
					Management</a> <a href="./CLSet" class="w3-bar-item w3-button">Checklist
					Management</a>
			</div>
		</div>
		
		<div class="w3-bar-item w3-right">
		<a href="./logout">Logout</a>	
		</div>
		<div class="w3-bar-item w3-right">
		<a href="./ChangedPwd">Change Password</a>
		</div>
		<div class="w3-bar-item w3-right">
		${sessionScope.authInfo.name } 
		</div>
		
	</div>

</body>
</html>


