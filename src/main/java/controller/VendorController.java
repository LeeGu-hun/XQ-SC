package controller;

import org.springframework.stereotype.Controller;

import service.VendorService;
@Controller
public class VendorController {
	private VendorService vendorService;

	public void setVendorService(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	
}
