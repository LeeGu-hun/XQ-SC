<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="cateCommand" method="post" id="icf">
	<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID" checked="checked"/>
	<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form:input path="CATEGORY_NAME" id="inCateName"/>
	<input type="button" value="등록" onclick="cateInsert()">
</form:form>
			