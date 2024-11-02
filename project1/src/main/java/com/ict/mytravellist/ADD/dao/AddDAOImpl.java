package com.ict.mytravellist.ADD.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.vo.FAQVO;
import com.ict.mytravellist.vo.NoticeVO;
import com.ict.mytravellist.vo.QNAVO;

@Repository
public class AddDAOImpl implements AddDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<NoticeVO> getNoticeList() {
		return sqlSessionTemplate.selectList("adds.noticeList");
	}

	@Override
	public List<NoticeVO> getNoticeList2() {
		return sqlSessionTemplate.selectList("adds.noticeList2");
	}
	
	@Override
	public NoticeVO getNoticeDetail(String noticeIdx) {
		return sqlSessionTemplate.selectOne("adds.noticeDetail", noticeIdx);
	}

	@Override
	public List<FAQVO> getFAQList() {
		return sqlSessionTemplate.selectList("adds.faqList");
	}

	@Override
	public List<QNAVO> getQNAList() {
		return sqlSessionTemplate.selectList("adds.qnaList");
	}

	@Override
	public int getQNAInsert(QNAVO qnavo) {
		return sqlSessionTemplate.update("adds.qnaInsert", qnavo);
	}

	@Override
	public QNAVO getQNADetail(String qnaIdx) {
		return sqlSessionTemplate.selectOne("adds.qnaDetail", qnaIdx);
	}

	@Override
	public QNAVO getQNADetailAdmin(String qnaIdx) {
		return sqlSessionTemplate.selectOne("adds.qnaDetailAdmin", qnaIdx);
	}

	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("adds.faqCount");
	}

	@Override
	public List<FAQVO> getFAOList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("adds.faqPageList", map);
	}

	@Override
	public List<QNAVO> getQNAList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("adds.qnaPageList", map);
	}

	@Override
	public List<NoticeVO> getNoticeSearch(String keyword) {
		return sqlSessionTemplate.selectList("adds.noticeSearch", keyword);
	}
}