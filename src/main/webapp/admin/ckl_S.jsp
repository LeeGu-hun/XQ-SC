<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form name="cklserch" method="get">
	<div  class="form-group input-group" style="overflow: hidden;">
		<div style="float: left;">
			<label>KIND</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id = "aaki" type = "radio" name="auditKindId" value="ALL"
				<c:out value="${map.auditKindId == 'ALL'?'checked':''}"/>	/>
			<label for = "aaki">ALL</label>&nbsp;&nbsp;
			<input id = "new" type = "radio" name="auditKindId" value="NE" 
			<c:out value="${map.auditKindId == 'NE'?'checked':''}"/>	/>
			<label for = "new">NEW</label>&nbsp;&nbsp;
			<input id = "regular" type = "radio" name="auditKindId" value="RE"  
			<c:out value="${map.auditKindId == 'RE'?'checked':''}"/>	/>
			<label for = "regular">REGULAR</label>&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div style="float: left;">
			<label>VALID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id = "alv" type = "radio" name="cklValid" value="A"
			<c:out value="${map.cklValid == 'A'?'checked':''}"/>	/>
			<label for = "alv">ALL</label>&nbsp;&nbsp;
			<input id = "valid" type = "radio" name="cklValid" value="Y" 
			<c:out value="${map.cklValid == 'Y'?'checked':''}"/>	/>
			<label for = "valid">VALID</label>&nbsp;&nbsp;
			<input id = "invalid" type = "radio" name="cklValid" value="N"
			<c:out value="${map.cklValid == 'N'?'checked':''}"/>	 />
			<label for = "invalid">INVALID</label>&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div style="float: left; line-height: 23px">
			<label id = "keyword">DISCRIPTION</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="form-group input-group" style="float: left;">
			<input type="text" class="form-control" id = "keyword" name = "keyword" value="${map.keyword}" >
			<span class="input-group-btn">
				<input type="submit" class="btn btn-default" value="조회">
			</span>
		</div>
	</div>
</form>
			