package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.MapVO;

public interface MapDAO {

	List<MapVO> getAllStationInfo(String name);

}