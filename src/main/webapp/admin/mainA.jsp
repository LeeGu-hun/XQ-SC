<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<style>
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<title></title>
</head>
<body>
<%@ include file="/include/headerA.jsp"%><br>
<a href="./logout">로그아웃</a>	
<a href="./ChangedPwd">비번변경</a>	
<li><a href="./AuditManage">평가관리</a></li>
</body>
</html>