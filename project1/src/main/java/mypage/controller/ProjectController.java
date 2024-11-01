package mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/go_main")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView("project_view/main_page");
		
		return mav ;
	}
	
	@RequestMapping("/go_my_page")
	public ModelAndView goMyPage(@ModelAttribute("isOk") String isOk) {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage");
		
		return mav ;
	}
	
	@GetMapping("/go_identify")
	public ModelAndView goIdentify(@ModelAttribute("cmd") String cmd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			session.setAttribute("userId",  "testid");
			String userId = (String) session.getAttribute("userId");
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
			if (true) { // ?ž„?‹œì½”ë“œ?ž„. ì¶”í›„?— ?œ„ ì½”ë“œë¡? ë³?ê²?
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
	
	
	
	@GetMapping("/go_my_comment")
	public ModelAndView goMyComment() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_myComment");
		
		 return mav ;
	}
	
	@GetMapping("/go_update")
	public ModelAndView goUpdate(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		 String userId =  (String) request.getSession().getAttribute("userId");
		 // ?´ë¦?, ?•„?´?””, ?´ë©”ì¼, ì£¼ì†Œ, ê´??‹¬ì§??—­ 123
		try {
			UserVO detail = projectService.getUserDetail(userId);
			mav.addObject("detail", detail);
			mav.setViewName("project_view/MEM_myPage_update");
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav ;
	}
	
	@GetMapping("/go_pw_change")
	public ModelAndView goPwChange() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_changePw");
		
		return mav ;
	}
	
	@GetMapping("/go_user_out")
	public ModelAndView goUserOut() {
		ModelAndView mav = new ModelAndView("project_view/MEM_myPage_userOut");
		
		return mav ;
	}
	
	@PostMapping("/go_update_ok")
	public ModelAndView goUpdateOK(UserVO uvo) {
		ModelAndView mav = new ModelAndView();
		try {
			String result = projectService.getUserUpdate(uvo);
			if (result != "0") {
				mav.setViewName("redirect:/go_my_page?isOk=yes");
			}else{
				mav.setViewName("project_view/error");
			}
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav;
	}
	@PostMapping("/go_pw_change_ok")
	public ModelAndView goPwChangeOK(String userPw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
		String userId = (String) session.getAttribute("userId");
		String encodePw = passwordEncoder.encode(userPw);
		
		UserVO uvo = new UserVO();
		uvo.setUserPw(encodePw);
		uvo.setUserId(userId);
		
		int result = projectService.getChangePw(uvo);
		if (result > 0) {
			mav.setViewName("redirect:/go_my_page?isOk=yes");
		}else {
			mav.setViewName("project_view/error");
		}
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav ;
	}
	
	@PostMapping("/go_user_out_ok")
	public ModelAndView goUserOutOK(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String userId = (String) session.getAttribute("userId");
			int result = projectService.getUserOut(userId);
			if (result > 0) {
				mav.setViewName("redirect:/go_main?isOk=yes");
				session.invalidate();
			}else {
				mav.setViewName("project_view/error");
			}
		} catch (Exception e) {
			System.out.println(e);
			mav.setViewName("project_view/error");
		}
		return mav ;
	}
}
