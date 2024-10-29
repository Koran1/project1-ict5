package com.ict.mytravellist.WTHR.dao;

import java.util.List;

import com.ict.mytravellist.WTHR.vo.PJWeatherVO;
import com.ict.mytravellist.WTHR.vo.ResultMapVO;
import com.ict.mytravellist.WTHR.vo.WeatherVO;

public interface WeatherDAO {
	public WeatherVO getRegInfo(String region);
	public List<PJWeatherVO> getWthrInfo(String region);
	public List<ResultMapVO> getWthrInfo2(String region);
	public List<ResultMapVO> getWthrInfo3(String region);
	public int insertWthrInfo(PJWeatherVO pvo);
	public int deleteWthrInfo();
}
