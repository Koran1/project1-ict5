package com.ict.mytravellist.ADD.dao;

import java.util.List;

import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

public interface AddDAO {
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
	
	// QNA 상세화면
	public QNAVO getQNADetail(String qnaIdx);
	
	// QNA 상세화면-관리자
	public QNAVO getQNADetailAdmin(String qnaIdx);
}