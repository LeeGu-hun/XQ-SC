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

		auditService.idInsert(ab);
		return "redirect:/AuditManage";
	}

	// search Auditor Id
	@RequestMapping(value = "audit/searchAuditorId", method = RequestMethod.POST)
	public String searchIssuer(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String auditor_name, @RequestParam String index) {

		List<BeanMember> auditorList = null;

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

	// Report page
	@RequestMapping(value = "/AuditReport", method = RequestMethod.GET)
	public String auditReportGet(Model model, AuditBean auditBean, HttpServletRequest request, DateCommand dc) {
		List<AuditBean> auditBeans = auditService.auditListReport(dc);
		request.setAttribute("auditBeans", auditBeans);

		return "audit/auditReport";
	}

	@RequestMapping(value = "/AuditReport", method = RequestMethod.POST)
	public String auditReportPost(Model model, AuditBean auditBean, HttpServletRequest request, DateCommand dc) {
		List<AuditBean> auditBeans = auditService.auditListReport(dc);
		request.setAttribute("auditBeans", auditBeans);

		return "audit/auditReport";
	}

	// insert modal
	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.GET)
	public String auditInsert(Model model, AuditBean auditBean, HttpServletRequest request) {

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

		if (Integer.parseInt(total) >= 80) {
			AuditBean bean = new AuditBean();
			bean.setVENDOR_ID(ac.getVENDOR_ID());
			auditService.nextPlanUpdate(bean);
		} else {
			AuditBean bean = new AuditBean();
			bean.setVENDOR_ID(ac.getVENDOR_ID());
			auditService.auditFalse(bean);
		}
		return "redirect:/audit/auditInsert";
	}

	// Result
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(Model model, HttpServletRequest request, DateCommand dateCommand) {
		AuditResultSearch ars = new AuditResultSearch();
		List<AuditResultSearch> arsList = auditService.getByPlanDate(dateCommand);
		model.addAttribute("arsList", arsList);

		return "audit/auditResult";
	}

	@RequestMapping(value = "/AuditResult", method = RequestMethod.POST)
	public String auditResultPost(Model model, DateCommand dateCommand) {
		if (dateCommand.getPlandate().equals("score")) {
			List<AuditResultSearch> arsList = auditService.getByScoreDate(dateCommand);
			model.addAttribute("arsList", arsList);
		} else {
			List<AuditResultSearch> arsList = auditService.getByPlanDate(dateCommand);
			model.addAttribute("arsList", arsList);
		}

		return "audit/auditResult";
	}

	// result modal
	@RequestMapping(value = "/audit/auditVendorResult", method = RequestMethod.GET)
	public String auditResultView(Model model, HttpServletRequest request) {

		String vendorname = (String) request.getParameter("vendorname");
		String id = (String) request.getParameter("id");
		String vendorid = (String) request.getParameter("vendorid");
		String prod = (String) request.getParameter("prod");
		String date1 = (String) request.getParameter("date1");
		String type = (String) request.getParameter("type");
		String auditor = (String) request.getParameter("auditor");
		String auditorId = (String) request.getParameter("auditorId");
		String result = (String) request.getParameter("result");
		String score = (String) request.getParameter("score");

		request.setAttribute("vendorname", vendorname);
		request.setAttribute("id", id);
		request.setAttribute("type", type);
		request.setAttribute("vendorid", vendorid);
		request.setAttribute("prod", prod);
		request.setAttribute("date1", date1);
		request.setAttribute("auditor", auditor);
		request.setAttribute("auditorId", auditorId);
		request.setAttribute("result", result);
		request.setAttribute("score", score);

		List<CheckListBean> checkResult = auditService.getEachCheckScore(id);
		model.addAttribute("checkResult", checkResult);

		return "audit/auditVendorResult";
	}

	@RequestMapping(value = "audit/auditVendorResult", method = RequestMethod.POST)
	public String auditResultViewPost(Model model, HttpServletRequest request, AuditCommand ac) {
		return "audit/auditVendorResult";
	}

}
