<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="CkLCommand" method="post" id="cif" action="CLSet?state=0">
<div align="right" style="overflow: hidden;">
	<div style="float: left; margin: 0">
		<div style="overflow: hidden; margin: 0">
			<div style="float: left;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>KIND</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>&nbsp;&nbsp;
				<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="float: left;">
				<label>VALID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>&nbsp;&nbsp;
				<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="float: left; line-height: 23px">
				<label>FULLSCORE</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="form-group input-group" style="float: left;">
				<form:input path="CHECKLIST_FULLSCORE" class="form-control"
				onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();"/>
			</div>
		</div>
		<div style="overflow: hidden; margin: 0">
			<div style="float: left;">
				<label>DISCRIPTION</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="float: left;">
				<form:textarea path="CHECKLIST_DISCRIPTION" class="form-control" id="inDiscription" cols="100" rows="3"/>
			</div>
		</div>
	</div>
	<div style="float: left;">
		<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btn-default" value="등록" onclick="ckLInsert()">
	</div>
</div>
	<span id="ckDs" style="font-size:9pt;color:red; text-align:right;"></span>
</form:form>
			