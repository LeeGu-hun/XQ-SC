<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="cateCommand" method="post">
	<c:choose>
		<c:when test="${selCate.CATEGORY_VALID eq 'Y'}">
			<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID" checked="checked"/>
			<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID"/>
		</c:when>
		<c:otherwise>
			<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID"/>
			<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID" checked="checked"/>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form:input path="CATEGORY_NAME" value="${selCate.CATEGORY_NAME}"/>
	<form:hidden path="CATEGORY_ID" value="${selCate.CATEGORY_ID}" />
	<input type="submit" value="수정">
	<a href="javascript:cateInsert()">취소</a>	
</form:form>
			