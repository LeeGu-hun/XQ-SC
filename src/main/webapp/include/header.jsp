<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.3">

<script type="text/javascript"
	href="${pageContext.request.contextPath}/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
  $('a[href="#"]').on('click', function(e){
    e.preventDefault();
  });
  
  $('#menu > li').on('mouseover', function(e){
    $(this).find("ul:first").show();
    $(this).find('> a').addClass('active');
  }).on('mouseout', function(e){
    $(this).find("ul:first").hide();
    $(this).find('> a').removeClass('active');
  });
  
  $('#menu li li').on('mouseover',function(e){
    if($(this).has('ul').length) {
      $(this).parent().addClass('expanded');
    }
    $('ul:first',this).parent().find('> a').addClass('active');
    $('ul:first',this).show();
  }).on('mouseout',function(e){
    $(this).parent().removeClass('expanded');
    $('ul:first',this).parent().find('> a').removeClass('active');
    $('ul:first', this).hide();
  });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
<header class="site-header-wrap">
	<div class="site-logo"> 
	<a class="site-logo">XQ-SC</a>
	</div>
</header>
	<nav>
		<div class="wrapper">

			<ul id="menu" class="clearfix">
				<li><a href="index.html">Home</a></li>

				<li><a href="#">Vendor 등록관리</a>
					<ul>
						<li><a href='vendor/vendorRegister'>Vendor Register</a></li>
						<li><a href='vendor/vendorStatus'>Vendor Status</a></li>
					</ul>
				</li>

				<li><a href="#">평가관리</a>
					<ul>
						<li><a class="dropdown-item" href='./AuditManage'>평가계획</a></li> 
						<li><a href='./AuditReport'>평가결과입력</a></li> 
						<li><a href='./AuditResult'>평가현황</a></li>
					</ul>
				</li>

				<li><a href="#">부적합관리</a>
					<ul>
						<li><a href='ncr/ncrRegister'>NCR Register</a></li> 
						<li><a href='ncr/ncrManagement'>NCR Management</a></li>
						<li><a href='ncr/ncrStatus'>NCR Status</a></li>
					</ul>
				</li>

				<li><a href="#">시스템관리</a>
					<ul>
						<li><a href='./Setting'>System Configuration</a></li> 
						<li><a href='./MSet'>Member Management</a></li> 
						<li><a href='./CLSet'>Checklist Management</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

</body>
</html>


