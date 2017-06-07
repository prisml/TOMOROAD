package org.kosta.tomoroad;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.tomoroad.model.dao.MemberDAO;
import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.service.PlaceService;
import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.service.StationService;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class TestUnit {
	@Resource(name="stationServiceImpl")
	private StationService stationService;
	
	@Resource(name="placeServiceImpl")
	private PlaceService placeService;
	
	@Resource(name="reviewServiceImpl")
	private ReviewService reviewService;
	
	@Resource
	private MemberDAO memberdao;
	
	@Resource(name="memberServiceImpl")
	private MemberService memberService;

	@Test
	public void test(){
		// 역 정보 얻어오기
		/*
		List<StationVO> stationInfoList= stationService.getStationInfo("전주");
		System.out.println("TestUnit>역정보:"+stationInfoList);
		*/
		StationVO stationInfoList= stationService.getInfo("전주");
		System.out.println("역정보:"+stationInfoList);
		
		// 역 주면 관광지 정보 얻어오기
		/*
		List<PlaceVO> placeInfolist= placeService.getPlaceInfo("전주");
		System.out.println("TestUnit>역주변정보:"+placeInfolist);
		*/
		
		//역 키워드 갖고오기
/*		List<String> list=stationService.getKeyword("전");
		if(list!=null)
			System.out.println("TestUnit>키워드 갖고옴:"+list);
		else
			System.out.println("없음");*/
		
		//관광지 키워드 갖고오기
/*		List<String> keywordList=placeService.getKeyWord("해");
		if(keywordList!=null)
			System.out.println("TestUnit>키워드 갖고옴:"+keywordList);
		else
			System.out.println("없음");*/
		
		
		//리뷰 키워드 가져오기
/*		List<ReviewVO> list=reviewService.getKeyword("전","제목+내용");
		System.out.println(list);*/

		//System.out.println(memberService.friendList("java"));
	
		//tourInfo게시판 정보 가져오기
		List<StationVO> list=stationService.getTourInfoData();
		System.out.println(list);

		memberdao.getProfileById("java");
		
	}
}
