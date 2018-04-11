<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function() {
		$("#auditDateFrom, #auditDateTo").datepicker({
					dateFormat : 'yy-mm-dd'			
				});
		
	});


</script>
<title>Insert title here</title>
</head>
<body>
<div>
	<form id="formSearchAudit" name="formSearchAudit" method="post" action="./searchAudit">
	<table > 
			<tr>
				<td>Vendor Name: <input type="text" name="vendorName" id="vendorName"/></td>						
			</tr>
			<tr>
				<td>Audit Date : <input type="text"	id="auditDateFrom" name="auditDateFrom" readonly> ~ <input
					 type="text" id="auditDateTo"  name="auditDateTo" readonly></td>
				<td> <input type="submit" value= "Search" ></td>
			</tr>
	</table>
	</form>
</div>
	
	<table >
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
		<tbody>
 		<c:forEach var="a" items="${auditList}">
		<tr>		
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

<div>

</div>
</body>
</html>