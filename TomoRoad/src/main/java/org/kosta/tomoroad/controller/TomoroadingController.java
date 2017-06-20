package org.kosta.tomoroad.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.TomoroadingService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<String> list= service.makeRoute(station, depart, destination);
		List<StationVO> stationList= new ArrayList<StationVO>();
		if(list.isEmpty()){
			return "tomoroading/fail.tiles";
		}else{
			for(int i=list.size()-1;i>=0;i--){
				stationList.add(service.locationInfo(list.get(i)));
			}
			model.addAttribute("station",station);
			model.addAttribute("names",stationList);
			return "tomoroading/tomoroading_result.tiles";
		}
	}
	@RequestMapping("tomoroading/travel.do")
	public String travel(String names,String waypoint,String depart,String destination,String id){
		String[] nameslist = names.split(",");
		String[] waypoints = waypoint.split(",");
		String list = "";
 		list += depart+",";
		for(int a=0;a<waypoints.length;a++){
				for(int i=0;i<nameslist.length;i++){
				if(nameslist[i].equals(waypoints[a])){
					list += waypoints[a]+",";
				}else{
					
				}
			}
		}
		list += destination;
		service.travel(id, list);
		return "redirect:travelStart.do";
	}
}
