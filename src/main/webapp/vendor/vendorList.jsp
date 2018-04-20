<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table class="table" border="1" >
		<thead>
			<tr>
				<th>Vendor Name</th>
				<th>Vendor ID</th>
			</tr>
		</thead>
		<tbody >
					<c:forEach var="a" items="${vendorList}">
						<tr onclick="rowselect(
							'${a.VENDOR_NAME}'
							,'${a.VENDOR_ID}')">									
							
							<td>${a.VENDOR_NAME}</td>
							<td>${a.VENDOR_ID}</td>
						</tr>
					</c:forEach>
				
		</tbody>		
</table>
		
