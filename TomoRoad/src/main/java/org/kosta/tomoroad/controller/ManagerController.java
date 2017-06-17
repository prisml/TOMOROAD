package org.kosta.tomoroad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.ManagerService;
import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
	
	@Resource(name = "managerServiceImpl")
	private ManagerService managerService;
	
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	
	@RequestMapping(method = RequestMethod.POST, value = "noauth_managerLogin.do")
	public String managerLogin(ManagerVO managerVO, HttpServletRequest request, HttpSession session,Model model) {
		/*System.out.println("접근함?");*/
		ManagerVO vo = managerService.managerLogin(managerVO);
		if (vo == null)
			return "member/noauth_login_fail";
		else {
			session.setAttribute("manager", vo);
		return "redirect:getMemberList.do";
	}
}

	@RequestMapping("getMemberList.do")
	public String getMemberList(Model model){
		model.addAttribute("list", managerService.getMemberList());
		return "manager/manager.tiles";
	}
	
	@RequestMapping(value = "mypage/updateMemberByManager.do", method = RequestMethod.POST)
	public String updateMemberByManager(MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		memberService.updateMemberByManager(vo);
		session.setAttribute("mvo", vo);
		return "redirect:updateResultViewByManager.do?id=" + vo.getId();
	}

	@RequestMapping("mypage/updateResultViewByManager.do")
	public ModelAndView updateMemberByManager(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("manager/manager.tiles", "mvo", vo);
	}
	
	@RequestMapping("deleteMemberByManager.do")
	public String deleteMemberByManager(String id,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberService.deleteMemberByManager(id);
		session.invalidate();
		return "redirect:manager/manager.do";
	}
	   
}
