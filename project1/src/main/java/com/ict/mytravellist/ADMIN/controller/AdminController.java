package com.ict.mytravellist.ADMIN.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.ADMIN.vo.AdminVO;
import com.ict.mytravellist.vo.UserVO;

@Controller
public class AdminController {
	
	@GetMapping("/administrator")
	public ModelAndView goAdminLoginPage() {
		return new ModelAndView("ADMIN/loginPage");
	}
	@GetMapping("/admin_index")
	public ModelAndView goAdminIndex2() {
		return new ModelAndView("ADMIN/index");
	}
	@GetMapping("/admin_members")
	public ModelAndView goAdminMembers() {
		ModelAndView mv = new ModelAndView("ADMIN/members");
		List<UserVO> list = new ArrayList<UserVO>();
		
		UserVO uvo1 = new UserVO();
		uvo1.setUserName("홍길동");
		uvo1.setUserId("hong");
		uvo1.setUserMail("hong@naver.com");
		uvo1.setUserAddr("서울시 마포구 백범로");
		uvo1.setUserFavor01("서울");
		uvo1.setUserFavor02("경기");
		uvo1.setUserFavor03("광주");
		uvo1.setUserReg("2024-09-27");
		
		UserVO uvo2 = new UserVO();
		uvo2.setUserName("고고고길동");
		uvo2.setUserId("hong");
		uvo2.setUserMail("hong@naver.com");
		uvo2.setUserAddr("서울시 마포구 백범로");
		uvo2.setUserFavor01("서울");
		uvo2.setUserFavor02("경기");
		uvo2.setUserFavor03("광주");
		uvo2.setUserReg("2024-09-27");
		
		list.add(uvo1);
		list.add(uvo2);
		mv.addObject("list", list);
		return mv;
	}
	@GetMapping("/admin_notice")
	public ModelAndView goAdminNotice() {
		
		return new ModelAndView("ADMIN/notice");
	}
	@GetMapping("/admin_notice_create")
	public ModelAndView goAdminNoticeCreate() {
		return new ModelAndView("ADMIN/notice_create");
	}
	@GetMapping("/admin_faq")
	public ModelAndView goAdminFAQ() {
		return new ModelAndView("ADMIN/faq");
	}
	@GetMapping("/admin_faq_create")
	public ModelAndView goAdminFAQCreate() {
		return new ModelAndView("ADMIN/faq_create");
	}
	@GetMapping("/admin_qa")
	public ModelAndView goAdminQA() {
		return new ModelAndView("ADMIN/qa");
	}
	@GetMapping("/admin_qa_question")
	public ModelAndView goAdminQAQuestion() {
		return new ModelAndView("ADMIN/qa_question");
	}
	@GetMapping("/admin_main")
	public ModelAndView goAdminMain() {
		return new ModelAndView("ADMIN/main");
	}
	@GetMapping("/admin_main_create")
	public ModelAndView goAdminMainCreate() {
		return new ModelAndView("ADMIN/main_create");
	}
	
	@PostMapping("/admin_index")
	public ModelAndView goAdminIndex(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		AdminVO avo = new AdminVO();

		String id = request.getParameter("adminID");
		String pw = request.getParameter("adminPW");
		
		String trueid = "admin";
		String truepw = "1111";
		
		if(id.equals(trueid) && pw.equals(truepw)) {
			avo.setAdminID(request.getParameter("adminID"));
			avo.setAdminPW(request.getParameter("adminPW"));
			request.getSession().setAttribute("avo", avo);
			result.setViewName("ADMIN/index");
		}else {
			result.addObject("errorMsg", "올바르지 못한 로그인 정보입니다.");
			result.setViewName("ADMIN/loginPage");
		}
		return result;
	}
	
	@PostMapping("/admin_main_create_OK")
	public ModelAndView adminMainCreateOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ADMIN/main");
		return mv; 
	}
	
	
}
