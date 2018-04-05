package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import bean.LoginCommand;

import spring.AuthInfo;

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
	
	@RequestMapping("/main")
	public String home() {
		
	    return "main";
	}
}
