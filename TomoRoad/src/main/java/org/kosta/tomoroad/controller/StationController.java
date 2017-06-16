package org.kosta.tomoroad.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.PlaceService;
import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StationController {
	@Resource(name="stationServiceImpl")
	private StationService service;
	@Resource(name="placeServiceImpl")
	private PlaceService placeSservice;
	
	//검색창에 입력한 단어가 들어가는 키워드를 가져옴
	@RequestMapping("station/getKeyword.do")
	@ResponseBody
	public List<String> getKeyword(String keyword){
		System.out.println("keyword:"+keyword);
		List<String> searchResultList=service.getKeyword(keyword);
		System.out.println("리뷰 키워드 갖고온다 : "+searchResultList);
		
		return searchResultList;
	}
	
	//역들의 이미지파일 이름,위치(지역구),역이름,역 설명을 가져와야함.
	@RequestMapping("station/getTourInfoData.do")
	public String getTourInfoData(Model model){ 
		List<StationVO> getTourInfoList=service.getTourInfoData();
		System.out.println(getTourInfoList);
		model.addAttribute("getTourInfoList",getTourInfoList);
		return "station/tourinfo.tiles";
	}
	
	//특정 역 정보(이름,설명)를 가져오는 것. 역이름과 설명. 그리고 주변 관광지 정보도 가져온다
	@RequestMapping("station/getDetailInfo.do")
	public String getDetailInfo(Model model,String name){ //name : 역 이름
		StationVO detailInfoVO = service.getDetailInfo(name); //역정보
		
		List<PlaceVO> aroundPlaceVO = placeSservice.getPlaceInfo(name);
		
		model.addAttribute("detailInfoVO",detailInfoVO); //특정 역 정보
		model.addAttribute("aroundPlaceVO",aroundPlaceVO); //주변 관광지 정보
		System.out.println("station에서 역 정보 : "+detailInfoVO);
		System.out.println("station에서 역 주변 리스트 : "+aroundPlaceVO);
		return "station/detail_info.tiles";
	}
	
	//메인페이지 관련 컨트롤러
		@RequestMapping("station/noauth_getAllStationInfo.do")
		@ResponseBody
		public List<StationVO> getAllStationInfo() throws IOException{
			return service.getAllStationInfo();
		}
	

}
