<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form commandName="MemberCommand" method="post" action="MSet?state=1">
	<table class="table">
		<tbody>
			<tr>
				<td colspan="7" align="center">
					<b>${selMember.MEMBER_DEPART} &nbsp;&nbsp;>&nbsp;&nbsp;	${selMember.MEMBER_ID}</b> 
					<form:hidden path="MEMBER_ID" value="${selMember.MEMBER_ID}" />
				</td>
			</tr>
			<tr>
				<td>
					<label><b>VALID</b></label><br>
					<c:choose>
						<c:when test="${selMember.MEMBER_VALID eq 'N'}">
							<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" />&nbsp;&nbsp;
							<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"
								checked="checked" />
						</c:when>
						<c:otherwise>
							<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID"
								checked="checked" />&nbsp;&nbsp;
							<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID" />
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<label><b>NAME</b></label><br>
					<form:input path="MEMBER_NAME" value="${selMember.MEMBER_NAME}" class="form-control"/>
				</td>
				<td>
					<label><b>EMAIL</b></label><br>
					<form:input path="MEMBER_EMAIL" value="${selMember.MEMBER_EMAIL}" class="form-control"/>
				</td>
				<td>
					<label><b>PASSWORD</b></label><br>
					<form:password path="MEMBER_PASS" value="${selMember.MEMBER_PASS}" class="form-control"/>
				</td>
				<td>
					<label><b>TEL</b></label><br>
					<form:input path="MEMBER_TEL" value="${selMember.MEMBER_TEL}" class="form-control"/>
				</td>
				<td>
					<input type="button" class="btn btn-default" value="수정" onclick="mUpdate()"
					style=" width:70pt;">
					<a href="javascript:inMemForm()">취소</a>
					<br>
					<span id="mInUp" style="font-size:9pt;color:red;"></span>
				</td>
			</tr>
			<tr>
				<td colspan="7" align="right">
				</td>
			</tr>
		</tbody>
	</table>
</form:form>