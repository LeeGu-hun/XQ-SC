package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bean.BeanCategory;
import bean.BeanProduct;
import bean.BeanVendor;
import bean.VendorCommand;
import service.VendorService;
import spring.AuthInfo;

@Controller
public class VendorController {
	private VendorService vendorService;

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	
	
	@RequestMapping(value="/vendor/newVendor", method=RequestMethod.GET)
	public String newVendorGet(HttpServletRequest request, BeanCategory beancategory, Model model) {
		List<BeanCategory> cateList = vendorService.cateList();
		int cnt = vendorService.vendorCount();
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("cateList", cateList); 
	
		 model.addAttribute("cnt","V_"+(cnt+1));
		 model.addAttribute("map", map);

		return "vendor/newVendor";
	}	

	@RequestMapping("vendor/prodList")
	public String prodList(HttpServletRequest request, Model model) {
		String selCate = request.getParameter("selCate");
		List<BeanProduct> prodList = vendorService.prodList(selCate);
		
/*		for(int i=0;i<prodList.size();i++) {
			BeanProduct bp = prodList.get(i);
			System.out.println(bp.getPRODUCT_NAME());
		}
	*/
		 model.addAttribute("prodList", prodList);
	
		return "vendor/newVendor2";
	}
	
	@RequestMapping(value = "/vendor/newVendor", method = RequestMethod.POST)
	public String newVendorPost(HttpServletRequest request, VendorCommand vendorcommand, HttpSession session) {
		MultipartFile isofile = vendorcommand.getVENDOR_ISO_FILE();
		MultipartFile certfile = vendorcommand.getVENDOR_CERT_FILE();
		String originalFilename1 = "", newFilename1 = "";
		String originalFilename2 = "", newFilename2 = "";

		if (isofile != null || certfile != null) {
			originalFilename1 = isofile.getOriginalFilename();
			originalFilename2 = certfile.getOriginalFilename();
			// 파일이 중복되지 않게 파일명에 시간추가
			newFilename1 = System.currentTimeMillis() + "_" + originalFilename1;
			newFilename2 = System.currentTimeMillis() + "_" + originalFilename2;

			// 파일 업로드 경로
			String root_path1 = request.getSession().getServletContext().getRealPath("/");
			String attach_path1 = "upload/";
			String root_path2 = request.getSession().getServletContext().getRealPath("/");
			String attach_path2 = "upload/";
			String path1 = root_path1 + attach_path1 + newFilename1;
			String path2 = root_path2 + attach_path2 + newFilename2; 
			
			try {
				File file1 = new File(path1);
				isofile.transferTo(file1);
				
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
	
	@RequestMapping("/vendor/vendorView/{VENDOR_ID}")
	public String vendorView(@PathVariable("VENDOR_ID") String VENDOR_ID, Model model) {
		
		BeanVendor view = vendorService.vendorView(VENDOR_ID);
		model.addAttribute("view", view);
	
		return "vendor/vendorView";
	}
	
	
	
	
	
	
	

	
	
	
}
	
	
	