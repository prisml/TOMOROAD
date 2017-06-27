package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("burn/getBurnList.do")
	public String getBurnList(String pageNo, Model model, HttpSession session){		
		model.addAttribute("station", burnService.getStationNameList());
		model.addAttribute("lvo",burnService.getBurnList(pageNo));		
		return "burn/burnlist.tiles";			
	}
	
	@RequestMapping("burn/showBurnDetail.do")
	public ModelAndView showBurnDetail(String no,Model model){
		burnService.updateHits(no);
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);
		model.addAttribute("comment",list);
		return new ModelAndView("burn/burn_detail.tiles","bvo",burnService.findBurnByNo(no));
	}
	
	@RequestMapping(method=RequestMethod.POST,value="burn/writeBurn.do")
	public String writeBurn(BurnVO bvo){
		burnService.writeBurn(bvo);
		System.out.println(bvo);
		return "redirect:writeBurnResult.do?no="+bvo.getNo();
	}
	
	@RequestMapping("burn/writeBurnResult.do")
	public ModelAndView writeBurnResult(String no){		
		return new ModelAndView("burn/register_result.tiles","bvo",burnService.findBurnByNo(no));		
	}
	
	//댓글
	@RequestMapping("burn/showBurnComment.do")
	@ResponseBody
	public Object showBurnComment(String no,Model model){
		List<BurnCommentVO> list=burnService.findBurnCommentByNo(no);		
		return list;
	}
	@RequestMapping("burn/deleteComment.do")
	public String deleteComment(BurnCommentVO vo){
		vo.setState("delete");
		burnService.deleteComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("burn/updateComment.do")
	public String updateComment(BurnCommentVO vo){
		burnService.updateComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("burn/registeComment.do")
	public String registeComment(BurnCommentVO vo){
		burnService.registeComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	@RequestMapping("burn/replyComment.do")
	public String replyComment(BurnCommentVO vo){
		burnService.replyComment(vo);
		return "redirect:showBurnDetail.do?no="+vo.getBurn_no();
	}
	//댓글끝
	
	@RequestMapping("burn/updateBurnView.do")
	public String updateBurnView(String no, Model model){
		model.addAttribute("bvo", burnService.findBurnByNo(no));
		model.addAttribute("station", burnService.getStationNameList());
		return "burn/update_form.tiles";		
	}
	
	@RequestMapping(method=RequestMethod.POST,value="burn/updateBurn.do")
	public String updateBurn(BurnVO bvo){		
		burnService.updateBurn(bvo);	
		return "redirect:showBurnDetailNohit.do?no="+bvo.getNo();
	}
	
	@RequestMapping("burn/showBurnDetailNohit.do")
	public ModelAndView showBurnDetailNohit(String no) {			
		return new ModelAndView("burn/burn_detail.tiles","bvo",burnService.findBurnByNo(no));
	}	
	
	@RequestMapping("burn/deleteBurn.do")
	public String deleteBurn(String no){
		burnService.deleteBurn(no);
		return "redirect:getBurnList.do";
	}
	
	@RequestMapping("burn/getBurnListByStation.do")
	public String getBurnListByStation(String stationName, String pageNo, Model model){
		model.addAttribute("station", burnService.getStationNameList());
		if(stationName.equals("all")){
			model.addAttribute("station", burnService.getStationNameList());
			model.addAttribute("lvo",burnService.getBurnList(pageNo));
		}else{
			model.addAttribute("station", burnService.getStationNameList());
			model.addAttribute("lvo",burnService.getBurnListByStation(stationName, pageNo));
		}
		return "burn/burnlist.tiles";		
	}
	
	@RequestMapping("getBurnListByStationAjax.do")
	@ResponseBody
	public Object getBurnListByStationAjax(String stationName, String pageNo){		
		if(stationName.equals("all")){
			return burnService.getBurnList(pageNo);
		}else{
			return burnService.getBurnListByStation(stationName, pageNo);			
		}		
	}
	
	@RequestMapping("burn/writeBurnForm.do")
	public ModelAndView writeBurnForm(){
		return new ModelAndView("burn/register_form.tiles","station",burnService.getStationNameList());
	}
	
	// 메세지
	
	@RequestMapping("isNewMsg.do")
	@ResponseBody
	public int isNewMsg(String receiver){	
		System.out.println(burnService.isNewMsg(receiver));
		return burnService.isNewMsg(receiver);
	}
	
	
	@RequestMapping("**/isNewMsg.do")
	@ResponseBody
	public int isNewMsgDir(String receiver){		
		return burnService.isNewMsg(receiver);
	}
	
	@RequestMapping("findId.do")
	@ResponseBody
	public Object findId(String id, String searcher){				
		return burnService.findId(id, searcher);
	}
	@RequestMapping("**/findId.do")
	@ResponseBody
	public Object findIdDir(String id, String searcher){				
		return burnService.findId(id, searcher);
	}	

	@RequestMapping("getMessageList.do")
	@ResponseBody
	public Object getMessageList(String sender, String receiver){
		return burnService.getMessageList(sender, receiver);
	}
	@RequestMapping("**/getMessageList.do")
	@ResponseBody
	public Object getMessageListDir(String sender, String receiver){
		return burnService.getMessageList(sender, receiver);
	}
	
	@RequestMapping("sendMessage.do")
	@ResponseBody
	public Object sendMessage(String sender, String receiver, String text){			
		return burnService.sendMessage(sender, receiver, text);
	}
	
	@RequestMapping("**/sendMessage.do")
	@ResponseBody
	public Object sendMessageDir(String sender, String receiver, String text){			
		return burnService.sendMessage(sender, receiver, text);
	}
	
	@RequestMapping("getFilteredMessage.do")
	@ResponseBody
	public Object getFilteredMessage(String id){
		return burnService.getFilteredMessage(id);
	}
	
	@RequestMapping("**/getFilteredMessage.do")
	@ResponseBody
	public Object getFilteredMessageDir(String id){
		return burnService.getFilteredMessage(id);
	}
	
}






