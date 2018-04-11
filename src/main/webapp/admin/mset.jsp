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

	<c:if test="${map.state ne 1}">
		<form:form commandName="MemberCommand" method="post">
			<table width=80% border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div align="center">
							<label>DEPART</label><br>
							<form:radiobutton path="MEMBER_DEPART" value="ADMIN" label="ADMIN" checked="checked"/>
							<form:radiobutton path="MEMBER_DEPART" value="PURCHASE" label="PURCHASE"/>
							<br>
							<form:radiobutton path="MEMBER_DEPART" value="QUALITY" label="QUALITY"/>
							<form:radiobutton path="MEMBER_DEPART" value="VENDOR" label="VENDOR"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>NAME</label><br>
							<form:input path="MEMBER_NAME"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>EMAIL</label><br>
							<form:input path="MEMBER_EMAIL"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>PASSWORD</label><br>
							<form:password path="MEMBER_PASS"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>TEL</label><br>
							<form:input path="MEMBER_TEL"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>VALID</label><br>
							<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" checked="checked"/>
							<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"/>
						</div>
					</td>
					<td>
						<input type="submit" value="등록">	
					</td>
				</tr>
			</table>
		</form:form>
	</c:if>
	<c:if test="${map.state eq 1}">
		<form:form commandName="MemberCommand" method="post">
			<table width=80% border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="7" align="center">
						${map.selMember.MEMBER_DEPART} > ${map.selMember.MEMBER_ID}
						<form:hidden path="MEMBER_ID" value ="${map.selMember.MEMBER_ID}"/>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							<label>VALID</label><br>
							<c:choose>
								<c:when test="${map.selMember.MEMBER_VALID eq 'Y'}">
									<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID" checked="checked"/>
									<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID"/>
								</c:when>
								<c:otherwise>
									<form:radiobutton path="MEMBER_VALID" value="Y" label="VALID"/>
									<form:radiobutton path="MEMBER_VALID" value="N" label="INVALID" checked="checked"/>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td>
						<div align="center">
							<label>NAME</label><br>
							<form:input path="MEMBER_NAME" value="${map.selMember.MEMBER_NAME}"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>EMAIL</label><br>
							<form:input path="MEMBER_EMAIL" value="${map.selMember.MEMBER_EMAIL}"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>PASSWORD</label><br>
							<form:password path="MEMBER_PASS" value="${map.selMember.MEMBER_PASS}"/>
						</div>
					</td>
					<td>
						<div align="center">
							<label>TEL</label><br>
							<form:input path="MEMBER_TEL" value="${map.selMember.MEMBER_TEL}"/>
						</div>
					</td>
					<td>
						<input type="submit" value="수정">
						<a href="./MSet">취소</a>
					</td>
				</tr>
			</table>
		</form:form>
	</c:if>
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
			<c:forEach var="m" items="${map.memberList}">
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
							<a href="./MSet?state=1&mId=${m.MEMBER_ID}">${m.MEMBER_ID}</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>