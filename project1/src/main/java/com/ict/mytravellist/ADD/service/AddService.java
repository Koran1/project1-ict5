package com.ict.mytravellist.ADD.service;

import java.util.List;

import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

public interface AddService {
	// 공지사항 초기화면
	public List<NoticeVO> getNoticeList();
	public List<NoticeVO> getNoticeList2();
	
	// 공지사항 상세화면
	public NoticeVO getNoticeDetail(String noticeIdx);
	
	// FAQ 초기화면
	public List<FAQVO> getFAQList();
	
	// QNA 초기화면
	public List<QNAVO> getQNAList();
	
	// QNA 작성화면
	public int getQNAInsert(QNAVO qnavo);
	
	// QNA 상세화면-User
	public QNAVO getQNADetail(String qnaIdx);
	
	// QNA 상세화면-관리자
	public QNAVO getQNADetailAdmin(String qnaIdx);
	
	// FAQ 페이징 처리 - 전체 게시물의 수
	public int getTotalCount();
	
	// FAQ 페이징 처리를 위한 리스트
	public List<FAQVO> getFAOList(int offset, int limit);
	
	// QNA 페이징 처리를 위한 리스트
	public List<QNAVO> getQNAList(int offset, int limit);
	
	// 공지사항 검색 기능
	public List<NoticeVO> getNoticeSearch(String keyword);
}