<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="prodCommand" method="post" action="Setting?state=3" id="upf">
	<c:choose>
		<c:when test="${selProd.PRODUCT_VALID eq 'Y'}">
			<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID" checked="checked"/>
			<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID"/>
		</c:when>
		<c:otherwise>
			<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID"/>
			<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID" checked="checked"/>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form:input path="PRODUCT_NAME" value="${selProd.PRODUCT_NAME}" id="upProdName"/>
	<form:hidden path="PRODUCT_ID" value="${selProd.PRODUCT_ID}" />
	<input type="button" value="수정" onclick="prodUpdate()">
	<a href="javascript:prodInsertForm()">취소</a>	
</form:form>
			