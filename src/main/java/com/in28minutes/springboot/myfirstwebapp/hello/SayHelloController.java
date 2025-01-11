package com.in28minutes.springboot.myfirstwebapp.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SayHelloController {

	@RequestMapping("Say-Hello")
	@ResponseBody
	public String SayHello() {
		return "Hello everyone!";
	}
	
	@RequestMapping("Say-Hello-Html")
	@ResponseBody
	public String SayHelloHtml() {
		StringBuffer s=new StringBuffer();
		s.append("<html>");
		s.append("<head>");
		s.append("<title>this is my html page</title>");
		s.append("</head>");
		s.append("<body>");
		s.append("my html page body");
		s.append("</body>");
		s.append("</html>");
		return s.toString();
	}
	
	@RequestMapping("Say-Hello-jsp")
	public String SayHelloJsp() {
		return "sayHello";
	}
}
