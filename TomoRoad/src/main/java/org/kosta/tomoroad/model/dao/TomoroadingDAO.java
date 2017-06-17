package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.ConnectionVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface TomoroadingDAO {

	StationVO locationInfo(String name);

	List<ConnectionVO> getConnectionList();

	StationVO getStationInfo(String depart);

	List<StationVO> getStationList();

	int getNumberOfStation();

}