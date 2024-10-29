package com.ict.mytravellist.MEM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	
	// 회원가입 페이지
	@PostMapping("/mem_joinPage")
	public ModelAndView mem_joinPage() {
		ModelAndView mv = new ModelAndView("MEM/MEM_joinPage");
		
		return mv;
	}
	
	// 회원가입 처리
	@PostMapping("/mem_joinPage_OK")
	public ModelAndView mem_joinPage_OK() {
		ModelAndView mv = new ModelAndView("MEM/MEM_loginPage");
		
		// 회원가입 성공 시, 로그인 화면(MEM_loginPage)으로 이동
		return mv;
	}
	
	// 아이디 중복 체크
	// 나중에 @AutoWired
	// @PostMapping("/id_dul_chk")
}