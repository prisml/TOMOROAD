package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.StationVO;

public interface TomoroadingService {

	StationVO locationInfo(String name);

	List<String> makeRoute(String[] station, String depart, String arrived);

	void travel(String id, String list);
	
	String getTravelRoute(String id);

	int traveling(String id);
	
	void updateTravelFlag(String id);

}