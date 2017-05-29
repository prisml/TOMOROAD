package org.kosta.tomoroad.controller;

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
	
	@RequestMapping("member/findMemberById.do")
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
	@RequestMapping(value="member/updateMember.do",method=RequestMethod.POST)
	public String update(MemberVO vo) {
		memberService.updateMember(vo);	
				return "redirect:updateResultView.do?id=" + vo.getId();	
	}
	@RequestMapping("member/registerResultView.do")
	public ModelAndView registerResultView(String id) {		
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
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
	@RequestMapping("myPage.do")
	public String myPage(){
		return "redirect:myPage.tiles";
}
}




















