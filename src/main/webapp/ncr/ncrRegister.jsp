<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

function searchAuditPopup(){

	var popup = window.open("<c:url value='./searchAuditPopup'/>", "" , "width=800,height=600,toolba=no,dependent=true");
	popup.moveTo(500,100);
}

function setChildValue(audit_no,vendor_name,dudit_date,audit_kind,audit_result,auditor_name){
	document.getElementById("audit_no").value = audit_no;
	document.getElementById("vendor_name").value = vendor_name;
	document.getElementById("dudit_date").value = dudit_date;
	document.getElementById("audit_kind").value = audit_kind;
	document.getElementById("audit_result").value = audit_result;
	document.getElementById("auditor_name").value = auditor_name;	

}

</script>
<title>NCR Register</title>
</head>
<body>
<div id=mainBox>
	<div>
		<table > 
			<tr>
				<td>Audit No.</td>
				<td><input type="text" id="audit_no"/>
					<image src="/images/icon_search.gif" , onclick="searchAuditPopup()"></td>
				<td>Vendor Name</td>
				<td><input type="text" id="vendor_name"></td>
				<td>Audit date</td>
				<td><input type="date" id="audit_date"></td>
			<tr>
			<tr>
				<td>Kind of Audit</td>
				<td><input type="text" id="audit_kind"></td>
				<td>Audit Result</td>
				<td><input type="text"  id="audit_result"></td>
				<td>Auditor</td>
				<td><input type="text"  id="auditor_name"></td>
			<tr>		
		</table>	
	</div>
	<div >
		<table >
			<tr>
				<td>Subject</td>
				<td colspan ="3"><input type="text" ></td>
				<td>Issuer</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>Description</td>
				<td colspan = "5">
				<textarea style="width :100%; height:500px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>file_upload</td>
				<td colspan = "5">
					<input type="file"></input></td>
				
		</table>
	</div>
 



</div>
</body>
</html>