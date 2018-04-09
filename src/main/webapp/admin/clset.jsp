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
<script>
	function test() {
		
	}
</script>
</head>

<body>
    <blockquote> <br>
		<a href="<c:url value='/main'/>"> [ dddddd ]</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./admin/setting.jsp">다른 회원의 게시판보기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../logout">로그아웃</a>
	</blockquote>
	<form:form commandName="uploadCkList" method="post">
		<div>
			<label>KIND</label>
			<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW"/>
			<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label>VALID</label>
			<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID"/>
			<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label>FULLSCORE..</label>
			<form:input path="CHECKLIST_FULLSCORE"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="등록">	
			<br>
			
			<label>DISCRIPTION</label>
			<form:textarea path="CHECKLIST_DISCRIPTION" cols="100" rows="3"/>
		</div>
	</form:form>
	<br>
	<br>
	<div>
		<label>KIND</label>
		<input id = "new" type = "radio", name="auditKindId" value="NE" />
		<label for = "new">NEW</label>
		<input id = "regular" type = "radio", name="auditKindId" value="RE" />
		<label for = "regular">REGULAR</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>VALID</label>
		<input id = "valid" type = "radio", name="cklValid" value="Y" />
		<label for = "valid">VALID</label>
		<input id = "invalid" type = "radio", name="cklValid" value="N" />
		<label for = "invalid">INVALID..</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label id = "keyword">DISCRIPTION</label>
		<input id = "keyword" type="text" name = "keyword" value="${map.keyword}" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="조회">
		<br>
	</div>
	
	<table width=80% border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr align="center" valign="middle">
				<th>
					<div align="center">KIND</div>
				</th>
				<th>
					<div align="center">DISCRIPTION</div>
				</th>
				<th>
					<div align="center">FULLSCORE</div>
				</th>
				<th>
					<div align="center">VALID</div>
				</th>
				<th>
					<div align="center">
    					<a href="javascript:test()">수정</a>
    				</div>
				</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="c" items="${map.allckList}">
				<tr>
					<td>
						<div align="center">
							${c.AUDIT_KIND_ID}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_DISCRIPTION}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_FULLSCORE}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_VALID}
						</div>
					</td>
					<td>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>