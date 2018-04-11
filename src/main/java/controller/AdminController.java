package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
/////////********************************************************
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping(value="Setting", method=RequestMethod.GET)
	public String settingGet(@ModelAttribute("cateCommand")BeanCategory category,
			@RequestParam(defaultValue="cate") String selCate,
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
	public String settingPost(@ModelAttribute("cateCommand")BeanCategory category,
			@RequestParam(defaultValue="cate") String selCate,
            @RequestParam(defaultValue="") String cateName,
            @RequestParam(defaultValue="") String prodName,
            @RequestParam(defaultValue="1") int curPage,
			Model model) {
		
		int cateCount = adminService.cateCount();
		int prodCount = adminService.prodCount();
		
		System.out.println(category.getCATEGORY_NAME());
		System.out.println(category.getCATEGORY_VALID());
		
		if(category != null) {
			adminService.insertCate(category);
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
	
	
	@RequestMapping("Setting/Update")
	public String setUpdate(HttpServletRequest request,
			Model model) {
		
		String cateId = request.getParameter("cateId");
		if(cateId != null) {
			BeanCategory selCate = adminService.selCate(cateId);
			model.addAttribute("selCate", selCate);
		}
	    		
		return "admin/set_cateUp";
	}
	
	
	
	//**************************************************************************
	
	@RequestMapping(value="MSet", method=RequestMethod.GET)
	public String msetGet(@ModelAttribute("MemberCommand")BeanMember member,
			@RequestParam(defaultValue="0") int state, 
			@RequestParam(defaultValue="") String mId,  Model model) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(state==1) {
			BeanMember selMember = adminService.selMember(mId);
			map.put("selMember", selMember);
		}

		List<BeanMember> memberList = adminService.allMemberList();
		
	    map.put("memberList", memberList);
	    map.put("state", state);
		model.addAttribute("map", map);

		return "admin/mset";
	}
	@RequestMapping(value="MSet", method=RequestMethod.POST)
	public String msetPost(@RequestParam(defaultValue="0") int state, 
			@ModelAttribute("MemberCommand")BeanMember member) {

		if(state == 1) {
			adminService.updateMember(member);
		}else {
			if( member != null) {
				adminService.insertMember(member);
			}			
		}
		
		return "redirect:/MSet";
	}
	
	//***************************************************************************
	
	@RequestMapping(value="CLSet", method=RequestMethod.GET)
	public String clsetGet(@ModelAttribute("uploadCkList")BeanChecklist ckList,
			@RequestParam(defaultValue="0") int state, 
			@RequestParam(defaultValue="") String ckId, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		if(state==1) {
			BeanChecklist selCkList = adminService.selCkList(ckId);
			map.put("selCkList", selCkList);
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
