<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<table class="table" border="1" >

		<thead>
			<tr>
				<th>Auditor Name</th>
				<th>Auditor ID</th>
			</tr>
		</thead>
		<tbody >
					<c:forEach var="a" items="${auditorList}">
						<tr onclick="rowselect1('${a.MEMBER_NAME}'
							,'${a.AUDITOR_ID}','${index}')">									
							<td>${a.MEMBER_NAME}</td>
							<td>${a.AUDITOR_ID}</td>
						</tr>
					</c:forEach>
			
		</tbody>		
</table>