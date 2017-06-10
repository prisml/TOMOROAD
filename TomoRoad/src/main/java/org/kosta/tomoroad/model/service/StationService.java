package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface StationService {

	List<String> getKeyword(String keyword);

	List<StationVO> getTourInfoData();

	StationVO getDetailInfo(String name);

	List<StationVO> getAllStationInfo();

}
