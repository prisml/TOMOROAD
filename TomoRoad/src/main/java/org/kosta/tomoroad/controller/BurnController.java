package org.kosta.tomoroad.controller;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.service.BurnService;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView showBurnDetail(String no){
		burnService.updateHits(no);
		return new ModelAndView("burn/burn_detail.tiles","bvo",burnService.findBurnByNo(no));
	}
	
	@RequestMapping(method=RequestMethod.POST,value="writeBurn.do")
	public String writeBurn(BurnVO bvo){
		burnService.writeBurn(bvo);
		return "redirect:writeBurnResult.do?no="+bvo.getNo();
	}
	
	@RequestMapping("writeBurnResult.do")
	public ModelAndView writeBurnResult(String no){		
		return new ModelAndView("burn/register_result.tiles","bvo",burnService.findBurnByNo(no));		
	}
	
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
	public ModelAndView showContentNoHit(String no) {			
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
	
	@RequestMapping("writeBurnForm.do")
	public ModelAndView writeBurnForm(){
		return new ModelAndView("burn/register_form.tiles","station",burnService.getStationNameList());
	}
}






