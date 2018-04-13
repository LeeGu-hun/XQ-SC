<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Setting</title>
      <link rel="stylesheet" href="./css/table.css" type="text/css">
      
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	function inMemForm() {
		$.ajax({
			type : "POST",
			url : "./MSet/MInsertForm",
			success : mForm
		});
	}
	
	function upMemForm(id) {
		$.ajax({
			type : "POST",
			url : "./MSet/MUpdateForm",
			data : "id=" + id,
			success : mForm
		});				
	}
	
	function mForm(msg) {
		$("#mInUpForm").html(msg);
	}
	
	function mInsert() {
		var name = document.getElementById('MEMBER_NAME'); 
			document.getElementById('mInUp').textContent= name.value;
		
		if(name.value == "" ){
			document.getElementById('mInUp').textContent= '내용을 입력해주세요';
			return;
		}
		document.getElementById('MemberCommand').submit();
	}
	
	function mUpdate() {

		var name = document.getElementById('MEMBER_NAME'); 
		
		if(name.value == ""){
			document.getElementById('mInUp').textContent= '내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('MemberCommand').submit();
	//	document.getElementById('mInUp').textContent= name.value;
	}
</script>
</head>

<body>
    <blockquote> <br>
		<a href="<c:url value='/main'/>"> [ dddddd ]</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./admin/setting.jsp">다른 회원의 게시판보기aaffff</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../logout">로그아웃</a>
	</blockquote>
	
	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr align="center" valign="middle">
				<th>
					<div align="center">DEPART</div>
				</th>
				<th>
					<div align="center">NAME</div>
				</th>
				<th>
					<div align="center">EMAIL</div>
				</th>
				<th>
					<div align="center">TEL</div>
				</th>
				<th>
					<div align="center">VALID</div>
				</th>
				<th>
					<div align="center">ID</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${map.ingMemberList}">
				<tr>
					<td>
						<div align="center">
							${m.MEMBER_DEPART}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_NAME}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_EMAIL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_TEL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_VALID}
						</div>
					</td>
					<td>
						<div align="center">
							<a href="javascript:upMemForm('${m.MEMBER_ID}')">${m.MEMBER_ID}</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	<div id="mInUpForm"><%@include file="/admin/m_In.jsp" %></div>
	<br><span id="mInUp" style="font-size:9pt;color:red;"></span>
	<br>
	<br>
	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr align="center" valign="middle">
				<th>
					<div align="center">DEPART</div>
				</th>
				<th>
					<div align="center">NAME</div>
				</th>
				<th>
					<div align="center">EMAIL</div>
				</th>
				<th>
					<div align="center">TEL</div>
				</th>
				<th>
					<div align="center">PASSWORD</div>
				</th>
				<th>
					<div align="center">VALID</div>
				</th>
				<th>
					<div align="center">ID</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${map.edMemberList}">
				<tr>
					<td>
						<div align="center">
							${m.MEMBER_DEPART}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_NAME}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_EMAIL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_TEL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_PASS}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_VALID}
						</div>
					</td>
					<td>
						<div align="center">
							<a href="javascript:upMemForm('${m.MEMBER_ID}')">${m.MEMBER_ID}</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>