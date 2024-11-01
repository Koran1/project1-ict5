package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.TourTalkVO;
import com.ict.project.vo.UserVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	@Override
	public String getUserUpdate(UserVO uvo) throws Exception{
		int result = sqlsessionTemplate.update("projectMapper.getUserUpdate", uvo);
		return String.valueOf(result);
	}
	@Override
	public List<TourTalkVO> getTTList(String userId,  int offset, int limit) throws Exception{ // 투어톡 select all
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("offset", offset);
		map.put("limit",  limit);
		return sqlsessionTemplate.selectList("projectMapper.getTTList", map);
	}
	@Override
	public String delTTOne(String tourTalkIdx) throws Exception {
		return String.valueOf(sqlsessionTemplate.delete("projectMapper.delTTOne", tourTalkIdx)) ;
	}
	@Override
	public String delTTChked(String[] chkedIdx) throws Exception {
		return String.valueOf(sqlsessionTemplate.delete("projectMapper.delTTChked", chkedIdx)) ;
	}
	@Override
	public UserVO getUserDetail(String userId) throws Exception {
		return sqlsessionTemplate.selectOne("projectMapper.getUserDetail", userId);
	}
	@Override
	public int countData(String userId) throws Exception {
		return sqlsessionTemplate.selectOne("projectMapper.countData", userId);
	}

}
