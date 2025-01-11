package com.in28minutes.springboot.myfirstwebapp.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
// if you need something to be accessed in jsp than use model
@Controller
public class LoginController {

	private AuthenticationService authenticationservice;
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String gotoLoginPage() {
		return "login";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String gotoWelcomePage(@RequestParam String name,@RequestParam String password,ModelMap model) {
		if(authenticationservice.authenticate(name, password)) {
			model.put("name", name);
			model.put("password", password);
			return "welcome";
		}else {
			return "login";	
		}
		
	}

	public LoginController(AuthenticationService authenticationservice) {
		super();
		this.authenticationservice = authenticationservice;
	}
}
