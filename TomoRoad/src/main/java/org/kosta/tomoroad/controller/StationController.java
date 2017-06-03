package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StationController {
	@Resource(name="stationServiceImpl")
	private StationService service;
	
	@RequestMapping("getStationInfo.do")
	public String getStationInfo(Model model,String id){
		List<StationVO> stationInfolist = service.getStationInfo(id);
		System.out.println("역 정보 : "+stationInfolist);
		model.addAttribute("stationInfolist",stationInfolist);
		return "station/GetStationInfo.tiles";
	}
	
	@RequestMapping("station/getKeyword.do")
	@ResponseBody
	//검색창에 입력한 단어가 들어가는 키워드를 가져옴
	public List<String> getKeyword(String keyword){
		System.out.println("keyword:"+keyword);
		List<String> searchResultList=service.getKeyword(keyword);
		System.out.println("리뷰 키워드 갖고온다 : "+searchResultList);
		
		return searchResultList;
	}
}
