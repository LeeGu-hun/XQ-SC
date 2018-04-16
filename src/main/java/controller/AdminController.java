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

import bean.AdminCkL;
import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanMember;
import bean.BeanProduct;
import bean.Paging;
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
		int auditPeriod = adminService.auditPeriod();
				
		Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("prodCount", prodCount);
	    map.put("cateCount", cateCount);
	    map.put("auditPeriod", auditPeriod);
	    model.addAttribute("cateList", cateList);
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
			adminService.prodInsert(product);
		}else if(state == 3){
			adminService.prodUpdate(product);
		}else {
			adminService.cateInsert(category);
		}
				
		return "redirect:/Setting";
	}
	
	
	@RequestMapping("Setting/CateUpdateForm")
	public String setCateUpdate(@ModelAttribute("cateCommand")BeanCategory category,
			HttpServletRequest request, Model model) {
		
		String cateId = request.getParameter("cateId").trim();
		if(cateId != null) {
			BeanCategory selCate = adminService.selCate(cateId);
			model.addAttribute("selCate", selCate);
		}
	    		
		return "admin/set_cateUp";
	}
	
	@RequestMapping("Setting/ProdUpdateForm")
	public String setProdUpdate(@ModelAttribute("prodCommand")BeanProduct product,
			HttpServletRequest request, Model model) {
		
		String prodId = request.getParameter("prodId").trim();
		if(prodId != null) {
			BeanProduct selProd = adminService.selProd(prodId);
			model.addAttribute("selProd", selProd);
		}
		
		List<BeanCategory> cateList = adminService.cateList();
		
	    model.addAttribute("cateList", cateList);

		return "admin/set_prodUp";
	}
	
	@RequestMapping("Setting/InsertCateForm")
	public String setInsertCateForm(@ModelAttribute("cateCommand")BeanCategory category) {
			
		return "admin/set_cateIn";
	}	
	
	@RequestMapping("Setting/InsertProdForm")
	public String setInsertProdForm(@ModelAttribute("prodCommand")BeanProduct product,
			Model model) {
			
		List<BeanCategory> cateList = adminService.cateList();
		
	    model.addAttribute("cateList", cateList);
	    
		return "admin/set_prodIn";
	}
	
	@RequestMapping("Setting/ProdCate")
	public String setProdCate(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id").trim();

		List<BeanProduct> prodList = null;
				
		if(id != null) {
			if(id.equals("cate")) {
				prodList = adminService.prodList();
			}else {				
				prodList = adminService.selProdCate(id);
			}
		}
		

	    model.addAttribute("prodList", prodList);
	    	    		
		return "admin/set_prodList";
	}
	
	//**************************************************************************
	
	@RequestMapping(value="MSet", method=RequestMethod.GET)
	public String msetGet(@ModelAttribute("MemberCommand")BeanMember member,
			@RequestParam(defaultValue="0") int state, 
			@RequestParam(defaultValue="") String mId,  Model model) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BeanMember> memberList = adminService.allMemberList();
		List<BeanMember> ingMemberList = adminService.ingMemberList();
		List<BeanMember> edMemberList = adminService.edMemberList();
		
	    map.put("memberList", memberList);
	    map.put("ingMemberList", ingMemberList);
	    map.put("edMemberList", edMemberList);
	    map.put("state", state);
		model.addAttribute("map", map);

		return "admin/mset";
	}
	@RequestMapping(value="MSet", method=RequestMethod.POST)
	public String msetPost(@RequestParam(defaultValue="0") int state, 
			@ModelAttribute("MemberCommand")BeanMember member, HttpServletRequest request) {
		
		if(state == 1) {
			adminService.updateMember(member);
		}else {
			if( member != null) {
				adminService.insertMember(member);
			}			
		}
		
		return "redirect:/MSet";
	}
	
	
	@RequestMapping("MSet/MUpdateForm")
	public String setMUpdateForm(@ModelAttribute("MemberCommand")BeanMember member,
			HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id").trim();
		if(id != null) {

			BeanMember selMember = adminService.selMember(id);
			
			model.addAttribute("selMember", selMember);
		}
		
		return "admin/m_Up";
	}
	

	@RequestMapping("MSet/MInsertForm")
	public String setMInsertForm(@ModelAttribute("MemberCommand")BeanMember member,
			Model model) {
				    
		return "admin/m_In";
	}
	
	
	
	//***************************************************************************
	
	@RequestMapping(value="CLSet", method=RequestMethod.GET)
	public String clsetGet(@ModelAttribute("CkLCommand")BeanChecklist ckList,
			@RequestParam(defaultValue="ALL") String auditKindId,
			@RequestParam(defaultValue="A") String cklValid,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue="1") int curPage,
			Model model) {
		
		
		AdminCkL ackl = new AdminCkL(0, 0, auditKindId, cklValid, keyword);
	    int listCnt = adminService.countCkL(ackl);
	    
	    Paging paging = new Paging();
	    paging.setPageNo(curPage);
	    paging.setPageSize(10);
	    paging.setTotalCount(listCnt);
	    int start = paging.getPageBegin();
	    int end = paging.getPageEnd();
	    
	    ackl.setStart(start);
	    ackl.setEnd(end);
				
		Map<String, Object> map = new HashMap<String, Object>();

		List<BeanChecklist> allckList = adminService.allCKList();
		List<BeanChecklist> getCkList = adminService.getCkList(ackl);
		
	    map.put("allckList", allckList);
	    map.put("getCkList", getCkList);
	    map.put("listCnt", listCnt);
	    map.put("auditKindId", auditKindId);
	    map.put("cklValid", cklValid);
	    map.put("keyword", keyword);
	    model.addAttribute("paging", paging);
		model.addAttribute("map", map);

		return "admin/clset";
	}
	
	@RequestMapping(value="CLSet", method=RequestMethod.POST)
	public String clsetPost(@RequestParam(defaultValue="0") int state, 
			@ModelAttribute("CkLCommand")BeanChecklist ckList) {

		if(state == 1) {
			adminService.updateCkList(ckList);
		}else {
			if( ckList != null) {
				adminService.insertCkList(ckList);;
			}	
		}
		
		return "redirect:/CLSet";
	}
	
	@RequestMapping("CLSet/CkLUpdateForm")
	public String setCkLUpdateForm(@ModelAttribute("CkLCommand")BeanChecklist checklist,
			HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id").trim();
		if(id != null) {
			BeanChecklist selCkList = adminService.selCkList(id);
			
			model.addAttribute("selCkList", selCkList);
		}
		
		return "admin/ckl_Up";
	}
	

	@RequestMapping("CLSet/CkLInsertForm")
	public String setCkLInsertForm(@ModelAttribute("CkLCommand")BeanChecklist checklist,
			Model model) {
				    
		return "admin/ckl_In";
	}
	
}
