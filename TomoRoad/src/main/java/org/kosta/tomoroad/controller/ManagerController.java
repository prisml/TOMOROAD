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
	
/*	@RequestMapping(value = "manager/updateMemberByManager.do", method = RequestMethod.POST)
	public String updateMemberByManager(MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		managerService.updateMemberByManager(vo);
		session.setAttribute("mvo", vo);
		return "redirect:manager/updateResultViewByManager.do?id=" + vo.getId();
	}

	@RequestMapping("manager/updateResultViewByManager.do")
	public ModelAndView updateMemberByManager(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("manager/manager_update_result.do", "mvo", vo);
	}*/
	
	@RequestMapping("updateMemberByManagerForm.do")
	public ModelAndView updateMemberByManagerForm(String id) {
		MemberVO vo =managerService.getIdFromMember(id);
		return new ModelAndView("manager/update_member_manager.tiles","mmvo",vo);
	}
	@RequestMapping("updateMemberByManager.do")
	public ModelAndView updateMemberByManager(MemberVO vo) {
		managerService.updateMemberByManager(vo);
		return new ModelAndView("redirect:getMemberList.do");
	}
	
	@RequestMapping("deleteMemberByManager.do")
	public String deleteMemberByManager(String id) {
		/*System.out.println(id);*/
		managerService.deleteMemberByManager(id);
		return "redirect:manager/manager_delete_result.do";
	}
	   
}
