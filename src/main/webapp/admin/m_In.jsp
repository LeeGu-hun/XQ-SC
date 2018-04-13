<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<form:form commandName="MemberCommand" method="post" action="MSet?state=0">
	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td>
					<div align="center">
						<label>DEPART</label><br>
						<form:radiobutton path="MEMBER_DEPART" value="ADMIN" label="ADMIN" checked="checked"/>
						<br>
						<form:radiobutton path="MEMBER_DEPART" value="PURCHASE" label="PURCHASE"/>
						<br>
						<form:radiobutton path="MEMBER_DEPART" value="QUALITY" label="QUALITY"/>
					</div>
				</td>
				<td>
					<div align="center">
						<label>NAME</label><br>
						<form:input path="MEMBER_NAME"/>
					</div>
				</td>
				<td>
					<div align="center">
						<label>EMAIL</label><br>
						<form:input path="MEMBER_EMAIL"/>
					</div>
				</td>
				<td>
					<div align="center">
						<label>PASSWORD</label><br>
						<form:password path="MEMBER_PASS"/>
					</div>
				</td>
				<td>
					<div align="center">
						<label>TEL</label><br>
						<form:input path="MEMBER_TEL"/>
					</div>
				</td>
				<td>
					<div align="center">
						<label>VALID</label><br>
						<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" checked="checked"/>
						<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"/>
					</div>
				</td>
				<td>
					<input type="button" value="등록" onclick="mInsert()">
				</td>
			</tr>
		</tbody>
	</table>
</form:form>