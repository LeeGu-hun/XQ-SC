<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table class="table">
			<thead>
				<tr>
					<th>Vendor</th>
					<th>Audit ID</th>
					<th>Outstanding</th>
					<th>Completed</th>
					<th>Issuer</th>
					
			
			</thead>
			<tbody>
				<c:forEach var="s" items="${ncrStatusList}">
											
							<td>${s.vendor_name}</td>
							<td>${s.audit_id}</td>
							<td>${s.ocount}</td>
							<td>${s.ccount}</td>
							<td>${n.Issuer_name}</td>
							
						</tr>
					</c:forEach>
			
			</tbody>
		</table>