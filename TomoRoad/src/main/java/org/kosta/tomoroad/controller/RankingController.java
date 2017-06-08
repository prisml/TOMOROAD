package org.kosta.tomoroad.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.RankingService;
import org.kosta.tomoroad.model.vo.RankingVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RankingController {
	@Resource(name="rankingServiceImpl")
	private RankingService service;
	
	@RequestMapping("hotplace/noauth_hotplace.do")
	public String mapInfo(){
		return "hotplace/hotplace.tiles";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("noauth_rankingLocation.do")
	@ResponseBody
	public List rankingLocation(){
		System.out.println("ajax통신중?");
		List<StationVO> list=service.mapInfo();
		List locationList=new ArrayList();
		for(int i=0;i<list.size();i++){
			Map map=new LinkedHashMap();
			map.put("lat", list.get(i).getLat());
			map.put("lng", list.get(i).getLng());
			locationList.add(map);
		}
		return locationList;
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("noauth_rankingInfo.do")
	@ResponseBody
	public List rankingInfo(){
		System.out.println("ajax통신중?");
		List<RankingVO> list=service.rankingInfo();
		return list;
	}
	
}
