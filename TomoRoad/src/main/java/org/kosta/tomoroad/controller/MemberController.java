package org.kosta.tomoroad.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@RequestMapping("findMemberById.do")
	public String findMemberById(String id, Model model) {
		MemberVO vo = memberService.findMemberById(id);
		if (vo != null)
			model.addAttribute("result", vo);
		return "redirect:home.do";
	}

	@RequestMapping(method = RequestMethod.POST, value = "noauth_login.do")
	public String login(MemberVO memberVO, HttpServletRequest request, HttpSession session) {
		MemberVO vo = memberService.login(memberVO);
		if (vo == null)
			return "member/noauth_login_fail";
		else {
			session.setAttribute("mvo", vo);
			return "redirect:home.do";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "home.tiles";
	}

	@RequestMapping(value = "member/noauth_registerMember.do", method = RequestMethod.POST)
	public String registerMember(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:noauth_registerResultView.do?id=" + vo.getId();
	}

	@RequestMapping("member/noauth_registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/noauth_register_result.tiles", "mvo", vo);
	}

	@RequestMapping(value = "member/updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberVO vo) {
		memberService.updateMember(vo);
		return "redirect:updateResultView.do?id=" + vo.getId();
	}

	@RequestMapping("member/updateResultView.do")
	public ModelAndView updateMember(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/update_result.tiles", "mvo", vo);
	}

	@RequestMapping("member_idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		int count = memberService.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}


	@RequestMapping("deleteMember.do")
	public String deleteMember(String id) {
		memberService.deleteMember(id);
		return "redirect:member/delete_result.do";
	}

	@RequestMapping(value = "noauth_findId.do", method = RequestMethod.POST)
	public String findId(MemberVO memberVO, HttpServletRequest request) {
		MemberVO vo = memberService.findId(memberVO);
		if (vo == null)
			return "member/noauth_findid_fail";
		else {
			HttpSession session = request.getSession();
			session.setAttribute("result", vo);
			return "member/noauth_findid_result.tiles";
		}
	}

	@RequestMapping(value = "noauth_findPw.do", method = RequestMethod.POST)
	public String findPw(MemberVO memberVO, HttpServletRequest request) {
		MemberVO vo = memberService.findPw(memberVO);
		if (vo == null)
			return "member/noauth_findpw_fail";
		else {
			HttpSession session = request.getSession();
			session.setAttribute("result", vo);
			return "member/noauth_findpw_result.tiles";
		}
	}

	@RequestMapping("friend_Request.do")
	public String friend_Request(String SenderId, String ReceiverId) {
		memberService.friend_Request(SenderId, ReceiverId);
		return null;
	}

	@RequestMapping("friend_Accept.do")
	public String friend_Accept(String senderID, String receiverID) {
		memberService.friend_Accept(senderID, receiverID);
		return null;
	}

	@RequestMapping("friend_Refuse.do")
	public String friend_Refuse(String senderID, String receiverID) {
		memberService.friend_Refuse(senderID, receiverID);
		return null;
	}

	@RequestMapping("mypage/friendList.do")
	public String friendList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		model.addAttribute("friendList", memberService.friendList(id));
		model.addAttribute("profile", memberService.getProfileById(id));
		return "mypage/friendList.tiles";
	}

	@RequestMapping("friend_RequestList.do")
	public List<String> friend_RequestList(String receiverID) {
		return memberService.friend_RequestList(receiverID);
	}

	@RequestMapping("getFriendId.do")
	@ResponseBody
	public String getFriendId(String id, String selectId) {
		return memberService.getFriendId(id, selectId);
	}

	@RequestMapping("deleteFriend.do")
	public String deleteFriend(String id, String deleteId) {
		memberService.deleteFriend(id, deleteId);
		return "redirect:friendList.do?id=" + id;

	}

	@RequestMapping("noauth_weather.do")
	public String weather() {
		return "noauth_weather.tiles";
	}

	@RequestMapping(value="profileUpload.do",method=RequestMethod.POST)
	public String profileUpload(MultipartFile file){
		System.out.println(file);
		return null;
	}
	
	@RequestMapping("mypage/{viewName}.do")
	public ModelAndView showMypage(@PathVariable String viewName,HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		return new ModelAndView("mypage/"+viewName + ".tiles", "profile", memberService.getProfileById(id));
	}
}
