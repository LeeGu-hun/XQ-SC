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
						<tr onclick="rowselect1('${a.auditor_name}'
							,'${a.auditor_id}','${index}')">									
							
							<td>${a.auditor_name}</td>
							<td>${a.auditor_id}</td>
						</tr>
					</c:forEach>
			
		</tbody>		
</table>