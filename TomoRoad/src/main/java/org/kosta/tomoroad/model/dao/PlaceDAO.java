package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.PlaceVO;

public interface PlaceDAO {

	List<String> getKeyWord(String keyword);
	List<PlaceVO> getPlaceInfo(String name);

}
