<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css?ver=1.3">
        <!-- Font Awesome -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	
        <!-- Header -->
        <div class="header-wrap d-none d-md-block">
            <div class="container">
                <div class="row">
                    
                    <!-- Left header box -->
                    <header class="col-6 text-left">
                        <h1>XQ-SC</h1>
                    </header>
                    
                </div>
            </div>
        </div>
        
        <!-- Main navigation -->
        <nav class="navbar navbar-expand-md navbar-dark bg-primary">
            <div class="container">
                
                           <!-- Main navigation items -->
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                                <a class="nav-link" href="index.html">Home</a>
                        </li>

                        <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown"   href="#" role="button" aria-haspopup="true" aria-expanded="false">Vendor 등록관리</a>
                                    <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href='vendor/vendorRegister'>Vendor Register</a>
                                          <a class="dropdown-item" href='vendor/vendorStatus'>Vendor Status</a>
                                    </div>
                        </li>


                          <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">평가관리</a>
                                    <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href='./AuditManage'>평가계획</a>
                                          <a class="dropdown-item" href='./AuditReport'>평가결과입력</a>
                                           <a class="dropdown-item" href='./AuditResult'>평가현황</a>
                                    </div>
                        </li>

                          <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">부적합관리</a>
                                    <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href='ncr/ncrRegister'>NCR Register</a>
                                          <a class="dropdown-item" href='ncr/ncrManagement'>NCR Management</a>
                                           <a class="dropdown-item" href='ncr/ncrStatus'>NCR Status</a>
                                    </div>
                        </li>

                        
                          <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">시스템관리</a>
                                    <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item " href='./Setting'>System Configuration</a>
                                          <a class="dropdown-item" href='./MSet'>Member Management</a>
                                           <a class="dropdown-item" href='./CLSet'>Checklist Management</a>
                                    </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


</body>
</html>


