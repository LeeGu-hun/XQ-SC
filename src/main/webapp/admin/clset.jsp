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
		
	function insertForm() {
		$.ajax({
			type : "POST",
			url : "./CLSet/CkLInsertForm",
			success : ckLForm
		});
	}
	
	function updateForm(id) {
		$.ajax({
			type : "POST",
			url : "./CLSet/CkLUpdateForm",
			data : "id=" + id,
			success : ckLForm
		});				
	}
	
	function ckLForm(msg) {
		$("#ckLInUp").html(msg);
	}
	
	function ckLInsert() {
		var inds = document.getElementById('inDiscription'); 
		
		if(inds.value == ""){
			document.getElementById('ckDs').textContent= '내용을 입력해주세요';
			inds.focus();
			return;
		}
		document.getElementById('cif').submit();
	}
	
	function ckLUpdate() {
		var upds = document.getElementById('upDiscription');
		
		if(upds.value == ""){
			document.getElementById('ckDs').textContent= '내용을 입력해주세요';
			upds.focus();
			return;
		}
		document.getElementById('cuf').submit();
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
	<span id="ckLInUp">
		<%@include file="/admin/ckl_In.jsp" %>
	</span>	
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
							<a href="javascript:updateForm('${c.CHECKLIST_ID}')">수정</a>
	    				</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>