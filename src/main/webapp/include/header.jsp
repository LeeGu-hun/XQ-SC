<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style></style><script></script>
</head>
<body>
<div id='headerBox'>
			<ul>
				<li><a href='#'><span>Vendor 등록관리</span></a></li>
					<ul>
						<li class='has-sub'><a href='vendor/vendorRegister'>Vendor Register</a></li>
						<li class='has-sub'><a href='vendor/vendorStatus'>Vendor Status</a></li>
					</ul>	
				<li class='active has-sub'><a href='#'><span>평가관리</span></a>
					<ul>
						<li class='has-sub'><a href='./AuditManage'>평가계획</a></li>
						<li class='has-sub'><a href='./AuditReport'>평가결과입력</a></li>
						<li class='has-sub'><a href='./AuditResult'>평가현황</a></li>
					</ul>
				</li>
				<li><a href='#'><span>부적합관리</span></a>
					<ul>
						<li class='has-sub'><a href='ncr/ncrRegister'>NCR Register</a></li>
						<li class='has-sub'><a href='ncr/ncr'>NCR Management</a></li>
						<li class='has-sub'><a href='./AuditResult'>NCR Status</a></li>
					</ul>				
				</li>
				<li class='last'><a href='#'><span>시스템 관리</span></a></li>
			</ul>
		</div>
	
</body>
</html>

		
