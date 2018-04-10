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
	function updateCkL(ckId) {
		location.href = "./CLSet?state=1&ckId="+ckId;
	}
	function totalAdd(){
		var total = document.getElementById("total");
		var haps = document.getElementsByName("haps");
		var sum = 0;
		for(var i = 0 ; i < haps.length ; i++){
			sum = sum + parseInt(haps[i].value);
		}
		total.value = sum;
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
	<c:if test="${map.state ne 1}">
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
	</c:if>
	<c:if test="${map.state eq 1}">
		<form:form commandName="uploadCkList" method="post">
			<div>
				<form:hidden path="CHECKLIST_ID" value ="${map.selCkList.CHECKLIST_ID}"/>
				
				<label>KIND</label>
				<c:choose>
					<c:when test="${map.selCkList.AUDIT_KIND_ID eq 'NE'}">
						<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW" checked="checked"/>
						<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR"/>
					</c:when>
					<c:otherwise>
						<form:radiobutton path="AUDIT_KIND_ID" value="NE" label="NEW"/>
						<form:radiobutton path="AUDIT_KIND_ID" value="RE" label="REGULAR" checked="checked"/>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>VALID</label>
				<c:choose>
					<c:when test="${map.selCkList.CHECKLIST_VALID eq 'Y'}">
						<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID" checked="checked"/>
						<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID"/>
					</c:when>
					<c:otherwise>
						<form:radiobutton path="CHECKLIST_VALID" value="Y" label="VALID"/>
						<form:radiobutton path="CHECKLIST_VALID" value="N" label="INVALID" checked="checked"/>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>FULLSCORE</label>
				<form:input path="CHECKLIST_FULLSCORE" value="${map.selCkList.CHECKLIST_FULLSCORE}"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="수정">		
				<a href="./CLSet">취소</a>
				<br>
				<label>DISCRIPTION</label>
				<form:textarea path="CHECKLIST_DISCRIPTION" cols="100" rows="3"
				placeholder="${map.selCkList.CHECKLIST_DISCRIPTION}"/>
			</div>
		</form:form>
	</c:if>
	<br>
	<br>
	<div>
		<label>KIND</label>
		<input id = "aaki" type = "radio" name="auditKindId" value="ALL" checked="checked"
			onclick="location.href='./CLSet'"/>
		<label for = "aaki">ALL</label>
		<input id = "new" type = "radio" name="auditKindId" value="NE" />
		<label for = "new">NEW</label>
		<input id = "regular" type = "radio" name="auditKindId" value="RE" />
		<label for = "regular">REGULAR</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>VALID</label>
		<input id = "alv" type = "radio" name="cklValid" value="A" checked="checked"/>
		<label for = "alv">ALL</label>
		<input id = "valid" type = "radio" name="cklValid" value="Y" />
		<label for = "valid">VALID</label>
		<input id = "invalid" type = "radio" name="cklValid" value="N" />
		<label for = "invalid">INVALID</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label id = "keyword">DISCRIPTION</label>
		<input id = "keyword" type="text" name = "keyword" value="${map.keyword}" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="조회">
		<br>
	</div>
	
	<br>
	<br>
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
				</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="c" items="${map.allckList}">
				<tr>
					<td>
						<div align="center">
							${c.AUDIT_KIND}
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
						<div align="center">
	    					<a href="./CLSet?state=1&ckId=${c.CHECKLIST_ID}">수정</a>
	    				</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>