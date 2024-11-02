package com.ict.mytravellist.ADD.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.ADD.dao.AddDAO;
import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

@Service
public class AddServiceImpl implements AddService {
	
	@Autowired
	private AddDAO addDAO;

	@Override
	public List<NoticeVO> getNoticeList() {
		return addDAO.getNoticeList();
	}

	@Override
	public List<NoticeVO> getNoticeList2() {
		return addDAO.getNoticeList2();
	}
	
	@Override
	public NoticeVO getNoticeDetail(String noticeIdx) {
		return addDAO.getNoticeDetail(noticeIdx);
	}

	@Override
	public List<FAQVO> getFAQList() {
		return addDAO.getFAQList();
	}

	@Override
	public List<QNAVO> getQNAList() {
		return addDAO.getQNAList();
	}

	@Override
	public int getQNAInsert(QNAVO qnavo) {
		return addDAO.getQNAInsert(qnavo);
	}

	@Override
	public QNAVO getQNADetail(String qnaIdx) {
		return addDAO.getQNADetail(qnaIdx);
	}

	@Override
	public QNAVO getQNADetailAdmin(String qnaIdx) {
		return addDAO.getQNADetail(qnaIdx);
	}

	@Override
	public int getTotalCount() {
		return addDAO.getTotalCount();
	}

	@Override
	public List<FAQVO> getFAOList(int offset, int limit) {
		return addDAO.getFAOList(offset, limit);
	}

	@Override
	public List<QNAVO> getQNAList(int offset, int limit) {
		return addDAO.getQNAList(offset, limit);
	}

	@Override
	public List<NoticeVO> getNoticeSearch(String keyword) {
		return addDAO.getNoticeSearch(keyword);
	}
}