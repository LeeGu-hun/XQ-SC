package controller;

import org.springframework.stereotype.Controller;

import service.AuditService;

@Controller
public class AuditController {
	
	private AuditService auditService;

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}
	
	
}
