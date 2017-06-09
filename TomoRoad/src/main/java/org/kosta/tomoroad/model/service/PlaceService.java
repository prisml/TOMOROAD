package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.PlaceVO;

public interface PlaceService {

	List<String> getKeyWord(String keyword);
	List<PlaceVO> getPlaceInfo(String name);

}