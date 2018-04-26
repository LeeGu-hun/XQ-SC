<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table class="table table-hover" >
			<thead>
				<tr>
					<th>NCR.No</th>
					<th>NCR title</th>
					<th>Audit ID</th>
					<th>Vendor ID</th>
					<th>Vendor Name</th>
					<th>NCR grade</th>
					<th>Issuer ID</th>			
					<th>NCR Status</th>	
			
			</thead>
			<tbody>
				<c:forEach var="n" items="${ncrList}">
				<tr onclick="rowselectDetail('${n.ncr_id}')">							
							
							<td>${n.ncr_id}</td>
							<td>${n.ncr_title}</td>
							<td>${n.audit_id}</td>
							<td>${n.vendor_id}</td>
							<td>${n.vendor_name}</td>
							<td>${n.ncr_grade_name}</td>
							<td>${n.issuer_name }</td>
							<td>${n.ncr_comp}</td>
						</tr>
					</c:forEach>
			
			</tbody>
		</table>