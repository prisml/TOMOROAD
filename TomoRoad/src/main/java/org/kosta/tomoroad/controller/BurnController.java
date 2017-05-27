package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.BurnService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BurnController {
	@Resource(name="burnServiceImpl")
	private BurnService burnService;
	
	@RequestMapping("getBurnList.do")
	public ModelAndView getBurnList(String pageNo){
		return new ModelAndView("burn/burnlist.tiles","lvo",burnService.getBurnList(pageNo));			
	}
	
}
