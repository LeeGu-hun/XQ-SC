package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import bean.AuditBean;

import oracle.net.aso.a;
import service.AuditService;

@SessionAttributes("countInfo")
@Controller
public class AuditController {

	private AuditService auditService;


	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	// 평가계획 - 총 건수
	@RequestMapping(value = "/AuditManage", method = RequestMethod.GET)
	public String auditManageGet(Model model, AuditBean auditBean) {
		List<AuditBean> listBean = auditService.auditList();
		model.addAttribute("listBean", listBean);

		int auditCount = auditService.auditCount();
		int auditCountConfirm = auditService.auditCountConfirm();
		int auditCountNotYet = auditService.auditCountNotYet();
		model.addAttribute("auditCount", auditCount);
		model.addAttribute("auditCountConfirm", auditCountConfirm);
		model.addAttribute("auditCountNotYet", auditCountNotYet);	

		return "audit/auditManage";
	}

	@RequestMapping(value = "/AuditManage", method = RequestMethod.POST)
	public String auditManagePost(Model model, AuditBean auditBean) {
		List<AuditBean> auditBeans = auditService.auditList();

		int auditCount = auditService.auditCount();
		int auditCountNotYet = auditService.auditCountNotYet();
		int auditCountConfirm = auditService.auditCountConfirm();

		model.addAttribute("auditBeans", auditBeans);
		model.addAttribute("auditCount", auditCount);
		model.addAttribute("auditCountNotYet", auditCountNotYet);
		model.addAttribute("auditCountConfirm", auditCountConfirm);

		return "audit/auditManage";
	}


	// 평가결과입력
	@RequestMapping(value = "/AuditReport", method = RequestMethod.GET)
	public String auditReportGet(Model model, AuditBean auditBean) {
		List<AuditBean> auditBeans = auditService.auditListResult();
		List<AuditBean> selCate = auditService.selCate();

		model.addAttribute("auditBeans",auditBeans);
		model.addAttribute("selCate",selCate);
		return "audit/auditReport";
	}

	@RequestMapping(value = "/AuditReport", method = RequestMethod.POST)
	public String auditReportPost(Model model, AuditBean auditBean) {
		
		
		return "audit/auditReport";
	}

	// 평가현황
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(AuditBean auditBean) {
		return "audit/auditResult";
	}

	@RequestMapping(value = "/AuditResult", method = RequestMethod.POST)
	public String auditResultPost(Model model, AuditBean auditBean) {
		
		return "audit/auditResult";
	}
	
	@RequestMapping(value = "/AuditReport")
	public String selCate(Model model, AuditBean auditBean) {
		List<AuditBean> selCate = auditService.selCate();
		model.addAttribute("selCate",selCate);
		System.out.println("컨트롤러!!!"+selCate);
		
		return "audit/auditResult";
	}
	


}
