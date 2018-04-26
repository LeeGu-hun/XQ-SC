<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="prodCommand" method="post" action="Setting?state=2" id="ipf">
	<table class="table" style="width:95%"><tbody>
		<tr>
			<td colspan="2">
				<form:select path="CATEGORY_ID" class="form-control" onchange="prodTable();" id="prodCate">
					<form:option value="cate">CATEGORY</form:option>
					<c:forEach var = "c" items="${cateList}">
						<form:option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</form:option>
					</c:forEach>
				</form:select>
			</td>
			<td colspan="2" align="right">
				<span id="ckProd" style="font-size:9pt;color:red;"></span>
			</td>
		</tr>
		<tr>
			<td>
				<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID" checked="checked"/>
			</td>
			<td>
				<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID"/>
			</td>
			<td>
				<form:input path="PRODUCT_NAME" id="inProdName" class="form-control" />
			</td>
			<td>
				<input type="button" class="btn btn-default" style="width:70pt;" 
				value="REGISTER" onclick="prodInsert()">
			</td>
		</tr>
		<tr><td colspan="4"></td></tr>
	</tbody></table>
</form:form>
			