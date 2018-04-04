package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="Setting", method=RequestMethod.GET)
	public String settingGet(@RequestParam(defaultValue="cate") String selCate,
            @RequestParam(defaultValue="") String cateName,
            @RequestParam(defaultValue="") String prodName,
            @RequestParam(defaultValue="1") int curPage,
			Model model) {
		
		List<BeanProduct> prodList = adminService.prodList();

		if(!selCate.equals("cate")) {
			prodList = adminService.selCateList(selCate);		
		}
				
		int cateCount = adminService.cateCount();
		int prodCount = adminService.prodCount();
				
		List<BeanCategory> cateList = adminService.cateList();

	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("cateList", cateList); // list
	    map.put("prodList", prodList);
	    map.put("prodCount", prodCount);
		model.addAttribute("cateCount", cateCount);
	    model.addAttribute("map", map);
	    		
		return "admin/setting";
	}
	
	@RequestMapping(value="Setting", method=RequestMethod.POST)
	public String settingPost(@RequestParam(defaultValue="cate") String selCate,
            @RequestParam(defaultValue="") String cateName,
            @RequestParam(defaultValue="") String prodName,
            @RequestParam(defaultValue="1") int curPage,
			Model model) {
		
		int cateCount = adminService.cateCount();
		int prodCount = adminService.prodCount();
		
		if(!cateName.equals("")) {
			adminService.uploadCate(cateName, cateCount);
		}
		
		if(!selCate.equals("cate")) {
			System.out.println("ddd");
		}
		System.out.println("post");

		return "redirect:/Setting";
	}
}
