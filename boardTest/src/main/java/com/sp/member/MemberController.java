package com.sp.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;
	
	// 변경 시작 부분 ----------------------------------------------------------------------
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(String login_error, Model model, HttpSession session) {
		// 로그인 폼
		boolean bLoginError = login_error != null;
		
		String msg="";
		if(bLoginError) {
			msg="아이디 또는 패스워드를 잘못 입력 하셨습니다.";
			model.addAttribute("message", msg);
		}
		
		return "member/login";
	}

	// 접근 오서라이제이션(Authorization:권한)이 없는 경우
	@RequestMapping(value="/member/noAuthorized")
	public String noAuthorized() {
		return ".member.noAuthorized";
	}
	
	// 세션이 만료 된 경우
	@RequestMapping(value="/member/expired")
	public String expired() {
		return ".member.expired";
	}
}
