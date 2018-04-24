<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

.reg {
	padding-left: 150px;
	padding-top:50px;
}

.login {
	padding-left: 130px;
	padding-top:50px;
}

.headerimg {
	margin-left: 70px;
	margin-right: 70px;
}

.footerimg {
	margin-left: 70px;
	margin-right: 70px;
}
</style>

<body>
	<div style="width: 100%; height: auto;">
		<div>
			<div class="headerimg"
				style="width: 93%; height: 450px; background-color: #ffdbbf;">

			</div>
		</div>

		<div class="footerimg" style="width: 93%; height: 550x; background-color: #eaeaed; ">
			<div class="login" style="width: 45%; float: left;">
				<form:form class="form-signin" commandName="loginCommand"
					action="loginDiv">
					<h2>Login</h2>
					<input type="text" name="id" id="id" placeholder="Id"
						value="A00001" style="height: 20px; width: 200px; margin: 30px 0;">
					<input type="password" name="password" id="password"
						placeholder="PASSWORD" value="1"
						style="height: 20px; width: 200px; margin-bottom: 10px;" />

					<input type="submit" value="login">
					<input type="checkbox" name="hold" id="hold" value="${check}" />
					<label for="hold">로그인유지</label>
				</form:form>

			</div>
			<div class="reg" style="width: 55%; float: left;">
				<div style="width: 100%;">
					<div style="width: 100%;">
						<img src="${pageContext.request.contextPath}/images/register.png"></img>
						<button href="vendor/newVendor" 
							type="button" data-toggle="modal" data-target="#myModal">신규등록</button>
					</div>
				</div>
			</div>
		</div>
		


		<!-- 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 60%;">
				<div class="modal-content"></div>
			</div>
		</div>


	</div>

</body>
</html>