package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.PlaceService;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaceController {
	@Resource(name="placeServiceImpl")
	private PlaceService service;
	
	@RequestMapping("place/getKeyword.do")
	@ResponseBody
	public List<String> getKeyWord(String keyword){
		List<String> keywordList=service.getKeyWord(keyword);
		System.out.println("place 키워드 갖고온다 : "+keywordList);
		return keywordList;
	}
	
	//역정보 게시판에서 특정 역의 주변 관광지 목록들을 가져옴
	@RequestMapping("place/getPlaceInfo.do")
	public String getPlaceInfo(String name,Model model){ //name:역 이름
		System.out.println("name="+name);
		List<PlaceVO> placeInfoList=service.getPlaceInfo(name);
		System.out.println("역 주변 정보 : "+placeInfoList);
		model.addAttribute("placeInfoList",placeInfoList);
		return "place/detail_info.tiles";
	}

}
