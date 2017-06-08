package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface StationDAO {


	List<String> getKeyword(String keyword);

	List<StationVO> getTourInfoData();

	StationVO getDetailInfo(String name);
	
	
	
}
