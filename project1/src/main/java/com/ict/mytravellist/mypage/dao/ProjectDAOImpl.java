package com.ict.mytravellist.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.vo.TourTalkVO;
import com.ict.mytravellist.vo.UserVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	@Override
	public String getUserUpdate(UserVO uvo) throws Exception{
		int result = sqlsessionTemplate.update("mypage.getUserUpdate", uvo);
		return String.valueOf(result);
	}
	@Override
	public List<TourTalkVO> getTTList(String userId,  int offset, int limit) throws Exception{ // ?��?��?�� select all
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("offset", offset);
		map.put("limit",  limit);
		return sqlsessionTemplate.selectList("mypage.getTTList", map);
	}
	@Override
	public String delTTOne(String tourTalkIdx) throws Exception {
		return String.valueOf(sqlsessionTemplate.delete("mypage.delTTOne", tourTalkIdx)) ;
	}
	@Override
	public String delTTChked(String[] chkedIdx) throws Exception {
		return String.valueOf(sqlsessionTemplate.delete("mypage.delTTChked", chkedIdx)) ;
	}
	@Override
	public UserVO getUserDetail(String userId) throws Exception {
		return sqlsessionTemplate.selectOne("mypage.getUserDetail", userId);
	}
	@Override
	public int countData(String userId) throws Exception {
		return sqlsessionTemplate.selectOne("mypage.countData", userId);
	}
	@Override
	public int getChangePw(UserVO uvo) throws Exception {
		return sqlsessionTemplate.update("mypage.getChangePw", uvo);
	}
	@Override
	public int getUserOut(String userId) throws Exception {
		return sqlsessionTemplate.update("mypage.getUserOut", userId);
	}

}
