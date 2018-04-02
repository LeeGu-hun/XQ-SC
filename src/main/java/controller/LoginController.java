package controller;

import org.springframework.stereotype.Controller;

import service.LoginService;
@Controller
public class LoginController {

	private LoginService loginService ;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
}
