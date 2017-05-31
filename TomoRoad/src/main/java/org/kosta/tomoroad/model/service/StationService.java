package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface StationService {

	StationVO getInfo(String id);

	List<StationVO> getList();

}
