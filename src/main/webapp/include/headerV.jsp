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
		<a href="./ncrManagement_vendor" class="w3-bar-item w3-button w3-padding-large">Home</a>

		<div class="w3-dropdown-hover">
			<button class="w3-button w3-padding-large">NCR</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="./ncrManagement_vendor" class="w3-bar-item w3-button">NCR
					Management</a>
			</div>
		</div>

		<div class="w3-bar-item w3-right">
			<a href="./logout">Logout</a>
		</div>
		<div class="w3-bar-item w3-right">
			<a href="./ChangedPwd">비밀번호변경</a>
		</div>
		<div class="w3-bar-item w3-right">${sessionScope.authInfo.name }
			님</div>

	</div>

</body>
</html>


