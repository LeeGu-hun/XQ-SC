package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bean.AuditBean;
import bean.AuditCommand;
import bean.AuditKind;
import bean.AuditProd;
import bean.AuditScoreCommand;
import bean.BeanCategory;
import bean.BeanMember;
import bean.BeanProduct;
import bean.CheckListBean;
import oracle.net.aso.a;
import service.AuditService;

@SessionAttributes("countInfo")
@Controller
public class AuditController {

	private AuditService auditService;

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	// - all list
	@RequestMapping(value = "/AuditManage", method = RequestMethod.GET)
	public String auditManageGet(Model model, AuditBean auditBean) {
		List<AuditBean> listBean = auditService.auditList();
		model.addAttribute("listBean", listBean);

		int allCount = auditService.allCount();
		int regularVencorCount = auditService.regularVencorCount();
		int newVendorCount = auditService.newVendorCount();
		int completeCount = auditService.completeCount();
		model.addAttribute("allCount", allCount);
		model.addAttribute("regularVencorCount", regularVencorCount);
		model.addAttribute("newVendorCount", newVendorCount);
		model.addAttribute("completeCount", completeCount);

		return "audit/auditManage";
	}

	@RequestMapping(value = "/AuditManage", method = RequestMethod.POST)
	public String auditManagePost(Model model, AuditBean auditBean) {
		List<AuditBean> auditBeans = auditService.auditList();
		return "audit/auditManage";
	}

	// complete list
	@RequestMapping("audit/auditConfirm")
	public String auditManageComfirm(Model model) {
		List<AuditBean> listBean = auditService.auditComplist();
		model.addAttribute("listBean", listBean);
		return "audit/auditConfirm";
	}

	// regular vendor list
	@RequestMapping("audit/regularVendorAudit")
	public String auditReVendor(Model model) {
		List<AuditBean> listBean = auditService.auditReVendor();
		model.addAttribute("listBean", listBean);
		return "audit/auditRegularVendor";
	}

	// new Vendor list
	@RequestMapping("audit/newVendorAudit")
	public String auditManageNotYet(Model model) {
		List<AuditBean> listBean = auditService.auditNewVendor();
		model.addAttribute("listBean", listBean);
		return "audit/auditNewVendor";

	}

	// audit Plan insert
	@RequestMapping(value = "/AuditPlanInsert", method = RequestMethod.GET)
	public String auditPlanInsert(Model model, AuditCommand ac, AuditBean auditBean) {
		return "audit/auditPlanInsert";
	}

	@RequestMapping(value = "/AuditPlanInsert", method = RequestMethod.POST)
	public String auditPlanInsertPost(AuditCommand ac, AuditBean auditBean) {
		AuditBean ab = new AuditBean();
		ab.setAUDIT_ID(ac.getAUDIT_ID());
		ab.setAUDIT_KIND_ID(ac.getAUDIT_KIND_ID());
		ab.setAUDITOR_ID(ac.getAUDITOR_ID());
		ab.setVENDOR_ID(ac.getVENDOR_ID());
		ab.setAUDIT_PLAN_DATE(ac.getAUDIT_PLAN_DATE());
		ab.setAUDIT_COMP_DATE(ac.getAUDIT_COMP_DATE());
		auditService.planInsert(ab);

		System.out.println(ab);

		return "audit/auditPlanInsert";
	}

	// Report page
	@RequestMapping(value = "/AuditReport", method = RequestMethod.GET)
	public String auditReportGet(Model model, AuditBean auditBean, AuditProd auditProd, HttpServletRequest request) {
		List<AuditBean> auditBeans = auditService.auditListReport();
		request.setAttribute("auditBeans", auditBeans);

		List<BeanCategory> cateList = auditService.cateList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);
		model.addAttribute("map", map);

		return "audit/auditReport";
	}

	@RequestMapping(value = "/AuditReport", method = RequestMethod.POST)
	public String auditReportPost(Model model, AuditBean auditBean, AuditProd auditProd, HttpServletRequest request) {
		List<AuditBean> auditBeans = auditService.auditListReport();
		request.setAttribute("auditBeans", auditBeans);

		List<BeanCategory> cateList = auditService.cateList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);
		model.addAttribute("map", map);

		return "audit/auditReport";
	}

	//  insert modal
	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.GET)
	public String auditInsert(Model model, AuditBean auditBean, HttpServletRequest request, AuditProd ap) {

		String vendorid = (String) request.getParameter("vendorid");
		String vendorname = (String) request.getParameter("vendorname");
		String date = (String) request.getParameter("date");
		String manager = (String) request.getParameter("manager");
		String category = (String) request.getParameter("category");
		String product = (String) request.getParameter("product");
		String auditid = (String) request.getParameter("auditid");
		String auditType = (String) request.getParameter("auditType");
		request.setAttribute("vendorid", vendorid);
		request.setAttribute("vendorname", vendorname);
		request.setAttribute("date", date);
		request.setAttribute("manager", manager);
		request.setAttribute("category", category);
		request.setAttribute("product", product);
		request.setAttribute("auditid", auditid);
		request.setAttribute("auditType", auditType);

		List<AuditKind> typeList = auditService.typeList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeList", typeList);
		model.addAttribute("map", map);
		System.out.println("ddddddd");
		return "audit/auditInsert";
	}

	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.POST)
	public String auditInsertPost(AuditScoreCommand ac) {

		AuditBean ab = new AuditBean();
		ab.setAUDIT_SCORE(ac.getAUDIT_SCORE());
		auditService.updateScore(ab);
		System.out.println("aaaaaaaaaaaaa");
		return "audit/auditInsert";
	}

	// Result 
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(Model model, AuditBean auditBean, HttpServletRequest request) {
		List<AuditBean> auditBeans = auditService.auditResult();
		model.addAttribute("auditBeans", auditBeans);

		// Cate list GEt 
		List<BeanCategory> cateList = auditService.cateList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);
		model.addAttribute("map", map);

		return "audit/auditResult";
	}

	@RequestMapping(value = "/AuditResult", method = RequestMethod.POST)
	public String auditResultPost(Model model, AuditBean auditBean) {
		return "audit/auditResult";
	}

	// Prod List 
	@RequestMapping("audit/prodList")
	public String prodList(HttpServletRequest request, Model model) {
		String selCate = request.getParameter("selCate");
		List<BeanProduct> prodList = auditService.prodList(selCate);
		model.addAttribute("prodList", prodList);
		return "audit/auditResult2";
	}

	@RequestMapping(value = "audit/check", method = RequestMethod.GET)
	public String checkList(HttpServletRequest request, Model model, AuditBean auditbean) {
		String typeList = request.getParameter("typeList");
		List<CheckListBean> checkList = auditService.checkList(typeList);
		model.addAttribute("checkList", checkList);
		return "audit/checkList";
	}

}
