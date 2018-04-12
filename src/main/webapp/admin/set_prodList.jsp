<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:forEach var="p" items="${prodList}">
	<tr align="center" valign="middle">
		<td>
			<div align="center">${p.PRODUCT_VALID}</div>
		</td>
		<td>
			<div align="center">
				<a href="javascript:prodUpdateForm('${p.PRODUCT_ID}')">
				<c:out value="${p.PRODUCT_NAME}"/>
			</div>
		</td>
		
	</tr>
</c:forEach>