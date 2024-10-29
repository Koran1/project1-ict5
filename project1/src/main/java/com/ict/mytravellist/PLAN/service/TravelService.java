package com.ict.mytravellist.PLAN.service;

import java.util.List;

import com.ict.mytravellist.PLAN.vo.TravelDBVO;

public interface TravelService {
	public List<TravelDBVO> selectTravelList();
	public TravelDBVO selectOne(String travelIdx);
	public TravelDBVO selectOneReg(String region);
}
