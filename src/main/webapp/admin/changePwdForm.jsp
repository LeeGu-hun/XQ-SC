<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="change.pwd.title" /></title>
      <link rel="stylesheet" href="css/table.css">
</head>
<body>
	<%@ include file="/include/header.jsp"%><br>
	${sessionScope.authInfo.name }님
	<form:form commandName="changePwdCommand" action="ChangedPwd">
		<p>
			<label><spring:message code="currentPassword" /><br> 
			<form:password	path="currentPassword" /><br>
			<span style="font-size:9pt;color:red;"><form:errors path="currentPassword" /></span> </label>
		</p>
		<p>
			<label><spring:message code="newPassword" /><br> 
			<form:password	path="newPassword" /><br>
			<span style="font-size:9pt;color:red;"> <form:errors path="newPassword" /></span> </label>
		</p>
		<input type="submit" value="<spring:message code="change.btn" />">
	</form:form>
</body>
</html>