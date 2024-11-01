package com.ict.mytravellist.MAIN.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.MAIN.service.TourTalkService;
import com.ict.mytravellist.vo.TourTalkVO;

@Controller
public class TourTalkController {

	@Autowired
	private TourTalkService tourTalkService;

	/*
	 * @Autowired private BCryptPasswordEncoder passwordEncoder;
	 */

	@GetMapping("/tourTalk_write")
	public ModelAndView getTourTalkWrite() {
		return new ModelAndView("TourTalk/write");
	}

	/*
	 * @PostMapping("/tourTalk_write_ok") public ModelAndView getTourTalkWriteOk(TourTalkVO tourvo,
	 * HttpServletRequest request) { try { ModelAndView mv = new
	 * ModelAndView("redirect:/TourTalk");
	 * 
	 * String path =
	 * request.getSession().getServletContext().getRealPath("/resources/upload");
	 * MultipartFile file = tourvo.getFile_name(); if (file.isEmpty()) {
	 * tourvo.setF_name(""); } else { UUID uuid = UUID.randomUUID(); String f_name =
	 * uuid.toString() + "_" + file.getOriginalFilename(); tourvo.setF_name(f_name);
	 * 
	 * // 업로드 file.transferTo(new File(path, f_name)); }
	 * 
	 * // 비밀번호 암호화
	 * 
	 * String pwd = passwordEncoder.encode(tourvo.getPwd()); tourvo.setPwd(pwd);
	 * 
	 * 
	 * int result = tourTalkService.getTourTalkInsert(tourvo); if (result > 0) { return mv; }
	 * 
	 * return new ModelAndView("TourTalk/error"); } catch (Exception e) {
	 * System.out.println(e); return new ModelAndView("TourTalk/error"); } }
	 */

	@GetMapping("/tourTalk_detail")
	public ModelAndView getTourTalkDetail(@ModelAttribute("userId") String userId, @ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("TourTalk/detail");

		// 조회수 증가
		int result = tourTalkService.getHitUpdate(userId);

		// 상세보기
		TourTalkVO tourtvo = tourTalkService.getTourTalkDetail(userId);

		// 댓글 리스트 가져오기 (원글과 관련된)
		/* List<CommVO> clist = tourTalkService.getCommentList(userId); */

		mv.addObject("tourtvo", tourtvo);
		/* mv.addObject("clist", clist); */
		return mv;
	}

	/*
	 * @GetMapping("/tourTalk_down") public void TourTalkDown(HttpServletRequest request,
	 * HttpServletResponse response) { try { String f_name =
	 * request.getParameter("f_name"); String path =
	 * request.getSession().getServletContext().getRealPath("/resources/upload/" +
	 * f_name); String r_path = URLEncoder.encode(path, "UTF-8"); // 브라우저 설정
	 * response.setContentType("application/x-msdownload");
	 * response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
	 * 
	 * // 실제 가져오기 File file = new File(new String(path.getBytes(), "UTF-8"));
	 * FileInputStream in = new FileInputStream(file); OutputStream out =
	 * response.getOutputStream();
	 * 
	 * FileCopyUtils.copy(in, out);
	 * 
	 * } catch (Exception e) { System.out.println(e); } }
	 * 
	 * @PostMapping("/comment_insert") public ModelAndView getCommentInsert(CommVO
	 * cvo, @ModelAttribute("userId") String userId,
	 * 
	 * @ModelAttribute("cPage") String cPage) { ModelAndView mv = new
	 * ModelAndView("redirect:/tourTalk_detail"); int result =
	 * tourTalkService.getCommentInsert(cvo); return mv; }
	 * 
	 * @PostMapping("/comment_delete") public ModelAndView
	 * getCommentDelete(@RequestParam("c_idx") String
	 * c_idx, @ModelAttribute("userId") String userId,
	 * 
	 * @ModelAttribute("cPage") String cPage) { ModelAndView mv = new
	 * ModelAndView("redirect:/tourTalk_detail"); int result =
	 * tourTalkService.getCommentDelete(c_idx); return mv; }
	 */
	/*
	 * @RequestMapping("/tourTalk_delete") public ModelAndView
	 * getTourTalkDelete(@ModelAttribute("userId") String userId, @ModelAttribute("cPage")
	 * String cPage) { System.out.println("userId : " + userId); return new
	 * ModelAndView("TourTalk/delete"); }
	 * 
	 * @RequestMapping("/tourTalk_delete_ok") public ModelAndView
	 * getTourTalkDeleteOk(@RequestParam("pwd") String pwd, @ModelAttribute("userId")
	 * String userId,
	 * 
	 * @ModelAttribute("cPage") String cPage) { ModelAndView mv = new
	 * ModelAndView(); System.out.println("pwd : " + pwd);
	 * System.out.println("userId : " + userId); // 비밀번호 체크 TourTalkVO tourvo =
	 * tourTalkService.getTourTalkDetail(userId); String dbpwd = tourvo.getPwd(); if
	 * (passwordEncoder.matches(pwd, dbpwd)) { // 원글 삭제 // active 컬럼을 0 -> 1 로 변경하자.
	 * int result = tourTalkService.getTourTalkDelete(userId); if (result > 0) {
	 * mv.setViewName("redirect:/TourTalk"); return mv; } } else { // 비밀번호가 틀리다.
	 * mv.setViewName("TourTalk/delete"); mv.addObject("pwdchk", "fail"); return mv; }
	 * 
	 * return new ModelAndView("TourTalk/error"); }
	 */
	/*
	 * @PostMapping("/tourTalk_update") public ModelAndView
	 * getTourTalkUpdate(@ModelAttribute("userId") String userId, @ModelAttribute("cPage")
	 * String cPage) { ModelAndView mv = new ModelAndView("TourTalk/update"); // DB 에서
	 * userId를 이용해서 정보 가져오기 TourTalkVO tourvo = tourTalkService.getTourTalkDetail(userId); if (tourvo !=
	 * null) { mv.addObject("tourvo", tourvo); return mv; }
	 * 
	 * return null; }
	 * 
	 * @PostMapping("/tourTalk_update_ok") public ModelAndView getTourTalkUpdateOK(TourTalkVO tourvo,
	 * HttpServletRequest request, @ModelAttribute("cPage") String cPage,
	 * 
	 * @ModelAttribute("userId") String userId) {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * // 비밀번호 체크 TourTalkVO tourvo2 = tourTalkService.getTourTalkDetail(userId); String dbpwd =
	 * tourvo2.getPwd(); if (passwordEncoder.matches(tourvo.getPwd(), dbpwd)) { // 원글 수정
	 * try { String path =
	 * request.getSession().getServletContext().getRealPath("/resources/upload");
	 * MultipartFile file = tourvo.getFile_name(); String old_f_name =
	 * tourvo.getOld_f_name();
	 * 
	 * if (file.isEmpty()) { tourvo.setF_name(old_f_name); } else { UUID uuid =
	 * UUID.randomUUID(); String f_name = uuid.toString() + "_" +
	 * file.getOriginalFilename(); tourvo.setF_name(f_name);
	 * 
	 * // 실제업로드 file.transferTo(new File(path, f_name)); }
	 * 
	 * int result = tourTalkService.getTourTalkUpdate(tourvo); if (result > 0) {
	 * mv.setViewName("redirect:/tourTalk_detail"); return mv; } } catch (Exception e) {
	 * System.out.println(e); }
	 * 
	 * } else { // 비밀번호가 틀리다. mv.setViewName("TourTalk/update"); mv.addObject("pwdchk",
	 * "fail"); mv.addObject("tourvo", tourvo); return mv; }
	 * 
	 * return new ModelAndView("TourTalk/error");
	 * 
	 * }
	 */
}
