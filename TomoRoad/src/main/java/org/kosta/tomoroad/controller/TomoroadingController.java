package org.kosta.tomoroad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.service.TomoroadingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TomoroadingController {
	@Resource(name="tomoroadingServiceImpl")
	private TomoroadingService service;
	
	@RequestMapping("tomoroading/tomoroading.do")
	public String tomoroading_result(Model model,HttpServletRequest request){
		System.out.println("접근한거맞음?");
		request.getAttribute("list");
		return "tomoroading/tomoroading_result.tiles";
	}
}
