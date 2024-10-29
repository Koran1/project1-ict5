package com.ict.mytravellist.PLAN.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.PLAN.vo.TravelDBVO;

@Repository
public class TravelDAOImpl implements TravelDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TravelDBVO> selectTravelList() {
		return sqlSessionTemplate.selectList("traveldb.list");
	}

	@Override
	public TravelDBVO selectOne(String travelIdx) {
		return sqlSessionTemplate.selectOne("traveldb.onelist", travelIdx);
	}

	@Override
	public TravelDBVO selectOneReg(String region) {
		return sqlSessionTemplate.selectOne("traveldb.onereg", region);
	}
	
	
}
