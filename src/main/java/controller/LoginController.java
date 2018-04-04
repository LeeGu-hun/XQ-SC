package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.LoginCommand;
import bean.LoginCommandValidator;
import service.LoginService;
import spring.AuthInfo;
import spring.IdPasswordNotMatchingException;
@Controller
public class LoginController {

	private LoginService loginService ;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String form() {
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String form(LoginCommand loginCommand,
			Errors errors, HttpSession session,
			HttpServletResponse response) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if(errors.hasErrors())
			return "login/login";
		
		try {
			AuthInfo authInfo = loginService.authenticate(
					loginCommand.getId(),
					loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo);
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
			rememberCookie.setPath("/");
			if(loginCommand.isRememberid())
				rememberCookie.setMaxAge(60*60*24*30);
			else
				rememberCookie.setMaxAge(0);
			response.addCookie(rememberCookie);
			return "redirect:/main";
		} catch (IdPasswordNotMatchingException e) {
			errors.reject("idPasswordNotMatching");
			return "login/login";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
