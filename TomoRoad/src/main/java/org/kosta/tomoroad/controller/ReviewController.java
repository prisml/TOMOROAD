package org.kosta.tomoroad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource(name = "reviewServiceImpl")
	private ReviewService service;

	@RequestMapping("review/showList.do")
	public ModelAndView showList(String page) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewList", service.getList(page));
	}

	@RequestMapping("review/showListByMember.do")
	public ModelAndView showListByMember(String page, String id) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByMember(page,id));
	}

	@RequestMapping("review/showListByPlace.do")
	public ModelAndView showListByPlace(String page, String place) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByPlace(page,place));
	}

	@RequestMapping(value = "review/register.do", method = RequestMethod.POST)
	public ModelAndView register(ReviewVO vo, int placeNo, HttpServletRequest req) {
		vo.setMember((MemberVO) req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(placeNo));
		service.register(vo);
		return new ModelAndView("redirect:detail.do?no=" + vo.getNo());
	}
	
	@RequestMapping("review/register_form.do")
	public ModelAndView registerForm() {
		return new ModelAndView("review/register_form.tiles", "placeList", service.getStationList());
	}
	
	@RequestMapping("review/update_form.do")
	public ModelAndView updateForm(String no){
		System.out.println("updateForm no="+no);
		System.out.println("rvo="+service.getDetail(no));
		return new ModelAndView("review/update_form.tiles", "rvo", service.getDetail(no));
	}

	@RequestMapping(value = "review/update.do", method = RequestMethod.POST)
	public ModelAndView update(ReviewVO vo, int placeNo, HttpServletRequest req) {
		vo.setMember((MemberVO) req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(placeNo));
		service.update(vo);
		return new ModelAndView("redirect:detail.do?no=" + vo.getNo());
	}

	@RequestMapping("review/detail.do")
	public ModelAndView detail(String no) {
		ReviewVO rvo = service.getDetail(no);
		rvo.setRecommend(service.getreview_recommendByreviewNo(Integer.parseInt(no)));
		return new ModelAndView("review/detail.tiles", "rvo", rvo);
	}
	
	@RequestMapping("review/detailHit.do")
	public ModelAndView detailHit(String no){
		service.getDetailHit(no);
		return new ModelAndView("redirect:detail.do?no="+no);
	}
	
	@RequestMapping("review/delete.do")
	public ModelAndView delete(String no, HttpServletRequest req){
		MemberVO vo = (MemberVO) req.getSession().getAttribute("mvo");
		service.delete(no);
		return new ModelAndView("redirect:review/showListByMember.do?id="+vo.getId());
	}
	
	@RequestMapping("review_recommend")
	public String review_recommend(String member_id,int review_no){
		service.review_recommend(member_id, review_no);
		return "redirect:review/detail.do?no="+review_no;
	}
}
