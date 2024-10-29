package com.ict.mytravellist.WTHR.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.WTHR.vo.PJWeatherVO;
import com.ict.mytravellist.WTHR.vo.ResultMapVO;
import com.ict.mytravellist.WTHR.vo.WeatherVO;

@Repository
public class WeatherDAOImpl implements WeatherDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public WeatherVO getRegInfo(String region) {
		return sqlSessionTemplate.selectOne("reginfo.getreginfo", region);
	}

	@Override
	public int insertWthrInfo(PJWeatherVO pvo) {
		return sqlSessionTemplate.insert("reginfo.insertwthrinfo", pvo);
	}

	@Override
	public int deleteWthrInfo() {
		return sqlSessionTemplate.delete("reginfo.delete");
	}

	@Override
	public List<PJWeatherVO> getWthrInfo(String region) {
		return sqlSessionTemplate.selectList("reginfo.getwhtrinfo", region);
	}

	@Override
	public List<ResultMapVO> getWthrInfo2(String region) {
		return sqlSessionTemplate.selectList("reginfo.getwhtrinfo2", region);
	}

	@Override
	public List<ResultMapVO> getWthrInfo3(String region) {
		return sqlSessionTemplate.selectList("reginfo.getwhtrinfo3", region);
	}

}
