package controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
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
import bean.NcrCount;
import bean.VendorCommand;
import bean.VendorStatus;
import bean.VendorValid;
import service.VendorService;
import spring.AuthInfo;

@Controller
public class VendorController {
	private VendorService vendorService;

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
//
	DecimalFormat idForm = new DecimalFormat("00000");

	@RequestMapping(value = "/vendor/newVendor", method = RequestMethod.GET)
	public String newVendorGet(HttpServletRequest request, BeanCategory beancategory, Model model) {
		List<BeanCategory> cateList = vendorService.cateList();
		int cnt = vendorService.vendorCount();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateList", cateList);

		model.addAttribute("cnt", "V" + idForm.format(cnt + 1));
		model.addAttribute("map", map);

		return "vendor/newVendor";
	}

	@RequestMapping("/vendor/prodList")
	public String prodList(HttpServletRequest request, Model model) {
		String selCate = request.getParameter("selCate");
		List<BeanProduct> prodList = vendorService.prodList(selCate);

		// for(int i=0;i<prodList.size();i++) {
		// BeanProduct bp = prodList.get(i);
		// System.out.println(bp.getPRODUCT_NAME());
		// }

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
		if (certfile != null) {
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
		return "redirect:../";
	}

	@RequestMapping(value = "/vendorRegister")
	public String registList(HttpServletRequest request, Model model, BeanVendor beanvendor) {

		List<BeanVendor> list = vendorService.registerList();
		int cnts = vendorService.registerCount();

		model.addAttribute("list", list);
		model.addAttribute("cnts", cnts);

		return "/vendor/vendorRegister";
	}

	@RequestMapping(value = "/vendor/vendorView/{VENDOR_ID}", method = RequestMethod.GET)
	public String vendorView(@PathVariable("VENDOR_ID") String VENDOR_ID, Model model, BeanVendor beanvendor) {

		BeanVendor view = vendorService.vendorView(VENDOR_ID);
		model.addAttribute("view", view);

		return "/vendor/vendorView";
	}

	@RequestMapping("/vendor/vendorUpdate/{VENDOR_ID}")
	public String vendorUpdate(@PathVariable("VENDOR_ID") String VENDOR_ID,HttpServletRequest request, BeanVendor beanvendor) {
		BeanVendor bv = null;
		System.out.println("ID"+VENDOR_ID);
		bv = vendorService.vendorMem(VENDOR_ID);
		System.out.println(bv.getVENDOR_ID());
		
		int cnt = vendorService.auditCount();
		String AUDIT_ID = "S" + idForm.format(cnt + 1);
		
		bv.setAUDIT_ID(AUDIT_ID);

		vendorService.vendorUpdate(VENDOR_ID);
		vendorService.vendorMemRegister(bv);
		vendorService.auditIdRegister(bv);
		
		return "redirect:/vendorRegister";
	}

	@RequestMapping("/vendor/vendorDelete/{VENDOR_ID}")
	public String vendorDelete(@PathVariable("VENDOR_ID") String VENDOR_ID, BeanVendor beanvendor) {
		BeanVendor view = vendorService.vendorDelete(VENDOR_ID);
		return "redirect:/vendorRegister";
		
	}
	@RequestMapping(value = "/vendor/vendorSearch", method = RequestMethod.GET)
	public String searchVendorget(Model model) {
		return "vendor/vendorStatus";
	}
	
	@RequestMapping("/vendor/vendorSearch")
	public String vendorList(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "") String vendor_name) {
		List<BeanVendor> vendorList = null;
		try {
			vendorList = vendorService.getVendorList(vendor_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("vendorList", vendorList);

		return "vendor/vendorList";
	}

	
	@RequestMapping(value = "/vendorStatus", method = RequestMethod.GET)
	public String vendorStatusGet( Model model, ListCommand listCommand) {
		List<BeanProduct> prodList = vendorService.productList();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prodList", prodList);

		model.addAttribute("map", map);

		return "vendor/vendorStatus";
	}

	@RequestMapping(value = "/vendorStatus", method = RequestMethod.POST)
	public String vendorStatusPost(Model model, HttpServletRequest request,ListCommand listCommand
			,@RequestParam(defaultValue = "All") String PRODUCT_ID,
			@RequestParam(defaultValue = "All") String VALID) {
		
		List<BeanProduct> prodList = vendorService.productList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prodList", prodList);
		model.addAttribute("map", map);
		
		List<NcrCount> count = vendorService.ncrAllCount();
		List<NcrCount> countY = vendorService.ncrYCount();
		List<VendorValid> valid = vendorService.getValid();
		
		model.addAttribute("valid",valid);
		model.addAttribute("count",count);
		model.addAttribute("countY",countY);
		
		 if(VALID.equals("Y")) {

			List<VendorStatus> validY = vendorService.getYList(listCommand);
			model.addAttribute("validY", validY);
			return "vendor/vendorStatus";
			
		}else if (VALID.equals("N")) {
				List<VendorStatus> validN = vendorService.getNList(listCommand);
				model.addAttribute("validN", validN);
				return "vendor/vendorStatus";
				
		}else {
			
			List<VendorStatus> vendors = vendorService.vendorStatusList(listCommand);
			model.addAttribute("vendors", vendors);
			return "vendor/vendorStatus";
			
		}

	}

}
