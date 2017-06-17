package org.kosta.tomoroad.model.service;

import java.io.IOException;
import java.util.List;

import org.kosta.tomoroad.model.vo.MapVO;

public interface MapService {

	List<MapVO> getAllStationInfo(String name);

	String weatherInfo(MapVO vo) throws IOException;

}