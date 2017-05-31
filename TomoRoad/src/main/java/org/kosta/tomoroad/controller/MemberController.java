package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource(name="memberServiceImpl")
	private MemberService memberService;
	
	@RequestMapping("findMemberById.do")
	public String findMemberById(String id,Model model){
		MemberVO vo=memberService.findMemberById(id);
		if(vo!=null)
			model.addAttribute("result", vo);
		return "member/findbyid_result.tiles";
	}
	@RequestMapping(method=RequestMethod.POST,value="login.do")
	public String login(MemberVO memberVO,HttpServletRequest request){
		MemberVO vo=memberService.login(memberVO);
		if(vo==null)
			return "member/login_fail";
		else{
			HttpSession session=request.getSession();
			session.setAttribute("mvo",vo);
			return "home.tiles";
		}
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return "home.tiles";
	}
	@RequestMapping(value="member/registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);		
		return "redirect:registerResultView.do?id=" + vo.getId();
	}
	@RequestMapping("member/registerResultView.do")
	public ModelAndView registerResultView(String id) {		
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}
	@RequestMapping(value="member/updateMember.do",method=RequestMethod.POST)
	public String update(MemberVO vo) {
		memberService.updateMember(vo);	
		return "redirect:updateResultView.do?id=" + vo.getId();	
	}
	@RequestMapping("member/updateResultView.do")
	public ModelAndView updateMember(String id){		
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/update_result.tiles", "memberVO", vo);
	}	
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {		
		int count=memberService.idcheck(id);
		return (count==0) ? "ok":"fail"; 		
	}
	@RequestMapping("mypage.do")
	public String myPage(){
		return "redirect:mypage.tiles";
}
	@RequestMapping(value="member/deleteMember.do",method=RequestMethod.POST)
	public String delete(MemberVO vo) {
		memberService.deleteMember(vo);	
		return "redirect:deleteResultView.do?id=" + vo.getId();	
	}
	@RequestMapping("member/deleteResultView.do")
	public ModelAndView deleteResultView(String id) {		
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/delete_result.tiles", "memberVO", vo);
	}
	@RequestMapping("findIdByPwNameTel.do")
	public String findIdByPwNameTel(MemberVO memberVO,Model model){
		MemberVO vo=memberService.findIdByPwNameTel(memberVO);
		if(vo!=null)
			model.addAttribute("result", vo);
		return "member/findid.tiles";
	}
	@RequestMapping("findPwByIdNameTel.do")
	public String findPwByIdNameTel(MemberVO memberVO,Model model){
		MemberVO vo=memberService.findPwByIdNameTel(memberVO);
		if(vo!=null)
			model.addAttribute("result", vo);
		return "member/findpw.tiles";
	}
	@RequestMapping("friend_Request.do")
	public String friend_Request(String SenderId,String ReceiverId){
		memberService.friend_Request(SenderId, ReceiverId);
		return null;
	}
	@RequestMapping("friend_Accept.do")
	public String friend_Accept(String senderID,String receiverID){
		memberService.friend_Accept(senderID, receiverID);
		return null;
	}
	@RequestMapping("friend_Refuse.do")
	public String friend_Refuse(String senderID,String receiverID){
		memberService.friend_Refuse(senderID, receiverID);
		return null;
	}
	@RequestMapping("friendList.do")
	public ModelAndView friendList(String id){
		return new ModelAndView("member/friendList.tiles","friendList",memberService.friendList(id));
	}
	@RequestMapping("friend_RequestList.do")
	public List<String> friend_RequestList(String receiverID){
		return memberService.friend_RequestList(receiverID);
	}
	@RequestMapping("getFriendId.do")
	public String getFriendId(String id,String selectId){
		return memberService.getFriendId(id, selectId);
	}
}




















