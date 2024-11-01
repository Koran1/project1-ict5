package com.ict.mytravellist.MAIN.dao;

import java.util.List; 


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.vo.TourTalkVO;

@Repository
public class TourTalkDAOImpl implements TourTalkDAO{
     
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<TourTalkVO> getTourTalkList() {
		return sqlSessionTemplate.selectList("tourTalk.list");
	}

	@Override
	public int getTourTalkInsert(TourTalkVO tourtvo) {
		return sqlSessionTemplate.insert("tourTalk.insert", tourtvo);
	}

	@Override
	public TourTalkVO getTourTalkDetail(String userIdx) {
		return sqlSessionTemplate.selectOne("tourTalk.detail", userIdx);
	}

	/*
	 * @Override public int getTourTalkDelete(String userIdx) { return
	 * sqlSessionTemplate.update("TourTalk.delete", userIdx); }
	 * 
	 * @Override public int getTourTalkUpdate(TourTalkVO tourvo) { return
	 * sqlSessionTemplate.update("TourTalk.update", tourvo); }
	 */

	@Override
	public int getHitUpdate(String userIdx) {
		return sqlSessionTemplate.update("tourTalk.hitupdate", userIdx);
	}

	/*
	 * @Override public int getTotalCount() { return
	 * sqlSessionTemplate.selectOne("TourTalk.count"); }
	 * 
	 * @Override public List<TourTalkVO> getTourTalkList(int offset, int limit) { Map<String,
	 * Integer> map = new HashMap<String, Integer>(); map.put("limit", limit);
	 * map.put("offset", offset);
	 * 
	 * return sqlSessionTemplate.selectList("TourTalk.pageList", map); }
	 * 
	 * @Override public List<CommVO> getCommentList(String userIdx) { return
	 * sqlSessionTemplate.selectList("TourTalk.clist", userIdx); }
	 * 
	 * @Override public int getCommentInsert(CommVO cvo) { return
	 * sqlSessionTemplate.insert("TourTalk.cinsert", cvo); }
	 * 
	 * @Override public int getCommentDelete(String c_idx) { return
	 * sqlSessionTemplate.delete("TourTalk.cdelete", c_idx); }
	 */

}
