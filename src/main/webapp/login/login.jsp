<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
function vendorInsert() {
	var popup = window.open("<c:url value='/vendor/newVendor'/>", "",
			"width=600,height=500 ");
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div style="width: 100%;">
		<div style="width: 60%; float: left;">
			<div style="width: 100%; height: 650px;"></div>
			<div style=" width: 100%;height: 350px;">
				<div style=" width: 100%;">
				<form:form class="form-signin" commandName="loginCommand" action="login">
					<h2>Login</h2>
					<input type="text" name="id" id="id" placeholder="Id" value="${MEMBER_ID}"
						style="height: 20px; width: 200px; margin: 30px 0;">

					<input type="password" name="password" id="password" placeholder="PASSWORD"
						style="height: 20px; width: 200px; margin-bottom: 10px;" />

					<input type="submit" value="login">
					<input type="checkbox" name="hold" id="hold"  value="${check}" />
					<label for="hold">로그인유지</label>		
				</form:form>
				</div>
			</div>

		</div>
		<div style="width: 40%; float: left;">
		<div style="width: 100%;height: 800px;">
		등록절차이미지
		</div>
		<div style="width: 100%;height: 200px;">
			<input type="button" value="신규등록" onclick="vendorInsert()">
			</div>
			</div>
		</div>
	</div>



</body>
</html>