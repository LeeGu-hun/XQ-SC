<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>MJ</title>
</head>
<style>
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		
	}
}
</style>
<body>
	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>MJ</b>
				Company</a>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1600px;" "id="home">
		<img class="w3-image" src="./images/architect.jpg" alt="Architecture"
			style="width: 1600px; height: 600px;">
	</header>

	<!-- Footer -->
	<div class="w3-display-container w3-content "
		style="max-width: 1600px;">
		<div class="w3-row w3-border">
			<div class="w3-half w3-container">
				<div class="w3-container " style="margin-left:70px; margin-top:20px;">
					<form:form commandName="loginCommand" style="height:100%;"
						action="loginDiv">
						<br>
						<p>
							<form:input type="text" path="id" placeholder="ID"
								 class="w3-input w3-border " style="width: 450px;" />
			<span style="font-size:9pt;color:red;"> <form:errors path="id" /></span>
						</p>
						<p>
							<form:password path="password"
								placeholder="PASSWORD"  class="w3-input w3-border"
								style="width: 450px;" />
								<span style="font-size:9pt;color:red;"> <form:errors path="password" /></span>
						</p>
						<p>
							<input class="w3-bar-item w3-button w3-dark-grey"
								type="submit" style="width: 450px;"  value="login">
						</p>
						<p>
							<input type="checkbox" name="hold" id="hold" value="${check}"
								class="w3-check" /> <label for="hold">Remember</label>&nbsp;&nbsp;
						</p>
					</form:form>
				</div>

			</div>
			<div class="w3-half w3-container w3-border">
				<div>
					<div style="width: 100%;">
						<div>
							<img src="${pageContext.request.contextPath}/images/register.png"></img>
							<button class="w3-bar-item w3-button w3-dark-grey"
								href="vendor/newVendor" data-toggle="modal"
								data-target="#myModal" data-backdrop="static"
								data-keyboard="false">Register</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog" style="width: 1700px;">
					<div class="modal-content"></div>
				</div>
			</div>
		</div>
	</div>







</body>
</html>