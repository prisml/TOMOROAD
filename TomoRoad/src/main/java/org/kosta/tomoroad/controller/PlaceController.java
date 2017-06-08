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
	
	@RequestMapping("noauth_getPlaceInfo.do")
	public String getPlaceInfo(String id,Model model){ //나중에 역정보게시판에서 관광지 가져올 때 쓸거야
		List<PlaceVO> placeInfoList=service.getPlaceInfo(id);
		System.out.println("역 주변 정보 : "+placeInfoList);
		model.addAttribute("placeInfoList",placeInfoList);
		return "place/getPlaceInfo.tiles";
	}
	
	@RequestMapping("place/getKeyword.do")
	@ResponseBody
	public List<String> getKeyWord(String keyword){
		List<String> keywordList=service.getKeyWord(keyword);
		System.out.println("place 키워드 갖고온다 : "+keywordList);
		return keywordList;
	}
}
