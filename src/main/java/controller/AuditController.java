package controller;

import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.fabric.xmlrpc.base.Array;

import bean.AdminCkL;
import bean.AdminMem;
import bean.AuditBean;
import bean.AuditCommand;
import bean.AuditKind;
import bean.AuditNcrBean;
import bean.AuditResultSearch;
import bean.AuditScoreCommand;
import bean.AuditSubmitBean;
import bean.AuditVendorInfo;
import bean.BeanCategory;
import bean.BeanIssuer;
import bean.BeanMember;
import bean.BeanProduct;
import bean.BeanVendor;
import bean.CheckListBean;
import bean.DateCommand;
import bean.LoginCommand;
import bean.LoginCommandValidator;
import bean.NcrBean;
import bean.NcrSearchCommand;
import bean.Paging;
import oracle.net.aso.a;
import service.AuditService;
import spring.AuthInfo;
import spring.IdPasswordNotMatchingException;
import spring.InvalidMemberException;
import spring.MemberNotFoundException;

@SessionAttributes("countInfo")
@Controller
public class AuditController {

	private AuditService auditService;

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	// *********** audit Manage Page **************

	// plan date, auditor insert page
	@RequestMapping(value = "/AuditManage", method = RequestMethod.GET)
	public String auditManageGet(Model model, AuditBean auditBean, HttpServletRequest request) {
		List<AuditBean> listBean = auditService.auditList();
		model.addAttribute("listBean", listBean);

		// audit count
		int allCount = auditService.allCount();
		model.addAttribute("allCount", allCount);
		
		
		return "audit/auditManage";
		
	}

// plan date, auditor insert page
		@RequestMapping(value = "/AuditManage", method = RequestMethod.POST)
		public String auditManagePost(LoginCommand loginCommand,
				Errors errors, Model model, AuditCommand ac, HttpSession session,
				HttpServletResponse response) {
			AuditBean ab = new AuditBean();
			
			ab.setAUDITOR_ID(ac.getAUDITOR_ID());
			ab.setAUDIT_ID(ac.getAUDIT_ID());
			ab.setAUDIT_PLAN_DATE(ac.getAUDIT_PLAN_DATE());

			auditService.idInsert(ab);
			
			new LoginCommandValidator().validate(loginCommand, errors);
			if(errors.hasErrors())
				return "redirect:/AuditManage";
			return "redirect:/AuditManage";
		}
		
		
	
		public String form(LoginCommand loginCommand,
				Errors errors, HttpSession session,
				HttpServletResponse response) {
			new LoginCommandValidator().validate(loginCommand, errors);
			if(errors.hasErrors())
			return "login/login";
			return "redirect:/";
			
			
		}
		

	// search Auditor Id
	@RequestMapping(value = "audit/searchAuditorId", method = RequestMethod.POST)
	public String searchIssuer(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String auditor_name, @RequestParam String index) {

		List<AuditBean> auditorList = null;

		try {
			auditorList = auditService.getAuditorList(auditor_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("auditorList", auditorList);
		model.addAttribute("index", index);

		return "audit/auditorList";
	}
	
	@RequestMapping(value = "audit/searchAuditorId", method = RequestMethod.GET)
	public String searchIssuerget(Model model) {
		return "audit/auditorList";
	}

	// ****************** Report Page ******************//
	
	// Report page
	@RequestMapping(value = "/AuditReport", method = RequestMethod.GET)
	public String auditReportGet(Model model, 
			AuditBean auditBean, HttpServletRequest request, DateCommand dc) {
		return "audit/auditReport";
	}
	
	@RequestMapping(value = "/auditSearch")
	public String ncrSearch(HttpServletRequest request,  Model model, DateCommand dc) {
		List<AuditBean> auditBeans = auditService.auditListReport(dc);
		model.addAttribute("auditBeans",auditBeans);
		return "audit/checkList";
	}

	// report page : insert modal
	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.GET)
	public String auditInsert(Model model, AuditBean auditBean, HttpServletRequest request) {

		String vendorid = (String) request.getParameter("vendorid");
		String auditid = (String) request.getParameter("auditid");
		String auditType = (String) request.getParameter("auditType");

		request.setAttribute("vendorid", vendorid);
		request.setAttribute("auditid", auditid);
		request.setAttribute("auditType", auditType);

		List<CheckListBean> checkListNE = auditService.checkListNe();
		model.addAttribute("checkListNE", checkListNE);
		List<CheckListBean> checkListRE = auditService.checkListRe();
		model.addAttribute("checkListRE", checkListRE);
		List<AuditBean> getVendorName = auditService.auditVendorName(auditid);
		System.out.println(getVendorName);
		model.addAttribute("getVendorName", getVendorName);
		

		return "audit/auditInsert";
	}
	
	


	// report page : insert modal
	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.POST)
	public String auditInsertPost(HttpServletRequest request, 
			AuditScoreCommand ac, AuditSubmitBean sub) {
		AuditBean ab = new AuditBean();

		String total = (String) request.getParameter("total");
		String auditid = request.getParameter("auditid");
		request.setAttribute("total", total);
		request.setAttribute("auditid", auditid);
		request.setAttribute("auditType", request.getParameter("AUDIT_KIND_ID"));

		ab.setAUDIT_SCORE(Integer.parseInt(total));
		ab.setAUDIT_ID(ac.getAUDIT_ID());
		ab.setAUDIT_RSINPUT_DATE(ac.getAUDIT_RSINPUT_DATE());
		ab.setAUDIT_COMP_DATE(ac.getAUDIT_COMP_DATE());

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
		auditService.updateScore(ab);
		int cutline = auditService.cutLineScore();

		if (Integer.parseInt(total) >= cutline) {
			AuditBean bean = new AuditBean();
			bean.setVENDOR_ID(ac.getVENDOR_ID());
			auditService.nextPlanUpdate(bean);
			BeanVendor beanVendor = new BeanVendor();
			beanVendor.setAUDIT_ID(ac.getAUDIT_ID());
			beanVendor.setVENDOR_ID(ac.getVENDOR_ID());
			auditService.regulerVendorRegister(beanVendor);
		} else {
			AuditBean bean = new AuditBean();
			bean.setVENDOR_ID(ac.getVENDOR_ID());
			auditService.auditFalse(bean);
			AuditResultSearch rs = new AuditResultSearch();
			rs.setAUDIT_ID(sub.getAUDIT_ID());
			auditService.resultFalse(rs);
		}
		return "redirect:/AuditReport";
	}

	// Result Page : get
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(Model model, 
			HttpServletRequest request, 
			DateCommand dateCommand) {

		
		return "audit/auditResult";
	}

	


	// result page :post
	@RequestMapping(value = "/audit/resultSearch")
	public String auditResultPost(Model model, DateCommand dateCommand) {
		
		if (dateCommand.getPlandate().equals("all")) {
			List<AuditBean> arsList = auditService.getAll(dateCommand);
			model.addAttribute("arsList", arsList);
		} else if (dateCommand.getPlandate().equals("incomplete")) {
			List<AuditBean> arsList = auditService.incomplete(dateCommand);
			model.addAttribute("arsList", arsList);
		} else if (dateCommand.getPlandate().equals("passed")) {
			List<AuditBean> arsList = auditService.getPassed(dateCommand);
			model.addAttribute("arsList", arsList);
		} else if (dateCommand.getPlandate().equals("notPassed")) {
			List<AuditBean> arsList = auditService.getNotPassed(dateCommand);
			model.addAttribute("arsList", arsList);
		} else if (dateCommand.getPlandate().equals("notPlanVendor")) {
			List<AuditBean> arsList = auditService.notPlanVendor(dateCommand);
			model.addAttribute("arsList", arsList);
		}
		
		return "audit/auditResultAjax";
	}

	// result page : modal
	@RequestMapping(value = "/audit/auditVendorResult", method = RequestMethod.GET)
	public String auditResultView(
			Model model, 
			HttpServletRequest request, 
			AuditScoreCommand ac) {

		
		String id = (String) request.getParameter("id");
		String vendorid = (String) request.getParameter("vendorid");
		String type = (String) request.getParameter("type");
		String auditor = (String) request.getParameter("auditor");
		String auditorId = (String) request.getParameter("auditorId");
		String result = (String) request.getParameter("result");
		String score = (String) request.getParameter("score");

	
		request.setAttribute("id", id);
		request.setAttribute("type", type);
		request.setAttribute("vendorid", vendorid);
		request.setAttribute("auditor", auditor);
		request.setAttribute("auditorId", auditorId);
		request.setAttribute("result", result);
		request.setAttribute("score", score);

		List<AuditBean> date = auditService.getDate(id);
		List<CheckListBean> checkResult = auditService.getEachCheckScore(id);
		int ncrCount = auditService.ncrCount(id);
		int ncrCountComp = auditService.ncrCountComp(id);
		List<AuditBean> getVendorName = auditService.auditVendorName(id);
		
		
		model.addAttribute("date", date);
		model.addAttribute("checkResult", checkResult);
		model.addAttribute("ncrCount",ncrCount);
		model.addAttribute("ncrCountComp",ncrCountComp);
		model.addAttribute("getVendorName",getVendorName);

		return "audit/auditVendorResult";
	}

	@RequestMapping(value = "audit/auditVendorResult", method = RequestMethod.POST)
	public String auditResultViewPost() {
		
		
		return "audit/auditVendorResult";
	}
	
	
//	@RequestMapping(value = "audit/auditPlan",method=RequestMethod.GET)
//	public String auditNcrVendor(Model model,HttpServletRequest request) {
//		String vendorid = (String) request.getParameter("vendorid");
//
//		request.setAttribute("vendorid", vendorid);
//		List<AuditVendorInfo> vendorInfo = auditService.vendorInfo(vendorid);
//		model.addAttribute("vendorInfo",vendorInfo);
//		return "audit/auditPlan";
//	}
//	
//	@RequestMapping(value = "audit/auditPlan",method=RequestMethod.POST)
//	public String auditNcrVendorPost() {
//		return "audit/auditPlanInsert";
//	}

}
