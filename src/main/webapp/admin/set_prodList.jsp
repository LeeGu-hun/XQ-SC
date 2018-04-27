<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:forEach var="p" items="${prodList}">
	<tr onclick="prodUpdateForm('${p.PRODUCT_ID}')" align="center" valign="middle" style="display:table; width:100%;">
		<td style="width:120px;">
			<div align="center">${p.PRODUCT_VALID}</div>
		</td>
		<td>
			<div align="center"><c:out value="${p.PRODUCT_NAME}"/></div>
		</td>
		
	</tr>
</c:forEach>