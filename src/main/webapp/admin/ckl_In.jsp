<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="CkLCommand" method="post" id="cif" action="CLSet?state=0">
	<table><tbody>
		<tr>
			<td style="width:100pt;" align="right">
				<label>KIND</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>&nbsp;&nbsp;
				<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
			</td>
			<td style="width:100pt;"  align="right">
				<label>VALID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>&nbsp;&nbsp;
				<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
			</td>
			<td align="right">
				<label>FULLSCORE</label>&nbsp;&nbsp;&nbsp;
			</td>
			<td align="right">
				<div class="form-group input-group" style="float: left;">
					<form:input path="CHECKLIST_FULLSCORE" class="form-control"
					onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();"/>
				</div>
			</td>
			<td rowspan="2" style="width:100pt;" align="center">
				<input type="button" class="btn btn-default" value="REGISTER" onclick="ckLInsert()"
				style="width:80pt; height:50pt">
				<br>
				<span id="ckDs" style="font-size:9pt;color:red;"></span>
			</td>
		</tr>
		<tr>
			<td style="width:100pt;">
				<label>DISCRIPTION</label>
			</td>
			<td colspan="5">
				<form:textarea path="CHECKLIST_DISCRIPTION" class="form-control" id="inDiscription" cols="100" rows="3"/>
			</td>
			<td>
			</td>
		</tr>
	</tbody></table>
</form:form>
			