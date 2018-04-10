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
import org.springframework.web.bind.annotation.SessionAttributes;

import bean.AuditBean;
import bean.AuditProd;
import bean.BeanCategory;
import bean.BeanProduct;
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
	public String auditReportPost(
			Model model, AuditBean auditBean, 
			AuditProd auditProd, HttpServletRequest request) {
		List<AuditBean> auditBeans = auditService.auditListReport();
		model.addAttribute("auditBeans", auditBeans);
		List<BeanCategory> cateList = auditService.cateList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);
		return "audit/auditReport";
	}
	
	//평가 결과 insert 
	@RequestMapping(value = "/audit/auditInsert", method = RequestMethod.GET)
	public String auditInsert(Model model, AuditBean auditBean, HttpServletRequest request) {
		String AUDIT_ID = request.getParameter("AUDIT_ID");
		List<AuditBean> selectID = auditService.auditSelectId(AUDIT_ID);
		model.addAttribute("selectID",selectID);
		
		System.out.println(">>>"+selectID);
		
		return "audit/auditInsert";
	}
	

	// 평가현황
	@RequestMapping(value = "/AuditResult", method = RequestMethod.GET)
	public String auditResultGet(
			Model model, AuditBean auditBean, 
			HttpServletRequest request) {
		List<AuditBean> auditBeans = auditService.auditResult();
		model.addAttribute("auditBeans", auditBeans);
		
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

	// 물품 리스트
	@RequestMapping("audit/prodList")
	public String prodList(
					HttpServletRequest request, 
					Model model) {
		String selCate = request.getParameter("selCate");
		List<BeanProduct> prodList = auditService.prodList(selCate);
		model.addAttribute("prodList", prodList);
		return "audit/auditResult2";
	}


	
}
