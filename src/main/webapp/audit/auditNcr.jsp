<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">


<table class="table table-hover">


	<c:forEach var="c" items="${vendorNcr}">
		<tr>
		<td nowrap>NCR Description</td>
		
			<td>
				${c.NCR_TITLE}
			</td>
			<td>NCR Subject</td>
			<td>
				<td colspan="7"><textarea class="form-control col-sm-5" rows="5">${c.NCR_DESCRIPTION}</textarea>
		
			</td>
			
			
		</tr>
	</c:forEach>



<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</table>

