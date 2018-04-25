<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="cateCommand" method="post" id="icf">
	<table class="table" style="width:95%"><tbody>
		<tr>
			<td>
				<form:radiobutton path="CATEGORY_VALID" value="Y" label="VALID" checked="checked"/>			
			</td>
			<td>
				<form:radiobutton path="CATEGORY_VALID" value="N" label="INVALID"/>
			</td>
			<td>
				<form:input path="CATEGORY_NAME" id="inCateName" class="form-control"/>
			</td>
			<td>
				<input type="button" class="btn btn-default" value="등록" onclick="cateInsert()"
				style="width:70pt;">
			</td>
		</tr>
		<tr><td colspan="4" align="right">
			<span id="ckCate" style="font-size:9pt;color:red;"></span>
		</td></tr>
	</tbody></table>
</form:form>
			