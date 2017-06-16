package org.kosta.tomoroad.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.StationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	@Resource(name="stationServiceImpl")
	private StationService service;
	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName) {
		//System.out.println("@PathVariable:" + viewName);
		return viewName + ".tiles";
	}
	
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName, @PathVariable String viewName) {
		//System.out.println("@PathVariable:" + dirName + "/" + viewName);
		return dirName + "/" + viewName + ".tiles";
	}
	@RequestMapping("loginalert.do")
	public String loginAlert(){
		return "loginalert";
	}
	@RequestMapping("home.do")
	public String home(Model model) throws IOException{
		model.addAttribute("station",service.getAllStationInfo());
		return "home.tiles";
	}
}
