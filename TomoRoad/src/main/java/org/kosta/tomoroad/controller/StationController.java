package org.kosta.tomoroad.controller;

import java.util.List;

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
	public String getStationInfo(Model model){
		List<StationVO> stationInfolist = service.getStationInfo();
		model.addAttribute("stationInfolist",stationInfolist);
		return "station/getStationInfo.tiles";
	}
}
