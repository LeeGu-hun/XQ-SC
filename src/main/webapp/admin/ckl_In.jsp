<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="CkLCommand" method="post" id="cif" action="CLSet?state=0">
	<div>
		<label>KIND</label>
		<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>
		<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>VALID</label>
		<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>
		<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>FULLSCORE..</label>
		<form:input path="CHECKLIST_FULLSCORE"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="등록" onclick="ckLInsert()">
		<br>
		<label>DISCRIPTION</label>
		<form:textarea path="CHECKLIST_DISCRIPTION" id="inDiscription" cols="100" rows="3"/>
		<br>		
		<span id="ckDs" style="font-size:9pt;color:red;"></span>
	</div>
</form:form>
			