package controller;

import org.springframework.stereotype.Controller;

import service.NcrService;

@Controller
public class NcrController {
	private NcrService ncrService;

	public void setNcrService(NcrService ncrService) {
		this.ncrService = ncrService;
	}
	
	

}
