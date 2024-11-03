package com.ict.mytravellist.MAIN.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.MAIN.dao.TourTalkDAO;
import com.ict.mytravellist.vo.TourTalkVO;

@Service
public class TourTalkServiceImpl implements TourTalkService{

	@Autowired
	private TourTalkDAO tourTalkDAO; 
	
	@Override
	public List<TourTalkVO> getTourTalkList() {
		return tourTalkDAO.getTourTalkList();
	}

	@Override
	public int getTourTalkInsert(TourTalkVO tourtvo) {
		return tourTalkDAO.getTourTalkInsert(tourtvo);
	}

	@Override
	public TourTalkVO getTourTalkDetail(String userIdx) {
		return tourTalkDAO.getTourTalkDetail(userIdx);
	}

	/*
	 * @Override public int getTourTalkDelete(String userIdx) { return
	 * tourDAO.getTourTalkDelete(userIdx); }
	 * 
	 * @Override public int getTourTalkUpdate(TourTalkVO bvo) { return
	 * tourDAO.getTourTalkUpdate(bvo); }
	 */

	@Override
	public int getHitUpdate(String userIdx) {
		return tourTalkDAO.getHitUpdate(userIdx);
	}

	@Override
	public void insertTourTalk(TourTalkVO tourTalkVO) {
		tourTalkDAO.insertTourTalk(tourTalkVO);
		
	}

	/*
	 * @Override public int getTotalCount() { return tourDAO.getTotalCount(); }
	 * 
	 * @Override public List<TourTalkVO> getTourTalkList(int offset, int limit) { return
	 * tourDAO.getTourTalkList(offset, limit); }
	 * 
	 * @Override public List<CommVO> getCommentList(String userIdx) { return
	 * tourDAO.getCommentList(userIdx); }
	 * 
	 * @Override public int getCommentInsert(CommVO cvo) { return
	 * tourDAO.getCommentInsert(cvo); }
	 * 
	 * @Override public int getCommentDelete(String c_idx) { return
	 * tourDAO.getCommentDelete(c_idx); }
	 */

}
