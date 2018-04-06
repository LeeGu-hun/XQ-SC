package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bean.NcrAuditListCommand;
import service.NcrService;

@Controller
public class NcrController {
	private NcrService ncrService;

	public void setNcrService(NcrService ncrService) {
		this.ncrService = ncrService;
		
	}
	
	@RequestMapping("ncr/ncrRegister")
	public String ncrRegisterget() {
		return "ncr/ncrRegister";
	}
	
	
	@RequestMapping("ncr/searchAuditPopup")
	public String searchAuditPopup() {
		
		return "ncr/searchAudit";	}
	
	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.GET)
	public String searchAuditget(Model model) {
		return "ncr/searchAudit";
	}
	
	
	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.POST)
	public String searchAudit(Model model, HttpSession session,
			@RequestParam(defaultValue="") String vendorName,
            @RequestParam(defaultValue="") String dateFrom,
            @RequestParam(defaultValue="") String dateTo) {
		
		List<NcrAuditListCommand> auditList =null;
		
		try {						
			auditList= ncrService.getAuditList(vendorName,dateFrom,dateTo);			
		} catch (Exception e) {e.printStackTrace();}
		
		model.addAttribute("auditList",auditList);
		
		return "ncr/searchAudit";
	}
	

}
