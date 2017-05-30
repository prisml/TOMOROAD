package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.BurnService;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BurnController {
	@Resource(name="burnServiceImpl")
	private BurnService burnService;
	
	@RequestMapping("getBurnList.do")
	public ModelAndView getBurnList(String pageNo){
		return new ModelAndView("burn/burnlist.tiles","lvo",burnService.getBurnList(pageNo));			
	}
	
	@RequestMapping("showBurnDetail.do")
	public ModelAndView showBurnDetail(String no,Model model){
		burnService.updateHits(no);
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getRecomment()!=0){
				burnService.findParentCommentMemberId(list.get(i).getRecomment());
			}
		}
		model.addAttribute("comment",burnService.findBurnCommentByNo(no));
		return new ModelAndView("burn/burn_detail.tiles","bvo",burnService.findBurnByNo(no));
	}
	
	@RequestMapping(method=RequestMethod.POST,value="writeBurn.do")
	public String writeBurn(BurnVO bvo){
		burnService.writeBurn(bvo);
		System.out.println(bvo);
		return "redirect:writeBurnResult.do?no="+bvo.getNo();
	}
	
	@RequestMapping("writeBurnResult.do")
	public ModelAndView writeBurnResult(String no){		
		return new ModelAndView("burn/register_result.tiles","bvo",burnService.findBurnByNo(no));		
	}
	@RequestMapping("showBurnComment.do")
	@ResponseBody
	public Object showBurnComment(String no,Model model){
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);
		return list;
	}
	
}






