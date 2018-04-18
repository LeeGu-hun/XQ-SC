<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form name="cklserch" method="get">
	<label>KIND</label>
	<input id = "aaki" type = "radio" name="auditKindId" value="ALL"
		<c:out value="${map.auditKindId == 'ALL'?'checked':''}"/>	/>
	<label for = "aaki">ALL</label>
	<input id = "new" type = "radio" name="auditKindId" value="NE" 
	<c:out value="${map.auditKindId == 'NE'?'checked':''}"/>	/>
	<label for = "new">NEW</label>
	<input id = "regular" type = "radio" name="auditKindId" value="RE"  
	<c:out value="${map.auditKindId == 'RE'?'checked':''}"/>	/>
	<label for = "regular">REGULAR</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<label>VALID</label>
	<input id = "alv" type = "radio" name="cklValid" value="A"
	<c:out value="${map.cklValid == 'A'?'checked':''}"/>	/>
	<label for = "alv">ALL</label>
	<input id = "valid" type = "radio" name="cklValid" value="Y" 
	<c:out value="${map.cklValid == 'Y'?'checked':''}"/>	/>
	<label for = "valid">VALID</label>
	<input id = "invalid" type = "radio" name="cklValid" value="N"
	<c:out value="${map.cklValid == 'N'?'checked':''}"/>	 />
	<label for = "invalid">INVALID</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<label id = "keyword">DISCRIPTION</label>
	<input id = "keyword" type="text" name = "keyword" value="${map.keyword}" />
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="조회">
	<br>
</form>
			