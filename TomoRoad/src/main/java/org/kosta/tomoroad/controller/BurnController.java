package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.burn.BurnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BurnController {
	@Resource
	private BurnService burnService;
	
	@RequestMapping("getBurnList.do")
	public ModelAndView getBurnList(Model model, String pageNo){
		return new ModelAndView("burn/burnlist.tiles","lvo",burnService.getBurnList(pageNo));			
	}
	
}
