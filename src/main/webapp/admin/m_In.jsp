<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<form:form commandName="MemberCommand" method="post" action="MSet?state=0">
	<table class="table" style="margin: 0">
		<tbody>
			<tr>
				<td>
					<label><b>DEPART</b></label><br>
					<form:radiobutton path="MEMBER_DEPART" value="ADMIN" label="ADMIN" checked="checked"/>
					<br>
					<form:radiobutton path="MEMBER_DEPART" value="PURCHASE" label="PURCHASE"/>
					<br>
					<form:radiobutton path="MEMBER_DEPART" value="QUALITY" label="QUALITY"/>
					
				</td>
				<td>
					<br>
					<label><b>NAME</b></label><br>
					<form:input path="MEMBER_NAME" class="form-control" style=" width:90pt;"/>
					
				</td>
				<td>
					<br>
					<label><b>EMAIL</b></label><br>
					<form:input path="MEMBER_EMAIL" class="form-control" style=" width:170pt;"/>
					
				</td>
				<td>
					<br>
					<label><b>PASSWORD</b></label><br>
					<form:password path="MEMBER_PASS" class="form-control" style=" width:120pt;"/>
					
				</td>
				<td>
					<br>
					<label><b>TEL</b></label><br>
					<form:input path="MEMBER_TEL" class="form-control" style=" width:120pt;"/>
					
				</td>
				<td>
					<label><b>VALID</b></label>
					<br>
					<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" checked="checked"/>
					<br>
					<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"/>
					
				</td>
				<td align="center" style=" width:125pt;">
					<br>
					<input type="button" class="btn btn-default" value="REGISTER" onclick="mInsert()" 
					style=" width:90pt; height: 30pt"><br>
					<span id="mInUp" style="font-size:9pt;color:red;"></span>
				</td>
			</tr>
		</tbody>
	</table>
</form:form>