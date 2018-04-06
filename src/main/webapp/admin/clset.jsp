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
</head>

<body>
    <blockquote> <br>
		<a href="<c:url value='/main'/>"> [ dddddd ]</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./admin/setting.jsp">다른 회원의 게시판보기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../logout">로그아웃</a>
	</blockquote>

	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr align="center" valign="middle">
				<th width="10%">
					<div align="center">DEPART</div>
				</th>
				<th width="10%">
					<div align="center">ID</div>
				</th>
				<th width="10%">
					<div align="center">PASSWORD</div>
				</th>
				<th width="15%">
					<div align="center">NAME</div>
				</th>
				<th width="20%">
					<div align="center">EMAIL</div>
				</th>
				<th width="20%">
					<div align="center">TEL</div>
				</th>
				<th width="10%">
					<div align="center">VALID</div>
				</th>
				<th width="5%">
				</th>
			</tr>
		</thead>
		<tbody>
		<form:form commandName="uploadMember" method="post">
			<tr>
				<td>
					<div align="center">
						<form:select path="MEMBER_DEPART">
							<form:option value="ADMIN"/>
							<form:option value="QUALITY"/>
							<form:option value="PURCHASE"/>
							<form:option value="VENDOR"/>
						</form:select>
					</div>
				</td>
				<td>
					<form:input path="MEMBER_ID"/>
				</td>
				<td>
					<form:password path="MEMBER_PASS"/>
				</td>
				<td>
					<form:input path="MEMBER_NAME"/>
				</td>
				<td>
					<form:input path="MEMBER_EMAIL"/>
				</td>
				<td>
					<form:input path="MEMBER_TEL"/>
				</td>
				<td>
					<form:radiobutton path="MBMBER_VALID" value="Y" label="VALID"/>
					<form:radiobutton path="MBMBER_VALID" value="N" label="INVALID"/>
				</td>
				<td>
					<input type="submit" value="등록">
				</td>
			</tr>
		</form:form>
			<c:forEach var="m" items="${map.memberList}">
				<tr>
					<td>
						<div align="center">
							${m.MEMBER_DEPART}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_ID}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_PASS}
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
							${m.MBMBER_VALID}
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>