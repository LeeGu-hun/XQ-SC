<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="cateCommand" method="post" action="Setting?state=1" id="ucf">
	<table class="table" style="width:95%"><tbody>
		<tr>
			<c:choose>
				<c:when test="${selCate.CATEGORY_VALID eq 'Y'}">
					<td>
						<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID" checked="checked"/>
					</td>
					<td>
						<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID"/>
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID"/>
					</td>
					<td>
						<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID" checked="checked"/>
					</td>
				</c:otherwise>
			</c:choose>
			<td>
				<form:input path="CATEGORY_NAME" value="${selCate.CATEGORY_NAME}" id="upCateName" class="form-control"/>
				<form:hidden path="CATEGORY_ID" value="${selCate.CATEGORY_ID}" />
			</td>
			<td>
				<input type="button" style="width:70pt;" class="btn btn-default" value="MODIFY" onclick="cateUpdate()">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
			<span id="ckCate" style="font-size:9pt;color:red;"></span>
			</td>
			<td align="right">
				<a href="javascript:cateInsertForm()">CANCEL</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</tbody></table>
</form:form>
			