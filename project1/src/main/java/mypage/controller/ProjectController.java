package com.ict.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.service.ProjectService;
import com.ict.project.vo.TourTalkVO;
import com.ict.project.vo.UserVO;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/go_main")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView("project_view/main_page");
		
		return mav ;
	}
	
	@RequestMapping("/go_my_page")
	public ModelAndView goMyPage() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage");
		
		return mav ;
	}
	
	@RequestMapping("/go_identify")
	public ModelAndView goIdentify(@ModelAttribute("cmd") String cmd, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			request.getSession().setAttribute("userId", "testid"); // 임시로 세션 설정
			String userId = (String) request.getSession().getAttribute("userId");
			mav.addObject("userId", userId);
			mav.setViewName("project_view/MEM_myPage_identityCheck");
			
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav;
	}
	
	@PostMapping("go_pw_chk")
	public ModelAndView goPwChk(UserVO uvo, @RequestParam("cmd") String cmd) {
		ModelAndView mav = new ModelAndView();
		try {
			String pw = uvo.getUserPw();
			uvo.setUserPw(passwordEncoder.encode(pw));
			
			String userId = uvo.getUserId();
			UserVO dbUvo = projectService.getUserDetail(userId);
			
			String dbPw = dbUvo.getUserPw();
	//		if (passwordEncoder.matches(pw, dbPw)) { 
			if (true) { // 임시코드임. 추후에 위 코드로 변경
				mav.setViewName("redirect:/" + cmd);
			}else {
				mav.setViewName("project_view/MEM_myPage_identityCheck");
				mav.addObject("pwChk", false);
			}
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav ;
	}
	
	
	
	@RequestMapping("/go_my_comment")
	public ModelAndView goMyComment() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_myComment");
		
		 return mav ;
	}
	
	@RequestMapping("/go_update")
	public ModelAndView goUpdate(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_update");
		 String userId =  (String) request.getSession().getAttribute("userId");
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
//		 projectService.getUserDetail(userId);
		return mav ;
	}
	
	@RequestMapping("/go_pw_change")
	public ModelAndView goPwChange() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_changePw");
		
		return mav ;
	}
	
	@RequestMapping("/go_user_out")
	public ModelAndView goUserOut() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_userOut");
		
		return mav ;
	}
	
	@RequestMapping("/go_update_ok")
	public ModelAndView goUpdateOK(UserVO uvo) {
		ModelAndView mav = new ModelAndView();
		try {
			String result = projectService.getUserUpdate(uvo);
			if (result == "1") {
				mav.setViewName("project_view/MEM_myPage");
				mav.addObject("result", result);
			}else{
				mav.setViewName("project_view/error");
			}
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav;
	}
	
}
