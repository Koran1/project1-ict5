package com.ict.mytravellist.WTHR.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.WTHR.dao.WeatherDAO;
import com.ict.mytravellist.WTHR.vo.ResultMapVO;
import com.ict.mytravellist.vo.WeatherVO;
import com.ict.mytravellist.WTHR.vo.RegionVO;

@Service
public class WeatherServiceImpl implements WeatherService{

	@Autowired
	private WeatherDAO weatherDAO;
	
	@Override
	public RegionVO getRegInfo(String region) {
		return weatherDAO.getRegInfo(region);
	}

	@Override
	public int insertWthrInfo(WeatherVO pvo) {
		return weatherDAO.insertWthrInfo(pvo);
	}

	@Override
	public int deleteWthrInfo() {
		return weatherDAO.deleteWthrInfo();
	}

	@Override
	public List<WeatherVO> getWthrInfo(String region) {
		return weatherDAO.getWthrInfo(region);
	}
	
	@Override
	public List<ResultMapVO> getWthrInfo2(String region) {
		return weatherDAO.getWthrInfo2(region);
	}

	@Override
	public List<ResultMapVO> getWthrInfo3(String region) {
		return weatherDAO.getWthrInfo3(region);
	}

}
