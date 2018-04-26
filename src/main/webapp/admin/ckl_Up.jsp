<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="CkLCommand" id="cuf" method="post" action="CLSet?state=1">
	<table><tbody>
		<tr>
			<td style="width:100pt;" align="right">
				<form:hidden path="CHECKLIST_ID" value ="${selCkList.CHECKLIST_ID}"/>
				<label>KIND</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<c:choose>
					<c:when test="${selCkList.AUDIT_KIND_ID eq 'NE'}">
						<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>&nbsp;&nbsp;
						<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
					</c:when>
					<c:otherwise>
						<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW"/>&nbsp;&nbsp;
						<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR" checked="checked"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td style="width:100pt;"  align="right">
				<label>VALID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<c:choose>
					<c:when test="${selCkList.CHECKLIST_VALID eq 'Y'}">
						<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>&nbsp;&nbsp;
						<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
					</c:when>
					<c:otherwise>
						<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID"/>&nbsp;&nbsp;
						<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID" checked="checked"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td align="right">
				<label>FULLSCORE</label>&nbsp;&nbsp;&nbsp;
			</td>
			<td align="right">
				<div class="form-group input-group" style="float: left;">
					<form:input path="CHECKLIST_FULLSCORE" value="${selCkList.CHECKLIST_FULLSCORE}"
					class="form-control" onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();"/>
				</div>
			</td>
			<td rowspan="2" style="width:100pt;" align="center">
				<input type="button" value="MODIFY" class="btn btn-default" onclick="ckLInsert()" 
				style="width:80pt; height:50pt">
				<br>
				<span id="ckDs" style="font-size:9pt;color:red;"></span>
				<br>
				<a href="javascript:insertForm()">CANCEL</a>
			</td>
		</tr>
		<tr>
			<td style="width:100pt;">
				<label>DISCRIPTION</label>
			</td>
			<td colspan="5">
				<form:textarea path="CHECKLIST_DISCRIPTION" placeholder="${selCkList.CHECKLIST_DISCRIPTION}"
				class="form-control" id="inDiscription" cols="100" rows="3"/>
			</td>
			<td>
			</td>
		</tr>
	</tbody></table>
</form:form>
			