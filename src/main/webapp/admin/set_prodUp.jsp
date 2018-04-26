<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form commandName="prodCommand" method="post" action="Setting?state=3" id="upf">
	<table class="table" style="width:95%"><tbody>
		<tr>
			<td colspan="2">
				<input type="hidden" id="cateid" value="${selProd.CATEGORY_ID}">
				<form:select path="CATEGORY_ID" class="form-control" onchange="prodTable();" id="prodCate">
					<form:option value="cate">CATEGORY</form:option>
					<c:forEach var = "c" items="${cateList}">
						<form:option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</form:option>
					</c:forEach>
				</form:select>
			</td>
			<td colspan="2" align="right">
				<span id="ckProd" style="font-size:9pt;color:red;"></span>
			<a href="javascript:prodInsertForm()">CANCEL</a>
			</td>
		</tr><tr>
			<c:choose>
				<c:when test="${selProd.PRODUCT_VALID eq 'Y'}">
					<td>
						<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID" checked="checked"/>
					</td>
					<td>
						<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID"/>
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<form:radiobutton path="PRODUCT_VALID" value="Y" label="VALID"/>
					</td>
					<td>
						<form:radiobutton path="PRODUCT_VALID" value="N" label="INVALID" checked="checked"/>
					</td>
				</c:otherwise>
			</c:choose>
			<td>
				<form:input path="PRODUCT_NAME" class="form-control" value="${selProd.PRODUCT_NAME}" id="upProdName"/>
				<form:hidden path="PRODUCT_ID" value="${selProd.PRODUCT_ID}" />
			</td>
			<td>
				<input type="button" class="btn btn-default" value="MODIFY" style="width:70pt;" onclick="prodUpdate()">
			</td>
		</tr>
		<tr><td colspan="4"></td></tr>
	</tbody></table>
</form:form>
			