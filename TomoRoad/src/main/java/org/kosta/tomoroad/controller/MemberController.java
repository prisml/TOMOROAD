package org.kosta.tomoroad.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.service.TomoroadingService;
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
	
	// 프로필 파일업로드 경로
	private String uploadPath;
	
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	
	@Resource(name = "tomoroadingServiceImpl")
	private TomoroadingService tomoroadingService;
	
	
	@Resource
	private ReviewService reviewService;

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
	}

	@RequestMapping(method = RequestMethod.POST, value = "noauth_login.do")
	public String login(MemberVO memberVO, HttpServletRequest request, HttpSession session) {
		MemberVO vo = memberService.login(memberVO);
		if (vo == null)
			return "member/noauth_fail";
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
		return "redirect:home.do";
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

	@RequestMapping("noauth_idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		int count = memberService.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@RequestMapping("deleteMember.do")
	public String deleteMember(String id,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberService.deleteMember(id);
		session.invalidate();
		return "redirect:home.do";
	}
	@RequestMapping(value = "noauth_findId.do", method = RequestMethod.POST)
	public ModelAndView findId(MemberVO memberVO) {
		MemberVO vo = memberService.findId(memberVO);
		if (vo == null)
			return new ModelAndView("member/noauth_fail");
		else {                   
			return new ModelAndView("member/noauth_findid_result.tiles", "member", vo);
		}
	} 
	@RequestMapping("member/noauth_findPw.do")
	public String findPw(MemberVO vo,Model model){
		String id = memberService.findPw(vo);
		if (id != null) 	{
			model.addAttribute("mmvo",vo.getId());
		    return "member/noauth_updatepw.tiles";		
		} else {
			return "member/noauth_fail";
		}
	}
	@RequestMapping(value = "noauth_updatePw.do", method = RequestMethod.POST)
	public ModelAndView updatePw(MemberVO vo) {
		memberService.updatePw(vo);
		return new ModelAndView("redirect:member/noauth_updatepw_result.do");
	}

	@RequestMapping("friend_Request.do")
	public String friend_Request(String senderId, String receiverId) {
		memberService.friend_Request(senderId, receiverId);
		return "redirect:memberpage.do?selectId="+receiverId;
	}

	@RequestMapping("mypage/friend_Accept.do")
	public String friend_Accept(String senderID, String receiverID) {
		memberService.friend_Accept(senderID.trim(), receiverID);
		return "redirect:friend_RequestList.do";
	}

	@RequestMapping("mypage/friend_Refuse.do")
	public String friend_Refuse(String senderID, String receiverID) {
		memberService.friend_Refuse(senderID, receiverID);
		return "redirect:friend_RequestList.do";
	}

	@RequestMapping("mypage/friend{viewName}_Block.do")
	public String requestFriend_Block(@PathVariable String viewName,String id, String blockId) {
		memberService.friend_Block(id, blockId);
		return "redirect:friend"+viewName+".do";
	}
	
	@RequestMapping("mypage/friendList.do")
	public String friendList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		model.addAttribute("friendList", memberService.friendList(id));
		String profile = memberService.getProfileById(id);
		model.addAttribute("profile",profile);
		return "mypage/friendList.tiles";
	}
	
	@RequestMapping("mypage/friend_BlockList.do")
	public String friendBlockList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		model.addAttribute("friendList", memberService.friendBlockList(id));
		String profile = memberService.getProfileById(id);
		model.addAttribute("profile",profile);
		return "mypage/friend_BlockList.tiles";
	}

	@RequestMapping("mypage/friend_RequestList.do")
	public String friend_RequestList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		model.addAttribute("friend_RequestList", memberService.friend_RequestList(id));
		String profile = memberService.getProfileById(id);
		model.addAttribute("profile",profile);
		return "mypage/friend_RequestList.tiles";
	}
	
	@ResponseBody
	@RequestMapping("noauth_friend_RequestInfo.do")
	public int friend_RequestInfo(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if(vo != null){
			String id = vo.getId();
			return memberService.friend_RequestInfo(id);
		}
		return 0;
	}

	@RequestMapping("getFriendId.do")
	@ResponseBody
	public String getFriendId(String id, String selectId) {
		return memberService.getFriendId(id, selectId);
	}

	@RequestMapping("deleteFriend.do")
	public String deleteFriend(String id, String deleteId) {
		memberService.deleteFriend(id, deleteId);
		return "redirect:mypage/friendList.do";
	}
	
	@RequestMapping("FriendUnBlock.do")
	public String FriendUnBlock(String id,String unBlockId){
		memberService.unBlockFriend(id, unBlockId);
		return "redirect:mypage/friend_BlockList.do";
	}

	@RequestMapping("noauth_weather.do")
	public String weather() {
		return "noauth_weather.tiles";
	}
	
	@RequestMapping("mypage/{viewName}.do")
	public ModelAndView showMypage(@PathVariable String viewName,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		String profile = memberService.getProfileById(id);
		return new ModelAndView("mypage/"+viewName + ".tiles", "profile",profile);
	}
	
	@RequestMapping("mypage/mypage.do")
	public String mypage(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		HashSet<String> routeList = new HashSet<String>();
		
		List<String> list = tomoroadingService.getTotalRoute(id);
		for(int i = 0;i<list.size();i++){
			String[] route = list.get(i).split(",");
			for(int j = 0;j<route.length;j++){
				routeList.add(route[j]);
			}
		}
		model.addAttribute("profile",  memberService.getProfileById(id));
		model.addAttribute("totalfriend", memberService.totalFriend(id));
		model.addAttribute("totalContents", reviewService.getTotalContentsByMember(id));
		
		if(tomoroadingService.getTravelRoute(id) == null){
			String[] arr = {};
			model.addAttribute("travelRoute", arr);
			model.addAttribute("totalTravel", routeList.size());
		}else{
			model.addAttribute("travelRoute", tomoroadingService.getTravelRoute(id).split(","));
			model.addAttribute("totalTravel", (int)Math.ceil(routeList.size()*2.38));
		}
		return "mypage/mypage.tiles";
	}

	@RequestMapping(value = "profileFileUpload.do", method = RequestMethod.POST)
	public String profileFileUpload(MultipartFile uploadfile,HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		String fileName = uploadfile.getOriginalFilename();
		String profile = "/tomoroad/resources/img/profiles/"+id+fileName.substring(fileName.lastIndexOf("."), fileName.lastIndexOf(".")+4);
		// 확장자명
		
		if(uploadfile.isEmpty()){
			return "mypage/mypage_fail";
		}
		
		memberService.profileFileUpload(id,profile);
		String getprofile = memberService.getProfileById(id);
		String ext = id+getprofile.substring(getprofile.lastIndexOf("."), getprofile.lastIndexOf(".")+4);
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/profiles/");
		String uploadPath2 = "C:\\Users\\Administrator\\git\\TOMOROAD\\TomoRoad\\src\\main\\webapp\\resources\\img\\profiles\\";
		try {
			uploadfile.transferTo(new File(uploadPath+ext));
			
			// 프로필파일을 WAS에서 Workspace로 복사하기
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(uploadPath+ext));
			
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadPath2+ext));
			
			int data = bis.read();
			
			while(data!=-1){
				bos.write(data);
				data = bis.read();
			}
			bos.close();
			bis.close();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:mypage/mypage.do?id="+id;
	}
	
	@RequestMapping("profileReset.do")
	public String profileReset(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		String profileReset = "/tomoroad/resources/img/profiles/kakao.jpg";
		memberService.profileReset(id,profileReset);
		return "redirect:mypage/mypage.do?id="+id;
	}
	
	   @RequestMapping("mypage/showListByMember.do")
	   public String showListByMember(String page,HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
			if (page == null)
	        page = "1";
			String profile = memberService.getProfileById(id);
			model.addAttribute("profile",profile);
			model.addAttribute("reviewList", reviewService.getListByMember(page,id));
			return "mypage/showList.tiles";
	   }
	   
	   @RequestMapping("mypage/showListByMember2.do")
	   public String showListByMember2(String page,HttpServletRequest request,Model model) {
		   	HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
			if (page == null)
	        page = "1";
			String profile = memberService.getProfileById(id);
			model.addAttribute("profile",profile);
			model.addAttribute("reviewList", reviewService.getListByMember(page,id));
			return "mypage/showList2.tiles";
	   }
	   
	   @RequestMapping("memberpage.do")
	   public String memberpage(HttpServletRequest request,String selectId,Model model){	 
		   	HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
			if(id.equals(selectId)){
				return "redirect:mypage/mypage.do";
			}else{
				model.addAttribute("memberInfo", memberService.findMemberById(selectId));
				model.addAttribute("friend", memberService.getFriendId(id, selectId));
				return "memberpage/memberpage.tiles";
			}
	   }
	   
	   @RequestMapping("end.do")
	   public String end(HttpServletRequest request){
		   HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
		   tomoroadingService.updateTravelFlag(id);
		   return "redirect:mypage/mypage.do";
	   }
	   
	   @RequestMapping("mypage/myTravelRoute.do")
	   public String myTravelRoute(HttpServletRequest request,Model model){
		   HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("mvo");
			String id = vo.getId();
			List<String> list = tomoroadingService.getTotalRoute(id);
			ArrayList<List<String>> OutputList = new ArrayList<List<String>>(); 
			for(int i = 0;i<list.size();i++){
				List<String> splitRouteList  = Arrays.asList(list.get(i).split(","));
				OutputList.add(splitRouteList);
			}
			model.addAttribute("travelRoute", OutputList);
			model.addAttribute("profile",  memberService.getProfileById(id));
			return "mypage/travelRoute.tiles";
	   }
	   
}
