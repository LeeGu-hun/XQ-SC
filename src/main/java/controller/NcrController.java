package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bean.BeanIssuer;
import bean.BeanVendor;
import bean.NcrAuditListCommand;
import bean.NcrBean;
import bean.NcrIssueCommand;
import bean.NcrSearchCommand;
import service.NcrService;
import spring.AuthInfo;

@Controller
public class NcrController {
	private NcrService ncrService;

	public void setNcrService(NcrService ncrService) {
		this.ncrService = ncrService;
		
	}
	
	@RequestMapping("ncr/searchAuditPopup")
	public String searchAuditPopup() {
		
		return "ncr/searchAudit";	}
	
	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.GET)
	public String searchAuditget(Model model) {
		return "ncr/searchAudit";
	}
	
	
	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.POST)
	public String searchAudit(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue="") String vendorName,
            @RequestParam(defaultValue="") String dateFrom,
            @RequestParam(defaultValue="") String dateTo ){
		
		List<NcrAuditListCommand> auditList =null;
		
		try {						
			auditList= ncrService.getAuditList(vendorName,dateFrom,dateTo);			
		} catch (Exception e) {e.printStackTrace();}
		
		model.addAttribute("auditList",auditList);
		request.setAttribute("auditList", auditList);
				
		return "ncr/ncrAuditList";
	}
	
	@RequestMapping(value = "ncr/ncrIssue", method = RequestMethod.POST)
	public String issue(NcrIssueCommand nic , HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mhsq) 
			throws IllegalStateException,IOException {
		System.out.println("nic는"+nic.getAudit_id());
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		NcrBean nb = new NcrBean();
		nb.setAudit_id(nic.getAudit_id());
		nb.setIssuer_id(authInfo.getId());
		nb.setNcr_title(nic.getNcr_title());
		nb.setNcr_description(nic.getNcr_description());
		nb.setNcr_grade_id(nic.getNcr_grade_id());
		
		ncrService.issueNcr(nb);		
				
		       
         // 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("ncr_file");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();
                 
                String saveFileName = genId + "." + originalfileName;
                // 저장되는 파일 이름
                String root_path = request.getSession().getServletContext().getRealPath("/");
        		String attach_path = "upload/";
        		String savePath = root_path + attach_path + saveFileName;        		
        		System.out.println(savePath);
                long fileSize = mf.get(i).getSize(); // 파일 사이즈
 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
 
                ncrService.ncrFileUpload(originalfileName, saveFileName, fileSize);
               
            }
        }
        
        
		return "redirect:./ncrRegister";
	}
	
		
	@RequestMapping(value = "ncr/ncrRegister", method = RequestMethod.GET)
		public String ncrRegister(HttpSession session ,Model model) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id",loginId);
		model.addAttribute("issuer_name",loginName);
		return"ncr/ncrRegister";
	}
	
	@RequestMapping(value = "ncr/ncrManagement", method = RequestMethod.GET)
		public String ncrManagementGet(HttpSession session) {
		
		return"ncr/ncrManagement";
		}
	
	@RequestMapping(value = "ncr/ncrSearch", method = RequestMethod.POST)
	public String ncrSearch(NcrSearchCommand nsc , Model model) {
		
			List<NcrBean> ncrList =null;			
		
		try {						
			ncrList= ncrService.getNcrList(nsc);			
		} catch (Exception e) {e.printStackTrace();}
		
		
		model.addAttribute("ncrList",ncrList);		
		
		System.out.println("ncrList"+ncrList);
	return"ncr/ncrList";
	}
	
	
	@RequestMapping(value = "ncr/searchVendorId", method = RequestMethod.POST)
	public String searchVendor(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue="") String vendor_name) {
    		List<BeanVendor> vendorList =null;
		
		try {						
			vendorList= ncrService.getVendorList(vendor_name);			
		} catch (Exception e) {e.printStackTrace();}
		
		model.addAttribute("vendorList",vendorList);
				
		return "ncr/ncrVendorList";
	}
	
	@RequestMapping(value = "ncr/searchVendorId", method = RequestMethod.GET)
	public String searchVendorget(Model model) {
		return "ncr/ncrManagement";
	}
	
	
	@RequestMapping(value = "ncr/searchIssuerId", method = RequestMethod.POST)
	public String searchIssuer(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue="") String issuer_name) {
    		List<BeanIssuer> issuerList =null;
		
		try {						
			issuerList= ncrService.getIssuerList(issuer_name);			
		} catch (Exception e) {e.printStackTrace();}
		model.addAttribute("issuerList",issuerList);
		System.out.println(issuerList.size());
		return "ncr/ncrIssuerList";
	}
	
	@RequestMapping(value = "ncr/searchIssuerId", method = RequestMethod.GET)
	public String searchIssuerget(Model model) {
		return "ncr/ncrManagement";
	}
	
	@RequestMapping(value = "ncr/ncrDetail", method = RequestMethod.POST)
	public String ncrDetailPost(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue="") String ncr_id) {
    		List<NcrBean> ncrBean =null;
		
		try {						
			ncrBean= ncrService.getNcrDetail(ncr_id);			
		} catch (Exception e) {e.printStackTrace();}
		model.addAttribute("ncrBean",ncrBean);
		System.out.println(ncrBean.size());
		return "ncr/ncrDetail";
	}
	
	@RequestMapping(value = "ncr/ncrDetail", method = RequestMethod.GET)
	public String ncrDetailget(Model model) {
		return "ncr/ncrManagement";
	}
}
