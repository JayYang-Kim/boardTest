package com.sp.myInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("myInfo.myInfoController")
public class MyInfoController {
	
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public String myInfoForm() {
		return ".myInfo.myInfo";
	}
	
}
