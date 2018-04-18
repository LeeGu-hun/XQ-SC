<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="CkLCommand" id="cuf" method="post" action="CLSet?state=1">
	<div>
		<form:hidden path="CHECKLIST_ID" value ="${selCkList.CHECKLIST_ID}"/>
		
		<label>KIND</label>
		<c:choose>
			<c:when test="${selCkList.AUDIT_KIND_ID eq 'NE'}">
				<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>
				<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
			</c:when>
			<c:otherwise>
				<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW"/>
				<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR" checked="checked"/>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>VALID</label>
		<c:choose>
			<c:when test="${selCkList.CHECKLIST_VALID eq 'Y'}">
				<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>
				<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
			</c:when>
			<c:otherwise>
				<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID"/>
				<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID" checked="checked"/>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>FULLSCORE</label>
		<form:input path="CHECKLIST_FULLSCORE" value="${selCkList.CHECKLIST_FULLSCORE}"
		onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="수정" onclick="ckLUpdate()">
		<a href="javascript:insertForm()">취소</a>
		<br>
		<label>DISCRIPTION</label>
		<form:textarea path="CHECKLIST_DISCRIPTION" id="upDiscription" cols="100" rows="3"
		placeholder="${selCkList.CHECKLIST_DISCRIPTION}"/>
		<br>		
		<span id="ckDs" style="font-size:9pt;color:red;"></span>
	</div>
</form:form>
			