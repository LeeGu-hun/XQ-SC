package controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import bean.LoginCommand;

@Controller
public class MainController {

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
	@RequestMapping(value="/vendor/newVendor", method=RequestMethod.GET)
	public String form() {
		return "vendor/newVendor";
	}
	@RequestMapping("/main")
	public String home() {
	
		return "main";
	}
}