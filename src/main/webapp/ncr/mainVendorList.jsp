<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
				<tr align="center" valign="middle">
					<td>
						<div>회사ID</div>
					</td>
					<td>
						<div>회사명</div>
					</td>
					<td>
						<div>품목</div>
					</td>
					<td>
						<div>영업담당자이름</div>
					</td>
					<td>
						<div>영업담당자연락처</div>
					</td>
					
				</tr>

				<c:forEach var="li" items="${list}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td>${li.VENDOR_ID}</td>
						<input type="hidden" id="VENDOR_ID" name="VENDOR_ID" value="${li.VENDOR_ID}"/ >
						<td>${li.VENDOR_NAME}</td>
						<input type="hidden" id="VENDOR_NAME" name="VENDOR_NAME" value="${li.VENDOR_NAME}"/ >
						<td>${li.PRODUCT_NAME}</td>
						<td>${li.VENDOR_S_NAME}</td>
						<input type="hidden" id="VENDOR_S_NAME" name="VENDOR_S_NAME" value="${li.VENDOR_S_NAME}"/ >
						<td>${li.VENDOR_S_TEL}</td>
						<input type="hidden" id="VENDOR_S_TEL" name="VENDOR_S_TEL" value="${li.VENDOR_S_TEL}"/ >
						<input type="hidden" id="VENDOR_S_EMAIL" name="VENDOR_S_EMAIL" value="${li.VENDOR_S_EMAIL}"/ >
						
					</tr>

				</c:forEach>


			</table>
</body>
</html>