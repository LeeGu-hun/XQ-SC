
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<select>
	<c:forEach var="c" items="${prodList}">
		<option value="${c.PRODUCT_ID}">${c.PRODUCT_NAME}</option>
	</c:forEach>
	<option value=1>1</option>
	<option value=1>1</option>
	<option value=1>1</option>
	<option value=1>1</option>
	<option value=1>1</option>
	<option value=1>1</option>
</select>

