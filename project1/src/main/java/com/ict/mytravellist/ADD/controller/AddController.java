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

import com.ict.mytravellist.ADD.comm.FAQPaging;
import com.ict.mytravellist.ADD.service.AddService;
import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

@Controller
public class AddController {
	
	@Autowired
	private AddService addService;
	
	@Autowired
	private FAQPaging paging;
	
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
	
	// 검색 결과 화면
    @GetMapping("/add_notice_search")
    public ModelAndView addNoticeSearch(@RequestParam("keyword") String keyword) {
        ModelAndView mv = new ModelAndView("ADD/ADD_notice_search");

        List<NoticeVO> searchResults = addService.getNoticeSearch(keyword);

        mv.addObject("searchResults", searchResults);
        mv.addObject("keyword", keyword);
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
	/*
	@GetMapping("/add_faq")
	public ModelAndView addFaq() {
		ModelAndView mv = new ModelAndView("ADD/ADD_FAQ");
		List<FAQVO> faq_list = addService.getFAQList();
		mv.addObject("faq_list", faq_list);
		return mv;
	}
	*/
	
	@GetMapping("/add_faq")
	public ModelAndView addFaq(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ADD/ADD_FAQ");

		// 1. 전체 게시물의 수를 구한다.
		int count = addService.getTotalCount();
		paging.setTotalRecord(count);

		// 2. 전체 페이지의 수를 구한다.
		// NumPerPage(6) 보다 작을 경우 1페이지
		if (paging.getTotalRecord() <= paging.getNumPerPage()) { // 전체 데이터의 수가 한 페이지당 데이터보다 작거나 같을 경우
			paging.setTotalPage(1);
		} else { // 클 경우
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage()); // (전체 데이터) / (한 페이지당 데이터)
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) { // 나누어 떨어지지 않으면
				paging.setTotalPage(paging.getTotalPage() + 1); // 나눠진 결과에 +1을 해서 총 페이지에 저장하자
			}
		}

		// 3. 파라미터에서 넘어오는 cPage(보고 싶은 페이지번호)를 구하자
		String cPage = request.getParameter("cPage");

		// 만약에 cPage가 null 이면 무조건 1 page 이다.
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작블록 구하기
		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		
		// 끝블록 구하기
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의 사항
		// enbBlock(3,6,9...) 이렇게 설정되는데
		// 총 데이터가 20개면 총 페이지는 4개가 나온다.
		if (paging.getEndBlock() > paging.getTotalPage()) { // 끝블록이 총 페이지보다 크면
			paging.setEndBlock(paging.getTotalPage()); // 끝블록을 총 페이지에 맞게 조절
		}

		// DB 갔다가 오기
		List<FAQVO> faq_list = addService.getFAOList(paging.getOffset(), paging.getNumPerPage());

		mv.addObject("faq_list", faq_list);
		mv.addObject("paging", paging);
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