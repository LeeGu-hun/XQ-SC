package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.BeanIssuer;
import bean.BeanNcrAttach;
import bean.BeanReplyAttach;
import bean.BeanVendor;
import bean.NcrAuditListCommand;
import bean.NcrBean;
import bean.NcrIssueCommand;
import bean.NcrReplyBean;
import bean.NcrReplyCommand;
import bean.NcrSearchCommand;
import bean.NcrStatusBean;
import bean.NcrStatusCommand;
import service.NcrService;
import spring.AuthInfo;

@Controller
public class NcrController {
	private NcrService ncrService;

	public void setNcrService(NcrService ncrService) {this.ncrService = ncrService;	}

	@RequestMapping("ncr/searchAuditPopup")
	public String searchAuditPopup() {
		return "ncr/searchAudit";}

	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.GET)
	public String searchAuditget(Model model) {
		return "ncr/searchAudit";
	}

	@RequestMapping(value = "ncr/searchAudit", method = RequestMethod.POST)
	public String searchAudit(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String vendorName, @RequestParam(defaultValue = "") String dateFrom,
			@RequestParam(defaultValue = "") String dateTo) {
		List<NcrAuditListCommand> auditList = null;
		try {
			auditList = ncrService.getAuditList(vendorName, dateFrom, dateTo);
		} catch (Exception e) {	e.printStackTrace();}
		model.addAttribute("auditList", auditList);
		request.setAttribute("auditList", auditList);
		return "ncr/ncrAuditList";
	}

	@RequestMapping(value = "ncr/ncrIssue", method = RequestMethod.POST)
	public String issue(NcrIssueCommand nic, HttpSession session, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {		
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
				
				long fileSize = mf.get(i).getSize(); // 파일 사이즈
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				System.out.println(savePath);
				ncrService.ncrFileUpload(originalfileName, saveFileName, fileSize);
			}
		}
		return "redirect:./ncrRegister";
	}

	@RequestMapping(value = "ncr/ncrRegister", method = RequestMethod.GET)
	public String ncrRegister(HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id", loginId);
		model.addAttribute("issuer_name", loginName);
		return "ncr/ncrRegister";
	}

	@RequestMapping(value = "ncr/ncrManagement", method = RequestMethod.GET)
	public String ncrManagementGet(HttpSession session) {
		return "ncr/ncrManagement";
	}

	@RequestMapping(value = "ncr/ncrSearch", method = RequestMethod.POST)
	public String ncrSearch(NcrSearchCommand nsc, Model model) {
		
		List<NcrBean> ncrList = null;
		try {
			ncrList = ncrService.getNcrList(nsc);
		} catch (Exception e) {	e.printStackTrace();}
		model.addAttribute("ncrList", ncrList);
		return "ncr/ncrList";
	}

	@RequestMapping(value = "ncr/searchVendorId", method = RequestMethod.POST)
	public String searchVendor(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String vendor_name) {
		List<BeanVendor> vendorList = null;
		try {
			vendorList = ncrService.getVendorList(vendor_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("vendorList", vendorList);
		return "ncr/ncrVendorList";
	}
	
	@RequestMapping(value = "ncr/searchVendorId", method = RequestMethod.GET)
	public String searchVendorget(Model model) {
		return "ncr/ncrManagement";
	}

	@RequestMapping(value = "ncr/searchIssuerId", method = RequestMethod.POST)
	public String searchIssuer(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String issuer_name) {
		List<BeanIssuer> issuerList = null;

		try {
			issuerList = ncrService.getIssuerList(issuer_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("issuerList", issuerList);
		
		return "ncr/ncrIssuerList";
	}

	@RequestMapping(value = "ncr/searchIssuerId", method = RequestMethod.GET)
	public String searchIssuerget(Model model) {
		return "ncr/ncrManagement";
	}

	@RequestMapping(value = "ncr/ncrDetail", method = RequestMethod.POST)
	public String ncrDetailPost(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam String ncr_id) {
		List<NcrBean> ncrBean = null;
		List<NcrReplyBean> ncrReplyBean = null;
		try {
			ncrBean = ncrService.getNcrDetail(Integer.parseInt(ncr_id));
		} catch (Exception e) {e.printStackTrace();	}
		List<BeanNcrAttach> uploadFileList = ncrService.getFileList(Integer.parseInt(ncr_id));
		
		try {
			ncrReplyBean = ncrService.getReplyDetail(Integer.parseInt(ncr_id));
		} catch (Exception e) {e.printStackTrace();	}
		
		List<BeanReplyAttach> uploadReplyFileList = ncrService.getReplyFileList(Integer.parseInt(ncr_id));
		model.addAttribute("ncrBean", ncrBean);
		model.addAttribute("uploadFileList", uploadFileList);
		model.addAttribute("ncrReplyBean", ncrReplyBean);
		model.addAttribute("uploadReplyFileList", uploadReplyFileList);
		return "ncr/ncrDetail";
	}

	@RequestMapping(value = "ncr/ncrDetail", method = RequestMethod.GET)
	public String ncrDetailget() {
		return "ncr/ncrManagement";
	}
	
	@RequestMapping(value = "ncr/ncrDetail_vendor", method = RequestMethod.POST)
	public String ncrDetail_vendor(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam String ncr_id) {
		List<NcrBean> ncrBean = null;
		List<NcrReplyBean> ncrReplyBean = null;
		try {
			ncrBean = ncrService.getNcrDetail(Integer.parseInt(ncr_id));
		} catch (Exception e) {e.printStackTrace();	}
		List<BeanNcrAttach> uploadFileList = ncrService.getFileList(Integer.parseInt(ncr_id));
		
		try {
			ncrReplyBean = ncrService.getReplyDetail(Integer.parseInt(ncr_id));
		} catch (Exception e) {e.printStackTrace();	}
		
		List<BeanReplyAttach> uploadReplyFileList = ncrService.getReplyFileList(Integer.parseInt(ncr_id));
		model.addAttribute("ncrBean", ncrBean);
		model.addAttribute("uploadFileList", uploadFileList);
		model.addAttribute("ncrReplyBean", ncrReplyBean);
		model.addAttribute("uploadReplyFileList", uploadReplyFileList);
		return "ncr/ncrDetail_vendor";
	}

	@RequestMapping(value = "ncr/ncrDetail_vendor", method = RequestMethod.GET)
	public String ncrDetail_vendorGet() {
		return "ncr/ncrManagement_vendor";
	}
	
	@RequestMapping(value = "ncr/ncrComplete", method = RequestMethod.POST)
	public String ncrComplete(@RequestParam(defaultValue = "") String ncr_id) {		
		ncrService.ncrComplete(Integer.parseInt(ncr_id));
		return "ncr/ncrManagement";
	}
	@RequestMapping(value = "ncr/ncrComplete", method = RequestMethod.GET)
	public String ncrCompleteGet() {
		return "redirect:./ncrManagement";
	}	

	@RequestMapping(value = "ncr/ncrVendorReply", method = RequestMethod.POST)
	public String ncrVendorReplyPost(HttpSession session, Model model,@RequestParam(defaultValue = "") String ncr_id) {		
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id", loginId);
		model.addAttribute("issuer_name", loginName);
		model.addAttribute("ncr_id",ncr_id);
		return "ncr/ncrVedorReplyForm";
	}
	
	@RequestMapping(value = "ncr/ncrVendorReply", method = RequestMethod.GET)
	public String ncrVendorReplyGet(HttpSession session , Model model,@RequestParam(defaultValue = "") String ncr_id) {
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id", loginId);
		model.addAttribute("issuer_name", loginName);
		model.addAttribute("ncr_id",ncr_id);
		return "ncr/ncrVedorReplyForm";
	}
	
	
	@RequestMapping(value = "ncr/ncrVendorReplySave", method = RequestMethod.POST)
	public String issue(NcrReplyCommand nrc, HttpSession session, HttpServletRequest request,			
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {			
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		
		nrc.setReplier_id(authInfo.getId());
		ncrService.saveVendorReply(nrc);		


		List<MultipartFile> mf = mhsq.getFiles("reply_file");
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
				String attach_path = "upload2/";
				String savePath = root_path + attach_path + saveFileName;
				
				long fileSize = mf.get(i).getSize(); // 파일 사이즈
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				ncrService.replyFileUpload(originalfileName, saveFileName, fileSize,Integer.parseInt(nrc.getNcr_id()));
				
			}
		}
		return "ncr/ncrManagement";
	}
	
	@RequestMapping(value = "ncr/ncrVendorReplySave_vendor", method = RequestMethod.POST)
	public String issue_vendor(NcrReplyCommand nrc, HttpSession session, HttpServletRequest request,			
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {			
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		
		nrc.setReplier_id(authInfo.getId());
		ncrService.saveVendorReply(nrc);		


		List<MultipartFile> mf = mhsq.getFiles("reply_file");
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
				String attach_path = "upload2/";
				String savePath = root_path + attach_path + saveFileName;
				
				long fileSize = mf.get(i).getSize(); // 파일 사이즈
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				ncrService.replyFileUpload(originalfileName, saveFileName, fileSize,Integer.parseInt(nrc.getNcr_id()));
				
			}
		}
		return "ncr/ncrManagement_vendor";
	}
	
	
	
	
	@RequestMapping(value = "ncr/ncrAuditorReply", method = RequestMethod.POST)
	public String ncrAuditorReplyPost(HttpSession session, Model model,@RequestParam(defaultValue = "") String ncr_id) {		
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id", loginId);
		model.addAttribute("issuer_name", loginName);
		model.addAttribute("ncr_id",ncr_id);
		return "ncr/ncrAuditorReplyForm";
	}
	
	@RequestMapping(value = "ncr/ncrAuditorReply", method = RequestMethod.GET)
	public String ncrAuditorReplyGet(HttpSession session , Model model,@RequestParam(defaultValue = "") String ncr_id) {
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String loginId = authInfo.getId();
		String loginName = authInfo.getName();
		model.addAttribute("issuer_id", loginId);
		model.addAttribute("issuer_name", loginName);
		model.addAttribute("ncr_id",ncr_id);
		return "ncr/ncrAuditorReplyForm";
	}
	
	
	@RequestMapping(value = "ncr/ncrAuditorReplySave", method = RequestMethod.POST)
	public String auditreply(NcrReplyCommand nrc, HttpSession session, HttpServletRequest request,			
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {			
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");		
		
		nrc.setReplier_id(authInfo.getId());
		ncrService.saveAuditorReply(nrc);		
		
		return "ncr/ncrManagement";
	}
	
	@RequestMapping(value = "ncr/ncrStatus", method = RequestMethod.GET)
	public String ncrStatusGet(HttpSession session) {
		return "ncr/ncrStatus";
	}
	
	@RequestMapping(value = "ncr/ncrStatusSearch", method = RequestMethod.POST)
	public String ncrStatusSearch(NcrStatusCommand nsc, Model model) {
		
		List<NcrStatusBean> ncrStatusList = null;
		try {
			ncrStatusList = ncrService.getNcrStatus(nsc);
		} catch (Exception e) {	e.printStackTrace();}
		model.addAttribute("ncrStatusList", ncrStatusList);
		return "ncr/ncrStatusList";
	}
	
	@RequestMapping(value = "ncr/ncrManagement_vendor", method = RequestMethod.GET)
	public String searchIssuer(Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String vendor_id = authInfo.getId();
		
		model.addAttribute("vendor_id",vendor_id);
		
		return "ncr/ncrManagement_vendor";
	}
	
	@RequestMapping("/mainV")
	public String homeA() {
		
	    return "ncr/mainV";
	}
	
}
