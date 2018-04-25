package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import bean.LoginCommand;
import bean.NcrBean;
import service.AuditService;
import service.NcrService;
import service.VendorService;
import spring.AuthInfo;

@Controller
public class MainController {
	
	private AuditService auditService;

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	private VendorService vendorService;

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}

	
	private NcrService ncrService;

	public void setNcrService(NcrService ncrService) {this.ncrService = ncrService;	}
	
	
	@RequestMapping("/")
	public String root(LoginCommand loginCommand,
			@CookieValue(value="REMEMBER",
			required=false) Cookie rCookie) {
		if(rCookie != null) {
			loginCommand.setId(rCookie.getValue());
			loginCommand.setRememberid(true);
		}
		return "login/login";
	}
	
	@RequestMapping("/main")
	public String home(Model model) {		
	
		int vendorcnts = vendorService.registerCount();		
		System.out.println(vendorcnts);
		int auditPlanCnts = ncrService.auditPlanCnts();
		int auditRinputCnts = ncrService.auditRinputCnts();
		int ncrCnts = ncrService.ncrCnts();
		List<NcrBean> ncrImcompList = null;
		try {
			ncrImcompList = ncrService.ncrImcompList();
		} catch (Exception e) {	e.printStackTrace();}
		
		model.addAttribute("ncrImcompList", ncrImcompList);		
		model.addAttribute("vendorcnts", vendorcnts);
		model.addAttribute("auditPlanCnts", auditPlanCnts);
		model.addAttribute("auditRinputCnts", auditRinputCnts);
		model.addAttribute("ncrCnts", ncrCnts);
		
				
		return "main";
			 
	}
	
	
}
