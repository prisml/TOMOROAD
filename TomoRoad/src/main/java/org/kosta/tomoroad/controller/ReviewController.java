package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource(name="reviewServiceImpl")
	private ReviewService service;
	
	@RequestMapping("review/showList.do")
	public ModelAndView showList(String page){
		if(page==null)
			page="1";
		return new ModelAndView("review/showList.tiles","reviewMap",service.getList(page));
	}
	
	@RequestMapping(name="review/register.do")
	public ModelAndView register(ReviewVO vo){
		String no="";
		return new ModelAndView("review/detail.tiles?no="+no);
	}
}
