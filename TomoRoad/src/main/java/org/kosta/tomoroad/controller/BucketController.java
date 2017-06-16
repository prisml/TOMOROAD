package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.BucketService;
import org.kosta.tomoroad.model.vo.BucketVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BucketController {
	@Resource(name="bucketServiceImpl")
	private BucketService service;
	
	@RequestMapping("bucket/addBucket.do")
	@ResponseBody
	public String addBucket(BucketVO vo){
		if(service.findBucket(vo)==0){
			service.insertBucket(vo);
			return "ok";
		}else{
			return "fail";
		}
	}
}
