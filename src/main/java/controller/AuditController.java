package controller;

import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.fabric.xmlrpc.base.Array;

import bean.AdminCkL;
import bean.AuditBean;
import bean.AuditCommand;
import bean.AuditKind;
import bean.AuditProd;
import bean.AuditResultSearch;
import bean.AuditScoreCommand;
import bean.AuditSubmitBean;
import bean.BeanCategory;
import bean.BeanIssuer;
import bean.BeanMember;
import bean.BeanProduct;
import bean.CheckListBean;
import bean.DateCommand;
import oracle.net.aso.a;
import service.AuditService;

@SessionAttributes("countInfo")
@Controller
public class AuditController {

	private AuditService auditService;

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	@RequestMapping(value = "/AuditManage", method = RequestMethod.GET)
	public String auditManageGet(Model model, AuditBean auditBean, HttpServletRequest request) {
		List<AuditBean> listBean = auditService.auditList();
		model.addAttribute("listBean", listBean);

		// audit count
		int allCount = auditService.allCount();
		model.addAttribute("allCount", allCount);
		return "audit/auditManage";
	}

	@RequestMapping(value = "/audit/auditManage", method = RequestMethod.POST)
	public String auditManagePost(Model model, AuditCommand ac, AuditBean auditBean) {
		List<AuditBean> auditBeans = auditService.auditList();
		AuditBean ab = new AuditBean();

		ab.setAUDIT_KIND_ID(ac.getAUDIT_KIND_ID());
		ab.setAUDITOR_ID(ac.getAUDITOR_ID());
		ab.setVENDOR_ID(ac.getVENDOR_ID());
		ab.setAUDIT_PLAN_DATE(ac.getAUDIT_PLAN_DATE());
		ab.setAUDIT_COMP_DATE(ac.getAUDIT_COMP_DATE());
		auditService.idInsert(ab);
		System.out.println(">>>>>>>>>>" + ab);
		return "redirect:/AuditManage";
	}

	// search Auditor Id
	@RequestMapping(value = "audit/searchAuditorId", method = RequestMethod.POST)
	public String searchAuditor(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String MEMBER_NAME) {

		List<BeanMember> auditorList = auditService.getAuditorList(MEMBER_NAME);
		model.addAttribute("auditorList", auditorList);
		System.out.println(auditorList.size());
		System.out.println(">>>>>>>>>>>>>>>" + auditorList);
		return "audit/auditorList";
	}

	@RequestMapping(value = "audit/searchAuditorId", method = RequestMethod.GET)
	public String sertchAuditorIdGet(Model model) {
		return "audit/auditManage";
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

	// insert modal
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

		if (auditType.equals("NE")) {
			List<CheckListBean> checkList = auditService.checkListNe();
			model.addAttribute("checkList", checkList);
		} else {
			List<CheckListBean> checkList = auditService.checkListRe();
			model.addAttribute("checkList", checkList);
		}
		return "audit/auditInsert";
	}

	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.POST)
	public String auditInsertPost(HttpServletRequest request, AuditScoreCommand ac) {
		AuditBean ab = new AuditBean();

		String total = (String) request.getParameter("total");
		request.setAttribute("total", total);

		ab.setAUDIT_SCORE(Integer.parseInt(total));
		ab.setAUDIT_ID(ac.getAUDIT_ID());
		ab.setAUDIT_RSINPUT_DATE(ac.getAUDIT_RSINPUT_DATE());
		auditService.updateScore(ab);

		String[] score = request.getParameterValues("score");
		String[] cId = request.getParameterValues("cId");
		String auditId = ac.getAUDIT_ID();

		for (int i = 0; i < score.length; i++) {
			AuditSubmitBean audit = new AuditSubmitBean();
			audit.setAUDIT_ID(ac.getAUDIT_ID());
			audit.setAUDIT_SCORE(Integer.parseInt(score[i]));
			audit.setCHECKLIST_ID(cId[i]);
			auditService.getCheckResult(audit);
		}
		return "audit/auditInsert";
	}

	// Result
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(
			
			Model model, AuditBean auditBean, 
			HttpServletRequest request,
			DateCommand dateCommand) {

		AuditResultSearch ars = new AuditResultSearch();

		
		List<AuditResultSearch> arsList = auditService.getByPlanDate(dateCommand);
		model.addAttribute("arsList", arsList);

		return "audit/auditResult";
	}

	@RequestMapping(value = "/AuditResult", method = RequestMethod.POST)
	public String auditResultPost(Model model, AuditBean auditBean,DateCommand dateCommand) {
		
		if (dateCommand.getPlandate().equals("score")) {
			List<AuditResultSearch> arsList = auditService.getByScoreDate(dateCommand);
			model.addAttribute("arsList", arsList);
		} else {
			List<AuditResultSearch> arsList = auditService.getByPlanDate(dateCommand);
			model.addAttribute("arsList", arsList);
		}
		
		System.out.println("......."+dateCommand.getPlandate());
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

	// result modal
	@RequestMapping(value = "audit/auditVendorResult", method = RequestMethod.GET)
	public String auditResultView(Model model, AuditBean auditBean, HttpServletRequest request, AuditProd ap) {

		String AUDIT_ID = request.getParameter("AUDIT_ID");
		System.out.println(">>>>>>>>" + AUDIT_ID);
		List<CheckListBean> checkResult = auditService.getEachCheckScore(AUDIT_ID);
		model.addAttribute("checkResult", checkResult);

		String vendorid = (String) request.getParameter("vendorid");
		String vendorname = (String) request.getParameter("vendorname");
		String date1 = (String) request.getParameter("date1");
		String date2 = (String) request.getParameter("date2");
		String manager = (String) request.getParameter("manager");
		String product = (String) request.getParameter("product");
		String auditid = (String) request.getParameter("auditid");
		String auditType = (String) request.getParameter("auditType");
		String score = (String) request.getParameter("score");

		request.setAttribute("vendorid", vendorid);
		request.setAttribute("vendorname", vendorname);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		request.setAttribute("manager", manager);
		request.setAttribute("product", product);
		request.setAttribute("auditid", auditid);
		request.setAttribute("auditType", auditType);
		request.setAttribute("score", score);

		return "audit/auditVendorResult";
	}
}
