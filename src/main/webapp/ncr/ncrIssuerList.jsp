<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="table" border="1" >
		<thead>
			<tr>
				<th>Issuer Name</th>
				<th>Issuer ID</th>
			</tr>
		</thead>
		<tbody >
					<c:forEach var="i" items="${issuerList}">
						<tr onclick="rowselect1('${i.issuer_name}'
							,'${i.issuer_id}')">									
							
							<td>${i.issuer_name}</td>
							<td>${i.issuer_id}</td>
						</tr>
					</c:forEach>
				
		</tbody>		
</table>
		
		