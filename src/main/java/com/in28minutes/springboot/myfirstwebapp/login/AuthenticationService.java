package com.in28minutes.springboot.myfirstwebapp.login;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
      public boolean authenticate(String name,String password) {
    	  
    	  boolean isValidname = name.equalsIgnoreCase("Dhairya");
    	  boolean isValidpassword = password.equals("1234");
    	 // System.out.println("Authenticating: name=" + name + ", password=" + password);
    	  return isValidname && isValidpassword;
      }
}
