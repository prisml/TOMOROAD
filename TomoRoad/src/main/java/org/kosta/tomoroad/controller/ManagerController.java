package org.kosta.tomoroad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.ManagerService;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {
	
	@Resource(name = "managerServiceImpl")
	private ManagerService managerService;
	
/*	@RequestMapping(method = RequestMethod.POST, value = "noauth_managerLogin.do")
	public String managerLogin(ManagerVO managerVO, HttpSession session) {
		ManagerVO vo = managerService.managerLogin(managerVO);
		if (vo == null)
			return "member/noauth_login_fail";
		else {
			session.setAttribute("manager", vo);
		return "redirect:manager.tiles";
	}
}*/
	
/*	// 
	@RequestMapping("findMemberById.do")
	public String findMemberById(String id, Model model) {
		MemberVO vo = memberService.findMemberById(id);
		if (vo != null)
			model.addAttribute("result", vo);
		return "redirect:home.do";
	}
	
	@RequestMapping("findMember.do")
	public String findMember(MemberVO memberVO, Model model) {
		MemberVO vo = memberService.findMember(memberVO);
		if (vo != null)
			model.addAttribute("result", vo);
		return "redirect:home.do";
	}*/

	/*@RequestMapping(value = "member/noauth_registerMember.do", method = RequestMethod.POST)
	public String registerMember(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:noauth_registerResultView.do?id=" + vo.getId();
	}

	@RequestMapping("member/noauth_registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/noauth_register_result.tiles", "mvo", vo);
	}

	@RequestMapping(value = "mypage/updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		memberService.updateMember(vo);
		session.setAttribute("mvo", vo);
		return "redirect:updateResultView.do?id=" + vo.getId();
	}

	@RequestMapping("mypage/updateResultView.do")
	public ModelAndView updateMember(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("mypage/update_result.tiles", "mvo", vo);
	}

	@RequestMapping("deleteMember.do")
	public String deleteMember(String id,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberService.deleteMember(id);
		session.invalidate();
		return "redirect:home.do";
	}*/
	   
}
