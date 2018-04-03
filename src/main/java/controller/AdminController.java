package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.BeanCategory;
import bean.BeanProduct;
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
		int prodCount = adminService.prodCount();
		
		if(!cateName.equals("")) {
			adminService.uploadCate(cateName, cateCount);
		}
		
		List<BeanCategory> cateList = adminService.cateList();
		List<BeanProduct> prodList = adminService.prodList();

	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("cateList", cateList); // list
	    map.put("prodList", prodList);
	    map.put("prodCount", prodCount);
		model.addAttribute("cateCount", cateCount);
	    model.addAttribute("map", map);
	//	model.addAttribute("cateList", cateList);
		
		return "admin/setting";
	}

}
