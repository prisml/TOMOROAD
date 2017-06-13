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
	public String getBurnList(String pageNo, Model model){
		model.addAttribute("station", burnService.getStationNameList());
		model.addAttribute("lvo",burnService.getBurnList(pageNo));
		return "burn/burnlist.tiles";			
	}
	
	@RequestMapping("showBurnDetail.do")
	public ModelAndView showBurnDetail(String no,Model model){
		burnService.updateHits(no);
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);
		model.addAttribute("comment",list);
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
	
	//댓글
	@RequestMapping("showBurnComment.do")
	@ResponseBody
	public Object showBurnComment(String no,Model model){
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);
		return list;
	}
	@RequestMapping("deleteComment.do")
	public String deleteComment(BurnCommentVO vo){
		vo.setState("delete");
		burnService.deleteComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("updateComment.do")
	public String updateComment(BurnCommentVO vo){
		burnService.updateComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("registeComment.do")
	public String registeComment(BurnCommentVO vo){
		burnService.registeComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("replyComment.do")
	public String replyComment(BurnCommentVO vo){
		burnService.replyComment(vo);
		System.out.println(vo.getBurn_no());
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	//댓글끝
	
	@RequestMapping("updateBurnView.do")
	public String updateBurnView(String no, Model model){
		model.addAttribute("bvo", burnService.findBurnByNo(no));
		model.addAttribute("station", burnService.getStationNameList());
		return "burn/update_form.tiles";		
	}
	
	@RequestMapping(method=RequestMethod.POST,value="updateBurn.do")
	public String updateBurn(BurnVO bvo){		
		burnService.updateBurn(bvo);	
		return "redirect:showBurnDetailNohit.do?no="+bvo.getNo();
	}
	
	@RequestMapping("showBurnDetailNohit.do")
	public ModelAndView showBurnDetailNohit(String no) {			
		return new ModelAndView("burn/burn_detail.tiles","bvo",burnService.findBurnByNo(no));
	}	
	
	@RequestMapping("deleteBurn.do")
	public String deleteBurn(String no){
		burnService.deleteBurn(no);
		return "redirect:getBurnList.do";
	}
	
	@RequestMapping("getBurnListByStation.do")
	public ModelAndView getBurnListByStation(String stationName, String pageNo){
		return new ModelAndView("burn/burnlist.tiles","lvo",burnService.getBurnListByStation(stationName, pageNo));
	}
	
	@RequestMapping("getBurnListByStationAjax.do")
	@ResponseBody
	public Object getBurnListByStationAjax(String stationName, String pageNo){
		System.out.println(burnService.getBurnListByStation(stationName, pageNo));
		return burnService.getBurnListByStation(stationName, pageNo);
	}
	
	@RequestMapping("writeBurnForm.do")
	public ModelAndView writeBurnForm(){
		return new ModelAndView("burn/register_form.tiles","station",burnService.getStationNameList());
	}
}






