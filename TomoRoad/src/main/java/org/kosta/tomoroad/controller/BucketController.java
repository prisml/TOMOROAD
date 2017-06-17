package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.BucketService;
import org.kosta.tomoroad.model.vo.BucketVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("bucket/deleteBucket.do")
	public String deleteBucket(BucketVO vo){
		service.deleteBucket(vo);
		return "bucket/deleteBucket_result.tiles";
	}
	
	@RequestMapping("bucket/bucketList.do")
	public String bucketList(String id,Model model){
		model.addAttribute("bvo",service.selectBucketList(id));
		return "bucket/bucketPage.tiles";
	}
	@RequestMapping("bucket/deletechecked.do")
	@ResponseBody
	public List<BucketVO> deletechecked(String list,String id){
		System.out.println(list);
		BucketVO vo=new BucketVO();
		vo.setId(id);
		String[] names = list.split("역");
		for(int i=0;i<names.length;i++){
			vo.setName(names[i]+"역");
			service.deleteBucket(vo);
		}
		return service.selectBucketList(id);
	}
}
	