<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table class="table" border="1" >
		<thead>
			<tr>
				<th>Audit No.</th>
				<th>Vendor Name</th>
				<th>Audit Date</th>
				<th>Kind of Audit</th>
				<th>Audit Result</th>
				<th>Auditor</th>
			</tr>
		</thead>
		<tbody >
					<c:forEach var="a" items="${auditList}">
						<tr onclick="rowselect('${a.audit_id}'
							,'${a.vendor_name}'
							,'${a.audit_comp_date}'
							,'${a.audit_kind}'
							,'${a.audit_result}'
							,'${a.member_name}')">
									
							<td>${a.audit_id}</td>
							<td>${a.vendor_name}</td>
							<td>${a.audit_comp_date}</td>
							<td>${a.audit_kind}</td>
							<td>${a.audit_result}</td>
							<td>${a.member_name}</td>
						</tr>
					</c:forEach>
				
		</tbody>		
</table>
		