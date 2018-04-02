package controller;

import org.springframework.stereotype.Controller;

import service.AdminService;
@Controller
public class AdminController {
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	

}
