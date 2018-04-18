<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
</head>
<style>
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
        height:600px;
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
	<div style="width: 100%;">
		<div style="width: 60%; float: left;">
			<div style="width: 100%; height: 650px; background-color:#ffdbbf;"></div>
			<div style="width: 100%; height: 350px;">
				<div style="width: 100%;">
					<form:form class="form-signin" commandName="loginCommand"
						action="login">
						<h2>Login</h2>
						<input type="text" name="id" id="id" placeholder="Id"
							value="S-1"
							style="height: 20px; width: 200px; margin: 30px 0;">

						<input type="password" name="password" id="password"
							placeholder="PASSWORD" value="1"
							style="height: 20px; width: 200px; margin-bottom: 10px;" />

						<input type="submit" value="login">
						<input type="checkbox" name="hold" id="hold" value="${check}" />
						<label for="hold">로그인유지</label>
					</form:form>
				</div>
			</div>

		</div>
		<div style="width: 40%; float: left;">
			<div style="width: 100%; height: 800px; background-color:#f7cde3">등록절차이미지</div>
			<div style="width: 100%; height: 200px;">
				<button href="vendor/newVendor" class="btn-btn-default" type="button" data-toggle="modal" data-target="#myModal">신규등록</button>	
			</div>
		</div>
			<!-- 모달 -->
				<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog" style="width:60%;">
				<div class="modal-content">
					
				</div>
		</div>
		</div>
		
		
	</div>


<li><a href="./AuditManage">평가관리</a></li>

</body>
</html>