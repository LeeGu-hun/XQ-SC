<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Plan Insert</title>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>

<script>
	function add() {
		form.submit();
	}
</script>

</head>
<body>
	<form action="./AuditPlanInsert" method="POST" name="form">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'><span>Vendor 등록관리</span></a></li>
				<li class='active has-sub'><a href='#'><span>평가관리</span></a>
					<ul>
						<li class='has-sub'><a href='./AuditManage'><span>평가계획조회</span></a></li>
						<li class='has-sub'><a href='./AuditPlanInsert'><span>평가계획입력</span></a></li>
						<li class='has-sub'><a href='./AuditReport'><span>평가결과입력</span></a></li>
						<li class='has-sub'><a href='./AuditResult'><span>평가현황</span></a></li>
					</ul></li>
				<li><a href='#'><span>부적합관리</span></a></li>
				<li class='last'><a href='#'><span>시스템 관리</span></a></li>
			</ul>
		</div>
		<table border="1" id="auditTable">
			<tr>
				<th>Audit ID</th>
				<th>AUDIT_KIND_ID</th>
				<th>VENDOR_ID</th>
				<th>AUDITOR_ID</th>
				<th>Audit Plan Date</th>
				<th>Audit OutCall Date</th>
				<th>Submit</th>
			</tr>

			<tr align="center" valign="middle" bordercolor="#333333">
			
				<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
					<input type="text" name="AUDIT_ID">
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
					type="text" name="AUDIT_KIND_ID"></td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
					type="text" name="VENDOR_ID"></td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
					type="text" name="AUDITOR_ID"></td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
					type="date" name="AUDIT_PLAN_DATE"></td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
					type="date" name="AUDIT_COMP_DATE"></td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><a
					href='#' onclick="add()"><span>Submit</span></a></td>
			</tr>

		</table>
	</form>
</body>
</html>