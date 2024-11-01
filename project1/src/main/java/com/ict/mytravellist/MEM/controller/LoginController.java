package com.ict.mytravellist.MEM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	// 로그인 화면
	@RequestMapping("/mem_login")
	public ModelAndView mem_login() {
		ModelAndView mv = new ModelAndView("MEM/MEM_loginPage");
		return mv;
	}
	
	// 로그인 처리
	@PostMapping("/mem_login_ok")
	public ModelAndView mem_login_ok() {
		ModelAndView mv = new ModelAndView("/index");
		
		// 로그인 성공 시, 로그인 된 메인 화면(MAIN_main_login.jsp)으로 이동
		return mv;
		
		// 로그인 실패 시, 로그인 화면(MEM_loginPage)으로 이동		
	}
	
	// 아이디 찾기 화면
	@RequestMapping("/mem_findID")
	public ModelAndView mem_findID() {
		ModelAndView mv = new ModelAndView("MEM/MEM_findID");
		return mv;
	}
	
	// 비밀번호 찾기 화면
	@RequestMapping("/mem_findPW")
	public ModelAndView mem_findPW() {
		ModelAndView mv =  new ModelAndView("MEM/MEM_findPW");
		return mv;
	}
	
	// 회원가입 이용 약관 화면
	@RequestMapping("/mem_joinAgree")
	public ModelAndView mem_joinAgree() {
		ModelAndView mv =  new ModelAndView("MEM/MEM_joinAgree");
		return mv;
	}
	
	// 아이디 찾기 관련
	@RequestMapping("/mem_findID_OK")
	public ModelAndView mem_findID_detail() {
		ModelAndView mv = new ModelAndView("MEM/MEM_findID_OK");
		
		// DB 정보 일치 시, 아이디 찾기 안내 화면(MEM_findID_Success)으로 이동
		
		// DB 정보 불일치 시, 아이디 찾기 화면(MEM_findID)으로 이동
		
		return mv;
	}
	
	// 비밀번호 찾기 관련
	@PostMapping("/mem_findPW_change")
	public ModelAndView mem_findPW_change() {
		ModelAndView mv = new ModelAndView("MEM/MEM_findPW_Change");
		
		// DB 정보 일치 시, 비밀번호 변경 화면(MEM_findPW_Change)으로 이동
		
		// DB 정보 불일치 시, 비밀번호 찾기 화면(MEM_finePW)으로 이동
		
		return mv;
	}
	
	// 비밀번호 변경 관련
	@PostMapping("/mem_findPW_OK")
	public ModelAndView mem_findPW_OK() {
		ModelAndView mv = new ModelAndView("MEM/MEM_loginPage");
		 
		// 비밀번호 입력-확인 일치 시, 로그인 화면(MEM_loginPage)으로 이동
		
		// 비밀번호 입력-확인 불일치 시, 비밀번호 변경(MEM_findPW_Change)으로 이동
		
		return mv;
	}
}