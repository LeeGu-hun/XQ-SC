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
			@ModelAttribute("prodCommand")BeanProduct product,
			Model model) {
		
		List<BeanCategory> cateList = adminService.cateList();
		List<BeanProduct> prodList = adminService.prodList();

		int cateCount = adminService.cateCount();
		int prodCount = adminService.prodCount();
				
		Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("cateList", cateList);
	    map.put("prodCount", prodCount);
	    map.put("cateCount", cateCount);
		model.addAttribute("prodList", prodList);
	    model.addAttribute("map", map);
	    		
		return "admin/setting";
	}
	
	@RequestMapping(value="Setting", method=RequestMethod.POST)
	public String settingPost(@ModelAttribute("cateCommand")BeanCategory category,
			@ModelAttribute("prodCommand")BeanProduct product,
			@RequestParam(defaultValue="0") int state,
			Model model) {
				
		if(state == 1) {
			adminService.cateUpdate(category);
		}else if(state == 2){
			System.out.println("2");
		}else if(state == 3){
			System.out.println("3");
		}else {
			adminService.cateInsert(category);
		}
				
		return "redirect:/Setting";
	}
	
	
	@RequestMapping("Setting/CateUpdate")
	public String setCateUpdate(@ModelAttribute("cateCommand")BeanCategory category,
			HttpServletRequest request, Model model) {
		
		String cateId = request.getParameter("cateId").trim();
		if(cateId != null) {
			BeanCategory selCate = adminService.selCate(cateId);
			model.addAttribute("selCate", selCate);
		}
	    		
		return "admin/set_cateUp";
	}
	
	@RequestMapping("Setting/ProdUpdate")
	public String setProdUpdate(@ModelAttribute("prodCommand")BeanProduct product,
			HttpServletRequest request, Model model) {
		
		String prodId = request.getParameter("prodId").trim();
		if(prodId != null) {
			BeanProduct selProd = adminService.selProd(prodId);
			model.addAttribute("selProd", selProd);
		}
	    		
		return "admin/set_prodUp";
	}
	
	@RequestMapping("Setting/InsertCateForm")
	public String setInsertCateForm(@ModelAttribute("cateCommand")BeanCategory category) {
			
		return "admin/set_cateIn";
	}	
	
	@RequestMapping("Setting/InsertProdForm")
	public String setInsertProdForm(@ModelAttribute("prodCommand")BeanProduct product) {
			
		return "admin/set_prodIn";
	}
	
	@RequestMapping("Setting/ProdCate")
	public String setProdCate(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id").trim();
		List<BeanProduct> prodList = adminService.prodList();
		
		if(id != null) {
			if(id.equals("cate")) {
				
			}else {				
				prodList = adminService.selProdCate(id);
			}
			model.addAttribute("selProd", prodList);
		}
	    		
		return "admin/set_prodUp";
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
