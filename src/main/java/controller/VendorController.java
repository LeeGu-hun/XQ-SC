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
	public String form(HttpServletRequest request, BeanCategory beancategory,Model model) {
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
		System.out.println(selCate);
		List<BeanProduct> prodList = vendorService.prodList(selCate);
		
		for(int i=0;i<prodList.size();i++) {
			BeanProduct bp = prodList.get(i);
			System.out.println(bp.getPRODUCT_NAME());
		}
	
		 model.addAttribute("prodList", prodList);
	
		return "vendor/newVendor2";
	}
	
	@RequestMapping(value = "/vendor/newVendor", method = RequestMethod.POST)
	public String boardWritePost(VendorCommand vendorcommand, HttpSession session, HttpServletRequest request) {

		MultipartFile multi = vendorcommand.getVENDOR_CERT_FILE();
		
		String originalFilename = "", newFilename = "";

		if (multi != null) {
			originalFilename = multi.getOriginalFilename();
			// 파일이 중복되지 않게 파일명에 시간추가
			newFilename = System.currentTimeMillis() + "_" + originalFilename;

			// 파일 업로드 경로
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "upload/";
			String path = root_path + attach_path + newFilename;

			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		BeanVendor bv = new BeanVendor();
		bv.setVENDOR_NAME(vendorcommand.getVENDOR_NAME());
//		bv.setBOARD_PASS(board.getBOARD_PASS());
//		bv.setBOARD_SUBJECT(board.getBOARD_SUBJECT());
//		bv.setBOARD_CONTENT(board.getBOARD_CONTENT());
//		bv.setBOARD_FILE(newFilename);
//		bv.setHOST(authInfo.getId());
//		bv.setWRITER(authInfo.getId());
		vendorService.vendorRegister(bv);
		return "/vendorRegister";
	}

	
	
	
}
	
	
	