package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanMember;
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
	    map.put("selCate", selCate);
	    map.put("cateList", cateList);
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
			if(!prodName.equals("")) {
				adminService.uploadProduct(selCate, prodName, prodCount);
				System.out.println("upP");
			}
		}
		
		
		System.out.println("post");

		return "redirect:/Setting";
	}
	
	@RequestMapping(value="MSet", method=RequestMethod.GET)
	public String msetGet(@ModelAttribute("uploadMember")BeanMember member, Model model) {
		
		List<BeanMember> memberList = adminService.allMemberList();
		
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberList", memberList);
		model.addAttribute("map", map);

		return "admin/mset";
	}
	@RequestMapping(value="MSet", method=RequestMethod.POST)
	public String msetPost(@ModelAttribute("uploadMember")BeanMember member) {

		if( member != null) {
			adminService.uploadMember(member);
		}
		

		return "redirect:/MSet";
	}
	
	@RequestMapping(value="CLSet", method=RequestMethod.GET)
	public String clsetGet(@ModelAttribute("uploadCkList")BeanChecklist ckList,
			@RequestParam(defaultValue="0") int state, 
			@RequestParam(defaultValue="") String ckId, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		if(state==1) {
			BeanChecklist selCkList = adminService.selCkList(ckId);
			map.put("selCkList", selCkList);
		//	return "redirect:/CLSet?state=1&ckId="+ckId;
		}
		
		
		List<BeanChecklist> allckList = adminService.allCKList();
		
	    map.put("allckList", allckList);
	    map.put("state", state);
		model.addAttribute("map", map);

		return "admin/clset";
	}
	@RequestMapping(value="CLSet", method=RequestMethod.POST)
	public String clsetPost(@RequestParam(defaultValue="0") int state, 
			@ModelAttribute("uploadCkList")BeanChecklist ckList) {

		if(state == 1) {
			adminService.updateCkList(ckList);
		}else {
			if( ckList != null) {
				adminService.uploadCkList(ckList);;
			}	
		}
		
		return "redirect:/CLSet";
	}
	
	
}
