package org.kosta.tomoroad;

import java.sql.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.service.PlaceService;
import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.service.StationService;
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
	
	@Resource(name="memberServiceImpl")
	private MemberService memberService;

	@Test
	public void test(){
	}
}
