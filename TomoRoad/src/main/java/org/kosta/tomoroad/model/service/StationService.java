package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface StationService {

	List<StationVO> getStationInfo(String id);

	List<String> getKeyword(String keyword);

}
