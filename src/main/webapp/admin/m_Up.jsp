<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form commandName="MemberCommand" method="post" action="MSet?state=1">
	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td colspan="7" align="center">${selMember.MEMBER_DEPART} >
					${selMember.MEMBER_ID} <form:hidden path="MEMBER_ID"
						value="${selMember.MEMBER_ID}" />
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<label>VALID</label><br>
						<c:choose>
							<c:when test="${selMember.MEMBER_VALID eq 'N'}">
								<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" />
								<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"
									checked="checked" />
							</c:when>
							<c:otherwise>
								<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID"
									checked="checked" />
								<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID" />
							</c:otherwise>
						</c:choose>
					</div>
				</td>
				<td>
					<div align="center">
						<label>NAME</label><br>
						<form:input path="MEMBER_NAME" value="${selMember.MEMBER_NAME}" />
					</div>
				</td>
				<td>
					<div align="center">
						<label>EMAIL</label><br>
						<form:input path="MEMBER_EMAIL" value="${selMember.MEMBER_EMAIL}" />
					</div>
				</td>
				<td>
					<div align="center">
						<label>PASSWORD</label><br>
						<form:password path="MEMBER_PASS" value="${selMember.MEMBER_PASS}" />
					</div>
				</td>
				<td>
					<div align="center">
						<label>TEL</label><br>
						<form:input path="MEMBER_TEL" value="${selMember.MEMBER_TEL}" />
					</div>
				</td>
				<td><input type="button" value="수정" onclick="mUpdate()">
					<a href="javascript:inMemForm()">취소</a></td>
			</tr>
		</tbody>
	</table>
</form:form>