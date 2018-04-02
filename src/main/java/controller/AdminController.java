package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.BeanCategory;
import service.AdminService;
@Controller
public class AdminController {
	
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping("Setting")
	public String setting(@RequestParam(defaultValue="all") String searchOption,
            @RequestParam(defaultValue="") String cateName,
            @RequestParam(defaultValue="") String prodName,
            @RequestParam(defaultValue="1") int curPage,
			Model model) {
		
		int cateCount = adminService.cateCount();
		
		if(!cateName.equals("")) {
			adminService.uploadCate(cateName, cateCount);
		}
		
		List<BeanCategory> cateList = adminService.cateList();

		model.addAttribute("cateCount", cateCount-1);
		model.addAttribute("cateList", cateList);
		
		return "admin/setting";
	}

}
