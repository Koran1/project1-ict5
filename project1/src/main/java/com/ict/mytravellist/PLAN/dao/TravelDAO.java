package com.ict.mytravellist.PLAN.dao;

import java.util.List;

import com.ict.mytravellist.PLAN.vo.TravelDBVO;

public interface TravelDAO {
	public List<TravelDBVO> selectTravelList();
	public TravelDBVO selectOne(String travelIdx);
	public TravelDBVO selectOneReg(String region);
}
