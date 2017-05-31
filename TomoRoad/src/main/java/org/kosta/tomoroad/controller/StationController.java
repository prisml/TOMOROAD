package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StationController {
	@Resource(name="stationServiceImpl")
	private StationService service;
	
	@RequestMapping("getStationInfo.do")
	public String getStationInfo(Model model,String id){
		StationVO stationInfo = service.getInfo(id);
		System.out.println("역 정보 : "+stationInfo);
		model.addAttribute("stationInfolist",stationInfo);
		return "station/info.tiles";
	}
}
