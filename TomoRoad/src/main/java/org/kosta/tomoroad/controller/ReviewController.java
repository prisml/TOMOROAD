package org.kosta.tomoroad.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource(name="reviewServiceImpl")
	private ReviewService service;
	
	@RequestMapping("review/showList.do")
	public ModelAndView showList(String page){
		if(page==null)
			page="1";
		return new ModelAndView("review/showList.tiles","reviewMap",service.getList(page));
	}

	@RequestMapping(value="review/register.do",method=RequestMethod.POST)
	public ModelAndView register(ReviewVO vo, int place, HttpServletRequest req){
		vo.setMember((MemberVO)req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(place));
		service.register(vo);
		return new ModelAndView("redirect:review/detail.do?no="+vo.getNo());
	}
	
	@RequestMapping(value="review/update.do",method=RequestMethod.POST)
	public ModelAndView update(ReviewVO vo, int place, HttpServletRequest req){
		vo.setMember((MemberVO)req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(place));
		service.update(vo);
		return new ModelAndView("redirect:review/detail.do?no="+vo.getNo());
	}
	
	@RequestMapping("review/detail.do")
	public ModelAndView detail(String no){
		return new ModelAndView("review/detail.tiles","rvo",service.getDetail(no));
	}
	
	@RequestMapping("review/getKeyword.do")
	@ResponseBody
	//검색창에 입력한 단어가 들어가는 키워드를 가져옴
	public ArrayList<String> getKeyword(String keyword,String reviewFilter){
		System.out.println("keyword:"+keyword);
		System.out.println("컨트롤러에서의 reviewFilter:"+reviewFilter);
		List<ReviewVO> searchResultList=service.getKeyword(keyword,reviewFilter);
		System.out.println("리뷰 키워드 갖고온다 : "+searchResultList);
		
		ArrayList<String> keywordList=new ArrayList<String>();
		
		if(reviewFilter.equals("제목만")){
			for(int i=0;i<searchResultList.size();i++){
				keywordList.add(searchResultList.get(i).getTitle());
			}
		}else{
			for(int i=0;i<searchResultList.size();i++){
				keywordList.add(searchResultList.get(i).getContent()); //제목이나 내용에 키워드가 있을 경우 자동완성 목록을 어떻게 띄워줄 것인가
			}
		}
		return keywordList;
/*		ArrayList<String> list=new ArrayList<String>();
		list.add("개발");
		list.add("개진상");
		list.add("개주사");*/
	}
}
