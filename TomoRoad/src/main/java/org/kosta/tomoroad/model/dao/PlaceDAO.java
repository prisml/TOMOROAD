package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.PlaceVO;

public interface PlaceDAO {

	List<PlaceVO> getPlaceInfo(String id);

	List<String> getKeyWord(String keyword);

}
