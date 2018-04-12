<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="prodCommand" method="post" action="Setting?state=2" id="ipf">
	<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID" checked="checked"/>
	<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form:input path="PRODUCT_NAME" id="inProdName"/>
	<input type="button" value="등록" onclick="prodInsert()">
</form:form>
			