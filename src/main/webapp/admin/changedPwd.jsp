<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHANGE PASSWORD</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.css"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.min.css"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2"></script>
</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<br>
	<div class="container" style="position: relative;   
    width: 60%;
    height: 800px;
    margin: 20px auto;">
	<br><br>
		<div class="col-lg-4" align="center" style=" position: absolute;   
		    width: 500px;
		    height: 500px;
		    top: 0;               
		    bottom: 0;            
		    left: 0;              
		    right: 0;             
		    margin: auto;">
	         <div class="panel panel-success">
	             <div class="panel-heading">
	                 ${sessionScope.authInfo.name }'S PASSWORD HAS BEEN CHANGED.
	             </div>
	             <div class="panel-body">
	             <c:if test="${sessionScope.authInfo.depart eq 'VENDOR' }">
	             	<a href="<c:url value='./ncrManagement_vendor'/>">GO MAIN</a>
	             </c:if>
	             <c:if test="${sessionScope.authInfo.depart ne 'VENDOR' }">
	             	
            		 <a href="<c:url value='main'/>">GO MAIN</a>
	             </c:if>
				 </div>
	             <div class="panel-footer">
	             </div>
	         </div>
	     </div>
	</div>
</body>
</html>