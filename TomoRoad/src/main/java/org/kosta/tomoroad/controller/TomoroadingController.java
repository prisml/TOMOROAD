package org.kosta.tomoroad.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.TomoroadingService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TomoroadingController {
	@Resource(name="tomoroadingServiceImpl")
	private TomoroadingService service;
	
	@RequestMapping("tomoroading/tomoroading.do")
	public String tomoroading_result(Model model,String names){
		System.out.println(names);
		String[] listarray = names.split("역");
		List<String> namelist= new ArrayList<String>();
		for(int i=0;i<listarray.length;i++){
			namelist.add(listarray[i]+"역");
		}
		model.addAttribute("locationNames", namelist);
		return "tomoroading/tomoroading_result.tiles";
	}
	
	@RequestMapping("tomoroad/makeRoute.do")
	public String makeRoute(String station[],String depart,String destination,Model model){
		List<String> list= service.makeRoute(station, depart, destination);//투머로딩.
		List<StationVO> stationList= new ArrayList<StationVO>();
		if(list.isEmpty()){//투머로딩이 안됐으면 fail로보낸다.
			return "tomoroading/fail.tiles";
		}else{
			for(int i=list.size()-1;i>=0;i--){
				//넣었던 정보들을 리스트에 담을때 넣었던 순서대로 뽑기위해
				//for문을반대로 돌린다.
				stationList.add(service.locationInfo(list.get(i)));
			}
			model.addAttribute("station",station);//사용자가 선택한 역들의 정보를 보냄
			model.addAttribute("names",stationList);//투머로딩의 결과들을 보냄
			return "tomoroading/tomoroading_result.tiles";
		}
	}
	@RequestMapping("tomoroading/travel.do")
	public String travel(String names,String waypoint,String depart,String destination,String id){
		//자신이 선택한 여행지를 투머로딩에 나온 순서대로 배치시켜 db에 넣기위한 컨트롤러이다.
		String[] nameslist = names.split(",");//
		String[] waypoints = waypoint.split(",");
		String list = "";
 		list += depart+",";//맨처음 스트링 list에 출발역을 넣고
		for(int a=0;a<waypoints.length;a++){
				for(int i=0;i<nameslist.length;i++){
				if(nameslist[i].equals(waypoints[a])){
					if(list.contains(waypoints[a])){//만약 선택한 경로를 여러번 들리게될 경우, 처음한번만 넣어주기위한 조건문 
					}else
					list += waypoints[a]+",";//경유지들을 계속 누적시킨다.
					}else{
					
				}
			}
		}
		list += destination; //최종적으로 목적지를 넣는다.
		service.travel(id, list);
		return "redirect:travelStart.do";
	}
	@RequestMapping("tomoroading/check.do")
	@ResponseBody
	public int check(String id){
		//ajax방식으로 체크된값을 int형으로 반환
		System.out.println(id);
		return service.traveling(id);
	}
}
