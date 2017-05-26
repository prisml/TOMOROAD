package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.StationService;
import org.kosta.tomoroad.model.StationVO;
import org.springframework.stereotype.Controller;

@Controller
public class StationController {
	@Resource(name="stationServiceImpl")
	private StationService service;
	
	public String getStationInfo(){
		List<StationVO> list = service.getStationInfo();
		return "";
	}
}
