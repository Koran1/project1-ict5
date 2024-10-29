package com.ict.mytravellist.WTHR.dao;

import java.util.List;

import com.ict.mytravellist.WTHR.vo.ResultMapVO;
import com.ict.mytravellist.vo.WeatherVO;
import com.ict.mytravellist.WTHR.vo.RegionVO;

public interface WeatherDAO {
	public RegionVO getRegInfo(String region);
	public List<WeatherVO> getWthrInfo(String region);
	public List<ResultMapVO> getWthrInfo2(String region);
	public List<ResultMapVO> getWthrInfo3(String region);
	public int insertWthrInfo(WeatherVO pvo);
	public int deleteWthrInfo();
}
