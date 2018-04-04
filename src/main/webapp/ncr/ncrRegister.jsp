<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

function searchAuditPopup(){

	var popup = window.open("<c:url value='ncr/searchAuditPopup'/>", "" , "width=800,height=600,toolba=no,dependent=true");
	popup.moveTo(500,100);
}


</script>
<title>Insert title here</title>
</head>
<body>
<div id=mainBox>
	<div>
		<table > 
			<tr>
				<td>Audit No.</td>
				<td><input type="text"/>
					<image src="/images/icon_search.gif" , onclick="searchAuditPopup()"></td>
				<td>Vendor Name</td>
				<td><input type="text" ></td>
				<td>Audit date</td>
				<td><input type="date" ></td>
			<tr>
			<tr>
				<td>Kind of Audit</td>
				<td><select></select></td>
				<td>Audit Result</td>
				<td><input type="text" ></td>
				<td>Auditor</td>
				<td><input type="text" ></td>
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