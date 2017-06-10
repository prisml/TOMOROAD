package org.kosta.tomoroad.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		String[] listarray = names.split(",");
		List<String> namelist= new ArrayList<String>();
		System.out.println(listarray.length);
		for(int i=0;i<listarray.length;i++){
			System.out.println(listarray[i]);
			namelist.add(listarray[i]);
		}
		System.out.println(namelist.size());
		model.addAttribute("locationNames", namelist);
		return "tomoroading/tomoroading_result.tiles";
	}
	
	@RequestMapping("tomoroading/route.do")
	@ResponseBody
	public List<StationVO> Tomoroading(HttpServletRequest request){
		String names=request.getParameter("names");
		String[] listarray=names.split(",");
		List<String> namelist= new ArrayList<String>();
		List<StationVO> list=new ArrayList<StationVO>();
		System.out.println(listarray.length);
		for(int i=0;i<listarray.length;i++){
			System.out.println(listarray[i]);
			namelist.add(listarray[i]);
		}
		for(int i=0;i<namelist.size();i++){
			list.add(service.locationInfo(namelist.get(i)));
		}
		System.out.println(namelist.size());
		return list;
	}
}
