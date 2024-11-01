package com.ict.mytravellist.ADD.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.ADD.service.AddService;
import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

@Controller
public class AddController {
	@Autowired
	private AddService addService;
	
	// 공지사항 초기 화면
	@GetMapping("/add_notice")
	public ModelAndView addNotice() {
		ModelAndView mv = new ModelAndView("ADD/ADD_notice");
		List<NoticeVO> notice_list = addService.getNoticeList();
		List<NoticeVO> notice_list2 = addService.getNoticeList2();
		mv.addObject("notice_list", notice_list);
		mv.addObject("notice_list2", notice_list2);
		return mv;
	}
	
	// 공지사항 상세 화면
	@GetMapping("/add_notice_detail")
	public ModelAndView addNoticeDetail(@RequestParam("noticeIdx") String noticeIdx) {
		ModelAndView mv = new ModelAndView("ADD/ADD_notice_detail");
		NoticeVO noticevo = addService.getNoticeDetail(noticeIdx);
		if (noticevo != null) {
			mv.addObject("noticevo", noticevo);
			return mv;
		}
		return null;
	}
	
	// FAQ 초기 화면
	@GetMapping("/add_faq")
	public ModelAndView addFaq() {
		ModelAndView mv = new ModelAndView("ADD/ADD_FAQ");
		List<FAQVO> faq_list = addService.getFAQList();
		mv.addObject("faq_list", faq_list);
		return mv;
	}
	
	// Q&A 초기 화면 테스트
	@GetMapping("/add_qna")
	public ModelAndView add_qna() {
		ModelAndView mv = new ModelAndView("ADD/ADD_QNA");
		List<QNAVO> qna_list = addService.getQNAList();
		mv.addObject("qna_list", qna_list);
		return mv;
		
		// 로그인X 로그인 화면으로 이동
		
		// 로그인O 나의 질문 초기 화면으로 이동
	}
	
	
	// Q&A 질문하기 상세 화면 테스트-User
	@GetMapping("/add_qna_detail")
	public ModelAndView addQnaDetail(@RequestParam("qnaIdx") String qnaIdx) {
		ModelAndView mv = new ModelAndView("ADD/ADD_QNA_detail");
		QNAVO qnavo = addService.getQNADetail(qnaIdx);
		if (qnavo != null) {
			mv.addObject("qnavo", qnavo);
			return mv;
		}
		return null;
	}
	
	// Q&A 질문하기 상세 화면 테스트-Admin
	@GetMapping("/add_qna_detail_admin")
	public ModelAndView addQnaDetailAdmin(@RequestParam("qnaIdx") String qnaIdx) {
		ModelAndView mv = new ModelAndView("ADD/ADD_QNA_detail_admin");
		QNAVO qnavo = addService.getQNADetailAdmin(qnaIdx);
		if (qnavo != null) {
			mv.addObject("qnavo", qnavo);
			return mv;
		}
		return null;
	}
	
	// Q&A 질문하기 화면 테스트
	@GetMapping("/add_qna_ask")
	public ModelAndView addQnaAsk() {
		ModelAndView mv = new ModelAndView("ADD/ADD_QNA_ask");
		return mv;
	}
	
	// Q&A 질문하기 저장
	@PostMapping("/add_qna_ask_ok")
	public ModelAndView addQnaAskOK(QNAVO qnavo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/add_qna");
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = qnavo.getFileName();
			
			if (file.isEmpty()) {
				qnavo.setQnaFile("");
			} else {
				UUID uuid = UUID.randomUUID();
				String qnaFile = uuid.toString()+"_"+file.getOriginalFilename();
				qnavo.setQnaFile(qnaFile);
				file.transferTo(new File(path, qnaFile));
			}
			int result = addService.getQNAInsert(qnavo);
			if(result > 0) {
				return mv;
			}
			return null;
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return null;
		}
	}
	
	// 파일 다운로드
	@GetMapping("/add_qna_ask_filedown")
	public void aadQnaAskFiledown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String qnaFile = request.getParameter("qnaFile");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+qnaFile);
			String r_path = URLEncoder.encode(path, "UTF-8");
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
			
			// 실제 가져오기
			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}