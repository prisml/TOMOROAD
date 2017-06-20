package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.ConnectionVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.kosta.tomoroad.model.vo.TravelVO;

public interface TomoroadingDAO {

	StationVO locationInfo(String name);

	List<ConnectionVO> getConnectionList();

	StationVO getStationInfo(String depart);

	List<StationVO> getStationList();

	int getNumberOfStation();

	void travel(TravelVO tvo);

	TravelVO travelChecking(TravelVO tvo);

	void endTravel(TravelVO tvo);

	void reTravel(TravelVO tvo);
	
	String getTravelRoute(String id);

}