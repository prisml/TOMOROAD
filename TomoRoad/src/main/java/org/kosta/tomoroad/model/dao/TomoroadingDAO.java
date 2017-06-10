package org.kosta.tomoroad.model.dao;

import org.kosta.tomoroad.model.vo.StationVO;

public interface TomoroadingDAO {

	StationVO locationInfo(String name);

}