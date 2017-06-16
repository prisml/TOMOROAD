package org.kosta.tomoroad.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.MapService;
import org.kosta.tomoroad.model.vo.MapVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {
	@Resource(name="mapServiceImpl")
	private MapService service;
	
	@RequestMapping("home.do")
	public String getAllStationInfo(Model model,HttpSession session){
		MemberVO vo= (MemberVO)session.getAttribute("mvo");
		if(vo==null){//멤버가 로그인하지 않았을 시에는 비로그인 상태의 데이터를 반환해 옵니다.
			model.addAttribute("station",service.getAllStationInfo(""));
			model.addAttribute("size",service.getAllStationInfo("").size());//미리 배열의 크기를 조절해주기 위해 사용합니다.
			
		}else{// 멤버가 로그인을 했을시에는 해당멤버의 리뷰글 조회를하여, 갔던역에 대한 마커정보를 바꿔줍니다.
			model.addAttribute("station",service.getAllStationInfo(vo.getId()));
			model.addAttribute("size",service.getAllStationInfo(vo.getId()).size());
		}
		return "home.tiles";
	}
	@RequestMapping("noauth_weatherInfo.do")
	@ResponseBody
	public String weatherInfo(Model model,MapVO vo) throws IOException{		
		return service.weatherInfo(vo);
	}
}
