package controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bean.BeanCategory;
import bean.BeanMember;
import bean.BeanProduct;
import bean.BeanVendor;
import bean.ListCommand;
import bean.VendorCommand;
import bean.VendorStatus;
import service.VendorService;
import spring.AuthInfo;

@Controller
public class VendorController {
	private VendorService vendorService;

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	DecimalFormat idForm = new DecimalFormat("00000");
	
	@RequestMapping(value="/vendor/newVendor", method=RequestMethod.GET)
	public String newVendorGet(HttpServletRequest request, BeanCategory beancategory, Model model) {
		List<BeanCategory> cateList = vendorService.cateList();
		int cnt = vendorService.vendorCount();
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("cateList", cateList); 
	
		 model.addAttribute("cnt","V"+idForm.format(cnt+1));
		 model.addAttribute("map", map);

		return "vendor/newVendor";
	}	

	@RequestMapping("/vendor/prodList")
	public String prodList(HttpServletRequest request, Model model) {
		String selCate = request.getParameter("selCate");
		List<BeanProduct> prodList = vendorService.prodList(selCate);
		
//		for(int i=0;i<prodList.size();i++) {
//			BeanProduct bp = prodList.get(i);
//			System.out.println(bp.getPRODUCT_NAME());
//		}
	
		 model.addAttribute("prodList", prodList);
	
		return "vendor/newVendor2";
	}
	
	@RequestMapping(value = "/vendor/newVendor", method = RequestMethod.POST)
	public String newVendorPost(HttpServletRequest request, VendorCommand vendorcommand, HttpSession session) {
		MultipartFile isofile = vendorcommand.getVENDOR_ISO_FILE();
		MultipartFile certfile = vendorcommand.getVENDOR_CERT_FILE();
		String originalFilename1 = "", newFilename1 = "";
		String originalFilename2 = "", newFilename2 = "";

		if (isofile != null) {
			originalFilename1 = isofile.getOriginalFilename();
			newFilename1 = System.currentTimeMillis() + "_" + originalFilename1;

			String root_path1 = request.getSession().getServletContext().getRealPath("/");
			String attach_path1 = "upload/";
			String path1 = root_path1 + attach_path1 + newFilename1;

			try {
				File file1 = new File(path1);
				isofile.transferTo(file1);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(certfile != null) {
			originalFilename2 = certfile.getOriginalFilename();
			newFilename2 = System.currentTimeMillis() + "_" + originalFilename2;

			String root_path2 = request.getSession().getServletContext().getRealPath("/");
			String attach_path2 = "upload/";
			String path2 = root_path2 + attach_path2 + newFilename2;

			try {
				File file2 = new File(path2);
				certfile.transferTo(file2);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	
		BeanVendor bv = new BeanVendor();
		bv.setVENDOR_NAME(vendorcommand.getVENDOR_NAME());
		bv.setPRODUCT_ID(vendorcommand.getPRODUCT_ID());
		bv.setVENDOR_ADDRESS(vendorcommand.getVENDOR_ADDRESS());
		bv.setVENDOR_EMP_NO(vendorcommand.getVENDOR_EMP_NO());
		bv.setVENDOR_ISO_FILE(newFilename1);
		bv.setVENDOR_CERT_FILE(newFilename2);
		bv.setVENDOR_REQ_DATE(vendorcommand.getVENDOR_REQ_DATE());
		bv.setVENDOR_ID(vendorcommand.getVENDOR_ID());
		bv.setVENDOR_Q_NAME(vendorcommand.getVENDOR_Q_NAME());
		bv.setVENDOR_Q_TEL(vendorcommand.getVENDOR_Q_TEL());
		bv.setVENDOR_Q_EMAIL(vendorcommand.getVENDOR_Q_EMAIL());
		bv.setVENDOR_S_NAME(vendorcommand.getVENDOR_S_NAME());
		bv.setVENDOR_S_TEL(vendorcommand.getVENDOR_S_TEL());
		bv.setVENDOR_S_EMAIL(vendorcommand.getVENDOR_S_EMAIL());
		vendorService.vendorRegister(bv);	
		
		
		return "login/login";
	}
	

	@RequestMapping(value="/vendor/vendorRegister")
	public String registList (HttpServletRequest request,Model model,BeanVendor beanvendor) {
		
		List<BeanVendor> list = vendorService.registerList();	
		int cnts = vendorService.registerCount();
		
		model.addAttribute("list", list);
		model.addAttribute("cnts",cnts);
	
		return "/vendor/vendorRegister";
	}
	
	@RequestMapping(value ="/vendor/vendorView/{VENDOR_ID}", method = RequestMethod.POST)
	public String vendorView(@PathVariable("VENDOR_ID") String VENDOR_ID, Model model,BeanVendor beanvendor) {
		
		BeanVendor view = vendorService.vendorView(VENDOR_ID);
		model.addAttribute("view", view);
	
		return "vendor/vendorView";
	}
	
	@RequestMapping("/vendor/vendorUpdate")
	public String vendorUpdate(HttpServletRequest request, BeanVendor beanvendor) {
		String VENDOR_ID = request.getParameter("VENDOR_ID");
		String VENDOR_NAME = request.getParameter("VENDOR_NAME");
		String VENDOR_S_TEL = request.getParameter("VENDOR_S_TEL");
		String VENDOR_S_EMAIL = request.getParameter("VENDOR_S_EMAIL");

		BeanVendor bv = new BeanVendor();
		bv.setVENDOR_ID(VENDOR_ID);
		bv.setVENDOR_NAME(VENDOR_NAME);
		bv.setVENDOR_S_TEL(VENDOR_S_TEL);
		bv.setVENDOR_S_EMAIL(VENDOR_S_EMAIL);
		BeanVendor view = vendorService.vendorUpdate(VENDOR_ID);
		vendorService.vendorMemRegister(bv);	
		
		return "redirect:/vendor/vendorRegister";
	}
	
	@RequestMapping("/vendor/vendorDelete/{VENDOR_ID}")
	public String vendorDelete(@PathVariable("VENDOR_ID") String VENDOR_ID,BeanVendor beanvendor) {
		BeanVendor view = vendorService.vendorDelete(VENDOR_ID);
		return "redirect:/vendor/vendorRegister";
	}
	
	@RequestMapping(value="/vendor/vendorStatus", method = RequestMethod.GET)
	public String vendorStatusGet (HttpServletRequest request, BeanVendor beanvendor,BeanCategory beancategory, Model model) {
		List<BeanVendor> vendorList = vendorService.vendorList(); 
		List<BeanCategory> cateList = vendorService.cateList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);
		 
		model.addAttribute("vendorList", vendorList);
		model.addAttribute("map", map);
	 
		return "vendor/vendorStatus";
	}	
	
	@RequestMapping(value="/vendor/vendorStatus", method = RequestMethod.POST)
	public String vendorStatusPost (Model model, 
	@ModelAttribute("cmd") ListCommand listCommand) {
		
		List<VendorStatus> vendors = vendorService. vendorStatusList(listCommand);
		model.addAttribute("vendors", vendors);
	
		return "vendor/vendorStatus";
	}
	
}
	
	
	